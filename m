Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 039C1482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 05:02:57 -0700 (MST)
Message-ID: <3DFC7EFA.9040708@freebel.net>
Date: Sun, 15 Dec 2002 13:09:14 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------020609020700060903080206"
Subject: [parisc-linux] Is this system_irqsave diff is correct?
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

This is a multi-part message in MIME format.
--------------020609020700060903080206
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

is this  diff is right:
--- system_irqsave.h.orig       2002-12-15 13:02:50.000000000 +0000
+++ system_irqsave.h    2002-12-15 13:03:29.000000000 +0000
@@ -9,8 +9,7 @@

  #define local_irq_save(x) \
         __asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : 
"memory" )
-#define local_irq_restore(x) \
-       __asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )
+#define local_irq_restore(x) __restore_flags(x)
  #define local_irq_disable() __cli()
  #define local_irq_enable()  __sti()

Thanks for attention,
	Joel

--------------020609020700060903080206
Content-Type: text/plain;
 name="system_irqsave.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="system_irqsave.h.diff"

--- system_irqsave.h.orig	2002-12-15 13:02:50.000000000 +0000
+++ system_irqsave.h	2002-12-15 13:03:29.000000000 +0000
@@ -9,8 +9,7 @@
 
 #define local_irq_save(x) \
 	__asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )
-#define local_irq_restore(x) \
-	__asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )
+#define local_irq_restore(x) __restore_flags(x)
 #define local_irq_disable() __cli()
 #define local_irq_enable()  __sti()
 

--------------020609020700060903080206--
