Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 744394845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Dec 2003 02:57:24 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 1ARqDR-0004g3-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 04 Dec 2003 10:56:09 +0100
Date: Thu, 4 Dec 2003 10:56:08 +0100
Message-ID: <3FB25B960000DA45@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3FB25B960000DA45/mail.tiscali.be"
Subject: [parisc-linux] 2.4.23 some tested backport (pgalloc.h)
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

--========/3FB25B960000DA45/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi pa,

iirc this a Randolph's patch which I try to backport and test seems ok
=========><=========
--- linux-2.4.23-pa1/include/asm-parisc/pgalloc.h	2003-03-10 08:02:19.000000000
+0100
+++ linux-2.4.23-rc5-pa17/include/asm-parisc/pgalloc.h	2003-12-04 11:06:31.000000000
+0100
@@ -124,8 +124,9 @@
 
 #define flush_icache_page(vma,page)	do { flush_kernel_dcache_page(page_address(page));
flush_kernel_icache_page(page_address(page)); } while (0)
 
-#define flush_icache_user_range(vma, page, addr, len) \
-	flush_user_icache_range(addr, addr + len);
+#define flush_icache_user_range(vma, page, addr, len) do { \
+        flush_user_dcache_range(addr, addr + len); \
+	flush_user_icache_range(addr, addr + len); } while (0)
 
 #define flush_icache_range(s,e)		do { flush_kernel_dcache_range_asm(s,e);
flush_kernel_icache_range_asm(s,e); } while (0)
 
=========><=========

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr



--========/3FB25B960000DA45/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="include_asm-parisc_pgalloc.h.patch"

LS0tIGxpbnV4LTIuNC4yMy1wYTEvaW5jbHVkZS9hc20tcGFyaXNjL3BnYWxsb2MuaAkyMDAzLTAz
LTEwIDA4OjAyOjE5LjAwMDAwMDAwMCArMDEwMAorKysgbGludXgtMi40LjIzLXJjNS1wYTE3L2lu
Y2x1ZGUvYXNtLXBhcmlzYy9wZ2FsbG9jLmgJMjAwMy0xMi0wNCAxMTowNjozMS4wMDAwMDAwMDAg
KzAxMDAKQEAgLTEyNCw4ICsxMjQsOSBAQAogCiAjZGVmaW5lIGZsdXNoX2ljYWNoZV9wYWdlKHZt
YSxwYWdlKQlkbyB7IGZsdXNoX2tlcm5lbF9kY2FjaGVfcGFnZShwYWdlX2FkZHJlc3MocGFnZSkp
OyBmbHVzaF9rZXJuZWxfaWNhY2hlX3BhZ2UocGFnZV9hZGRyZXNzKHBhZ2UpKTsgfSB3aGlsZSAo
MCkKIAotI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBhZ2UsIGFkZHIsIGxl
bikgXAotCWZsdXNoX3VzZXJfaWNhY2hlX3JhbmdlKGFkZHIsIGFkZHIgKyBsZW4pOworI2RlZmlu
ZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBhZ2UsIGFkZHIsIGxlbikgZG8geyBcCisg
ICAgICAgIGZsdXNoX3VzZXJfZGNhY2hlX3JhbmdlKGFkZHIsIGFkZHIgKyBsZW4pOyBcCisJZmx1
c2hfdXNlcl9pY2FjaGVfcmFuZ2UoYWRkciwgYWRkciArIGxlbik7IH0gd2hpbGUgKDApCiAKICNk
ZWZpbmUgZmx1c2hfaWNhY2hlX3JhbmdlKHMsZSkJCWRvIHsgZmx1c2hfa2VybmVsX2RjYWNoZV9y
YW5nZV9hc20ocyxlKTsgZmx1c2hfa2VybmVsX2ljYWNoZV9yYW5nZV9hc20ocyxlKTsgfSB3aGls
ZSAoMCkKIAo=

--========/3FB25B960000DA45/mail.tiscali.be--
