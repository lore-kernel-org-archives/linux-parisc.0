Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F51A483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Sep 2003 10:45:03 -0600 (MDT)
Date: Wed, 24 Sep 2003 18:45:01 +0200
Message-ID: <3F5CB6FB00007DA0@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
Cc: tausq@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Backport tausq patch
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

Hi Randolph and all,

Here is the backport of your 2.6 patch:
--- pgalloc.h.orig	2003-09-24 18:35:25.000000000 +0200
+++ pgalloc.h	2003-09-24 18:35:06.000000000 +0200
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

I test it successfully with 32 and 64 (UP) kernels.
Don't know yet if it will help SMP boot of the N (I will test tomorrow)

hth,
    Joel



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
