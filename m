From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] [patch] fix serial stuff in 2.6.10-pa3 wrt to NO_IRQ
Date: Mon, 3 Jan 2005 17:03:34 -0500
Message-ID: <200501031703.34801.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_2Ec2BDWsEqwfLPx"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_2Ec2BDWsEqwfLPx
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

i mentioned this before but i guess it slipped through the cracks ;)
-mike

--Boundary-00=_2Ec2BDWsEqwfLPx
Content-Type: text/x-diff; charset="us-ascii";
	name="2.6.10-pa3-serial-NO_IRQ.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-pa3-serial-NO_IRQ.patch"

--- linux-2.6.10-pa3/drivers/serial/mux.c.orig	2005-01-03 16:16:18.085834288 -0500
+++ linux-2.6.10-pa3.fixed/drivers/serial/mux.c	2005-01-03 16:17:09.179066936 -0500
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h> /* for udelay */
 #include <linux/device.h>
+#include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/parisc-device.h>
 
--- linux-2.6.10-pa3/drivers/serial/serial_core.c.orig	2005-01-03 16:16:34.786295432 -0500
+++ linux-2.6.10-pa3.fixed/drivers/serial/serial_core.c	2005-01-03 16:16:42.412136128 -0500
@@ -1915,9 +1915,6 @@
 		printk("MMIO 0x%lx", port->mapbase);
 		break;
 	}
-#ifndef NO_IRQ
-#define NO_IRQ (-1)
-#endif
 	if (port->irq == NO_IRQ) {
 		printk(" (polled) is a %s\n", uart_type(port));
 	} else {

--Boundary-00=_2Ec2BDWsEqwfLPx
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_2Ec2BDWsEqwfLPx--
