From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Why toggle_bounce only for disks?
Date: Sat, 6 Aug 2005 19:56:15 -0400
Message-ID: <20050806235615.GK3505__6988.44505609504$1416623885$gmane$org@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: linux-ide@vger.kernel.org
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

Ahoi,

The following patch fixes a crash caused by attempting to bounce buffer
when an IDE CD-ROM is used on a machine with an IO-MMU. [At least, this
patch fixes things so I can use my IDE CD-ROM behind an ns87415 on a 
HP PA-RISC workstation.]

Why was this only allowed for disks?

--- a/drivers/ide/ide-lib.c   18 Jul 2005 18:46:30 -0000
+++ b/drivers/ide/ide-lib.c   6 Aug 2005 20:28:04 -0000
@@ -410,7 +410,7 @@ void ide_toggle_bounce(ide_drive_t *driv
 {
        u64 addr = BLK_BOUNCE_HIGH;     /* dma64_addr_t */
 
-       if (on && drive->media == ide_disk) {
+       if (on) {
                if (!PCI_DMA_BUS_IS_PHYS)
                        addr = BLK_BOUNCE_ANY;
                else if (HWIF(drive)->pci_dev)

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
