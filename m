Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gate.algorithm.aelita.com (unknown [212.176.18.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7081C485F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Aug 2003 02:32:45 -0600 (MDT)
Received: from bagman.edm.com ([10.0.0.4]) by gate.algorithm.aelita.com
          (Post.Office MTA v3.5.3 release 223 ID# 0-12345L500S10000V35)
          with ESMTP id com for <parisc-linux@lists.parisc-linux.org>;
          Mon, 25 Aug 2003 12:33:53 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1251"
Subject: RE: [parisc-linux] Help: Need instruction sequence for gdb breakpoint
Date: Mon, 25 Aug 2003 12:31:50 +0400
Message-ID: <3F6F4712B759A34ABD453A8B39C10D62DEED89@bagman.edm.com>
From: "Lev Assinovsky" <LAssinovsky@algorithm.aelita.com>
To: "Thibaut VARENE" <varenet@esiee.fr>,
	"Grant Grundler" <grundler@parisc-linux.org>
Cc: <parisc-linux@lists.parisc-linux.org>
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

I meant have you heard about ddd for HP-UX 11.00?

----
Lev Assinovsky
Aelita Software Corporation
O&S Core Division, Programmer
ICQ# 165072909


> -----Original Message-----
> From: Thibaut VARENE [mailto:varenet@esiee.fr]
> Sent: Saturday, August 23, 2003 1:56 PM
> To: Grant Grundler
> Cc: Lev Assinovsky; parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Help: Need instruction sequence for gdb
> breakpoint
>=20
>=20
> -------------------
> > On Fri, Aug 22, 2003 at 09:13:37PM +0400, Lev Assinovsky wrote:
> > > Hi!
> > > 1. I meant just a hardcoded breakpoint (not hardware)
> > > Partially works just BREAK 4, 8. Though I need to do "jump" to=20
> next line=20
> > > to continue in gdb.
> >=20
> > ah ok=20
> > > 2. gdb doesn't work with shared libraries explicitly loaded by=20
> program.
> > > Could you please point to anybody from HP team?
> >=20
> > HP Team? Sorry but officially there is no HP parisc-linux team.
> > Most of us are interested in kernel hacking and less in
> > making gdb work.
> >=20
> > > 3. What about ddd?
> >=20
> > sorry - haven't looked at ddd.
> >=20
>=20
> ddd is a GUI frontend to gdb...
>=20
>=20
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://pateam.esiee.fr/
> On vacation until Aug 25th
>=20
>=20
