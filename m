Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.rz.uni-ulm.de (gemini.rz.uni-ulm.de [134.60.246.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D914482A
	for <parisc-linux@parisc-linux.org>; Wed, 26 Mar 2003 11:14:42 -0700 (MST)
Date: Wed, 26 Mar 2003 19:14:18 +0100
From: Markus Schaber <markus.schaber@student.uni-ulm.de>
To: "Adriano Galano" <adriano@satec.es>
Cc: "'Matthieu Delahaye'" <m.delahaye@esiee.fr>, <davidm@hpl.hp.com>,
	<willy@debian.org>, <adriano@satec.es>, <linux-ia64@linuxia64.org>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Message-Id: <20030326191418.0c7a5edb.markus.schaber@student.uni-ulm.de>
In-Reply-To: <000b01c2f3c1$6cd7e0c0$6620a4d5@tsatec.int>
References: <20030326125140.6f2b7f7c.markus.schaber@student.uni-ulm.de>
	<000b01c2f3c1$6cd7e0c0$6620a4d5@tsatec.int>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="=.nV7S4cEMG3SL7/"
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

--=.nV7S4cEMG3SL7/
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

"Adriano Galano" <adriano@satec.es> schrieb:

> > [...] maybe one can even run a PA-RISC OS inside a virtual
> > PA-RISC Machine on Itaniums. (However I don't know any such VM.)
> Which VM are ported to Linux IA64? Bochs? Virtuozzo? VMWare? Plex86?
> Recent Microsoft adquisition
> (http://www.connectix.com/fr/about/acquisition_faq.html) is focus in
> this sense I think.

As far as I know, all those VMs emulate IA32 and not PA-RISC. So I don't
know how this could help in running a PA-RISC OS on an Itanium.

However, Bochs should be easy to port to another platform due to it's
pure interpreter nature. I don't know about Virtuozzo, but VMWare and
Plex86 run at least user-level app code natively, so they have to be
adopted to the IA64 Kern and the mode switching, I think. E. G. VMware
and Plex86 both make use of Kernel Modules / Patches which must be
adopted.

Gru=DF,
Markus

--=20
Schabi's Flohmarkt: http://schabi.de/flohmarkt/

Der Dienstweg ist die Verbindung der Sackgasse mit dem Holzweg!
[DoLi in unibwm.studium]

--=.nV7S4cEMG3SL7/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ge3+6IhVmcufrl4RAv6wAJsG/0qP6/frhjZa/Ov3m5E/hLWXswCfY/xT
JK/ISNGxELj34jEe9xa3xJU=
=efH9
-----END PGP SIGNATURE-----

--=.nV7S4cEMG3SL7/--
