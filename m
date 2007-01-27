From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 05:09:49 -0500
Message-ID: <200701270509.50109.vapier__42379.2979251177$1416624268$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1831314481=="
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

--===============1831314481==
Content-Type: multipart/signed; boundary="nextPart4153313.UVMlQnOUaV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4153313.UVMlQnOUaV
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

after upgrading from 2.17.50.0.9 to 2.17.50.0.10 (.11 too), ld seems unable=
 to=20
do anything remotely basic ... is there something basic i'm missing here ? =
 i=20
verified that it isnt caused by the Gentoo patchsets as a vanilla build=20
exhibits the issue as well

$ cat test.c
int main() { fopen(); }
$ gcc test.c
/usr/hppa2.0-unknown-linux-gnu/binutils-bin/2.17.50.0.10/ld: /tmp/ccpL4Tbn.=
o(.text+0x10):=20
cannot handle R_PARISC_PCREL17F for fopen@@GLIBC_2.2
/usr/hppa2.0-unknown-linux-gnu/binutils-bin/2.17.50.0.10/ld: final link=20
failed: Bad value
collect2: ld returned 1 exit status
$ gcc --version
gcc (GCC) 4.1.1 (Gentoo 4.1.1-r3)
=2Dmike

--nextPart4153313.UVMlQnOUaV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARbsk7UFjO5/oN/WBAQIktA//YACyJkFnYlt0teuujM58D7rcYrr2yh82
fM1l44NCdgwzGea/gn8K79/FaYfZqBHq1+kNTbRgbEzs/v9kWACBet6PApa7KooB
7crzZNMS2vp/hPoigmktFj5x1CVzfYN1PbRcarnAH+I9kzoPpmj/H8+NQXIIevou
qaBOpSZhQRtUlxdRtIXKsP28HAkneuoghhZztyhdxRXsamsWjPpyocfwGmCrFx9G
VZqdh688bE+B2Bz/9zVWH/MNU/IPWMnKZAp+oZdztcCzFFO49QK5BWdRfOjqnOB5
HZp1Ki5j42noSHnq+mwekEWj5VI3ssPwWsAtW0XFaKl9VkFSi6Ixoy7nlvEsp4JX
NLcxq/TDkyYoqlCbjlTXkwHoR/lWwR9OHhMLPeg+Bb7q+fX1rsXRUc+HzaLgsW9o
u+SiZBFj9kYwH2JO8KUSuBD2TydQcuhVKpYzKAVYCxP1WaujWbjyHACAgalEvGAp
e4OL2VybPQA3uU2Un2N9LOsk9+8dIjut55WOfTAn9t71X1U/D1QYZeRh6iWEWOJX
ap9AhDOshrQ9SINACSq80WfRgavD3gf+auSNn8w2XJhddjBzpQ/0gCWQmtcnGvWK
0Bw7OGA/AJ8OiIBL6KxeaXrSrMywA+6VjD4Bya15ShBbEIPsWlQmQmx1cNjSgQ+U
3HtYqMFJ8SI=
=cOgw
-----END PGP SIGNATURE-----

--nextPart4153313.UVMlQnOUaV--

--===============1831314481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1831314481==--
