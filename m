Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FAC5482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 10:50:53 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: Richard Hirst <rhirst@linuxcare.com>
Date: Tue, 5 Jun 2001 11:36:37 -0500
Content-Type: text/plain
References: <20010605160653.L25745@linuxcare.com>
Cc: <debian-hppa@lists.debian.org>, parisc-linux@thepuffingroup.com,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Message-Id: <01060511501903.00472@wolf01.my.home>
Subject: [parisc-linux] pa-risc V0.9 on Model 720 (+ others)
List-ID: <linux-parisc.vger.kernel.org>

To All -

Ref: Kernel snap-shot of 0603 (presumed similar to V0.9 kernel)

Found:
File: linux/include/asm-parisc/io.h
Lines: 27 - 40
Do:
Comment out the #ifdef at (appox.) line 27 and matching #endif at (appox)=
 line 40

Situation (sitrep):
Box model 720 doesn't have PCI BA -
Box model 720 EISA BA was an option=20
(mine has one, I don't have a card, so I am not building that driver.)

Without either BA's defined - in/out Byte, Word, Long does not have
a prototype in mem.c (amoung other places) - the compiler guesses
(incorrectly) at what inb() and outb() mean.

Makes a difference.

More to follow as I work my way through:
serial.c
pc_keyb.c
lasi_82596.c
parport_gsc.c
scsi.c
sim700.c
inode.c
array.c
binfmt_som.c
binfmt_elf.c
and various other bits and bytes.

Hey - No one ever said this was a clean build, did they?

Mike

On Tue, 05 Jun 2001, you wrote:
> On Tue, Jun 05, 2001 at 09:14:05AM -0500, djweis@sjdjweis.com wrote:
> >=20
> > On Tue, 5 Jun 2001, Richard Hirst wrote:
> >=20
> > > So with the nfsroot you have the D310 booting, but with the 0.9 ISO
> > > it stops after serial driver initialisation.
> >=20
> > No, if I boot off the cd, I get IPL errors. When I netboot the kernel=
 off
> > the cd, it stopped at serial init. I don't think it actually stopped,=
 I
> > think it no longer printed but still booted.
>=20
> Ah, ok.  I'd misunderstood you.  So the kernel on the CD is no
> different from the one you built yourself.  That's a relief!
>=20
> Have you checked both serial ports, just in case the one the
> kernel finds isn't the one you are using?
>=20
> From the boot msgs you sent earlier, it looks like you turned
> SERIAL_DEBUG_AUTOCONF on.  Does it actually run the loopback
> test at serial.c:3671 successfully?
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
