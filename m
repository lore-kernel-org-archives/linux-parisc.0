Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from onet2.cup.hp.com (unknown [15.255.208.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F5B5485A
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 06:06:51 -0600 (MDT)
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by onet2.cup.hp.com (Postfix) with ESMTP id 45E9418C8B
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 05:06:42 -0700 (PDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id IAA03496 for <parisc-linux@parisc-linux.org>; Tue, 2 Oct 2001 08:26:56 +0200 (MET DST)
Message-Id: <sbb97922.053@ms-zrt1>
Date: Tue, 02 Oct 2001 08:12:42 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <marteaut@esiee.fr>, <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel
	options
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>Hi all,
>
>	Once again, I ask you to verify what I wrote and only God knows =
how
>important it is to re-read this file b/c it is useful and I made it so
>many mistakes for sure :)
>
>	I added the comments of the first draft (Thanks to Grant) and CPU =
type
>help too. I do not really like the lists. If you have any better idea,
>please let me know.
>
>Thanks, Thomas.
>ESIEE Team
>
>PS: I would like to know if I can put the PA-RISC/Linux Boot HOWTO into
>stable state??
>
>Text to add in Documentation/ Configure.help
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>Processor family
>CONFIG_PA7100
>  In this section, you will find enough informations to set correctly=20
>  your CPU type option. Nevertheless, if you need more, you can see=20
>  all the hardware content of your box at http://hwdb.parisc-linux.org.
> =20
>  If you select the PA7000/PA7100 option, your box must be one of =
these=20
>  listed below: 705/35, 710/50, 715/33, 715/50, 715/75, 720/50, 725/50,=20=

>  725/75, 730/66, 735/99, 735/125, 750/66, 755/99.
>
>  If you select the PA7200 option, your box must be one of these =
listed=20
>  below: C100, C110, D250, D350, D260, D360, J200, J210, K100, K200,=20
>  K210, K220, K400, K410, K420.
>
>  If you choose the PA7100LC/PA7300LC option then your box is 715/64,=20
>  715/80, 715/100, 725/100, A180, B132L(+), B160L(+), B180L(+), C160L,=20
>  C180L, D200, D210, D220, D230, D300, D310, D320 or D330. There are=20
>  also some systems from the E series but there are not yet supported.
>
>  Finally, PA8x00 is the good choice for all new stuff like A500, B1000,
>  B2000, B2600, C200+, C240+, C3000, C3600, J282, J2240, J5000, J6000,=20
>  J6700, J7000, K250, K260, K270, K370, K450, K460, K470, K570, L1000,=20
>  L2000, L3000, N4000, V2200, V2250, V2500.
>
Since at least two C200+ machines get Trace/Breakpoint trap errors when
compiling for PA8x00, I'd suggest a rephrasing or an addition like:

- for a generic kernel, select PA7x00
- if you select PA7000/PA7100, your box must be .... or newer.
- if you're not sure, select PA7x00

etc. 'Must' sounds very sure.

Good luck,
Jurriaan
