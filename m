Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA10379
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 03:11:01 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 10:13:38 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 143bZw-0000PI-00
	for parisc-linux@thepuffingroup.com; Wed, 06 Dec 2000 10:13:36 +0000
Date: Wed, 6 Dec 2000 10:13:36 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001206101336.J12682@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] stacks
List-ID: <linux-parisc.vger.kernel.org>


i'm going to explain my thoughts on how the stacks work, (a) so someone
can point out how stupid i am and (b) so i can get it straight in my
own head.  i find explaining things to other people helps me understand.
you're my unpaid code-therapists :-)

we have bprm->p (see definition in <linux/binfmts.h>)

this is initialised to PAGE_SIZE * MAX_ARG_PAGES - sizeof (void *).
ie 32 pages less one pointer.

copy_strings() (exec.c) copies the strings involved from argv and envp
to some pages which it allocates on behalf of the user, starting at the
top and working down (oooh, directionalist asumptions....)

setup_arg_pages() (exec.c, called from binfmt_elf.c) adds the stack_base
(more on this later) to bprm->p and uses this address to map the pages
into the task's address space.

then create_elf_tables plonks a lot more stuff onto the stack (going
down, of course), including a pile of ELF entries, the envp pointers,
the argv pointers, and finally at the bottom envp, argv & argc.

finally, start_thread() is called, passing it a pointer to argc, which
happens to be just right for an x86 procedure call since it takes all
arguments on the stack.

why did this downwards-growing monstrosity ever work for us before?
because we set our stack_base to 0x2000'0000 so we started 32 pages from
that base and kept going down.  this was enough for everything except for
programs like procmail's configuration which tries to break it.  oops.
and we are wasting up to 128k on the stack.  double-oops.

our crt1.o depends on this layout now.  at least it depends on bits of it.
i can move some stuff around, like the strings, because they're only
referenced through the other pointers.

so how am i going to fix this mess?  i'm not sure.  the problem gets
uglier every time i stare at it.  i'm sure the solution involves macros
of some kind -- sp = place_on_stack(sp, addr, len).  but the strings
are then a pain...

i need to think about this some more.  and i need a machine to test this
on, which i can have tomorrow, hopefully.

P.S.  Thanks, you've really helped me come to terms with the stacks in
my life.

-- 
Revolutions do not require corporate support.
