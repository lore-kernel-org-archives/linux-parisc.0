Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67C05482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 02:45:04 -0700 (MST)
Date: Fri, 22 Nov 2002 10:44:57 +0100
Message-ID: <3DB57761000044AF@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
To: "Helge Deller" <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org, puffin@esiee.fr
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=========3DB57761000044AF/mail.tiscali.be"
Subject: [parisc-linux] small add patch from 2.4.19 not yet in 2.4.20
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

--=========3DB57761000044AF/mail.tiscali.be
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi Helge and all,

Here is some small diff file of some stuff found in 2.4.19-pa24 but not yet
in 2.4.20-rc1. I am not able to judge their importance so I submit it to
your attention.

=================================================================================
diff -Naur -x CVS -x .cvsignore -x '*.orig' -x math-emu linux-2.4.20-rc1-pa6/arch/parisc/kernel/syscall.S
linux-2.4.20-rc1-pa6t/arch/parisc/kernel/syscall.S
--- linux-2.4.20-rc1-pa6/arch/parisc/kernel/syscall.S	2002-08-07 07:43:26.000000000
+0200
+++ linux-2.4.20-rc1-pa6t/arch/parisc/kernel/syscall.S	2002-10-30 18:39:33.000000000
+0100
@@ -593,18 +593,11 @@
 	ENTRY_DIFF(ftruncate64)	/* 200 */
 	ENTRY_SAME(getdents64)
 	ENTRY_DIFF(fcntl64)
-#ifdef CONFIG_XFS_FS
-	ENTRY_SAME(attrctl)
-	ENTRY_SAME(acl_get)
-	ENTRY_SAME(acl_set)            /* 205 */
-#else
-	ENTRY_SAME(ni_syscall)
-	ENTRY_SAME(ni_syscall)
-	ENTRY_SAME(ni_syscall)	       /* 205 */
-#endif
-	ENTRY_SAME(gettid)             
+	ENTRY_SAME(ni_syscall)		/* attrctl */
+	ENTRY_SAME(ni_syscall)		/* acl_get */
+	ENTRY_SAME(ni_syscall)		/* acl_set */
+	ENTRY_SAME(gettid)
 	ENTRY_SAME(readahead)          
-	ENTRY_SAME(tkill)
 
 .end
 
diff -Naur -x CVS -x .cvsignore -x '*.orig' -x math-emu linux-2.4.20-rc1-pa6/drivers/char/hp_psaux.c
linux-2.4.20-rc1-pa6t/drivers/char/hp_psaux.c
--- linux-2.4.20-rc1-pa6/drivers/char/hp_psaux.c	2002-11-13 16:56:38.000000000
+0100
+++ linux-2.4.20-rc1-pa6t/drivers/char/hp_psaux.c	2002-11-01 19:25:48.000000000
+0100
@@ -197,7 +197,7 @@
 }
 #endif 
 
-static int init_keyb(unsigned long hpa)
+static int __init init_keyb(unsigned long hpa)
 {
 	int res = 0;
 	unsigned long flags;
diff -Naur -x CVS -x .cvsignore -x '*.orig' -x math-emu linux-2.4.20-rc1-pa6/drivers/net/pcnet32.c
linux-2.4.20-rc1-pa6t/drivers/net/pcnet32.c
--- linux-2.4.20-rc1-pa6/drivers/net/pcnet32.c	2002-11-13 16:58:23.000000000
+0100
+++ linux-2.4.20-rc1-pa6t/drivers/net/pcnet32.c	2002-11-01 21:30:18.000000000
+0100
@@ -45,7 +45,7 @@
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
 
-static const char version[] __devinitdata =
+static const char *version =
 DRV_NAME ".c:v" DRV_VERSION " " DRV_RELDATE " tsbogend@alpha.franken.de\n";
 
 /*
@@ -207,10 +207,10 @@
  *	   fix pci probe not increment cards_found
  *	   FD auto negotiate error workaround for xSeries250
  *	   clean up and using new mii module
- * v1.27b  Sep 30 2002 Kent Yoder <yoder1@us.ibm.com>
- * 	   Added timer for cable connection state changes.
- * v1.27c  Sat Apr 13 2002 Helge Deller <deller@gmx.de>
+ * v1.27b  Sat Apr 13 2002 Helge Deller <deller@gmx.de>
  * 	   typo-fixes & cleanups
+ * v1.27c  Sep 30 2002 Kent Yoder <yoder1@us.ibm.com>
+ * 	   Added timer for cable connection state changes.
  */
 
 
diff -Naur -x CVS -x .cvsignore -x '*.orig' -x math-emu linux-2.4.20-rc1-pa6/drivers/scsi/cpqfcTSstructs.h
linux-2.4.20-rc1-pa6t/drivers/scsi/cpqfcTSstructs.h
--- linux-2.4.20-rc1-pa6/drivers/scsi/cpqfcTSstructs.h	2002-11-18 09:10:31.000000000
+0100
+++ linux-2.4.20-rc1-pa6t/drivers/scsi/cpqfcTSstructs.h	2002-11-07 08:56:22.000000000
+0100
@@ -413,7 +413,9 @@
 } TachLiteERQ;
 
 // for now, just 32 bit DMA, eventually 40something, with code changes
-#define CPQFCTS_DMA_MASK 0xFFFFFFFFUL
+//#define CPQFCTS_DMA_MASK 0xFFFFFFFFUL
+#define CPQFCTS_DMA_MASK ((unsigned long) (0x00000000FFFFFFFF))
+
 
 #define TL_MAX_SG_ELEM_LEN 0x7ffff  // Max buffer length a single S/G entry
 				// may represent (a hardware limitation).  The
diff -Naur -x CVS -x .cvsignore -x '*.orig' -x math-emu linux-2.4.20-rc1-pa6/fs/exec.c
linux-2.4.20-rc1-pa6t/fs/exec.c
--- linux-2.4.20-rc1-pa6/fs/exec.c	2002-11-18 09:24:17.000000000 +0100
+++ linux-2.4.20-rc1-pa6t/fs/exec.c	2002-11-07 10:31:14.000000000 +0100
@@ -394,6 +394,7 @@
 		struct page *page = bprm->page[i];
 		if (page) {
 			bprm->page[i] = NULL;
+			mm->rss++;
 			put_dirty_page(current,page,stack_base);
 		}
 		stack_base += PAGE_SIZE;

=================================================================================

Thanks in advance,
    Joel


********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be



--=========3DB57761000044AF/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="linux-2.4.20-rc1-pa6_mine.diff1"

ZGlmZiAtTmF1ciAteCBDVlMgLXggLmN2c2lnbm9yZSAteCAnKi5vcmlnJyAteCBtYXRoLWVtdSBs
aW51eC0yLjQuMjAtcmMxLXBhNi9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzY2FsbC5TIGxpbnV4LTIu
NC4yMC1yYzEtcGE2dC9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzY2FsbC5TCi0tLSBsaW51eC0yLjQu
MjAtcmMxLXBhNi9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzY2FsbC5TCTIwMDItMDgtMDcgMDc6NDM6
MjYuMDAwMDAwMDAwICswMjAwCisrKyBsaW51eC0yLjQuMjAtcmMxLXBhNnQvYXJjaC9wYXJpc2Mv
a2VybmVsL3N5c2NhbGwuUwkyMDAyLTEwLTMwIDE4OjM5OjMzLjAwMDAwMDAwMCArMDEwMApAQCAt
NTkzLDE4ICs1OTMsMTEgQEAKIAlFTlRSWV9ESUZGKGZ0cnVuY2F0ZTY0KQkvKiAyMDAgKi8KIAlF
TlRSWV9TQU1FKGdldGRlbnRzNjQpCiAJRU5UUllfRElGRihmY250bDY0KQotI2lmZGVmIENPTkZJ
R19YRlNfRlMKLQlFTlRSWV9TQU1FKGF0dHJjdGwpCi0JRU5UUllfU0FNRShhY2xfZ2V0KQotCUVO
VFJZX1NBTUUoYWNsX3NldCkgICAgICAgICAgICAvKiAyMDUgKi8KLSNlbHNlCi0JRU5UUllfU0FN
RShuaV9zeXNjYWxsKQotCUVOVFJZX1NBTUUobmlfc3lzY2FsbCkKLQlFTlRSWV9TQU1FKG5pX3N5
c2NhbGwpCSAgICAgICAvKiAyMDUgKi8KLSNlbmRpZgotCUVOVFJZX1NBTUUoZ2V0dGlkKSAgICAg
ICAgICAgICAKKwlFTlRSWV9TQU1FKG5pX3N5c2NhbGwpCQkvKiBhdHRyY3RsICovCisJRU5UUllf
U0FNRShuaV9zeXNjYWxsKQkJLyogYWNsX2dldCAqLworCUVOVFJZX1NBTUUobmlfc3lzY2FsbCkJ
CS8qIGFjbF9zZXQgKi8KKwlFTlRSWV9TQU1FKGdldHRpZCkKIAlFTlRSWV9TQU1FKHJlYWRhaGVh
ZCkgICAgICAgICAgCi0JRU5UUllfU0FNRSh0a2lsbCkKIAogLmVuZAogCmRpZmYgLU5hdXIgLXgg
Q1ZTIC14IC5jdnNpZ25vcmUgLXggJyoub3JpZycgLXggbWF0aC1lbXUgbGludXgtMi40LjIwLXJj
MS1wYTYvZHJpdmVycy9jaGFyL2hwX3BzYXV4LmMgbGludXgtMi40LjIwLXJjMS1wYTZ0L2RyaXZl
cnMvY2hhci9ocF9wc2F1eC5jCi0tLSBsaW51eC0yLjQuMjAtcmMxLXBhNi9kcml2ZXJzL2NoYXIv
aHBfcHNhdXguYwkyMDAyLTExLTEzIDE2OjU2OjM4LjAwMDAwMDAwMCArMDEwMAorKysgbGludXgt
Mi40LjIwLXJjMS1wYTZ0L2RyaXZlcnMvY2hhci9ocF9wc2F1eC5jCTIwMDItMTEtMDEgMTk6MjU6
NDguMDAwMDAwMDAwICswMTAwCkBAIC0xOTcsNyArMTk3LDcgQEAKIH0KICNlbmRpZiAKIAotc3Rh
dGljIGludCBpbml0X2tleWIodW5zaWduZWQgbG9uZyBocGEpCitzdGF0aWMgaW50IF9faW5pdCBp
bml0X2tleWIodW5zaWduZWQgbG9uZyBocGEpCiB7CiAJaW50IHJlcyA9IDA7CiAJdW5zaWduZWQg
bG9uZyBmbGFnczsKZGlmZiAtTmF1ciAteCBDVlMgLXggLmN2c2lnbm9yZSAteCAnKi5vcmlnJyAt
eCBtYXRoLWVtdSBsaW51eC0yLjQuMjAtcmMxLXBhNi9kcml2ZXJzL25ldC9wY25ldDMyLmMgbGlu
dXgtMi40LjIwLXJjMS1wYTZ0L2RyaXZlcnMvbmV0L3BjbmV0MzIuYwotLS0gbGludXgtMi40LjIw
LXJjMS1wYTYvZHJpdmVycy9uZXQvcGNuZXQzMi5jCTIwMDItMTEtMTMgMTY6NTg6MjMuMDAwMDAw
MDAwICswMTAwCisrKyBsaW51eC0yLjQuMjAtcmMxLXBhNnQvZHJpdmVycy9uZXQvcGNuZXQzMi5j
CTIwMDItMTEtMDEgMjE6MzA6MTguMDAwMDAwMDAwICswMTAwCkBAIC00NSw3ICs0NSw3IEBACiAj
aW5jbHVkZSA8bGludXgvc2tidWZmLmg+CiAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KIAot
c3RhdGljIGNvbnN0IGNoYXIgdmVyc2lvbltdIF9fZGV2aW5pdGRhdGEgPQorc3RhdGljIGNvbnN0
IGNoYXIgKnZlcnNpb24gPQogRFJWX05BTUUgIi5jOnYiIERSVl9WRVJTSU9OICIgIiBEUlZfUkVM
REFURSAiIHRzYm9nZW5kQGFscGhhLmZyYW5rZW4uZGVcbiI7CiAKIC8qCkBAIC0yMDcsMTAgKzIw
NywxMCBAQAogICoJICAgZml4IHBjaSBwcm9iZSBub3QgaW5jcmVtZW50IGNhcmRzX2ZvdW5kCiAg
KgkgICBGRCBhdXRvIG5lZ290aWF0ZSBlcnJvciB3b3JrYXJvdW5kIGZvciB4U2VyaWVzMjUwCiAg
KgkgICBjbGVhbiB1cCBhbmQgdXNpbmcgbmV3IG1paSBtb2R1bGUKLSAqIHYxLjI3YiAgU2VwIDMw
IDIwMDIgS2VudCBZb2RlciA8eW9kZXIxQHVzLmlibS5jb20+Ci0gKiAJICAgQWRkZWQgdGltZXIg
Zm9yIGNhYmxlIGNvbm5lY3Rpb24gc3RhdGUgY2hhbmdlcy4KLSAqIHYxLjI3YyAgU2F0IEFwciAx
MyAyMDAyIEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4KKyAqIHYxLjI3YiAgU2F0IEFwciAx
MyAyMDAyIEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4KICAqIAkgICB0eXBvLWZpeGVzICYg
Y2xlYW51cHMKKyAqIHYxLjI3YyAgU2VwIDMwIDIwMDIgS2VudCBZb2RlciA8eW9kZXIxQHVzLmli
bS5jb20+CisgKiAJICAgQWRkZWQgdGltZXIgZm9yIGNhYmxlIGNvbm5lY3Rpb24gc3RhdGUgY2hh
bmdlcy4KICAqLwogCiAKZGlmZiAtTmF1ciAteCBDVlMgLXggLmN2c2lnbm9yZSAteCAnKi5vcmln
JyAteCBtYXRoLWVtdSBsaW51eC0yLjQuMjAtcmMxLXBhNi9kcml2ZXJzL3Njc2kvY3BxZmNUU3N0
cnVjdHMuaCBsaW51eC0yLjQuMjAtcmMxLXBhNnQvZHJpdmVycy9zY3NpL2NwcWZjVFNzdHJ1Y3Rz
LmgKLS0tIGxpbnV4LTIuNC4yMC1yYzEtcGE2L2RyaXZlcnMvc2NzaS9jcHFmY1RTc3RydWN0cy5o
CTIwMDItMTEtMTggMDk6MTA6MzEuMDAwMDAwMDAwICswMTAwCisrKyBsaW51eC0yLjQuMjAtcmMx
LXBhNnQvZHJpdmVycy9zY3NpL2NwcWZjVFNzdHJ1Y3RzLmgJMjAwMi0xMS0wNyAwODo1NjoyMi4w
MDAwMDAwMDAgKzAxMDAKQEAgLTQxMyw3ICs0MTMsOSBAQAogfSBUYWNoTGl0ZUVSUTsKIAogLy8g
Zm9yIG5vdywganVzdCAzMiBiaXQgRE1BLCBldmVudHVhbGx5IDQwc29tZXRoaW5nLCB3aXRoIGNv
ZGUgY2hhbmdlcwotI2RlZmluZSBDUFFGQ1RTX0RNQV9NQVNLIDB4RkZGRkZGRkZVTAorLy8jZGVm
aW5lIENQUUZDVFNfRE1BX01BU0sgMHhGRkZGRkZGRlVMCisjZGVmaW5lIENQUUZDVFNfRE1BX01B
U0sgKCh1bnNpZ25lZCBsb25nKSAoMHgwMDAwMDAwMEZGRkZGRkZGKSkKKwogCiAjZGVm
aW5lIFRMX01BWF9TR19FTEVNX0xFTiAweDdmZmZmICAvLyBNYXggYnVmZmVyIGxlbmd0aCBhIHNp
bmdsZSBTL0cgZW50cnkKIAkJCQkvLyBtYXkgcmVwcmVzZW50IChhIGhhcmR3YXJlIGxpbWl0YXRp
b24pLiAgVGhlCmRpZmYgLU5hdXIgLXggQ1ZTIC14IC5jdnNpZ25vcmUgLXggJyoub3JpZycgLXgg
bWF0aC1lbXUgbGludXgtMi40LjIwLXJjMS1wYTYvZnMvZXhlYy5jIGxpbnV4LTIuNC4yMC1yYzEt
cGE2dC9mcy9leGVjLmMKLS0tIGxpbnV4LTIuNC4yMC1yYzEtcGE2L2ZzL2V4ZWMuYwkyMDAyLTEx
LTE4IDA5OjI0OjE3LjAwMDAwMDAwMCArMDEwMAorKysgbGludXgtMi40LjIwLXJjMS1wYTZ0L2Zz
L2V4ZWMuYwkyMDAyLTExLTA3IDEwOjMxOjE0LjAwMDAwMDAwMCArMDEwMApAQCAtMzk0LDYgKzM5
NCw3IEBACiAJCXN0cnVjdCBwYWdlICpwYWdlID0gYnBybS0+cGFnZVtpXTsKIAkJaWYgKHBhZ2Up
IHsKIAkJCWJwcm0tPnBhZ2VbaV0gPSBOVUxMOworCQkJbW0tPnJzcysrOwogCQkJcHV0X2RpcnR5
X3BhZ2UoY3VycmVudCxwYWdlLHN0YWNrX2Jhc2UpOwogCQl9CiAJCXN0YWNrX2Jhc2UgKz0gUEFH
RV9TSVpFOwogCg==

--=========3DB57761000044AF/mail.tiscali.be--
