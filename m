Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0620482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 08:07:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19ayYe-0005Q5-SN; Fri, 11 Jul 2003 15:07:32 +0100
Date: Fri, 11 Jul 2003 15:07:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20030711140732.GA20424@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [2.5] ns87415 irq
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

Would this patch make sense for 2.5?  I have to confess not testing it
on any hardware, but it seems to be the Right Thing (and I'm sure Alan
remembers the mess we had in the 2.4 parisc tree for this ...)

--- linus-2.5/drivers/ide/pci/ns87415.c	Thu Jul 10 16:18:07 2003
+++ parisc-2.5/drivers/ide/pci/ns87415.c	Fri Jul 11 08:03:17 2003
@@ -200,7 +200,7 @@
 	}
 
 	if (!using_inta)
-		hwif->irq = hwif->channel ? 15 : 14;	/* legacy mode */
+		hwif->irq = ide_default_irq(hwif->io_ports[IDE_DATA_OFFSET]);
 	else if (!hwif->irq && hwif->mate && hwif->mate->irq)
 		hwif->irq = hwif->mate->irq;	/* share IRQ with mate */
 

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
