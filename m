From: Sven Schnelle <svens@gmx.de>
Subject: Re: [parisc-linux] USB Keyboard problems on C3600
Date: Mon, 08 Aug 2005 21:46:20 +0200
Message-ID: <87oe882ovn.fsf@deprecated.intranet.astaro.de>
References: <874qa39yqm.fsf@deprecated.intranet.astaro.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1283354566=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <874qa39yqm.fsf@deprecated.intranet.astaro.de> (Sven Schnelle's
	message of "Sat, 06 Aug 2005 11:54:41 +0200")
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1283354566==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Hi,

Sven Schnelle <svens@gmx.de> writes:

Just speaking to me, myself and i:

> i have a MAC USB Keyboard, which won't work with the builtin USB
> Controller of the C3600. If i connect it, i get this error messages:
> [..]
> Now i use a PCI USB Controller, and with this the keyboard is working
> fine, the only bad thing is that the Kernel crashes after 1-2h:
> [Kernel-oops-Backtrace]

Ok, this oops happens only if i have a Tekram DC-390U2W (SYM53C895
Chipset) SCSI Controller running in this system. After i removed it, the
kernel never crashed again. Unfortunately, this doen't mean that the
Keyboard is working the Onboard USB Controller. But at least its now
running fine with an PCI USB Controller.

Sven.
=2D-=20
"The number of Unix installations has grown to ten,  with more
 expected." (Unix Programmer's Manual, 2nd ed.; june 1972)

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC97aM86MdxiXaIbERAgf5AKDORN7zWhHyriI4ulMwsoq/zqGHqgCfXblD
rKzedOwI6H3V3QDVva6J0oI=
=v3E/
-----END PGP SIGNATURE-----
--=-=-=--

--===============1283354566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1283354566==--
