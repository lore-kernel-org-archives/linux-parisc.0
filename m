Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mlbmx1.corp.harris.com (mlbmx1.corp.harris.com [137.237.90.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 821D5482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Nov 2001 09:57:58 -0700 (MST)
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921627EE@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: 'Helge Deller' <deller@gmx.de>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 2.4.14 and ISA-NE2000 StackDump
Date: Tue, 20 Nov 2001 11:57:31 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Well, you=B4ve got a 64Bit-Kernel and i run a 32bit Kernel on my =
715/75.

I just tested with 2.4.4-pa7 and got the same effect...

greetings
Wolfgang

> -----Original Message-----
> From:	Helge Deller [SMTP:deller@gmx.de]
> Sent:	Monday, November 19, 2001 7:52 PM
> To:	Pedot, Wolfgang; 'Parisc Linux Mailinglist'
> Subject:	Re: [parisc-linux] 2.4.14 and ISA-NE2000 StackDump
>=20
> Hi Wolfgang,
>=20
> I've no problems here with my ISA NE2000 and kernel 2.4.14-pa7:
>=20
> NE*000 ethercard probe at 0x340: 08 00 00 50 11 13
> eth0: NE2000 found at 0x340, using IRQ 10.
>=20
> pa64:~# uname -a
> Linux pa64 2.4.14-pa7 #2 Mon Nov 19 19:43:37 CET 2001 parisc unknown
>=20
> pa64:~# cat /proc/interrupts
>  IRQ      count         Region    ISR
>  10:       2346            EISA  NE2000
>=20
> Sadly I've no idea why it doesn't work for you...
>=20
> Greetings,
> Helge
>=20
> On Monday 19 November 2001 15:16, Pedot, Wolfgang wrote:
> > Hi,
> >
> > I just tried to update to 2.4.14-pa6 and noticed a stackdump during
> > initialisation of my old NE2000 ISA-Nic which works fine using the =
last
> > 2.4.9 Kernel. After this stackdump i booted (reset used) 2.4.9 =
again and
> > the machine hung without any message druring initialistaion of the =
NE2000
> > (right after "NE*000 ethercard probe at 0x300:"). I had to =
power-cycle the
> > machine to make it work again.
> >
> > Heres the log-message:
> >
> > Last modified Nov 1, 2000 by Paul Gortmaker
> > NE*000 ethercard probe at 0x300:WARNING! Stack pointer and cr30 do =
not
> > correspond!
> >
> > Bad Address (null pointer deref?): Code=3D6 regs=3D100fe380 =
(Addr=3D50412d43)
> >
> > any hints?
> > Are there any guys arround here which made their ne2000 work with =
2.4.14?
> > greetings
> >
> > Wolfgang Pedot
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
