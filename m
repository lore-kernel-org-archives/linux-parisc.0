From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 8/8] parisc: Select GENERIC_HARDIRQS_NO_DEPRECATED
Date: Sun, 06 Feb 2011 20:46:08 -0000
Message-ID: <20110206204511.119862953@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

All chips converted.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/parisc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Index: linux-next/arch/parisc/Kconfig
===================================================================
--- linux-next.orig/arch/parisc/Kconfig
+++ linux-next/arch/parisc/Kconfig
@@ -15,6 +15,7 @@ config PARISC
 	select HAVE_GENERIC_HARDIRQS
 	select GENERIC_IRQ_PROBE
 	select IRQ_PER_CPU
+	select GENERIC_HARDIRQS_NO_DEPRECATED
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used


