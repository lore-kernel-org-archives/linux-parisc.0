Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from montperdu.pyrene.net (jmharang.net1.nerim.net [62.212.119.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BB37483E
	for <parisc-linux@parisc-linux.org>; Sat,  1 Nov 2003 14:34:12 -0700 (MST)
Received: from montperdu.pyrene.net (localhost [127.0.0.1])
	by montperdu.pyrene.net (Postfix) with SMTP id 112862C95E
	for <parisc-linux@parisc-linux.org>; Sat,  1 Nov 2003 22:34:09 +0100 (CET)
Date: Sat, 1 Nov 2003 22:34:09 +0100
From: Jean-marc Harang <jean-marc.harang@laposte.net>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Console on HP 9000 E55
Message-Id: <20031101223409.44119ba9.jean-marc.harang@laposte.net>
In-Reply-To: <200311011959.hA1Jxxi29314@opus.allegro.com>
References: <20031101200941.5c474aba.jean-marc.harang@laposte.net>
	<200311011959.hA1Jxxi29314@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Le Sat, 1 Nov 2003 11:59:59 -0800 (PST)
Stan Sieler <sieler@allegro.com> a =E9crit:

> Hi,
>=20
> What card on the HP 9000/E35 are you trying to use with a console port?
> (And, which connector (and: male/female, round or 9 pin or 25 pin or ?))
>=20
> (I know the questions may be obvious to you, but there are several=20
> possibilities ... knowing which you're trying to do may help me answer yo=
u.)
>=20
> > Up to now, the server successfully boots on the original HP-UX. But we =
have
> > no access to any console on MDP 9-pin DB9. The other connector called D=
DP is
> > not equiped with the patch panel :/.=20
>=20
> Yes, I've got an E35 here (running HP-UX).
>=20

I use the APMUX port (the only one on the E55 I/O board), with the cable ref
A1703-63009. At one end with high-density connector for APMUX and at the ot=
her
ends one DB9 called MDP and something like big centronics called DDP (for t=
he
patch panel i don't own). So i try the MDP port without result.

Thanks

A+
jm. Harang
