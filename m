Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48527482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Aug 2003 02:24:07 -0600 (MDT)
Date: Wed, 6 Aug 2003 10:23:59 +0200
Message-ID: <3F2E54A800000406@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3F2E54A800000406/mail.tiscali.be"
Subject: [parisc-linux] bitops.h patch
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

--========/3F2E54A800000406/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi Grant,

Thanks first for the help of previous patches :-)

And here is the final one for bitops.h suggested by Lamont for
2.6:
diff -Naur linux-2.6.0-test2.orig/include/asm-parisc/bitops.h linux-2.6.0-test2-b/include/asm-parisc/bitops.h
--- linux-2.6.0-test2.orig/include/asm-parisc/bitops.h	2003-08-05 19:24:18.000000000
+0200
+++ linux-2.6.0-test2-b/include/asm-parisc/bitops.h	2003-08-06 10:02:00.000000000
+0200
@@ -223,16 +223,31 @@
  * @word: The word to search
  *
  * Undefined if no bit exists, so code should check against 0 first.
+ *
+ * This is a fast ffs version written by "LaMont Jones <lamont@hp.com>"
  */
-static __inline__ unsigned long __ffs(unsigned long word)
-{
-	unsigned long result = 0;
 
-	while (!(word & 1UL)) {
-		result++;
-		word >>= 1;
-	}
-	return result;
+static __inline__ int __ffs(int x)
+{
+	int ret;
+	__asm__(" ldi    32,%1\n"
+		" extru,<>  %0,31,16,%%r0\n"
+		" extru,TR  %0,15,16,%0\n"
+		" addi    -16,%1,%1\n"
+		" extru,<>  %0,31,8,%%r0\n"
+		" extru,TR  %0,23,8,%0\n"
+		" addi    -8,%1,%1\n"
+		" extru,<>  %0,31,4,%%r0\n"
+		" extru,TR  %0,27,4,%0\n"
+		" addi    -4,%1,%1\n"
+		" extru,<>  %0,31,2,%%r0\n"
+		" extru,TR  %0,29,2,%0\n"
+		" addi    -2,%1,%1\n"
+		" extru,=  %0,31,1,%%r0\n"
+		" addi    -1,%1,%1\n"
+		: "=r" (x), "=r" (ret)
+		: "0" (x), "1" (ret));
+	return ret;
 }
 
 /*
================================================================================

If some interrest could you ci for me (I have no ci access)

Thanks in advance,
    Joel



------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 



--========/3F2E54A800000406/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Bitops-2.6.patch"

ZGlmZiAtTmF1ciBsaW51eC0yLjYuMC10ZXN0Mi5vcmlnL2luY2x1ZGUvYXNtLXBhcmlzYy9iaXRv
cHMuaCBsaW51eC0yLjYuMC10ZXN0Mi1iL2luY2x1ZGUvYXNtLXBhcmlzYy9iaXRvcHMuaAotLS0g
bGludXgtMi42LjAtdGVzdDIub3JpZy9pbmNsdWRlL2FzbS1wYXJpc2MvYml0b3BzLmgJMjAwMy0w
OC0wNSAxOToyNDoxOC4wMDAwMDAwMDAgKzAyMDAKKysrIGxpbnV4LTIuNi4wLXRlc3QyLWIvaW5j
bHVkZS9hc20tcGFyaXNjL2JpdG9wcy5oCTIwMDMtMDgtMDYgMTA6MDI6MDAuMDAwMDAwMDAwICsw
MjAwCkBAIC0yMjMsMTYgKzIyMywzMSBAQAogICogQHdvcmQ6IFRoZSB3b3JkIHRvIHNlYXJjaAog
ICoKICAqIFVuZGVmaW5lZCBpZiBubyBiaXQgZXhpc3RzLCBzbyBjb2RlIHNob3VsZCBjaGVjayBh
Z2FpbnN0IDAgZmlyc3QuCisgKgorICogVGhpcyBpcyBhIGZhc3QgZmZzIHZlcnNpb24gd3JpdHRl
biBieSAiTGFNb250IEpvbmVzIDxsYW1vbnRAaHAuY29tPiIKICAqLwotc3RhdGljIF9faW5saW5l
X18gdW5zaWduZWQgbG9uZyBfX2Zmcyh1bnNpZ25lZCBsb25nIHdvcmQpCi17Ci0JdW5zaWduZWQg
bG9uZyByZXN1bHQgPSAwOwogCi0Jd2hpbGUgKCEod29yZCAmIDFVTCkpIHsKLQkJcmVzdWx0Kys7
Ci0JCXdvcmQgPj49IDE7Ci0JfQotCXJldHVybiByZXN1bHQ7CitzdGF0aWMgX19pbmxpbmVfXyBp
bnQgX19mZnMoaW50IHgpCit7CisJaW50IHJldDsKKwlfX2FzbV9fKCIgbGRpICAgIDMyLCUxXG4i
CisJCSIgZXh0cnUsPD4gICUwLDMxLDE2LCUlcjBcbiIKKwkJIiBleHRydSxUUiAgJTAsMTUsMTYs
JTBcbiIKKwkJIiBhZGRpICAgIC0xNiwlMSwlMVxuIgorCQkiIGV4dHJ1LDw+ICAlMCwzMSw4LCUl
cjBcbiIKKwkJIiBleHRydSxUUiAgJTAsMjMsOCwlMFxuIgorCQkiIGFkZGkgICAgLTgsJTEsJTFc
biIKKwkJIiBleHRydSw8PiAgJTAsMzEsNCwlJXIwXG4iCisJCSIgZXh0cnUsVFIgICUwLDI3LDQs
JTBcbiIKKwkJIiBhZGRpICAgIC00LCUxLCUxXG4iCisJCSIgZXh0cnUsPD4gICUwLDMxLDIsJSVy
MFxuIgorCQkiIGV4dHJ1LFRSICAlMCwyOSwyLCUwXG4iCisJCSIgYWRkaSAgICAtMiwlMSwlMVxu
IgorCQkiIGV4dHJ1LD0gICUwLDMxLDEsJSVyMFxuIgorCQkiIGFkZGkgICAgLTEsJTEsJTFcbiIK
KwkJOiAiPXIiICh4KSwgIj1yIiAocmV0KQorCQk6ICIwIiAoeCksICIxIiAocmV0KSk7CisJcmV0
dXJuIHJldDsKIH0KIAogLyoK


--========/3F2E54A800000406/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Bitops-2.4.patch"

ZGlmZiAtTmF1ciBsaW51eC0yLjQuMjEtcGE5Lm9yaWcvaW5jbHVkZS9hc20tcGFyaXNjL2JpdG9w
cy5oIGxpbnV4LTIuNC4yMS1wYTktYi9pbmNsdWRlL2FzbS1wYXJpc2MvYml0b3BzLmgKLS0tIGxp
bnV4LTIuNC4yMS1wYTkub3JpZy9pbmNsdWRlL2FzbS1wYXJpc2MvYml0b3BzLmgJMjAwMy0wOC0w
NSAxOToxNzozNy4wMDAwMDAwMDAgKzAyMDAKKysrIGxpbnV4LTIuNC4yMS1wYTktYi9pbmNsdWRl
L2FzbS1wYXJpc2MvYml0b3BzLmgJMjAwMy0wOC0wNiAwOTo1MzoyNi4wMDAwMDAwMDAgKzAyMDAK
QEAgLTIwOCwxMyArMjA4LDQ5IEBACiAKICNpZmRlZiBfX0tFUk5FTF9fCiAKKy8qKgorICogX19m
ZnMgLSBmaW5kIGZpcnN0IGJpdCBpbiB3b3JkLgorICogQHdvcmQ6IFRoZSB3b3JkIHRvIHNlYXJj
aAorICoKKyAqIFVuZGVmaW5lZCBpZiBubyBiaXQgZXhpc3RzLCBzbyBjb2RlIHNob3VsZCBjaGVj
ayBhZ2FpbnN0IDAgZmlyc3QuCisgKgorICogVGhpcyBpcyBhIGZhc3QgZmZzIHZlcnNpb24gd3Jp
dHRlbiBieSAiTGFNb250IEpvbmVzIDxsYW1vbnRAaHAuY29tPiIKKyAqLworCitzdGF0aWMgX19p
bmxpbmVfXyBpbnQgX19mZnMoaW50IHgpCit7CisJaW50IHJldDsKKwlfX2FzbV9fKCIgbGRpICAg
IDMyLCUxXG4iCisJCSIgZXh0cnUsPD4gICUwLDMxLDE2LCUlcjBcbiIKKwkJIiBleHRydSxUUiAg
JTAsMTUsMTYsJTBcbiIKKwkJIiBhZGRpICAgIC0xNiwlMSwlMVxuIgorCQkiIGV4dHJ1LDw+ICAl
MCwzMSw4LCUlcjBcbiIKKwkJIiBleHRydSxUUiAgJTAsMjMsOCwlMFxuIgorCQkiIGFkZGkgICAg
LTgsJTEsJTFcbiIKKwkJIiBleHRydSw8PiAgJTAsMzEsNCwlJXIwXG4iCisJCSIgZXh0cnUsVFIg
ICUwLDI3LDQsJTBcbiIKKwkJIiBhZGRpICAgIC00LCUxLCUxXG4iCisJCSIgZXh0cnUsPD4gICUw
LDMxLDIsJSVyMFxuIgorCQkiIGV4dHJ1LFRSICAlMCwyOSwyLCUwXG4iCisJCSIgYWRkaSAgICAt
MiwlMSwlMVxuIgorCQkiIGV4dHJ1LD0gICUwLDMxLDEsJSVyMFxuIgorCQkiIGFkZGkgICAgLTEs
JTEsJTFcbiIKKwkJOiAiPXIiICh4KSwgIj1yIiAocmV0KQorCQk6ICIwIiAoeCksICIxIiAocmV0
KSk7CisJcmV0dXJuIHJldDsKK30KKwogLyoKICAqIGZmczogZmluZCBmaXJzdCBiaXQgc2V0LiBU
aGlzIGlzIGRlZmluZWQgdGhlIHNhbWUgd2F5IGFzCiAgKiB0aGUgbGliYyBhbmQgY29tcGlsZXIg
YnVpbHRpbiBmZnMgcm91dGluZXMsIHRoZXJlZm9yZQogICogZGlmZmVycyBpbiBzcGlyaXQgZnJv
bSB0aGUgYWJvdmUgZmZ6IChtYW4gZmZzKS4KICAqLwotCi0jZGVmaW5lIGZmcyh4KSBnZW5lcmlj
X2Zmcyh4KQorc3RhdGljIF9faW5saW5lX18gaW50IGZmcyhpbnQgeCkKK3sKKwlpZiAoIXgpCisJ
CXJldHVybiAwOworCXJldHVybiBfX2ZmcygodW5zaWduZWQgbG9uZyl4KTsKK30KIAogLyoKICAq
IGh3ZWlnaHROOiByZXR1cm5zIHRoZSBoYW1taW5nIHdlaWdodCAoaS5lLiB0aGUgbnVtYmVyCg==

--========/3F2E54A800000406/mail.tiscali.be--
