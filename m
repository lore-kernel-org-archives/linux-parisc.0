From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] Fwd: [patch] enable pie scripts for hppa64
Date: Wed, 9 Aug 2006 00:13:09 -0400
Message-ID: <200608090013.09789.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0033293297=="
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

--===============0033293297==
Content-Type: multipart/signed; boundary="nextPart39863287.3X00dBzZSq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart39863287.3X00dBzZSq
Content-Type: multipart/mixed;
  boundary="Boundary-01=_VDW2Eb0Wd+te0zQ"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_VDW2Eb0Wd+te0zQ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

ok to apply ?  i dont want to step on anyone's toes ...
-mike

----------  Forwarded Message  ----------

Subject: [patch] enable pie scripts for hppa64
Date: Thursday 20 July 2006 01:18
From: Mike Frysinger <vapier@gentoo.org>
To: binutils@sourceware.org

ld/emulparams/hppalinux.sh was updated not too long ago to enable pie
 scripts, but hppa64linux.sh was skipped ... any reason to not do this ?
-mike

-------------------------------------------------------

--Boundary-01=_VDW2Eb0Wd+te0zQ
Content-Type: text/x-diff; charset="us-ascii";
	name="10_all_generate-pie-scripts.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="10_all_generate-pie-scripts.patch"

2006-07-19  Mike Frysinger  <vapier@gentoo.org>

	* emulparams/hppa64linux.sh (GENERATE_PIE_SCRIPT): Set to yes.

=2D-- ld/emulparams/hppa64linux.sh
+++ ld/emulparams/hppa64linux.sh
@@ -13,6 +13,7 @@
 ENTRY=3D"main"
 TEMPLATE_NAME=3Delf32
 GENERATE_SHLIB_SCRIPT=3Dyes
+GENERATE_PIE_SCRIPT=3Dyes
=20
 # We really want multiple .stub sections, one for each input .text section,
 # but for now this is good enough.

--Boundary-01=_VDW2Eb0Wd+te0zQ--

--nextPart39863287.3X00dBzZSq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUARNlg1UFjO5/oN/WBAQKmZA//e9HhoWrm28GNsuLHq1Sr89xqJDmkK+dL
OdizL9UnbBu6NdW7E58OX4s+/eK9ppJjH5Mwto2Xe8B/IATy3bwQhjRsSlLsWnCe
bKD42p7xufBff3lq1Jau2fD2gpvZI62qa4+t/34mVD/NJKxIyFZvJONI3PimCFt8
j7LZQte1uHlgTWf1GJj+5rmhhsCxx7y2nvXb8F94eHEGK2zOEoaqm5y0UQI6buPi
INg6bseFgqchdjncpmeKlgEzEUfjdrccSkWKxQgyrMAhlBRiGmgloeMZMiRHkvPe
lVTLS1FURUThEOBTgbF2xkWRfAFbkouew36YMCneSLWsHv+2I4k6AaPNRnmX5YfD
2kVu/tM5KmJkmKf2LYDIpYfJq2/hC6qFGvJf7W7CX2mYo71hrOZb3+Ri1VrvNLzU
BC9CMn+JFatz9JYyMPnT9/oGONLSdb3Nyv6c2E3hJ56UZUCz2d0OCQ9SFPbb7CAf
uVclsEFeSCFfrDbLPVq+HnskVioqvA8lB3QNYMFUnCsGU+NCySpJzliuCN45HM3p
lfxYy+zfgP2Cm8O6sr5RgMFe5dJOgJc3dd6P5t1b5p0wFRILSR8IG8Wg18PAqk7h
53l0+zti1W03YrEOHtnIiVIWFChgHYXD6jjX45n8z42WTlKMaPjRWzw2+S01NXYk
lO5POlxG05w=
=blu5
-----END PGP SIGNATURE-----

--nextPart39863287.3X00dBzZSq--

--===============0033293297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0033293297==--
