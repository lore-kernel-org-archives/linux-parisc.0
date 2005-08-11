From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] Fwd: [PATCH] IDE: don't offer IDE_GENERIC on ia64
Date: Thu, 11 Aug 2005 16:26:45 -0400
Message-ID: <20050811202645.GA14400@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Looks like a good idea for us too.

Cheers,
	Kyle

----- Forwarded message from Bjorn Helgaas <bjorn.helgaas@hp.com> -----

Sender: linux-ia64-owner@vger.kernel.org
From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: [PATCH] IDE: don't offer IDE_GENERIC on ia64
Date:	Thu, 11 Aug 2005 14:24:43 -0600

IA64 boxes only have PCI IDE devices, so there's no need to blindly poke
around in I/O port space.  Poking at things that don't exist causes MCAs
on HP ia64 systems.

Signed-off-by: Bjorn Helgaas <bjorn.helgaas@hp.com>

Index: work-vga/drivers/ide/Kconfig
===================================================================
--- work-vga.orig/drivers/ide/Kconfig	2005-08-10 14:57:47.000000000 -0600
+++ work-vga/drivers/ide/Kconfig	2005-08-10 14:58:02.000000000 -0600
@@ -276,6 +276,7 @@
 
 config IDE_GENERIC
 	tristate "generic/default IDE chipset support"
+	depends on !IA64
 	default y
 	help
 	  If unsure, say Y.

----- End forwarded message -----

-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
