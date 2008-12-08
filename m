From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Sun, 7 Dec 2008 21:13:55 -0500
Message-ID: <20081208021355.GP28348@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit da8e3b106c259f1ef791d99cb153c172583d9aa7
Author: Adrian Bunk <bunk@kernel.org>
Date:   Tue Dec 2 03:28:16 2008 +0000

    parisc: drivers/parisc/: make code static
    
    Make the following needlessly global code static:
    
    - asp.c: asp_init_chip()
    - ccio-dma.c: ccio_io_pdir_entry()
    - dino.c: struct dino_port_ops
    - dino.c: struct dino_bios_ops
    - hppb.c: struct hppb_card_head
    - lasi.c: lasi_led_init()
    - lasi.c: lasi_init_chip()
    - lba_pci.c: struct lba_bios_ops
    - sba_iommu.c: sba_io_pdir_entry()
    - sba_iommu.c: sba_driver_callback()
    - sba_iommu.c: sba_driver_callback()
    - wax.c: wax_init_chip()
    
    Signed-off-by: Adrian Bunk <bunk@kernel.org>
    Cc: Matthew Wilcox <matthew@wil.cx>
    Cc: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


