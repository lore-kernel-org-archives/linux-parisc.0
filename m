Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA21869
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 09:37:29 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 27DA65A5
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 08:39:37 -0800 (PST)
Message-Id: <200011171638.IAA16079@milano.cup.hp.com>
To: Arnaud.ATOCH@oecd.org
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Booting 712 with CD 0.5 
In-reply-to: Your message of "Fri, 17 Nov 2000 16:30:42 PST."
             <C12531D038D1D011B1DB0000F8036C28071AB722@eosm5.oecd.org>
Date: Fri, 17 Nov 2000 08:38:24 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Arnaud.ATOCH@oecd.org wrote:
> Is the following output the normal behavior of Linux-PARisc on a 712/100 ?
> 
> kmem_create: Forcing size word alignment - nfs_fh
> kernel BUG at pci-dma.c:391!
> kernel BUG at pci-dma.c:400!

The bug is real. A driver is calling pci_map_single() and pci_unmap_single()
without specifying which direction the DMA is going. Cache flushing on 712
(PCXL) systems needs to know. I'll assume it's the SCSI driver since
it looks like we are talking to a SCSI CD-ROM.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
