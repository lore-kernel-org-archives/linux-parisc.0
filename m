Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay1.cc.umr.edu [131.151.1.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id B91DB4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Mar 2003 14:49:18 -0700 (MST)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: RE: [parisc-linux] recent netboot iso?
Date: Mon, 3 Mar 2003 15:49:09 -0600
Message-ID: <B578DAA4FD40684793C953B491D4879174CFED@umr-mail7.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
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

FYI. Install worked great, but unfortunately, current tools/etc. still
have the problem with loading the afs module (segfault in insmod) and I
don't have time to dig into it again. (I did an a-g upgrade with
unstable as well.)

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216


> -----Original Message-----
> From: Neulinger, Nathan=20
> Sent: Monday, March 03, 2003 10:47 AM
> To: Tom; Thibaut VARENE
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: RE: [parisc-linux] recent netboot iso?
>=20
>=20
> Great! Thanks! I will take a look.=20
>=20
> -- Nathan
>=20
> ------------------------------------------------------------
> Nathan Neulinger                       EMail:  nneul@umr.edu
> University of Missouri - Rolla         Phone: (573) 341-4841
> Computing Services                       Fax: (573) 341-4216
>=20
>=20
> > -----Original Message-----
> > From: Tom [mailto:palinux@alaskatech.org]=20
> > Sent: Monday, March 03, 2003 10:14 AM
> > To: Thibaut VARENE
> > Cc: Neulinger, Nathan; parisc-linux@lists.parisc-linux.org
> > Subject: Re: [parisc-linux] recent netboot iso?
> >=20
> >=20
> > > On Mon, 3 Mar 2003, Thibaut VARENE wrote:
> > > from http://pateam.esiee.fr/
> > >
> > > PA/Linux stable kernel CVS version is 2.4.20-pa27
> > > Latest Netinst ISO version is 2.4.20-pa27-20030223
> > > PA/Linux devel kernel CVS version is 2.5.63-pa2
> > >
> > > if 2.4.20-pa27 features that fix, it's on the ISO...
> >=20
> > If this is the bus-walk hang, the -pa27 kernel fixes it on my C180.
> >=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
