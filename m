From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] 2.6.10-pa1 build failure [drivers/serial/mux.c]
Date: Sun, 26 Dec 2004 02:12:19 -0500
Message-ID: <200412260212.19982.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@parisc-linux.org
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

this hunk is bum:
--- LINUS_2_6_10/drivers/serial/mux.c
+++ CVS2_6_10_PA1/drivers/serial/mux.c
-       port->irq   = SERIAL_IRQ_NONE;
+       port->irq   = NO_IRQ;

NO_IRQ isnt defined in any headers, but the serial_core.c has a similar hunk:

--- LINUS_2_6_10/drivers/serial/serial_core.c
+++ CVS2_6_10_PA1/drivers/serial/serial_core.c
+#ifndef NO_IRQ
+#define NO_IRQ (-1)
+#endif
+   if (port->irq == NO_IRQ) {
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
