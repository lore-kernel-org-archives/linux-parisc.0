Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD68A482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 02:49:21 -0600 (MDT)
Date: Thu, 7 Aug 2003 10:49:20 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.x - impressions
Message-ID: <20030807084920.GL1873@lug-owl.de>
References: <20030806065647.GP1873@lug-owl.de> <20030807062818.GC4979@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DFTsS40uuchi7su8"
In-Reply-To: <20030807062818.GC4979@tausq.org>
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

--DFTsS40uuchi7su8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-08-06 23:28:19 -0700, Randolph Chung <randolph@tausq.org>
wrote in message <20030807062818.GC4979@tausq.org>:
> > - If I strace some program, the box will crash some time later (while
> >   strace is still running). I can still toggle the NumLock LED by
>=20
> what did you try to strace that caused the machine to crash?=20

I now did a TOC when it hung. (No virtual console switching possible,
but NumLock still worked. Here's my TOC content:

General Registers 0 - 31
 0 -  3  0x00000000  0x103000f0  0x101c77fc  0x37efc4e5
 4 -  7  0x00000008  0x00000001  0xffffffff  0x00000001
 8 - 11  0xffffffff  0x37efc4e4  0x00000010  0xc8103b1c
12 - 15  0x0000006c  0x102b24f4  0x00047ae0  0x00000020
16 - 19  0x37efc080  0x0000ff00  0x00025000  0x00000001
20 - 23  0x00000000  0x0000000e  0x00000010  0x00000000
24 - 27  0x00000000  0xffffffff  0x37efc4e5  0x102e4010
28 - 31  0x00000000  0x00000000  0x37efc740  0x101c717c

<Press any key to continue (q to quit)>

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000
 8 - 11  0x00000754  0x00000000  0x000000c0  0x00000000
12 - 15  0x00000000  0x00000000  0x00107800  0xf1000000
16 - 19  0xd5a827ac  0x00000000  0x101c6f58  0x92602000
20 - 23  0x00000000  0x37efc720  0x0004000f  0x00000000
24 - 27  0x002f6000  0x27f25000  0xfefffffb  0xaaaaaaaa
28 - 31  0xaaaaaaaa  0x11111111  0x37efc000  0x10354000

Space Registers 0 - 7
 0 -  3  0x00000000  0x000001bf  0x00000000  0x000003aa
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000

IIA Space                    =3D 0x00000000
IIA Offset                   =3D 0x101c6f5c
CPU State                    =3D 0x9e000001

--------------------------------------------------------

r02:	vsnprintf + 0x604
r27:	$global$ + 0x0
r31:	number + 0x2b8
IIA Offset:	number + 0x98

So it's most probably dieing in some printk() or something like that
with a bad parameter or format string? Is there some way to get more
than only the CPU state (eg. more stack frames)?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--DFTsS40uuchi7su8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/MhKQHb1edYOZ4bsRAnFnAJ4/mDaqwCdIyFKQsJA83yVU8RZ0ygCfXVqv
ejH1GLD+OMFcMQOR+VDr8D0=
=KzUq
-----END PGP SIGNATURE-----

--DFTsS40uuchi7su8--
