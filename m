Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 838EB4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 06:13:28 -0600 (MDT)
Date: Mon, 14 Apr 2003 12:13:24 +0000
Message-ID: <3E8AE87E00006C1C@ocpmta2.freegates.net>
In-Reply-To: <20030411155850.GA2795@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Andre,


>-- Original Message --
>From: Grant Grundler <grundler@parisc-linux.org>
>To: Joel Soete <jsoe0708@tiscali.be>
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] parisc-linux.org kernel
>Date: Fri, 11 Apr 2003 09:58:50 -0600
>
>
>On Fri, Apr 11, 2003 at 07:40:32AM +0200, Joel Soete wrote:
>> Here is the rough diffstat (still have to reverse ql driver patches, I
>will
>> try to find time this week-end :) )
>
>cool - let me add some general comments.
>You might break the diff up into chunks along the lines that
>I've commented on them below. You should end up with something like
>15-20 patches.
>
>>  Documentation/Configure.help                      |   90 
>	I expect parisc-specific changes here.
>
>>  Makefile                                          |   16 
>	Don't submit the Makefile unless you are sure we need it.
>
...
>
>>  drivers/ide/pci/ns87415.c                         |    8 
>>  drivers/ide/setup-pci.c                           |    2 
>	Suckyio support. This probably needs to go to Andre Hedrick.
>
Can you have a look on those two small patch (parisc specific):

diff -NaurX dontdiff linux-2.4.21-pre7/drivers/ide/pci/ns87415.c linux-2.4.21-pre7-pa3x/drivers/ide/pci/ns87415.c
--- linux-2.4.21-pre7/drivers/ide/pci/ns87415.c	2003-03-27 19:43:45.000000000
+0100
+++ linux-2.4.21-pre7-pa3x/drivers/ide/pci/ns87415.c	2003-02-28 18:43:45.000000000
+0100
@@ -27,6 +27,10 @@
 
 #include "ns87415.h"
 
+#if defined(__hppa__) && defined(CONFIG_SUPERIO)
+#include <asm/superio.h>
+#endif
+
 static unsigned int ns87415_count = 0, ns87415_control[MAX_HWIFS] = { 0
};
 
 /*
@@ -200,7 +204,11 @@
 	}
 
 	if (!using_inta)
+#if defined(__hppa__) && defined(CONFIG_SUPERIO)
+		hwif->irq = superio_get_ide_irq();	/* legacy mode */
+#else
 		hwif->irq = hwif->channel ? 15 : 14;	/* legacy mode */
+#endif
 	else if (!hwif->irq && hwif->mate && hwif->mate->irq)
 		hwif->irq = hwif->mate->irq;	/* share IRQ with mate */
 
diff -NaurX dontdiff linux-2.4.21-pre7/drivers/ide/setup-pci.c linux-2.4.21-pre7-pa3x/drivers/ide/setup-pci.c
--- linux-2.4.21-pre7/drivers/ide/setup-pci.c	2003-04-10 08:20:37.000000000
+0200
+++ linux-2.4.21-pre7-pa3x/drivers/ide/setup-pci.c	2003-04-08 14:13:41.000000000
+0200
@@ -477,7 +477,7 @@
 	if ((d->autodma == AUTODMA) ||
 	    ((dev->class >> 8) == PCI_CLASS_STORAGE_IDE &&
 	     (dev->class & 0x80))) {
-		unsigned long dma_base = ide_get_or_set_dma_base(hwif);
+		u32 dma_base = ide_get_or_set_dma_base(hwif);
 		if (dma_base && !(pcicmd & PCI_COMMAND_MASTER)) {
 			/*
  			 * Set up BM-DMA capability

Thanks in advance for your help,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
