From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v2][RFC] parisc: Change L1_CACHE_BYTES to 16
Date: Sun, 27 Sep 2015 12:07:00 -0400
Message-ID: <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>
References: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-6--941130753
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-6--941130753
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2015-09-26, at 11:38 AM, John David Anglin wrote:

> The attached change reduces L1_CACHE_BYTES from 32 on PA1.1 and 64 on =
PA2.0 to 16.
>=20
> This is based on examination of the L1 cache design for the PA-8700 =
processor where it can
> be seen the processor loads two double words per cycle.  This line =
length is consistent with the
> original alignment requirement for the ldcw instruction.
>=20
> Thus, we need to distinguish between the L1 and L2 (SMP) cache line =
lengths.
>=20
> The attached change bumps SMP_CACHE_BYTES to 128 bytes as this is the =
line length used
> on PA-8800 and PA-8900 processors.  This increases the overall kernel =
size somewhat but seems
> logically correct.


Slight tweak to previous.  This version only bumps SMP_CACHE_BYTES when =
CONFIG_SMP
is defined.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-6--941130753
Content-Disposition: attachment;
	filename=cache.h.d.txt
Content-Type: text/plain;
	name="cache.h.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/cache.h =
b/arch/parisc/include/asm/cache.h
index 47f11c7..cf11dd4 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -7,24 +7,27 @@
=20
=20
 /*
- * PA 2.0 processors have 64-byte cachelines; PA 1.1 processors have
- * 32-byte cachelines.  The default configuration is not for SMP =
anyway,
+ * PA 2.0 processors have 64 and 128-byte L2 cachelines; PA 1.1 =
processors
+ * have 32-byte cachelines.  The default configuration is not for SMP =
anyway,
  * so if you're building for SMP, you should select the appropriate
  * processor type.  There is a potential livelock danger when running
  * a machine with this value set too small, but it's more probable =
you'll
  * just ruin performance.
  */
-#ifdef CONFIG_PA20
-#define L1_CACHE_BYTES 64
-#define L1_CACHE_SHIFT 6
-#else
-#define L1_CACHE_BYTES 32
-#define L1_CACHE_SHIFT 5
-#endif
+#define L1_CACHE_BYTES 16
+#define L1_CACHE_SHIFT 4
=20
 #ifndef __ASSEMBLY__
=20
+#ifdef CONFIG_SMP
+#ifdef CONFIG_PA20
+#define SMP_CACHE_BYTES (8 * L1_CACHE_BYTES)
+#else
+#define SMP_CACHE_BYTES (2 * L1_CACHE_BYTES)
+#endif
+#else
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
+#endif
=20
 #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
=20

--Apple-Mail-6--941130753
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-6--941130753--
