Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7929482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jul 2003 22:05:25 -0600 (MDT)
Date: Tue, 22 Jul 2003 06:05:23 +0300
Subject: Re: [parisc-linux] Re: readline problem
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20030722024603.GA20537@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
Content-Type: text/plain; charset=us-ascii
Cc: Ramesh Doddaiah <ramesh.doddaiah@hp.com>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <20030722040523.C62B949C21@mail.esiee.fr>
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

-------------------
> On Mon, Jul 21, 2003 at 07:24:11PM +0530, Ramesh Doddaiah wrote:
> > Hi Grant,
> >=20
> > =20
> >    My name is Ramesh Doddaiah working in HP india in IA RAGE
Project,=20
> > naresh who is  working in PA RAGE give me your email id.
>=20
> ok
>=20
> >    I had posted this problem to
parisc-linux@lists.parisc-linux.org on
> > 16 july, i didn't get any reply.
>=20
> most of the parisc linux team has been on the road for OLS.
>=20
> >    I am using Linux/i386 -> Linux/PARISC cross compiler
> > (xc-latest.tar.gz from http://ftp.parisc-linux.org/x86-xcompilers/
),=20
> > while compiling some piece of code which uses readline and ncurses
lib
> > i get this errors
>=20
>=20
>=20
> >=20
> >
/opt/palinux/lib/gcc-lib/hppa-linux/3.0.3/../../../../hppa-linux/bin/l
d:
> > cannot find -lreadline
> > collect2: ld returned 1 exit status
> >=20
> >=20
> >    I don't have readline and curses library for this version of
compiler.
> >    I did searched a lot to get this libraries,but i didn't get
much information.
> >=20
> >    Please tell me where can i find readline and ncurses
> >    library for this version of cross compiler.
> >=20
> >    GCC Version: 3.0.3
>=20
> I'm pretty sure the old cross compiler is broken.

it is.

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-July/020483.
html

Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
