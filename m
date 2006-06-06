From: Kai Holthaus <kmh@sonic.net>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 19:38:19 -0700
Message-ID: <200606051938.20617.kmh@sonic.net>
References: <200606060220.k562KRc2009433@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1928753302=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606060220.k562KRc2009433@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1928753302==
Content-Type: multipart/signed; boundary="nextPart2544209.WPKh5gd8W8";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2544209.WPKh5gd8W8
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> You might explore ways to reduce the modules's (e.g., limit inlining).
> You might also try compiling with the -mlong-calls options.  This forces
> GCC to use the "bve" instruction for calls in PA 2.0 compilations.  The
> call setup using bve is slightly longer but there are no distance
> limitations.  There's also a PA 1.x variant using "ble".  What's unclear
> to me is whether the kernel loader has support for the relocations used
> in these sequences.

I think I'm clearly out of my league here, since I honestly don't understan=
d=20
bve vs ble... :(

Anyway - I tried compiling the module with the "-mlong-calls" option - now =
I=20
get a different error message upon trying to insert the module into the=20
kernel:
	module quickcam: Unknown relocation: 10

Does that tell you anything? Because I have no clue...

Thanks so much for your help!

	Kai

=2D-=20
Hofstadter's Law:
  "It always takes longer than you expect,
   even when you take into account Hofstadter's Law."
                             -- Douglas R. Hofstadter

kmh.AT.sonic.net

Check out Mission Octagon - a new, exciting novel!
http://www.missionoctagon.com

--nextPart2544209.WPKh5gd8W8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEhOqcwl7N6T1/FugRAk2vAJ9+jheiiieY93WsTHGwW7knXFVPpACdHTWY
ck7lHpsPBgczob0QxSE4WBo=
=5PWp
-----END PGP SIGNATURE-----

--nextPart2544209.WPKh5gd8W8--

--===============1928753302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1928753302==--
