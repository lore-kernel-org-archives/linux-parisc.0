From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] [patch] use __u64 rather than u64 in parisc statfs
	structs
Date: Sun, 28 Jan 2007 18:48:26 -0500
Message-ID: <200701281848.26804.vapier__19217.0208007612$1416624271$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KZTvFOfaSFWYpfE"
Cc: linux-kernel@vger.kernel.org
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

--Boundary-00=_KZTvFOfaSFWYpfE
Content-Type: multipart/signed; boundary="nextPart4081510.OzWm5YsbKY";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4081510.OzWm5YsbKY
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

the statfs header exports some structs to userspace ... the parisc statfs64=
=20
struct currently uses u64 so the trivial attached patch fixes it to use __u=
64
=2Dmike

--nextPart4081510.OzWm5YsbKY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARb02SkFjO5/oN/WBAQJIbxAAjBDD8IL5Oj0mu1fc+0IPx5DbyMqtgTsk
bBNPwiu1tYEHOuo37HcTXU7dfZgLA3IQJH2QadY3N453LJg0GuHRu8d6kNaMd2bQ
4ihf0alVPKZwo5Q2TXMf9E8caIV4up+BmlT9zfeK/vxnQSfeGskOqszTJ6sV0hNi
BCk2jEB6QmS5GcMhmvNlcvrAQUSJoktGcjn9+TBaohg//CI0tgqJnvS6vcZlyM/Z
jPLPqMqvGVzj79AzAlsaejdx4sUEq23Sc7Msx0yMifmD95SLEOb80bDppTlVMYaG
WzokN4IrGoX7bWHI3bTboRFF80K5zOviK4jHIKlwkHKG44pkVv8mmu5z5Vp6p/GI
kqRQPJhNvT+RwIeKU2ZueqgVW35nTLfJe0IKAxpy83HZ7gMWgGlXjZNxZLkEfX+J
X1wRH9rn5+KjyHOshenYx38QzJys6FSj1uVaGIDTxJ5y0otqm7al3rOGC/yQwNrd
wTCR1tgl5Z5KNgGHBah0WHZNczvFRK/G1QDj0+6gcHUKMQOwPIvz7xOXLnWTJd1Y
WEoCVTlvBeatGQhDY76t0Ywdm0CV17sN1YMyRz6d/k8KJXnM96mRtZ0he5G9NIQQ
3wQVQSk1yspSpfXtISjuceLJ29F8EHXEXWHgC+q3X++sDzL50Sbc1oLeEZeRM3lb
l0TuGNvwdh0=
=8G4Z
-----END PGP SIGNATURE-----

--nextPart4081510.OzWm5YsbKY--

--Boundary-00=_KZTvFOfaSFWYpfE
Content-Type: text/x-diff; charset="us-ascii";
	name="linux-use-__-types-in-parisc-statfs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="linux-use-__-types-in-parisc-statfs.patch"

Use __u64 rather than u64 in the struct statfs64 exported to userspace.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>

--- a/include/asm-parisc/statfs.h
+++ b/include/asm-parisc/statfs.h
@@ -30,11 +30,11 @@ struct statfs {
 struct statfs64 {
 	long f_type;
 	long f_bsize;
-	u64 f_blocks;
-	u64 f_bfree;
-	u64 f_bavail;
-	u64 f_files;
-	u64 f_ffree;
+	__u64 f_blocks;
+	__u64 f_bfree;
+	__u64 f_bavail;
+	__u64 f_files;
+	__u64 f_ffree;
 	__kernel_fsid_t f_fsid;
 	long f_namelen;
 	long f_frsize;

--Boundary-00=_KZTvFOfaSFWYpfE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_KZTvFOfaSFWYpfE--
