From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix serial console for machines with serial port on
 superio chip
Date: Wed, 1 Oct 2014 22:11:01 +0200
Message-ID: <20141001201101.GA18512@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Peter Hurley <peter@hurleysoftware.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix the serial console on machines where the serial port is located on
the SuperIO chip.

Signed-off-by: Helge Deller <deller@gmx.de>
CC: Peter Hurley <peter@hurleysoftware.com>
diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index a042d06..8be2096 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -395,7 +395,8 @@ static void __init superio_serial_init(void)
 	serial_port.iotype	= UPIO_PORT;
 	serial_port.type	= PORT_16550A;
 	serial_port.uartclk	= 115200*16;
-	serial_port.fifosize	= 16;
+	serial_port.flags	= UPF_FIXED_PORT | UPF_FIXED_TYPE |
+				  UPF_BOOT_AUTOCONF;
 
 	/* serial port #1 */
 	serial_port.iobase	= sio_dev.sp1_base;
