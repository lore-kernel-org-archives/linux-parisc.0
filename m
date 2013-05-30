From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parport_pc: disable PARPORT_PC_SUPERIO on parisc architecture
Date: Thu, 30 May 2013 18:24:46 +0200
Message-ID: <20130530162446.GA5750@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

If enabled, CONFIG_PARPORT_PC_SUPERIO scans on PC-like hardware for
various super-io chips by accessing i/o ports in a range which will
crash any parisc hardware at once.

In addition, parisc has it's own incompatible superio chip
(CONFIG_SUPERIO), so if we disable PARPORT_PC_SUPERIO completely for
parisc we can avoid that people by accident enable the parport_pc
superio option too.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parport/Kconfig b/drivers/parport/Kconfig
index 24e12d4..a505760 100644
--- a/drivers/parport/Kconfig
+++ b/drivers/parport/Kconfig
@@ -71,7 +71,7 @@ config PARPORT_PC_FIFO
 
 config PARPORT_PC_SUPERIO
 	bool "SuperIO chipset support"
-	depends on PARPORT_PC
+	depends on PARPORT_PC && !PARISC
 	help
 	  Saying Y here enables some probes for Super-IO chipsets in order to
 	  find out things like base addresses, IRQ lines and DMA channels.  It
