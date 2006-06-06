From: Kai Holthaus <kmh@sonic.net>
Subject: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 18:45:54 -0700
Message-ID: <200606051845.54924.kmh@sonic.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1471761893=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1471761893==
Content-Type: multipart/signed; boundary="nextPart14744473.VKIUT7n3Rt";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart14744473.VKIUT7n3Rt
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I'm trying to compile and install the qc-usb (http://qce-ga.sourceforge.net=
/)=20
kernel module on my A5005X server. Compilation works just fine (make all &&=
=20
make install), but upon insmodding I get the following error:

Module quickcam, symbol qc_proc_init is out of range for PCREL22F relocation
=46ATAL: Error inserting quickcam (/lib/modules/2.6.16-pa11/misc/quickcam.k=
o):=20
Invalid module format

I've searched on google (in general) and on this mailing list for help on t=
his=20
topic, but couldn't find anything that would help me out, since I'm not=20
really a kernel and/or gcc wiz.=20

What am I doing wrong? Or is there something in the module code that's not=
=20
compatible with a 64bit hppa kernel?

Thanks so much,

	Kai
=2D-=20
Hofstadter's Law:
  "It always takes longer than you expect,
   even when you take into account Hofstadter's Law."
                             -- Douglas R. Hofstadter

kmh.AT.sonic.net

Check out Mission Octagon - a new, exciting novel!
http://www.missionoctagon.com

--nextPart14744473.VKIUT7n3Rt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEhN5Swl7N6T1/FugRAgqPAJ0XZQ/5LhS3xMg8CEq0cA3Fl0DbIACfbhGN
whOJO/HULd6bYMiJTEI6Q3k=
=6k4f
-----END PGP SIGNATURE-----

--nextPart14744473.VKIUT7n3Rt--

--===============1471761893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1471761893==--
