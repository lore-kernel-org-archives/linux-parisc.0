Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11750
	for <parisc-linux@puffin.external.hp.com>; Mon, 17 Jul 2000 17:31:37 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 17 Jul 2000 23:33:14 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13EKMJ-000157-00
	for <parisc-linux@thepuffingroup.com>; Mon, 17 Jul 2000 19:31:35 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 17 Jul 2000 19:31:34 -0400
Message-ID: <87em4swcyx.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ELF loader is badly broken
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Basically it's pure chance that our ELF binary loader works at all.

The reason I say this is that we do not make sure that we actually map
in pages for the initial stack frame containing argc, argv, and
various ELF info, and, since the stack grows upwards while the frame
grows downwards, we often end up spilling over into unmapped memory in
create_elf_tables() when putting the pointers in argv and envp on the
stack.

The reason it actually works at all is that we *do* map these pages
when copying in the actual argc and argv strings, and therefore, if
there happens to be enough space left on the last page of strings (as
there nearly always is if the environment and argument vectors are
short enough and contain small enough strings), we manage to do okay.

I *think* that the reason the code works on other architectures is
that, since both their stacks and stack frames grow downwards, a page
fault in create_elf_tables() will Do The Right Thing by just
allocating more stack space.  Of course I could be totally wrong about
that...

In any case we probably need a special dispensation in the binary
loader code for our up-growing stacks and down-growing frames.  It
seems to me like we can either:

 1) Make a special #ifdef __hppa__ (yuck) in exec.c (or somewhere - I
    don't suppose there are any hooks for this sort of thing ... or
    for that matter any other supported architectures with up-growing
    stacks) to leave enough room for the argv and envp and associated
    bits that get put there by the binfmt stuff.

 2) Make an exception in the page fault handler (or probably in
    expand_stack(), I tried setting the VM_GROWSDOWN flag on it and
    that clearly wasn't enough) to the stack-growing-up-rule for the
    initial stack frame's VMA, for at least as long as it takes us to
    populate it with pointers.

If (2) actually works, it should be the better solution, I think,
because it means we don't have to second-guess the amount of crap the
binary format loaders are going to put on the stack for us.  Someone
who isn't an idiot like me can maybe comment further :-)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
