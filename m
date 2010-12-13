From: Joe Perches <joe@perches.com>
Subject: [PATCH 2/5] parisc: lba_pci: Use vsprintf extension %pR for struct resource
Date: Mon, 13 Dec 2010 13:42:19 -0800
Message-ID: <681d00d0482c5c1e030c88e3e3522b9ca90bd871.1292276119.git.joe@perches.com>
References: <cover.1292276119.git.joe@perches.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1292276119.git.joe@perches.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/parisc/lba_pci.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 3aeb327..b1b6644 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -749,24 +749,21 @@ lba_fixup_bus(struct pci_bus *bus)
 				continue;
 
 			if (res->flags & IORESOURCE_IO) {
-				DBG("lba_fixup_bus() I/O Ports [%lx/%lx] -> ",
-					res->start, res->end);
+				DBG("lba_fixup_bus() I/O Ports [%pR] -> ", res);
 				res->start |= lba_portbase;
 				res->end   |= lba_portbase;
-				DBG("[%lx/%lx]\n", res->start, res->end);
+				DBG("[%pR]\n", res);
 			} else if (res->flags & IORESOURCE_MEM) {
 				/*
 				** Convert PCI (IO_VIEW) addresses to
 				** processor (PA_VIEW) addresses
 				 */
-				DBG("lba_fixup_bus() MMIO [%lx/%lx] -> ",
-					res->start, res->end);
+				DBG("lba_fixup_bus() MMIO [%pR] -> ", res);
 				res->start = PCI_HOST_ADDR(HBA_DATA(ldev), res->start);
 				res->end   = PCI_HOST_ADDR(HBA_DATA(ldev), res->end);
-				DBG("[%lx/%lx]\n", res->start, res->end);
+				DBG("[%pR]\n", res);
 			} else {
-				DBG("lba_fixup_bus() WTF? 0x%lx [%lx/%lx] XXX",
-					res->flags, res->start, res->end);
+				DBG("lba_fixup_bus() WTF? [%pR] XXX", res);
 			}
 
 			/*
-- 
1.7.3.3.398.g0b0cd.dirty
