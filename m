Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id BADD94829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 03:05:24 -0700 (MST)
Date: Tue, 26 Nov 2002 11:05:17 +0100
Message-ID: <3DAAAD46000048D6@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=========3DAAAD46000048D6/mail.tiscali.be"
Subject: [parisc-linux] uaccess ya patch
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

--=========3DAAAD46000048D6/mail.tiscali.be
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi Randolph,

Much more for info, here is another way I found to implement __put_?_asm64.

--- uaccess.h.orig	2002-11-26 10:11:56.000000000 +0100
+++ uaccess.h	2002-11-26 09:58:08.000000000 +0100
@@ -28,6 +28,11 @@
  * that put_user is the same as __put_user, etc.
  */
 
+extern int __get_kernel_bad(void);
+extern int __get_user_bad(void);
+extern int __put_kernel_bad(void);
+extern int __put_user_bad(void);
+
 #define access_ok(type,addr,size)   (1)
 #define verify_area(type,addr,size) (0)
 
@@ -35,8 +40,12 @@
 #define get_user __get_user
 
 #if BITS_PER_LONG == 32
-#define LDD_KERNEL(ptr)		BUG()
-#define LDD_USER(ptr)		BUG()
+#define LDD_KERNEL(ptr)		__get_kernel_bad();
+#define LDD_USER(ptr)		__get_user_bad();
+/*
+#define STD_KERNEL(x, ptr)	__put_kernel_bad();
+#define STD_USER(x, ptr)	__put_user_bad();
+*/
 #define STD_KERNEL(x, ptr) __put_kernel_asm64(x,ptr)
 #define STD_USER(x, ptr) __put_user_asm64(x,ptr)
 #else
@@ -75,7 +84,7 @@
 	    case 2: __get_kernel_asm("ldh",ptr); break; \
 	    case 4: __get_kernel_asm("ldw",ptr); break; \
 	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: BUG(); break;                      \
+	    default: __get_kernel_bad(); break;         \
 	    }                                           \
 	}                                               \
 	else {                                          \
@@ -84,7 +93,7 @@
 	    case 2: __get_user_asm("ldh",ptr); break;   \
 	    case 4: __get_user_asm("ldw",ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		\
-	    default: BUG(); break;                      \
+	    default: __get_user_bad(); break;           \
 	    }                                           \
 	}                                               \
 							\
@@ -144,7 +153,7 @@
 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
 	    case 8: STD_KERNEL(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
@@ -153,7 +162,7 @@
 	    case 2: __put_user_asm("sth",x,ptr); break;         \
 	    case 4: __put_user_asm("stw",x,ptr); break;         \
 	    case 8: STD_USER(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 								\
@@ -211,45 +220,36 @@
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
 
-static inline void __put_kernel_asm64(u64 x, void *ptr)
-{
-	u32 hi = x>>32;
-	u32 lo = x&0xffffffff;
-	__asm__ __volatile__ (
-		"\n1:\tstw %1,0(%0)\n"
-		"\n2:\tstw %2,4(%0)\n"
-		"3:\n"
-		"\t.section __ex_table,\"a\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
-		 "\t.previous"
-		: : "r"(ptr), "r"(hi), "r"(lo));
-
-}
-
-static inline void __put_user_asm64(u64 x, void *ptr)
-{
-	u32 hi = x>>32;
-	u32 lo = x&0xffffffff;
-	__asm__ __volatile__ (
-		"\n1:\tstw %1,0(%%sr3,%0)\n"
-		"\n2:\tstw %2,4(%%sr3,%0)\n"
-		"3:\n"
-		"\t.section __ex_table,\"a\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
-		 "\t.previous"
-		: : "r"(ptr), "r"(hi), "r"(lo));
+#define __put_kernel_asm64(x, ptr)		\
+	__asm__ __volatile__ (			\
+		"\n1:\tstw\t%2,0(%1)\n"		\
+		"2:\tstw\t%R2,4(%1)\n"		\
+		"3:\n"				\
+		"\t.section __ex_table,\"a\"\n"	\
+		 "\t.word\t1b\n"		\
+		 "\t.word\t(3b-1b)+1\n"		\
+		 "\t.word\t2b\n"		\
+		 "\t.word\t(3b-2b)+1\n"		\
+		 "\t.previous"			\
+		: "=r"(__pu_err)		\
+		: "r"(ptr), "r"(x), "0"(__pu_err))
 
-}
+#define __put_user_asm64(x, ptr)		\
+	__asm__ __volatile__ (			\
+		"\n1:\tstw\t%2,0(%%sr3,%1)\n"	\
+		"2:\tstw\t%R2,4(%%sr3,%1)\n"	\
+		"3:\n"				\
+		"\t.section __ex_table,\"a\"\n"	\
+		 "\t.word\t1b\n"		\
+		 "\t.word\t(3b-1b)+1\n"		\
+		 "\t.word\t2b\n"		\
+		 "\t.word\t(3b-2b)+1\n"		\
+		 "\t.previous"			\
+		: "=r"(__pu_err)		\
+		: "r"(ptr), "r"(x), "0"(__pu_err))
 
 #endif
 
-
 /*
  * Complex access routines -- external declarations
  */

Cheers,
    Joel

********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be



--=========3DAAAD46000048D6/mail.tiscali.be
Content-Type: text/plain
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="pa-uaccess_h.txt"

LS0tIHVhY2Nlc3MuaC5vcmlnCTIwMDItMTEtMjYgMTA6MTE6NTYuMDAwMDAwMDAwICswMTAwCisr
KyB1YWNjZXNzLmgJMjAwMi0xMS0yNiAwOTo1ODowOC4wMDAwMDAwMDAgKzAxMDAKQEAgLTI4LDYg
KzI4LDExIEBACiAgKiB0aGF0IHB1dF91c2VyIGlzIHRoZSBzYW1lIGFzIF9fcHV0X3VzZXIsIGV0
Yy4KICAqLwogCitleHRlcm4gaW50IF9fZ2V0X2tlcm5lbF9iYWQodm9pZCk7CitleHRlcm4gaW50
IF9fZ2V0X3VzZXJfYmFkKHZvaWQpOworZXh0ZXJuIGludCBfX3B1dF9rZXJuZWxfYmFkKHZvaWQp
OworZXh0ZXJuIGludCBfX3B1dF91c2VyX2JhZCh2b2lkKTsKKwogI2RlZmluZSBhY2Nlc3Nfb2so
dHlwZSxhZGRyLHNpemUpICAgKDEpCiAjZGVmaW5lIHZlcmlmeV9hcmVhKHR5cGUsYWRkcixzaXpl
KSAoMCkKIApAQCAtMzUsOCArNDAsMTIgQEAKICNkZWZpbmUgZ2V0X3VzZXIgX19nZXRfdXNlcgog
CiAjaWYgQklUU19QRVJfTE9ORyA9PSAzMgotI2RlZmluZSBMRERfS0VSTkVMKHB0cikJCUJVRygp
Ci0jZGVmaW5lIExERF9VU0VSKHB0cikJCUJVRygpCisjZGVmaW5lIExERF9LRVJORUwocHRyKQkJ
X19nZXRfa2VybmVsX2JhZCgpOworI2RlZmluZSBMRERfVVNFUihwdHIpCQlfX2dldF91c2VyX2Jh
ZCgpOworLyoKKyNkZWZpbmUgU1REX0tFUk5FTCh4LCBwdHIpCV9fcHV0X2tlcm5lbF9iYWQoKTsK
KyNkZWZpbmUgU1REX1VTRVIoeCwgcHRyKQlfX3B1dF91c2VyX2JhZCgpOworKi8KICNkZWZpbmUg
U1REX0tFUk5FTCh4LCBwdHIpIF9fcHV0X2tlcm5lbF9hc202NCh4LHB0cikKICNkZWZpbmUgU1RE
X1VTRVIoeCwgcHRyKSBfX3B1dF91c2VyX2FzbTY0KHgscHRyKQogI2Vsc2UKQEAgLTc1LDcgKzg0
LDcgQEAKIAkgICAgY2FzZSAyOiBfX2dldF9rZXJuZWxfYXNtKCJsZGgiLHB0cik7IGJyZWFrOyBc
CiAJICAgIGNhc2UgNDogX19nZXRfa2VybmVsX2FzbSgibGR3IixwdHIpOyBicmVhazsgXAogCSAg
ICBjYXNlIDg6IExERF9LRVJORUwocHRyKTsgYnJlYWs7CQlcCi0JICAgIGRlZmF1bHQ6IEJVRygp
OyBicmVhazsgICAgICAgICAgICAgICAgICAgICAgXAorCSAgICBkZWZhdWx0OiBfX2dldF9rZXJu
ZWxfYmFkKCk7IGJyZWFrOyAgICAgICAgIFwKIAkgICAgfSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCiAJfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAogCWVsc2UgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKQEAgLTg0LDcgKzkzLDcgQEAKIAkgICAgY2FzZSAyOiBfX2dldF91c2VyX2Fz
bSgibGRoIixwdHIpOyBicmVhazsgICBcCiAJICAgIGNhc2UgNDogX19nZXRfdXNlcl9hc20oImxk
dyIscHRyKTsgYnJlYWs7ICAgXAogCSAgICBjYXNlIDg6IExERF9VU0VSKHB0cik7ICBicmVhazsJ
CVwKLQkgICAgZGVmYXVsdDogQlVHKCk7IGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICBcCisJ
ICAgIGRlZmF1bHQ6IF9fZ2V0X3VzZXJfYmFkKCk7IGJyZWFrOyAgICAgICAgICAgXAogCSAgICB9
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAl9ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJCQkJCQkJXApAQCAtMTQ0
LDcgKzE1Myw3IEBACiAJICAgIGNhc2UgMjogX19wdXRfa2VybmVsX2FzbSgic3RoIix4LHB0cik7
IGJyZWFrOyAgICAgICBcCiAJICAgIGNhc2UgNDogX19wdXRfa2VybmVsX2FzbSgic3R3Iix4LHB0
cik7IGJyZWFrOyAgICAgICBcCiAJICAgIGNhc2UgODogU1REX0tFUk5FTCh4LHB0cik7IGJyZWFr
OwkJCVwKLQkgICAgZGVmYXVsdDogQlVHKCk7IGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKKwkgICAgZGVmYXVsdDogX19wdXRfa2VybmVsX2JhZCgpOyBicmVhazsJCQlcCiAJ
ICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAJfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCiAJZWxzZSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCkBAIC0xNTMsNyArMTYyLDcgQEAKIAkgICAgY2FzZSAyOiBfX3B1dF91c2VyX2FzbSgi
c3RoIix4LHB0cik7IGJyZWFrOyAgICAgICAgIFwKIAkgICAgY2FzZSA0OiBfX3B1dF91c2VyX2Fz
bSgic3R3Iix4LHB0cik7IGJyZWFrOyAgICAgICAgIFwKIAkgICAgY2FzZSA4OiBTVERfVVNFUih4
LHB0cik7IGJyZWFrOwkJCVwKLQkgICAgZGVmYXVsdDogQlVHKCk7IGJyZWFrOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKKwkgICAgZGVmYXVsdDogX19wdXRfdXNlcl9iYWQoKTsgYnJl
YWs7CQkJXAogCSAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogCX0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAogCQkJCQkJCQlcCkBAIC0yMTEsNDUgKzIyMCwzNiBAQAogCQk6ICI9ciIo
X19wdV9lcnIpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJOiAiciIocHRyKSwgInIi
KHgpLCAiMCIoX19wdV9lcnIpKQogCi1zdGF0aWMgaW5saW5lIHZvaWQgX19wdXRfa2VybmVsX2Fz
bTY0KHU2NCB4LCB2b2lkICpwdHIpCi17Ci0JdTMyIGhpID0geD4+MzI7Ci0JdTMyIGxvID0geCYw
eGZmZmZmZmZmOwotCV9fYXNtX18gX192b2xhdGlsZV9fICgKLQkJIlxuMTpcdHN0dyAlMSwwKCUw
KVxuIgotCQkiXG4yOlx0c3R3ICUyLDQoJTApXG4iCi0JCSIzOlxuIgotCQkiXHQuc2VjdGlvbiBf
X2V4X3RhYmxlLFwiYVwiXG4iCi0JCSAiXHQud29yZFx0MWJcbiIKLQkJICJcdC53b3JkXHQoM2It
MWIpKzFcbiIKLQkJICJcdC53b3JkXHQyYlxuIgotCQkgIlx0LndvcmRcdCgzYi0yYikrMVxuIgot
CQkgIlx0LnByZXZpb3VzIgotCQk6IDogInIiKHB0ciksICJyIihoaSksICJyIihsbykpOwotCi19
Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBfX3B1dF91c2VyX2FzbTY0KHU2NCB4LCB2b2lk
ICpwdHIpCi17Ci0JdTMyIGhpID0geD4+MzI7Ci0JdTMyIGxvID0geCYweGZmZmZmZmZmOwotCV9f
YXNtX18gX192b2xhdGlsZV9fICgKLQkJIlxuMTpcdHN0dyAlMSwwKCUlc3IzLCUwKVxuIgotCQki
XG4yOlx0c3R3ICUyLDQoJSVzcjMsJTApXG4iCi0JCSIzOlxuIgotCQkiXHQuc2VjdGlvbiBfX2V4
X3RhYmxlLFwiYVwiXG4iCi0JCSAiXHQud29yZFx0MWJcbiIKLQkJICJcdC53b3JkXHQoM2ItMWIp
KzFcbiIKLQkJICJcdC53b3JkXHQyYlxuIgotCQkgIlx0LndvcmRcdCgzYi0yYikrMVxuIgotCQkg
Ilx0LnByZXZpb3VzIgotCQk6IDogInIiKHB0ciksICJyIihoaSksICJyIihsbykpOworI2RlZmlu
ZSBfX3B1dF9rZXJuZWxfYXNtNjQoeCwgcHRyKQkJXAorCV9fYXNtX18gX192b2xhdGlsZV9fICgJ
CQlcCisJCSJcbjE6XHRzdHdcdCUyLDAoJTEpXG4iCQlcCisJCSIyOlx0c3R3XHQlUjIsNCglMSlc
biIJCVwKKwkJIjM6XG4iCQkJCVwKKwkJIlx0LnNlY3Rpb24gX19leF90YWJsZSxcImFcIlxuIglc
CisJCSAiXHQud29yZFx0MWJcbiIJCVwKKwkJICJcdC53b3JkXHQoM2ItMWIpKzFcbiIJCVwKKwkJ
ICJcdC53b3JkXHQyYlxuIgkJXAorCQkgIlx0LndvcmRcdCgzYi0yYikrMVxuIgkJXAorCQkgIlx0
LnByZXZpb3VzIgkJCVwKKwkJOiAiPXIiKF9fcHVfZXJyKQkJXAorCQk6ICJyIihwdHIpLCAiciIo
eCksICIwIihfX3B1X2VycikpCiAKLX0KKyNkZWZpbmUgX19wdXRfdXNlcl9hc202NCh4LCBwdHIp
CQlcCisJX19hc21fXyBfX3ZvbGF0aWxlX18gKAkJCVwKKwkJIlxuMTpcdHN0d1x0JTIsMCglJXNy
MywlMSlcbiIJXAorCQkiMjpcdHN0d1x0JVIyLDQoJSVzcjMsJTEpXG4iCVwKKwkJIjM6XG4iCQkJ
CVwKKwkJIlx0LnNlY3Rpb24gX19leF90YWJsZSxcImFcIlxuIglcCisJCSAiXHQud29yZFx0MWJc
biIJCVwKKwkJICJcdC53b3JkXHQoM2ItMWIpKzFcbiIJCVwKKwkJICJcdC53b3JkXHQyYlxuIgkJ
XAorCQkgIlx0LndvcmRcdCgzYi0yYikrMVxuIgkJXAorCQkgIlx0LnByZXZpb3VzIgkJCVwKKwkJ
OiAiPXIiKF9fcHVfZXJyKQkJXAorCQk6ICJyIihwdHIpLCAiciIoeCksICIwIihfX3B1X2Vycikp
CiAKICNlbmRpZgogCi0KIC8qCiAgKiBDb21wbGV4IGFjY2VzcyByb3V0aW5lcyAtLSBleHRlcm5h
bCBkZWNsYXJhdGlvbnMKICAqLwo=

--=========3DAAAD46000048D6/mail.tiscali.be--
