From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Subject: [parisc-linux] [PATCH] asm-parisc/ide.h cleanup (there are no
	standard ports)
Date: Wed, 24 Mar 2004 14:43:43 +0100
Message-ID: <200403241443.43206.bzolnier__5182.24944030425$1416623309$gmane$org@elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: linux-ide@vger.kernel.org
To: parisc-linux@parisc-linux.org
Return-Path: <B.Zolnierkiewicz@elka.pw.edu.pl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hi,

Is this patch correct?

Regards,
Bartlomiej

 linux-2.6.5-rc2-bk3-root/include/asm-parisc/ide.h |   15 ++-------------
 1 files changed, 2 insertions(+), 13 deletions(-)

diff -puN include/asm-parisc/ide.h~parisc_no_default_ide_ports include/asm-parisc/ide.h
--- linux-2.6.5-rc2-bk3/include/asm-parisc/ide.h~parisc_no_default_ide_ports	2004-03-24 14:39:06.293991064 +0100
+++ linux-2.6.5-rc2-bk3-root/include/asm-parisc/ide.h	2004-03-24 14:39:33.400870192 +0100
@@ -41,19 +41,8 @@ static __inline__ void ide_init_hwif_por
 	hw->io_ports[IDE_IRQ_OFFSET] = 0;
 }
 
-static __inline__ void ide_init_default_hwifs(void)
-{
-#ifndef CONFIG_PCI
-	hw_regs_t hw;
-	int index;
