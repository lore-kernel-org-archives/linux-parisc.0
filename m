From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v3] parisc: Change L1_CACHE_BYTES to 16
Date: Wed, 14 Oct 2015 20:32:11 -0400
Message-ID: <B8E85737-5ECD-4CBE-8730-886B098C5FA4@bell.net>
References: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net> <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-10-557980494
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-10-557980494
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The latest version changes L1_CACHE_BYTES to 16 bytes and doesn't adjust =
SMP_CACHE_BYTES as
per James suggestion

Tested for 16 days on rp3440.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-10-557980494
Content-Disposition: attachment;
	filename=cache.h.d.1.txt
Content-Type: text/plain;
	name="cache.h.d.1.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/cache.h =
b/arch/parisc/include/asm/cache.h
index 47f11c7..3d0e17b 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -7,20 +7,12 @@
=20
=20
 /*
- * PA 2.0 processors have 64-byte cachelines; PA 1.1 processors have
- * 32-byte cachelines.  The default configuration is not for SMP =
anyway,
- * so if you're building for SMP, you should select the appropriate
- * processor type.  There is a potential livelock danger when running
- * a machine with this value set too small, but it's more probable =
you'll
- * just ruin performance.
+ * PA 2.0 processors have 64 and 128-byte L2 cachelines; PA 1.1 =
processors
+ * have 32-byte cachelines.  The L1 length appears to be 16 bytes but =
this
+ * is not clearly documented.
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

--Apple-Mail-10-557980494
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-10-557980494--
