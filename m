Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA04922
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 23:46:31 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 9374F3CE
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 22:48:41 -0800 (PST)
Message-Id: <200011200647.WAA18137@milano.cup.hp.com>
To: Ingo Matthaes <imatthae@grc.hp.com>
Cc: Parisc-Linux <parisc-linux@puffin.external.hp.com>
Subject: Re: [parisc-linux] A500 and glibc woes 
In-reply-to: Your message of "Sun, 19 Nov 2000 19:35:57 PST."
             <20001119193557.A8796@grccd310.grc.hp.com>
Date: Sun, 19 Nov 2000 22:47:27 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ingo Matthaes wrote:
> finally we've got a A500 for palinux testing. Unfortunately
> we have some problems with it.

Ingo,
uhmm...I'm not surprised. Let me help you understand the A500
and the direction we are going with support on the A500.
I'm one of several people working on A500 support.

A500 Features (marketing crud - you probably know this):
o 16GB of RAM
o 2-way 550 MHz PA8600
o 4 PCI-4X slots (3 of which are 1 slot per PCI bus)
o all in 2U rack mountable box.

Inside is (technical crud):
o PCX-W+
o Astro IOMMU (aka SBA. Provides cache-coherent DMA and virtual I/O DMA)
o Elroy PCI Host Bus Adapter (aka LBA)
o IOSAPIC interrupt controller (integrated in Elroy)
o PAT PDC (not legacy)
o ^B for service processor access (ie I can reset the machine remotely)
 
> A 32 bit kernel complains about a very old firmware and claims
> "that machine will probably never run linux"  But in fact, it 
> will :-)

That's right! :^)

> First question: Did anyone ever succeeded with a 32bit kernel
> on that hardware ?

No. Only on *64-bit* kernels. The reason is some of the PAT PDC
calls we need are *only* available in wide mode. We could have written
narrow<->wide mode translation routines but a 32-bit kernel ignores
the A500's best feature - 16GB of RAM. The issue is HP needs good
specweb99 numbers to sell these boxes and that requires GB of RAM.

The 512MB of RAM that 32-bit kernel currently supports (jsm tells me
3GB or so can be done) won't approach the perf levels which can be
acheived with 8 or 16GB. The HPUX specweb team (who just *beat* single
CPU TUX specweb99 numbers with HPUX on A500) told me. They have a clue.

You are welcome to write those translation routines and then
*remove* many the "#ifdef __LP64__" preprocessor directives in
arch/parisc/kernel/inventory.c and lba_pci.c. Send me the
patch and I'll test/review/commit the changes.

> A 64 bit Kernel boots fine and recognizes all available hardware 
> including the additional 100BT card. But it traps with the init
> which comes with the latest nfsroot tarball.

There are issues/problems with PCI resource management and I have
some code waiting to be tested when I get in tomorrow.

But you can be very helpful with user space! Perhaps Paul Bame
can be more specific.  But basically we don't have all the translation
routines in place for 32-bit applications invoking 64-bit kernel syscalls.

> I built a new one
> from the sourcesw of debians sysvlinux-2.78 and it does not trap
> anymore, but the kernel told me about unimplemented 32 syscalls.

Right.

> At this point I tried to build a 64 bit glibc in order to get
> a crt1.o , which is needed to builf for a 64bit init.
> 
> Did anyone ever build a 64bit glibc out of the current cvs tree ?

I don't think so. Eventually we wanted to but haven't been able yet.
So this great that you are trying!

> Today I've got 
...

Can someone one with a clue about toolchain look at that?

I'd be really impressed if someone got a 64-bit userspace built!
I can help get kernel working right but don't have a clue about the tools.

The 64-bit kernel can be booted on the following class of boxes
to about the same point as the A500:
o C160/180/200/240/360
o B2000/C3000/J5000/C3600/J5600/J6000
o some D/K/R-class machines

The key is the box must have PCX-U (PA8000), PCX-U+ (PA8200), 
PCX-W (PA8500) or PCX-W+ (PA8600) processor.

Look in the HWDB (http://www.parisc-linux.org/hw.html) or
in /usr/sam/lib/mo/sched.models (HPUX 11.x) to determine which
processor you have.


> Thats the point I'm currently stucking.
> 
> BTW If someone involved into the port with access to the internal HP 
>     Network needs access to that machine, please contact me.

Ditto. I can arrange access to my A500 as well. External access
to some limited number of people could be arranged if demand
is justifiable.  But given the number of other boxes which can
run 64-bit kernel, I hope that's not necessary.

Thanks Ingo!

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
