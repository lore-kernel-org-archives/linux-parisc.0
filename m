From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Fri, 23 Feb 2007 06:46:22 -0500
Message-ID: <200702230646.23698.vapier__33154.5230038047$1416624312$gmane$org@gentoo.org>
References: <20070223024202.1175E1800E4@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0065797075=="
Cc: libc-ports@sourceware.org,
 Aurelien Jarno <aurel32@debian.org>,
 debian-glibc@lists.debian.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Roland McGrath <roland@redhat.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070223024202.1175E1800E4@magilla.sf.frob.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0065797075==
Content-Type: multipart/signed; boundary="nextPart26664061.BdoMTrDk5b";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart26664061.BdoMTrDk5b
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 22 February 2007, Roland McGrath wrote:
> > All statically initialized locks are broken. We made locks smaller,
> > and changed the value of the static initialization.
>
> Smaller?  Smaller is easy.  And you didn't actually reduce
> __SIZEOF_PTHREAD_MUTEX_T, did you?  This seems like it would not be at all
> hard to accommodate just with symbol versioning and not break any
> compatibility.  Off hand, it seems like it would be some simple code in o=
ne
> new file in your sysdeps/ tree and a smattering of sysdeps Versions files.

how can you do symbol versioning on static initializers ?  the initialized=
=20
value is compiled into the .data sections of the actual binary ...

hmm ... do you mean we retain the pthread code that uses the old locking=20
methods and create all the new code with glibc-2.6 symbol versions ?
=2Dmike

--nextPart26664061.BdoMTrDk5b
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.2 (GNU/Linux)

iQIVAwUARd7UD0FjO5/oN/WBAQLpFRAAl50AUlZe+u71ZQJ37JhAHxFsNbBJ2nD0
/1Bwfe94oAhAS1ML/h/ORv0JqmqhEHIC55+JMyrydqQxI+CUcCfQhQOPDmhfCfGx
COlQy36JvfotFDUoVLkQtqrj69XaM2omcn1gEwL4v/2uitPqz99KORq16d78o9tE
MLNhXUFxK0CLnCCq5nRyeFT3ydeFpFxrpKatpBssg7ZflkTMMIv797hZhRGoDCLm
xdvKYvjxaEGHKr5i3E+jxjk9p83arwZaQ+wsA/QZrNUGvnAT4bTQRHw6rKlFdniy
LXPt60xnidht+4Y7BKv04+D6iJbGJL1vfP5f7xN8XuxeRHtNn5MVhcy//Bx+kej9
iYUMPu4rTd+WgYuteV8m+yZ04PFM7xHuoozQVEEl3MdrRqf8vOw+JzEXRm/Qpr+q
5OL46cafUIFKip6xRregKun/I4VWOx+pwFmSJbZjS6YvgYqLMw9IDB1d0Dz4hX5E
JdZ4c5DAzcQNA7dph21770RaGBpB9GoTUpIUYkPIdQ/rZzp3D3X/bUjfAVFEXS2H
leLY6tEdbQH3plEspYtMkou6KAdk/ieZQL1qfJ7R+flAHjACZzzy8FmXR+SSUWsp
jCEZ/u63RtyYe1VXlWfETItmvCUPPuSck8ugz17GMiYC+F6FFswb6w+uKasVkdqI
VWixJCmg0fA=
=lQS1
-----END PGP SIGNATURE-----

--nextPart26664061.BdoMTrDk5b--

--===============0065797075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0065797075==--
