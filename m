Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B554482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 05:18:21 -0600 (MDT)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C844@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Xavier Debacker'" <xavier.debacker@esiee.net>,
	"Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] PA/Linux iso 0.6 is out!
Date: Wed, 25 Apr 2001 13:17:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi Xavier,

Both keyboard and mouse on C110 are "PS/2"
Before switching to STI, keyboard works OK, (as i have to interupt boot
sequence, perfrom a SEArch and a BOot P2 (in my case)

Hans.


> -----Original Message-----
> From:	Xavier Debacker [SMTP:xavier.debacker@esiee.net]
> Sent:	Wednesday, April 25, 2001 11:22 AM
> To:	Witvliet, Hans
> Cc:	parisc-linux@lists.parisc-linux.org
> Subject:	Re: [parisc-linux] PA/Linux iso 0.6 is out!
>=20
> "Witvliet, Hans" a =E9crit :
>=20
> > Hi all,
> >
> > A quick try of the 32 bits version with STI console on a C110.
> > After booting from cdrom, i get startup info and the message =
switching
> to
> > STI. (looks very promissing..)
> > Again some more messages and a login prompt.
> > There it stops, the system does not read input from my keyboard, so =
can
> not
> > login....
> >
> > Will try on other systems later...
> >
> > Hans.
>=20
> Hi Hans,
>=20
> Do you use HIL or PS/2 Keyboard ?
>=20
> Only PS/2 keyboard is supported.
>=20
> Xavier.
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
