Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C29F4960
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 08:26:02 -0700 (MST)
Date: Tue, 9 Mar 2004 15:26:00 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Randolph Chung <randolph@tausq.org>
In-Reply-To: <20040309072917.GN1113@tausq.org>
Message-ID: <Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 8 Mar 2004, Randolph Chung wrote:

> > But what I'm wondering about is why the Silicon Image driver
> > (always) detects the Seagate ST311022A hard drive as "TS130220A2".
> > Since it uses mmio instead of PIO as the other drivers, maybe there is
> > some big-endian problem in the Linux/PA-RISC mmio code? But then this
> > problem must be somewhere in the IDE code, since all mmio in general
> > seems to be working fine!
>
> oh, for mmio you need to fix the macros in include/asm-parisc/ide.h. the
> ones in io.c are for pio access. the mmio ones are new, i think, and
> haven't been fixed properly (__ide_mm_insw, etc) -- you can try
> replacing readw with __raw_readw, etc.

I also changed readl, writew and writel accordingly (for 2.6.4-rc1-pa3)

> can you also try the native-mode fixup? something like this (sorry
> it's not in patch format, my tree is a bit of a mess right now and it's
> late....)

Did that too, and had some success!

Now the siimage driver detects the hard drive correctly as "ST311022A" and
also sees the partition. Even mounting works, but I see lots of
"hda: lost interrupt" messages and it takes forever (several minutes) to
mount.

So I now got as far with the siimage driver as with the promise driver.
Both somewhat work, but there is a interrupt delivery problem.


===========

But NOW I have some very weird problem for you!

I also compiled a kernel with the same changes to ide.h and pci.c,
but this time using the NS87415 driver (onboard IDE of the C3000).

I doubt that the pci.c and ide.h changes contribute to the mystery, but I
could not verify  it yet by compiling a unpatched, vanilla linux-2.6.4-rc1-pa3
kernel.

Anyway, the IDE hard drive works with the onboard IDE controller of the C3000!


... Well, not 100%. Let me explain. The mystery is:

IDE works fine (without DMA support, like in the 2.4 kernels), as long as
I interrupt the automatic boot up and to a "sea" followed by a "bo pri".

If I just start the machine and don't interrupt the automatic boot up,
it will cause a HPMC. Also if I do interrupt the automatic boot up,
and just do a "bo pri" WITHOUT a "sea" first, it will also cause a HPMC.

This is 100% reproduceable. I rebooted the machine 6 times without
interruption of the boot up sequence, and 7 times I interrupted and
did a "sea" inbetween, and every time the same result.

Just to be sure I also did the following:

- Sometimes I rebooted several times after each other without interrupting
  the boot sequence, and I every time got a HPMC.
- Sometimes I interrupted twice in a row and did a "sea" and IDE worked
  every time.
- Sometimes I soft rebooted instead of hitting the power button (power cycle),
  and every time it was the same result: it only works when I do "sea"
  at the PDC.

BTW, I have "AutoSearch ON".

So it seems "sea" is initializing the IDE card or some PCI registers,
and IDE works. Without it it causes a HPMC.

Perhaps this is related with the (possible) problem in the PCI config
accessor functions (as Grant suspects).


Randolph, it might be even the case that IDE is also working for you
and your 2.6 kernel you are experimenting with, if you just do a "sea"
before booting palo/linux.
Maybe the onboard IDE controller was working all time with previous 2.6
kernels, but I didn't notice it since I didn't do a "sea" back then ...



Further info (boot logs etc.) can be found here:
http://www.cs.ucc.ie/~xam/ide/


Thanks for your attention,
  Max
