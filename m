Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mlbmx1.corp.harris.com (mlbmx1.corp.harris.com [137.237.90.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38937482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 06:26:14 -0600 (MDT)
Message-ID: <8D4C69676E66D511A1CB00508BBBB192162684@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: "'rhirst@linuxcare.com'" <rhirst@linuxcare.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Install on a 715/75 (wont boot)
Date: Wed, 11 Jul 2001 08:26:08 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> -----Urspr=FCngliche Nachricht-----
> Von:	Richard Hirst [SMTP:rhirst@linuxcare.com]
> Gesendet am:	Dienstag, 10. Juli 2001 15:10
> An:	Pedot, Wolfgang
> Cc:	parisc-linux@lists.parisc-linux.org
> Betreff:	Re: [parisc-linux] Install on a 715/75 (wont boot)
>=20
> On Tue, Jul 10, 2001 at 02:45:59AM -0400, Pedot, Wolfgang wrote:
> > Hi,
> >=20
> > I just dug out a 715/75 at work (64MB RAM, 2x1GB HD). Now I=B4ve =
cleaned it
> and
> > brought it to live I want to install Linux but the problem is =
neither 0.9
> nor
> > 0.9.1 (downloaded yesterday) boots. I connected an external =
SCSI-CDRom
> (Toshiba
> > 6401) and the 715 detects it and I can tell it to boot from this =
drive but I
> get
> > an IPL Checksum Error with 0.9 (tried with two CDs) and "Wrong IPL =
Magic"
> with
> > 0.9.1. Both Images were downloaded and burned correctly as far as I =
can
> tell.
> > Now since this is my first experience with a PARISC-Machine I=B4m a =
little bit
> > helpless, any hints?
>=20
> For 0.9.1 it sounds like you picked up one of the broken versions
> of the ISO.  A new image was posted yesterday, so if you downloaded
> before that, please try again.
>=20
> Ok, i downloaded the new one and it works better but still no =
installer
> because my machine freezes at "branching to kernel at <addr>". Heres =
the
> output:
>=20
> Trying scsi.4.0
> Boot path initialized.
> Attemption to load IPL.
>=20
>=20
> Hard bootet.
> palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
> 0/vmlinux32 2853588 bytes @ 0x6ad6800
> 0/vmlinux64 3585851 bytes @ 0x6d8f800
> 0/ramdisk 1991209 bytes @ 0x70fb000
>=20
> Command line: 'root=3D/dev/ram console=3Dtty0 sti=3D0 =
sti_font=3DVGA8x16 TERM=3Dlinux'
>=20
> Kernel: partition 0 file /vmlinux
> Ramdisk: partition 0 file /ramdisk
> Warning: kernel name doesn=B4t end with 32 or 64... Guessing =
Annoyance: Firmware
> does not support PDC_MODEL_CAPABILITIES call
> 32
> ELF32 executable
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 1606948 mediaptr 0x1000
> Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
> Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
> Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
> Loading ramdisk 1991209 bytes @ 03e09000...
> branching to kernel entry point 0x00100000
>=20
> 0.9 didn't work on 715/75 anyway, but I would not have expected your
> particular error.
>=20
> I have never booted my 715/75 from CD; I've always booted it from
> the network.  The README on the CD should explain (briefly) how to
> do that.
>=20
> =20
> Well I tried to boot using bootp but it seems the 715 and my =
bootp-Server
> don=B4t understand each other. I have a running bootpd but it wont =
get anything
> from the 715 because it doesnt send UDP-Pakets but LLC-Pakets =
directly to the
> given MAC. Since I=B4m new to Parisc-Machine I=B4m maybe doing =
something wrong, I
> press ESC at bootup and enter "a" to get to the Boot-Admin-Menu, then =
I say
> "boot lan.<mac_of_bootp_server>" and I see that there are some =
LLC-Pakets
> coming to the Bootp-Server but there are no responses....
>=20
> mfG
> Wolfgang Pedot
>=20
