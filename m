Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 596324845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Dec 2003 03:11:49 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 1ARqRF-0004YN-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 04 Dec 2003 11:10:25 +0100
Date: Thu, 4 Dec 2003 11:10:25 +0100
Message-ID: <3FB25B960000DA96@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3FB25B960000DA96/mail.tiscali.be"
Subject: [parisc-linux] 2.4.23 lcopy_in_user backport
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

--========/3FB25B960000DA96/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi pa,

iirc this is a Carlos' chunk I try to backport:

=========><=========
diff -NaurX dontdiff linux-2.4.23-pa1/arch/parisc/lib/lusercopy.S linux-2.4.23-rc5-pa17/arch/parisc/lib/lusercopy.S
--- linux-2.4.23-pa1/arch/parisc/lib/lusercopy.S	2001-09-06 11:44:08.000000000
+0200
+++ linux-2.4.23-rc5-pa17/arch/parisc/lib/lusercopy.S	2003-10-23 18:21:44.000000000
+0200
@@ -133,6 +133,43 @@
 	.procend
 
 	/*
+	 * unsigned long
+	 * lcopy_in_user(void *to, const void *from, unsigned long n)
+	 *
+	 * Returns 0 for success.
+	 * otherwise, returns number of bytes not transferred.
+	 */
+
+	.export lcopy_in_user,code
+lcopy_in_user:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+	comib,=,n   0,%r24,$lciu_done
+	get_sr
+$lciu_loop:
+	ldbs,ma     1(%sr1,%r25),%r1
+	addib,<>    -1,%r24,$lciu_loop
+1:      stbs,ma     %r1,1(%sr1,%r26)
+$lciu_done:
+	bv          %r0(%r2)
+	copy        %r24,%r28
+	.exit
+
+2:      b $lciu_done
+	ldo         1(%r24),%r24
+
+	.section __ex_table,"a"
+#ifdef __LP64__
+	.dword      1b,(2b-1b)
+#else
+	.word       1b,(2b-1b)
+#endif
+	.previous
+
+	.procend
+
+	/*
 	 * long lstrncpy_from_user(char *dst, const char *src, long n)
 	 *
 	 * Returns -EFAULT if exception before terminator,
diff -NaurX dontdiff linux-2.4.23-pa1/include/asm-parisc/uaccess.h linux-2.4.23-rc5-pa17/include/asm-parisc/uaccess.h
--- linux-2.4.23-pa1/include/asm-parisc/uaccess.h	2003-11-12 07:25:38.000000000
+0100
+++ linux-2.4.23-rc5-pa17/include/asm-parisc/uaccess.h	2003-11-26 19:56:49.000000000
+0100
@@ -263,6 +263,7 @@
 
 extern unsigned long lcopy_to_user(void *, const void *, unsigned long);
 extern unsigned long lcopy_from_user(void *, const void *, unsigned long);
+extern unsigned long lcopy_in_user(void *, const void *, unsigned long);
 extern long lstrncpy_from_user(char *, const char *, long);
 extern unsigned lclear_user(void *,unsigned long);
 extern long lstrnlen_user(const char *,long);
@@ -281,5 +282,7 @@
 #define __copy_from_user lcopy_from_user
 #define copy_to_user lcopy_to_user
 #define __copy_to_user lcopy_to_user
+#define copy_in_user lcopy_in_user
+#define __copy_in_user lcopy_in_user
 
 #endif /* __PARISC_UACCESS_H */
=========><=========

hth,
    Joel
 

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr



--========/3FB25B960000DA96/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="arch_parisc_lib_lusercopy.S.patch"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi40LjIzLXBhMS9hcmNoL3BhcmlzYy9saWIvbHVz
ZXJjb3B5LlMgbGludXgtMi40LjIzLXJjNS1wYTE3L2FyY2gvcGFyaXNjL2xpYi9sdXNlcmNvcHku
UwotLS0gbGludXgtMi40LjIzLXBhMS9hcmNoL3BhcmlzYy9saWIvbHVzZXJjb3B5LlMJMjAwMS0w
OS0wNiAxMTo0NDowOC4wMDAwMDAwMDAgKzAyMDAKKysrIGxpbnV4LTIuNC4yMy1yYzUtcGExNy9h
cmNoL3BhcmlzYy9saWIvbHVzZXJjb3B5LlMJMjAwMy0xMC0yMyAxODoyMTo0NC4wMDAwMDAwMDAg
KzAyMDAKQEAgLTEzMyw2ICsxMzMsNDMgQEAKIAkucHJvY2VuZAogCiAJLyoKKwkgKiB1bnNpZ25l
ZCBsb25nCisJICogbGNvcHlfaW5fdXNlcih2b2lkICp0bywgY29uc3Qgdm9pZCAqZnJvbSwgdW5z
aWduZWQgbG9uZyBuKQorCSAqCisJICogUmV0dXJucyAwIGZvciBzdWNjZXNzLgorCSAqIG90aGVy
d2lzZSwgcmV0dXJucyBudW1iZXIgb2YgYnl0ZXMgbm90IHRyYW5zZmVycmVkLgorCSAqLworCisJ
LmV4cG9ydCBsY29weV9pbl91c2VyLGNvZGUKK2xjb3B5X2luX3VzZXI6CisJLnByb2MKKwkuY2Fs
bGluZm8gTk9fQ0FMTFMKKwkuZW50cnkKKwljb21pYiw9LG4gICAwLCVyMjQsJGxjaXVfZG9uZQor
CWdldF9zcgorJGxjaXVfbG9vcDoKKwlsZGJzLG1hICAgICAxKCVzcjEsJXIyNSksJXIxCisJYWRk
aWIsPD4gICAgLTEsJXIyNCwkbGNpdV9sb29wCisxOiAgICAgIHN0YnMsbWEgICAgICVyMSwxKCVz
cjEsJXIyNikKKyRsY2l1X2RvbmU6CisJYnYgICAgICAgICAgJXIwKCVyMikKKwljb3B5ICAgICAg
ICAlcjI0LCVyMjgKKwkuZXhpdAorCisyOiAgICAgIGIgJGxjaXVfZG9uZQorCWxkbyAgICAgICAg
IDEoJXIyNCksJXIyNAorCisJLnNlY3Rpb24gX19leF90YWJsZSwiYSIKKyNpZmRlZiBfX0xQNjRf
XworCS5kd29yZCAgICAgIDFiLCgyYi0xYikKKyNlbHNlCisJLndvcmQgICAgICAgMWIsKDJiLTFi
KQorI2VuZGlmCisJLnByZXZpb3VzCisKKwkucHJvY2VuZAorCisJLyoKIAkgKiBsb25nIGxzdHJu
Y3B5X2Zyb21fdXNlcihjaGFyICpkc3QsIGNvbnN0IGNoYXIgKnNyYywgbG9uZyBuKQogCSAqCiAJ
ICogUmV0dXJucyAtRUZBVUxUIGlmIGV4Y2VwdGlvbiBiZWZvcmUgdGVybWluYXRvciwK


--========/3FB25B960000DA96/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="include_asm-parisc_uaccess.h.patch"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi40LjIzLXBhMS9pbmNsdWRlL2FzbS1wYXJpc2Mv
dWFjY2Vzcy5oIGxpbnV4LTIuNC4yMy1yYzUtcGExNy9pbmNsdWRlL2FzbS1wYXJpc2MvdWFjY2Vz
cy5oCi0tLSBsaW51eC0yLjQuMjMtcGExL2luY2x1ZGUvYXNtLXBhcmlzYy91YWNjZXNzLmgJMjAw
My0xMS0xMiAwNzoyNTozOC4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIuNC4yMy1yYzUtcGEx
Ny9pbmNsdWRlL2FzbS1wYXJpc2MvdWFjY2Vzcy5oCTIwMDMtMTEtMjYgMTk6NTY6NDkuMDAwMDAw
MDAwICswMTAwCkBAIC0yNjMsNiArMjYzLDcgQEAKIAogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgbGNv
cHlfdG9fdXNlcih2b2lkICosIGNvbnN0IHZvaWQgKiwgdW5zaWduZWQgbG9uZyk7CiBleHRlcm4g
dW5zaWduZWQgbG9uZyBsY29weV9mcm9tX3VzZXIodm9pZCAqLCBjb25zdCB2b2lkICosIHVuc2ln
bmVkIGxvbmcpOworZXh0ZXJuIHVuc2lnbmVkIGxvbmcgbGNvcHlfaW5fdXNlcih2b2lkICosIGNv
bnN0IHZvaWQgKiwgdW5zaWduZWQgbG9uZyk7CiBleHRlcm4gbG9uZyBsc3RybmNweV9mcm9tX3Vz
ZXIoY2hhciAqLCBjb25zdCBjaGFyICosIGxvbmcpOwogZXh0ZXJuIHVuc2lnbmVkIGxjbGVhcl91
c2VyKHZvaWQgKix1bnNpZ25lZCBsb25nKTsKIGV4dGVybiBsb25nIGxzdHJubGVuX3VzZXIoY29u
c3QgY2hhciAqLGxvbmcpOwpAQCAtMjgxLDUgKzI4Miw3IEBACiAjZGVmaW5lIF9fY29weV9mcm9t
X3VzZXIgbGNvcHlfZnJvbV91c2VyCiAjZGVmaW5lIGNvcHlfdG9fdXNlciBsY29weV90b191c2Vy
CiAjZGVmaW5lIF9fY29weV90b191c2VyIGxjb3B5X3RvX3VzZXIKKyNkZWZpbmUgY29weV9pbl91
c2VyIGxjb3B5X2luX3VzZXIKKyNkZWZpbmUgX19jb3B5X2luX3VzZXIgbGNvcHlfaW5fdXNlcgog
CiAjZW5kaWYgLyogX19QQVJJU0NfVUFDQ0VTU19IICovCg==

--========/3FB25B960000DA96/mail.tiscali.be--
