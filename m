Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA25181
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 14:33:36 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 21:36:31 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 1487xM-0003J1-00
	for parisc-linux@thepuffingroup.com; Mon, 18 Dec 2000 21:36:28 +0000
Date: Mon, 18 Dec 2000 21:36:28 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001218213628.A12128@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] More on stacks
List-ID: <linux-parisc.vger.kernel.org>


I've just committed code which makes stacks work sanely.  This was much
more tricky than I anticipated.  I now _don't_ believe that changes
are really needed to all binaries, and so I withdraw my request for a
break-all-binaries day.  Of course, there are other reasons we may wish
to do this.

I suspect my changes will have broken SOM support, but I don't have any
SOM binaries here to test with.  Please don't send me any, I can't afford
to download them :-)

It definitely works for 32-bit kernels.  Please check, Paul.  I've done
my best to use elf_addr_t, elf_caddr_t everywhere, so it should be
independent of kernel LP64 state.  I think the changes I've made to
<asm/processor.h> make start_thread32 obsolete.

Here's a bit of a design document I wrote while working on this problem.
It may explain why it was working before, and how it works now.
Does anyone think this document is worthy of being put on the website
or in Documentation/ or somewhere more permanent?



Before I started, we were setting our stack pointer to MAX_ARG_PAGES *
PAGE_SIZE.  Then the kernel was treating the stack as a downward-growing
entity, copying strings to it, etc.  This has the following problems:

 * It potentially wastes a large chunk of address space.  Not memory, since
   unused pages aren't allocated.
 * Programs which get close to this limit end up faulting during
   setup_elf_tables rather than returning -E2BIG.
 * We don't get a nice stack frame.  libc's _start entry point has to do a
   lot more work than really necessary.

So we need to move the strings down to the base of the stack area.
This is more difficult than I realised.  I restructured copy_strings
to start at the bottom instead of the top and copy the strings upwards
instead of downwards.

However, binfmt_script (amongst others) expects there to be room at
the bottom of the stack to prepend new argument strings.  I considered
making binfmt_elf `know' how many new strngs had been put on the stack
and munge the argv setup in an appropriate manner.  But this would be
very unpleasant code.

Instead, I rewrote copy_strings to put the strings on the stack in the
opposite order -- argv[argc-1] to argc[0].  Now new strings placed on
the stack would fit naturally into the argc calculation scheme [once
i'd written it, because it would have to work slightly differently from
the current scheme].  But then I noticed /proc/<pid>/environ and, more
importantly, /proc/<pid>/cmdline.  These expect the strings to be in the
right order.

Rather than rewrite these functions (and they would be significantly
slower if they had to reorder the strings instead of just copying them),
I've opted to go _back_ to copying the strings downward up unti the
point where they're mapped into memory.  At that point, the strings will
be copied (entirely within kernel memory, before they get mapped) into
pages so they appear to userspace mapped at the base of the stack area.
This also allows processes to setproctitle() [which appears to mean
overwriting argv[0] under Linux] without as much danger of overwriting
a crucial part of the stack.

After this mapping is done, setup_elf_tables will still have to be
modified somewhat as the stack will now be growing upwards.  But that's a
good thing since programs which attempt to overflow the maximum argument
length should now work properly again.


-- 
Revolutions do not require corporate support.
