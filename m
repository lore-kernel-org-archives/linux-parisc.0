Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gate.algorithm.aelita.com (unknown [212.176.18.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B95C483F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Aug 2003 04:47:48 -0600 (MDT)
Received: from bagman.edm.com ([10.0.0.4]) by gate.algorithm.aelita.com
          (Post.Office MTA v3.5.3 release 223 ID# 0-12345L500S10000V35)
          with ESMTP id com for <parisc-linux@lists.parisc-linux.org>;
          Tue, 19 Aug 2003 14:47:50 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1251"
Subject: RE: [parisc-linux] Help: Need instruction sequence for gdb breakpoint
Date: Tue, 19 Aug 2003 14:47:47 +0400
Message-ID: <3F6F4712B759A34ABD453A8B39C10D62D4DA83@bagman.edm.com>
From: "Lev Assinovsky" <LAssinovsky@algorithm.aelita.com>
To: <parisc-linux@lists.parisc-linux.org>
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

Ok! But what's BREAK instruction for?
Besides gdb works for me on HPUX 11.00

----
Lev Assinovsky
Aelita Software Corporation
O&S Core Division, Programmer
ICQ# 165072909


> -----Original Message-----
> From: Thibaut VARENE [mailto:varenet@esiee.fr]
> Sent: Tuesday, August 19, 2003 2:29 PM
> To: Lev Assinovsky
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Help: Need instruction sequence for gdb
> breakpoint
>=20
>=20
> On Mon, 4 Aug 2003 14:37:13 +0400
> "Lev Assinovsky" <LAssinovsky@algorithm.aelita.com> wrote:
>=20
> > Hello all!
> > I badly need pa-risc 1.1 instruction sequence suitable for gdb.
> > I would like to implement "hard breakpoint".=20
> > I tried "BREAK 4,8" - gdb stops but can't continue.
> > Any help will be appreciated!
> >=20
>=20
> We've looked into this already, and as far as we could find=20
> out, there is
> no hardware support for hardware breakpoints on parisc.
> They'd have to be emulated.
>=20
> You can take a look at what we did for kgdb by checking this page:
> http://pateam.esiee.fr/kgdb.html
>=20
> Anyway, as far as i know, gdb isn't really supported for hppa.
>=20
> HTH,
>=20
>=20
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
>=20
