Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (mail.tiscali.be [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id C91DA4829
	for <parisc-linux@parisc-linux.org>; Fri,  4 Oct 2002 09:31:57 -0600 (MDT)
Date: Fri, 4 Oct 2002 17:24:45 +0200
Message-ID: <3D8EED0B00001557@ocpmta5.be.tiscali.com>
From: Joel.soete@freebel.net
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=========3D8EED0B00001557/mail.tiscali.be"
Subject: [parisc-linux] Need help to improve uaccess.h patch
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

--=========3D8EED0B00001557/mail.tiscali.be
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi all,

With evms-1.2.0, I test following draft of uaccess.h.

Can somebody have a close look on this code to make it relevant for all
(I not sure of exception condition (ie segv) because I do not find any way
to stress it and do not find usage of get_user_asm_64)?

Thanks in advance for attention and futher help,
    Joel


########
--- uaccess.h.orig	2002-10-04 10:23:59.000000000 +0200
+++ uaccess.h	2002-10-04 17:07:54.000000000 +0200
@@ -35,10 +35,15 @@
 #define get_user __get_user
 
 #if BITS_PER_LONG == 32
-#define LDD_KERNEL(ptr)		BUG()
-#define LDD_USER(ptr)		BUG()
-#define STD_KERNEL(x, ptr)	BUG()
-#define STD_USER(x, ptr)	BUG()
+
+#define LDD_KERNEL(x, ptr) __get_kernel_asm_64(x, ptr)
+
+#define LDD_USER(x, ptr) __get_user_asm_64(x, ptr)
+
+#define STD_KERNEL(x, ptr) __put_kernel_asm_64(x, ptr)
+
+#define STD_USER(x, ptr) __put_user_asm_64(x, ptr)
+
 #else
 #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
 #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
@@ -68,27 +73,28 @@
 ({                                                      \
 	register long __gu_err __asm__ ("r8") = 0;      \
 	register long __gu_val __asm__ ("r9") = 0;      \
+                                                        \
+        unsigned int __tmp = 0;                         \
 							\
 	if (segment_eq(get_fs(),KERNEL_DS)) {           \
 	    switch (sizeof(*(ptr))) {                   \
-	    case 1: __get_kernel_asm("ldb",ptr); break; \
-	    case 2: __get_kernel_asm("ldh",ptr); break; \
-	    case 4: __get_kernel_asm("ldw",ptr); break; \
-	    case 8: LDD_KERNEL(ptr); break;		\
+	    case 1: __get_kernel_asm("ldb",x, ptr); break; \
+	    case 2: __get_kernel_asm("ldh",x, ptr); break; \
+	    case 4: __get_kernel_asm("ldw",x, ptr); break; \
+	    case 8: LDD_KERNEL(x, ptr); break;		\
 	    default: BUG(); break;                      \
 	    }                                           \
 	}                                               \
 	else {                                          \
 	    switch (sizeof(*(ptr))) {                   \
-	    case 1: __get_user_asm("ldb",ptr); break;   \
-	    case 2: __get_user_asm("ldh",ptr); break;   \
-	    case 4: __get_user_asm("ldw",ptr); break;   \
-	    case 8: LDD_USER(ptr);  break;		\
+	    case 1: __get_user_asm("ldb",x, ptr); break;   \
+	    case 2: __get_user_asm("ldh",x, ptr); break;   \
+	    case 4: __get_user_asm("ldw",x, ptr); break;   \
+	    case 8: LDD_USER(x, ptr);  break;		\
 	    default: BUG(); break;                      \
 	    }                                           \
 	}                                               \
 							\
-	(x) = (__typeof__(*(ptr))) __gu_val;            \
 	__gu_err;                                       \
 })
 
@@ -113,7 +119,7 @@
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));
 #else
-#define __get_kernel_asm(ldx,ptr)                       \
+#define __get_kernel_asm(ldx,x, ptr)                    \
 	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
 		"2:\n"					\
 		"\t.section __ex_table,\"a\"\n"         \
@@ -121,9 +127,25 @@
 		 "\t.word\t(2b-1b)+3\n"                 \
 		 "\t.previous"                          \
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err));             \
+	(x) = (__typeof__(*(ptr))) __gu_val;
 
-#define __get_user_asm(ldx,ptr)                         \
+#define __get_kernel_asm_64(x, ptr)                         \
+        __asm__ ("\n\tldw\t4(%1),%3\n"                      \
+                 "1:\tstw\t%3,4(%2)\n"                      \
+                 "\tldw\t0(%1),%3\n"                        \
+                 "2:\tstw\t%3,0(%2)\n"                      \
+                "3:\n"                                      \
+                "\t.section __ex_table,\"a\"\n"             \
+                 "\t.word\t1b\n"                            \
+                 "\t.word\t(3b-1b)+1\n"                     \
+                 "\t.word\t2b\n"                            \
+                 "\t.word\t(3b-2b)+1\n"                     \
+                 "\t.previous"                              \
+                : "=r"(__gu_err)                            \
+                : "r"(ptr), "r"(&(x)), "r"(__tmp), "0"(__gu_err));
+
+#define __get_user_asm(ldx,x, ptr)                      \
 	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
 		"2:\n"					\
 		"\t.section __ex_table,\"a\"\n"         \
@@ -131,19 +153,38 @@
 		 "\t.word\t(2b-1b)+3\n"                 \
 		 "\t.previous"                          \
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err));             \
+	(x) = (__typeof__(*(ptr))) __gu_val;
+
+#define __get_user_asm_64(x, ptr)                           \
+        __asm__ ("\n\tldw\t4(%%sr3,%1),%3\n"                \
+                 "1:\tstw\t%3,4(%2)\n"                      \
+                 "\tldw\t0(%%sr3,%1),%3\n"                  \
+                 "2:\tstw\t%3,0(%2)\n"                      \
+                "3:\n"                                      \
+                "\t.section __ex_table,\"a\"\n"             \
+                 "\t.word\t1b\n"                            \
+                 "\t.word\t(3b-1b)+1\n"                     \
+                 "\t.word\t2b\n"                            \
+                 "\t.word\t(3b-2b)+1\n"                     \
+                 "\t.previous"                              \
+                : "=r"(__gu_err)                            \
+                : "r"(ptr), "r"(&(x)), "r"(__tmp), "0"(__gu_err));
+
 #endif
 
 #define __put_user(x,ptr)                                       \
 ({								\
 	register long __pu_err __asm__ ("r8") = 0;		\
+        unsigned long long X = (unsigned long long) x;          \
+        unsigned long long * __tmp = 0;                         \
 								\
 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
 	    switch (sizeof(*(ptr))) {                           \
 	    case 1: __put_kernel_asm("stb",x,ptr); break;       \
 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
-	    case 8: STD_KERNEL(x,ptr); break;			\
+	    case 8: STD_KERNEL(X,ptr); break;			\
 	    default: BUG(); break;                              \
 	    }                                                   \
 	}                                                       \
@@ -152,7 +193,7 @@
 	    case 1: __put_user_asm("stb",x,ptr); break;         \
 	    case 2: __put_user_asm("sth",x,ptr); break;         \
 	    case 4: __put_user_asm("stw",x,ptr); break;         \
-	    case 8: STD_USER(x,ptr); break;			\
+	    case 8: STD_USER(X,ptr); break;			\
 	    default: BUG(); break;                              \
 	    }                                                   \
 	}                                                       \
@@ -200,6 +241,22 @@
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
 
+#define __put_kernel_asm_64(X, ptr)                           \
+	__asm__ __volatile__ (                              \
+		"\n\tldw\t0(%2),%3\n"                       \
+		"1:\tstw\t%3,0(%1)\n"                 \
+		"\tldw\t4(%2),%3\n"		            \
+		"2:\tstw\t%3,4(%1)\n"                 \
+		"3:\n"					    \
+		"\t.section __ex_table,\"a\"\n"             \
+		 "\t.word\t1b\n"                            \
+		 "\t.word\t(3b-1b)+1\n"                     \
+		 "\t.word\t2b\n"                            \
+		 "\t.word\t(3b-2b)+1\n"                     \
+		 "\t.previous"                              \
+		: "=r"(__pu_err)                            \
+		: "r"(ptr), "r"(&(X)), "r"(__tmp), "0"(__pu_err))
+
 #define __put_user_asm(stx,x,ptr)                           \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
@@ -210,6 +267,23 @@
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
+
+#define __put_user_asm_64(X, ptr)                           \
+	__asm__ __volatile__ (                              \
+		"\n\tldw\t0(%2),%3\n"                       \
+		"1:\tstw\t%3,0(%%sr3,%1)\n"                 \
+		"\tldw\t4(%2),%3\n"		            \
+		"2:\tstw\t%3,4(%%sr3,%1)\n"                 \
+		"3:\n"					    \
+		"\t.section __ex_table,\"a\"\n"             \
+		 "\t.word\t1b\n"                            \
+		 "\t.word\t(3b-1b)+1\n"                     \
+		 "\t.word\t2b\n"                            \
+		 "\t.word\t(3b-2b)+1\n"                     \
+		 "\t.previous"                              \
+		: "=r"(__pu_err)                            \
+		: "r"(ptr), "r"(&(X)), "r"(__tmp), "0"(__pu_err))
+
 #endif
#########


--=========3D8EED0B00001557/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="pa-uaccess_h.patch"

LS0tIHVhY2Nlc3MuaC5vcmlnCTIwMDItMTAtMDQgMTA6MjM6NTkuMDAwMDAwMDAwICswMjAwCisr
KyB1YWNjZXNzLmgJMjAwMi0xMC0wNCAxNzowNzo1NC4wMDAwMDAwMDAgKzAyMDAKQEAgLTM1LDEw
ICszNSwxNSBAQAogI2RlZmluZSBnZXRfdXNlciBfX2dldF91c2VyCiAKICNpZiBCSVRTX1BFUl9M
T05HID09IDMyCi0jZGVmaW5lIExERF9LRVJORUwocHRyKQkJQlVHKCkKLSNkZWZpbmUgTEREX1VT
RVIocHRyKQkJQlVHKCkKLSNkZWZpbmUgU1REX0tFUk5FTCh4LCBwdHIpCUJVRygpCi0jZGVmaW5l
IFNURF9VU0VSKHgsIHB0cikJQlVHKCkKKworI2RlZmluZSBMRERfS0VSTkVMKHgsIHB0cikgX19n
ZXRfa2VybmVsX2FzbV82NCh4LCBwdHIpCisKKyNkZWZpbmUgTEREX1VTRVIoeCwgcHRyKSBfX2dl
dF91c2VyX2FzbV82NCh4LCBwdHIpCisKKyNkZWZpbmUgU1REX0tFUk5FTCh4LCBwdHIpIF9fcHV0
X2tlcm5lbF9hc21fNjQoeCwgcHRyKQorCisjZGVmaW5lIFNURF9VU0VSKHgsIHB0cikgX19wdXRf
dXNlcl9hc21fNjQoeCwgcHRyKQorCiAjZWxzZQogI2RlZmluZSBMRERfS0VSTkVMKHB0cikgX19n
ZXRfa2VybmVsX2FzbSgibGRkIixwdHIpCiAjZGVmaW5lIExERF9VU0VSKHB0cikgX19nZXRfdXNl
cl9hc20oImxkZCIscHRyKQpAQCAtNjgsMjcgKzczLDI4IEBACiAoeyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAlyZWdpc3RlciBsb25nIF9f
Z3VfZXJyIF9fYXNtX18gKCJyOCIpID0gMDsgICAgICBcCiAJcmVnaXN0ZXIgbG9uZyBfX2d1X3Zh
bCBfX2FzbV9fICgicjkiKSA9IDA7ICAgICAgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIHVuc2lnbmVkIGludCBfX3Rt
cCA9IDA7ICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJCQkJCQlcCiAJaWYgKHNlZ21lbnRf
ZXEoZ2V0X2ZzKCksS0VSTkVMX0RTKSkgeyAgICAgICAgICAgXAogCSAgICBzd2l0Y2ggKHNpemVv
ZigqKHB0cikpKSB7ICAgICAgICAgICAgICAgICAgIFwKLQkgICAgY2FzZSAxOiBfX2dldF9rZXJu
ZWxfYXNtKCJsZGIiLHB0cik7IGJyZWFrOyBcCi0JICAgIGNhc2UgMjogX19nZXRfa2VybmVsX2Fz
bSgibGRoIixwdHIpOyBicmVhazsgXAotCSAgICBjYXNlIDQ6IF9fZ2V0X2tlcm5lbF9hc20oImxk
dyIscHRyKTsgYnJlYWs7IFwKLQkgICAgY2FzZSA4OiBMRERfS0VSTkVMKHB0cik7IGJyZWFrOwkJ
XAorCSAgICBjYXNlIDE6IF9fZ2V0X2tlcm5lbF9hc20oImxkYiIseCwgcHRyKTsgYnJlYWs7IFwK
KwkgICAgY2FzZSAyOiBfX2dldF9rZXJuZWxfYXNtKCJsZGgiLHgsIHB0cik7IGJyZWFrOyBcCisJ
ICAgIGNhc2UgNDogX19nZXRfa2VybmVsX2FzbSgibGR3Iix4LCBwdHIpOyBicmVhazsgXAorCSAg
ICBjYXNlIDg6IExERF9LRVJORUwoeCwgcHRyKTsgYnJlYWs7CQlcCiAJICAgIGRlZmF1bHQ6IEJV
RygpOyBicmVhazsgICAgICAgICAgICAgICAgICAgICAgXAogCSAgICB9ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAl9ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAJZWxzZSB7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAogCSAgICBzd2l0Y2ggKHNpemVvZigqKHB0cikpKSB7ICAgICAg
ICAgICAgICAgICAgIFwKLQkgICAgY2FzZSAxOiBfX2dldF91c2VyX2FzbSgibGRiIixwdHIpOyBi
cmVhazsgICBcCi0JICAgIGNhc2UgMjogX19nZXRfdXNlcl9hc20oImxkaCIscHRyKTsgYnJlYWs7
ICAgXAotCSAgICBjYXNlIDQ6IF9fZ2V0X3VzZXJfYXNtKCJsZHciLHB0cik7IGJyZWFrOyAgIFwK
LQkgICAgY2FzZSA4OiBMRERfVVNFUihwdHIpOyAgYnJlYWs7CQlcCisJICAgIGNhc2UgMTogX19n
ZXRfdXNlcl9hc20oImxkYiIseCwgcHRyKTsgYnJlYWs7ICAgXAorCSAgICBjYXNlIDI6IF9fZ2V0
X3VzZXJfYXNtKCJsZGgiLHgsIHB0cik7IGJyZWFrOyAgIFwKKwkgICAgY2FzZSA0OiBfX2dldF91
c2VyX2FzbSgibGR3Iix4LCBwdHIpOyBicmVhazsgICBcCisJICAgIGNhc2UgODogTEREX1VTRVIo
eCwgcHRyKTsgIGJyZWFrOwkJXAogCSAgICBkZWZhdWx0OiBCVUcoKTsgYnJlYWs7ICAgICAgICAg
ICAgICAgICAgICAgIFwKIAkgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCiAJfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogCQkJCQkJCVwKLQkoeCkgPSAoX190eXBlb2ZfXygqKHB0cikpKSBfX2d1X3ZhbDsgICAg
ICAgICAgICBcCiAJX19ndV9lcnI7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogfSkKIApAQCAtMTEzLDcgKzExOSw3IEBACiAJCTogIj1yIihfX2d1X3ZhbCksICI9ciIo
X19ndV9lcnIpICAgICAgICBcCiAJCTogInIiKHB0ciksICIxIihfX2d1X2VycikpOwogI2Vsc2UK
LSNkZWZpbmUgX19nZXRfa2VybmVsX2FzbShsZHgscHRyKSAgICAgICAgICAgICAgICAgICAgICAg
XAorI2RlZmluZSBfX2dldF9rZXJuZWxfYXNtKGxkeCx4LCBwdHIpICAgICAgICAgICAgICAgICAg
ICBcCiAJX19hc21fXygiXG4xOlx0IiBsZHggIlx0MCglMiksJTBcbiIgICAgICAgICAgICAgXAog
CQkiMjpcbiIJCQkJCVwKIAkJIlx0LnNlY3Rpb24gX19leF90YWJsZSxcImFcIlxuIiAgICAgICAg
IFwKQEAgLTEyMSw5ICsxMjcsMjUgQEAKIAkJICJcdC53b3JkXHQoMmItMWIpKzNcbiIgICAgICAg
ICAgICAgICAgIFwKIAkJICJcdC5wcmV2aW91cyIgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
IAkJOiAiPXIiKF9fZ3VfdmFsKSwgIj1yIihfX2d1X2VycikgICAgICAgIFwKLQkJOiAiciIocHRy
KSwgIjEiKF9fZ3VfZXJyKSk7CisJCTogInIiKHB0ciksICIxIihfX2d1X2VycikpOyAgICAgICAg
ICAgICBcCisJKHgpID0gKF9fdHlwZW9mX18oKihwdHIpKSkgX19ndV92YWw7CiAKLSNkZWZpbmUg
X19nZXRfdXNlcl9hc20obGR4LHB0cikgICAgICAgICAgICAgICAgICAgICAgICAgXAor
I2RlZmluZSBfX2dldF9rZXJuZWxfYXNtXzY0KHgsIHB0cikgICAgICAgICAgICAgICAgICAgICAg
ICAgXAorICAgICAgICBfX2FzbV9fICgiXG5cdGxkd1x0NCglMSksJTNcbiIgICAgICAgICAgICAg
ICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiMTpcdHN0d1x0JTMsNCglMilcbiIgICAgICAg
ICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiXHRsZHdcdDAoJTEpLCUzXG4iICAg
ICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiMjpcdHN0d1x0JTMsMCgl
MilcbiIgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICIzOlxuIiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICJcdC5z
ZWN0aW9uIF9fZXhfdGFibGUsXCJhXCJcbiIgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAg
ICAiXHQud29yZFx0MWJcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAg
ICAgICAgICAiXHQud29yZFx0KDNiLTFiKSsxXG4iICAgICAgICAgICAgICAgICAgICAgXAorICAg
ICAgICAgICAgICAgICAiXHQud29yZFx0MmJcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorICAgICAgICAgICAgICAgICAiXHQud29yZFx0KDNiLTJiKSsxXG4iICAgICAgICAgICAgICAg
ICAgICAgXAorICAgICAgICAgICAgICAgICAiXHQucHJldmlvdXMiICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgIDogIj1yIihfX2d1X2VycikgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgIDogInIiKHB0ciksICJyIigmKHgp
KSwgInIiKF9fdG1wKSwgIjAiKF9fZ3VfZXJyKSk7CisKKyNkZWZpbmUgX19nZXRfdXNlcl9hc20o
bGR4LHgsIHB0cikgICAgICAgICAgICAgICAgICAgICAgXAogCV9fYXNtX18oIlxuMTpcdCIgbGR4
ICJcdDAoJSVzcjMsJTIpLCUwXG4iICAgICAgIFwKIAkJIjI6XG4iCQkJCQlcCiAJCSJcdC5zZWN0
aW9uIF9fZXhfdGFibGUsXCJhXCJcbiIgICAgICAgICBcCkBAIC0xMzEsMTkgKzE1MywzOCBAQAog
CQkgIlx0LndvcmRcdCgyYi0xYikrM1xuIiAgICAgICAgICAgICAgICAgXAogCQkgIlx0LnByZXZp
b3VzIiAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCQk6ICI9ciIoX19ndV92YWwpLCAiPXIi
KF9fZ3VfZXJyKSAgICAgICAgXAotCQk6ICJyIihwdHIpLCAiMSIoX19ndV9lcnIpKTsKKwkJOiAi
ciIocHRyKSwgIjEiKF9fZ3VfZXJyKSk7ICAgICAgICAgICAgIFwKKwkoeCkgPSAoX190eXBlb2Zf
XygqKHB0cikpKSBfX2d1X3ZhbDsKKworI2RlZmluZSBfX2dldF91c2VyX2FzbV82NCh4LCBwdHIp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBfX2FzbV9fICgiXG5cdGxkd1x0
NCglJXNyMywlMSksJTNcbiIgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiMTpc
dHN0d1x0JTMsNCglMilcbiIgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAg
ICAiXHRsZHdcdDAoJSVzcjMsJTEpLCUzXG4iICAgICAgICAgICAgICAgICAgXAorICAgICAgICAg
ICAgICAgICAiMjpcdHN0d1x0JTMsMCglMilcbiIgICAgICAgICAgICAgICAgICAgICAgXAorICAg
ICAgICAgICAgICAgICIzOlxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorICAgICAgICAgICAgICAgICJcdC5zZWN0aW9uIF9fZXhfdGFibGUsXCJhXCJcbiIgICAgICAg
ICAgICAgXAorICAgICAgICAgICAgICAgICAiXHQud29yZFx0MWJcbiIgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiXHQud29yZFx0KDNiLTFiKSsxXG4iICAg
ICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiXHQud29yZFx0MmJcbiIgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiXHQud29yZFx0KDNi
LTJiKSsxXG4iICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAiXHQucHJl
dmlvdXMiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgIDog
Ij1yIihfX2d1X2VycikgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAg
ICAgIDogInIiKHB0ciksICJyIigmKHgpKSwgInIiKF9fdG1wKSwgIjAiKF9fZ3VfZXJyKSk7CisK
ICNlbmRpZgogCiAjZGVmaW5lIF9fcHV0X3VzZXIoeCxwdHIpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAogKHsJCQkJCQkJCVwKIAlyZWdpc3RlciBsb25nIF9fcHVfZXJy
IF9fYXNtX18gKCJyOCIpID0gMDsJCVwKKyAgICAgICAgdW5zaWduZWQgbG9uZyBsb25nIFggPSAo
dW5zaWduZWQgbG9uZyBsb25nKSB4OyAgICAgICAgICBcCisgICAgICAgIHVuc2lnbmVkIGxvbmcg
bG9uZyAqIF9fdG1wID0gMDsgICAgICAgICAgICAgICAgICAgICAgICAgXAogCQkJCQkJCQlcCiAJ
aWYgKHNlZ21lbnRfZXEoZ2V0X2ZzKCksS0VSTkVMX0RTKSkgeyAgICAgICAgICAgICAgICAgICBc
CiAJICAgIHN3aXRjaCAoc2l6ZW9mKCoocHRyKSkpIHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCiAJICAgIGNhc2UgMTogX19wdXRfa2VybmVsX2FzbSgic3RiIix4LHB0cik7IGJyZWFrOyAg
ICAgICBcCiAJICAgIGNhc2UgMjogX19wdXRfa2VybmVsX2FzbSgic3RoIix4LHB0cik7IGJyZWFr
OyAgICAgICBcCiAJICAgIGNhc2UgNDogX19wdXRfa2VybmVsX2FzbSgic3R3Iix4LHB0cik7IGJy
ZWFrOyAgICAgICBcCi0JICAgIGNhc2UgODogU1REX0tFUk5FTCh4LHB0cik7IGJyZWFrOwkJCVwK
KwkgICAgY2FzZSA4OiBTVERfS0VSTkVMKFgscHRyKTsgYnJlYWs7CQkJXAogCSAgICBkZWZhdWx0
OiBCVUcoKTsgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCSAgICB9ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCX0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XApAQCAtMTUyLDcgKzE5Myw3IEBACiAJICAgIGNhc2UgMTogX19wdXRfdXNlcl9hc20oInN0YiIs
eCxwdHIpOyBicmVhazsgICAgICAgICBcCiAJICAgIGNhc2UgMjogX19wdXRfdXNlcl9hc20oInN0
aCIseCxwdHIpOyBicmVhazsgICAgICAgICBcCiAJICAgIGNhc2UgNDogX19wdXRfdXNlcl9hc20o
InN0dyIseCxwdHIpOyBicmVhazsgICAgICAgICBcCi0JICAgIGNhc2UgODogU1REX1VTRVIoeCxw
dHIpOyBicmVhazsJCQlcCisJICAgIGNhc2UgODogU1REX1VTRVIoWCxwdHIpOyBicmVhazsJCQlc
CiAJICAgIGRlZmF1bHQ6IEJVRygpOyBicmVhazsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCiAJICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAJfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCkBAIC0yMDAsNiArMjQxLDIyIEBACiAJCTogIj1yIihfX3B1X2VycikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAogCQk6ICJyIihwdHIpLCAiciIoeCksICIwIihfX3B1X2Vy
cikpCiAKKyNkZWZpbmUgX19wdXRfa2VybmVsX2FzbV82NChYLCBwdHIpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorCV9fYXNtX18gX192b2xhdGlsZV9fICggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCisJCSJcblx0bGR3XHQwKCUyKSwlM1xuIiAgICAgICAgICAgICAgICAgICAg
ICAgXAorCQkiMTpcdHN0d1x0JTMsMCglMSlcbiIgICAgICAgICAgICAgICAgIFwKKwkJIlx0bGR3
XHQ0KCUyKSwlM1xuIgkJICAgICAgICAgICAgXAorCQkiMjpcdHN0d1x0JTMsNCglMSlcbiIgICAg
ICAgICAgICAgICAgIFwKKwkJIjM6XG4iCQkJCQkgICAgXAorCQkiXHQuc2VjdGlvbiBfX2V4X3Rh
YmxlLFwiYVwiXG4iICAgICAgICAgICAgIFwKKwkJICJcdC53b3JkXHQxYlxuIiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCisJCSAiXHQud29yZFx0KDNiLTFiKSsxXG4iICAgICAgICAgICAg
ICAgICAgICAgXAorCQkgIlx0LndvcmRcdDJiXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKKwkJICJcdC53b3JkXHQoM2ItMmIpKzFcbiIgICAgICAgICAgICAgICAgICAgICBcCisJCSAi
XHQucHJldmlvdXMiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorCQk6ICI9ciIoX19w
dV9lcnIpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKwkJOiAiciIocHRyKSwgInIiKCYo
WCkpLCAiciIoX190bXApLCAiMCIoX19wdV9lcnIpKQorCiAjZGVmaW5lIF9fcHV0X3VzZXJfYXNt
KHN0eCx4LHB0cikgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJX19hc21fXyBfX3ZvbGF0
aWxlX18gKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJIlxuMTpcdCIgc3R4ICJc
dCUyLDAoJSVzcjMsJTEpXG4iICAgICAgICAgICBcCkBAIC0yMTAsNiArMjY3LDIzIEBACiAJCSAi
XHQucHJldmlvdXMiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCQk6ICI9ciIoX19w
dV9lcnIpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJOiAiciIocHRyKSwgInIiKHgp
LCAiMCIoX19wdV9lcnIpKQorCisjZGVmaW5lIF9fcHV0X3VzZXJfYXNtXzY0KFgsIHB0cikgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCisJX19hc21fXyBfX3ZvbGF0aWxlX18gKCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKKwkJIlxuXHRsZHdcdDAoJTIpLCUzXG4iICAgICAgICAg
ICAgICAgICAgICAgICBcCisJCSIxOlx0c3R3XHQlMywwKCUlc3IzLCUxKVxuIiAgICAgICAgICAg
ICAgICAgXAorCQkiXHRsZHdcdDQoJTIpLCUzXG4iCQkgICAgICAgICAgICBcCisJCSIyOlx0c3R3
XHQlMyw0KCUlc3IzLCUxKVxuIiAgICAgICAgICAgICAgICAgXAorCQkiMzpcbiIJCQkJCSAgICBc
CisJCSJcdC5zZWN0aW9uIF9fZXhfdGFibGUsXCJhXCJcbiIgICAgICAgICAgICAgXAorCQkgIlx0
LndvcmRcdDFiXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKwkJICJcdC53b3JkXHQo
M2ItMWIpKzFcbiIgICAgICAgICAgICAgICAgICAgICBcCisJCSAiXHQud29yZFx0MmJcbiIgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorCQkgIlx0LndvcmRcdCgzYi0yYikrMVxuIiAgICAg
ICAgICAgICAgICAgICAgIFwKKwkJICJcdC5wcmV2aW91cyIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCisJCTogIj1yIihfX3B1X2VycikgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorCQk6ICJyIihwdHIpLCAiciIoJihYKSksICJyIihfX3RtcCksICIwIihfX3B1X2VycikpCisK
ICNlbmRpZgogCiAK

--=========3D8EED0B00001557/mail.tiscali.be--
