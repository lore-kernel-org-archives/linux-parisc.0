Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from orion.netbank.com.br (orion.netbank.com.br [200.203.199.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F103482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 10:45:27 -0600 (MDT)
Date: Fri, 18 Jul 2003 13:47:22 -0300
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030718164722.GJ1582@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] provide probe_irq_mask dummy function
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

First patch! :P

This is what the other arches does to provide this ISA stuff, Grant suggested
cleaning the only user of this stuff, that is drivers/pcmcia/yenta_socket.c,
but Willy agreed that as we're on 2.6 times this bandaid is better for the time
being.

Best Regards,

- Arnaldo

===== arch/parisc/kernel/irq.c 1.15 vs edited =====
--- 1.15/arch/parisc/kernel/irq.c	Mon May  5 12:34:24 2003
+++ edited/arch/parisc/kernel/irq.c	Fri Jul 18 13:40:34 2003
@@ -842,6 +842,10 @@
 	return irq_found;
 }
 
+unsigned int probe_irq_mask(unsigned long irqs)
+{
+	return 0;
+}
 
 void __init init_IRQ(void)
 {
===== arch/parisc/kernel/parisc_ksyms.c 1.9 vs edited =====
--- 1.9/arch/parisc/kernel/parisc_ksyms.c	Sun Jun  8 17:24:25 2003
+++ edited/arch/parisc/kernel/parisc_ksyms.c	Fri Jul 18 13:41:37 2003
@@ -37,6 +37,7 @@
 #include <asm/irq.h>
 EXPORT_SYMBOL(enable_irq);
 EXPORT_SYMBOL(disable_irq);
+EXPORT_SYMBOL(probe_irq_mask);
 
 #include <asm/processor.h>
 EXPORT_SYMBOL(kernel_thread);
