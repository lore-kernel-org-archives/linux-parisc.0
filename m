Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cindrpmx1.corp.harris.com (cindrpmx1.corp.harris.com [137.237.241.23])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7452482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 07:31:42 -0600 (MDT)
Message-ID: <8D4C69676E66D511A1CB00508BBBB19216279A@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: 'Matthew Wilcox' <willy@debian.org>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] EISA support
Date: Wed, 10 Oct 2001 07:37:06 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> Anyone want to review a patch that makes EISA work?  I've only
> tested it on a 715/75 with a Mongoose chip; but Wax is
> supposed to be programmatically identical.  The patch is
> 18k, so rather than post it to the list, it's available from
> ftp://puffin.external.hp.com/pub/parisc/src/eisa.diff
>=20
I=B4ve just tested this patch on my 715/75 and it seems the =
EISA-Subsystem works.
Since I don=B4t have an EISA-Card I=B4ve tried an old ISA-Nic (NE2000) =
but the
driver-module has problems detecting the interrupt of the card and i =
have no
idea which one to use.....
I can give the module any irq i want and it says everything is fine but =
of
course no network-traffic possible.....
Is there any chance to bring this card to life?

greetings
Wolfgang
