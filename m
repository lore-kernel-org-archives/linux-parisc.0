Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27DB74829
	for <parisc-linux@parisc-linux.org>; Sun, 16 Feb 2003 02:42:36 -0700 (MST)
Date: Sun, 16 Feb 2003 10:42:35 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Watchdog on parisc?
Message-ID: <20030216094234.GG351@lug-owl.de>
References: <20030214181124.GJ13355@lug-owl.de> <20030216083110.GC18888@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
In-Reply-To: <20030216083110.GC18888@dsl2.external.hp.com>
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

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-02-16 01:31:10 -0700, Grant Grundler <grundler@dsl2.external.h=
p.com>
wrote in message <20030216083110.GC18888@dsl2.external.hp.com>:
> On Fri, Feb 14, 2003 at 07:11:24PM +0100, Jan-Benedict Glaw wrote:
> > Hi!
> >=20
> > I'm currently playing a bit with my B132L and 715. They're working quite
> > nice, except that kernels aren't too stable (gcc-3.2, I'll do some more
> > test compiles with gcc-3.0, too).
>=20
> gcc-3.2.1 has a few bugs that have bitten us already (search mail
> archive on "pty.c"). I'm not sure if it's better to stick with
> gcc 3.0 or grab something that's bleeding edge (gcc 3.3.x).

Yeah, I know. I followed that thread. gcc-3.0 seems to produce a more
stable kernel, but even there are some gotchas (eg. strace'ing programs
often leads to stuck userland while I still can ping the box or complete
the three-way-handshake of a starting TCP connection...).

I'd possibly spend some time in invensting this...

> > I've looked through the docs available if a watchdog is mentioned. In
> > ./docs/platforms/b1xx-service.pdf there's a watchdog timeout error
> > declared (during selftest) so I *think* there is a watchdog, isn't
> > there?
>=20
> I'm not sure what this is refering to. The CPU has some HW checking
> that is a sort of watchdog but it's CPU internal and only the firmware
> touches those.

So there's nothing what's like a watchdog as you know it from some
machines (SGI Indys for example) or as add-on cards in machines (PCI/ISA
cards).

> > I've not yet seen a driver for it, nor have I seen any
> > documentation. Is there a watchdog (and possibly some docu or an hpux
> > vmunix to disassemble) so I could possibly write something better than
> > softdog.c?
>=20
> not if it's what I'm thinking of (transaction timeout, ie causes an
> HPMC). This is a built-in HW feature.=20

Hmmm... Triggering a HPMC would be a neat feature. So we could think
about a way to initiate something that, if not handled, would trigger a
HPMC some 60 seconds later:-?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+T10KHb1edYOZ4bsRAuBOAJ94z7p8+gT4KNrOeN+r89dxn041/ACfTLvP
5HQTKcfv2qc1SR8SCUvkiGM=
=U+5l
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
