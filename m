From: "Helge Deller" <deller@gmx.de>
Subject: Aw: A500 boot crash in 4.2.0-rc3-00246-g763e326
Date: Tue, 18 Aug 2015 15:01:41 +0200
Message-ID: <trinity-5720bef8-5a4c-4465-b9eb-622daaef650a-1439902901415@3capp-gmx-bs02>
References: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee>,
 <trinity-122a736f-3aac-4830-afc5-2abcd91792ea-1439820380917@3capp-gmx-bs71>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: "Meelis Roos" <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-122a736f-3aac-4830-afc5-2abcd91792ea-1439820380917@3capp-gmx-bs71>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Tried 4.2.0-rc3-00246-g763e326 on A500 but it crashes on boot. This is 
> > still present in todays 4.2.0-rc6+git. 4.1 was fine, I Will bisect but 
> > it takes time.
> > 
> > PDC Stable Storage facility v0.30
> > STI GSC/PCI core graphics driver Version 0.9b
> > Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> > serial 0000:00:04.0: enabling device (0146 -> 0147)
> > console [ttyS0] disabled
> > 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 21, base_baud = 115200) is a 16550A
> > console [ttyS0] enabled
> > console [ttyS0] enabled
> > bootconsole [ttyB0] disabled
> > bootconsole [ttyB0] disabled
> > 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 21, base_baud = 115200) is a 16550A
> > 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 21, base_baud = 115200) is a 16550A
> > serial 0000:00:05.0: enabling device (0000 -> 0003)
> > serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
> > 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8003000 (irq = 22, base_baud = 115200) is a 16550A
> > serial 0000:00:05.0: Couldn't register serial port 0, irq 22, type 2, error -28
> > sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
> > sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)
> 
> I'm seeing the same problem on my rp5470 with Kernel 4.2-rc7. My machine just hangs though and doesn't crash.

I did a bisect and commit 3a9ad0b4fdcd57f775d3615004c8c64c021a9e7d ("PCI: Add pci_bus_addr_t") seems to be the culprit:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3a9ad0b4fdcd57f775d3615004c8c64c021a9e7d

Since the patch has "CC: stable@vger.kernel.org  # v3.19+", it might be the reason why you see kernel 3.19 failing too...

Helge

[deller@ls3530 linux-2.6]$ git bisect good v4.1
[deller@ls3530 linux-2.6]$ git bisect bad v4.2-rc3
Bisecting: 6909 revisions left to test after this (roughly 13 steps)
[0db9723cacf4d62bc3685fb15179b39ee4e17679] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux
[deller@ls3530 linux-2.6]$ git bisect bad 
Bisecting: 3289 revisions left to test after this (roughly 12 steps)
[e3d8238d7f5c3f539a29f5ac596cd342d847e099] Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
[deller@ls3530 linux-2.6]$ git bisect bad 
Bisecting: 1662 revisions left to test after this (roughly 11 steps)
[c70c5fb2b96dae0996fb0877d996458d3ca57eda] Merge tag 'pwm/for-4.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 824 revisions left to test after this (roughly 10 steps)
[acd53127c4adbd34570b221e7ea1f7fc94aea923] Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
[deller@ls3530 linux-2.6]$ git bisect bad 
Bisecting: 482 revisions left to test after this (roughly 9 steps)
[cb8a4deaf9b2778653c4391d8ccb24c5ab159f9d] Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial
[deller@ls3530 linux-2.6]$ git bisect bad 
Bisecting: 172 revisions left to test after this (roughly 8 steps)
[234a56c80a6aa7a05fec05d8b7184354d8765b48] Merge tag 'hwmon-for-linus-v4.2' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 96 revisions left to test after this (roughly 7 steps)
[a394c6a0b361fe7b6ffec0e33e9100db5e777b24] Merge git://git.kernel.org/pub/scm/linux/kernel/git/brodo/pcmcia
[deller@ls3530 linux-2.6]$ git bisect bad 
Bisecting: 42 revisions left to test after this (roughly 5 steps)
[0ff9b9bad66730e8347cb3350c8d3d1b88a21f13] Merge branches 'pci/aspm', 'pci/enumeration', 'pci/hotplug', 'pci/misc', 'pci/msi', 'pci/resource' and 'pci/virtualization' into next
[deller@ls3530 linux-2.6]$ git bisect bad 
Bisecting: 25 revisions left to test after this (roughly 4 steps)
[c6201cd8513db2db54b248a862672849ed9ccb82] PCI/MSI: Remove unused pci_msi_off()
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 19 revisions left to test after this (roughly 4 steps)
[0c0cbb6c5a04a169320df1812e58b10362865e95] PCI/ASPM: Simplify Clock Power Management setting
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 14 revisions left to test after this (roughly 3 steps)
[a5dd4b4b0570b3bf880d563969b245dfbd170c1e] PCI: pciehp: Wait for hotplug command completion where necessary
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 9 revisions left to test after this (roughly 3 steps)
[c0300089fd2dbeebef5ab9b6d66b4e6cedf8500a] PCI: Remove unused pci_scan_bus_parented()
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 5 revisions left to test after this (roughly 2 steps)
[917bfd93d3c9c644743940deaf8fe0cff77947eb] ACPI / PCI: Account for ARI in _PRT lookups
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[d59d36a7fce6707acae644621320a75ab93f1856] PCI: Remove unused pcibios_select_root() (again)
[deller@ls3530 linux-2.6]$ git bisect good
Bisecting: 1 revision left to test after this (roughly 1 step)
[3a9ad0b4fdcd57f775d3615004c8c64c021a9e7d] PCI: Add pci_bus_addr_t
[deller@ls3530 linux-2.6]$ git bisect bad 
3a9ad0b4fdcd57f775d3615004c8c64c021a9e7d is the first bad commit
commit 3a9ad0b4fdcd57f775d3615004c8c64c021a9e7d
Author: Yinghai Lu <yinghai@kernel.org>
Date:   Wed May 27 17:23:51 2015 -0700

    PCI: Add pci_bus_addr_t
    
    David Ahern reported that d63e2e1f3df9 ("sparc/PCI: Clip bridge windows
    to fit in upstream windows") fails to boot on sparc/T5-8:
    
      pci 0000:06:00.0: reg 0x184: can't handle BAR above 4GB (bus address 0x110204000)
    
    The problem is that sparc64 assumed that dma_addr_t only needed to hold DMA
    addresses, i.e., bus addresses returned via the DMA API (dma_map_single(),
    etc.), while the PCI core assumed dma_addr_t could hold *any* bus address,
    including raw BAR values.  On sparc64, all DMA addresses fit in 32 bits, so
    dma_addr_t is a 32-bit type.  However, BAR values can be 64 bits wide, so
    they don't fit in a dma_addr_t.  d63e2e1f3df9 added new checking that
    tripped over this mismatch.
    
    Add pci_bus_addr_t, which is wide enough to hold any PCI bus address,
    including both raw BAR values and DMA addresses.  This will be 64 bits
    on 64-bit platforms and on platforms with a 64-bit dma_addr_t.  Then
    dma_addr_t only needs to be wide enough to hold addresses from the DMA API.
    
    [bhelgaas: changelog, bugzilla, Kconfig to ensure pci_bus_addr_t is at
    least as wide as dma_addr_t, documentation]
    Fixes: d63e2e1f3df9 ("sparc/PCI: Clip bridge windows to fit in upstream windows")
    Fixes: 23b13bc76f35 ("PCI: Fail safely if we can't handle BARs larger than 4GB")
    Link: http://lkml.kernel.org/r/CAE9FiQU1gJY1LYrxs+ma5LCTEEe4xmtjRG0aXJ9K_Tsu+m9Wuw@mail.gmail.com
    Link: http://lkml.kernel.org/r/1427857069-6789-1-git-send-email-yinghai@kernel.org
    Link: https://bugzilla.kernel.org/show_bug.cgi?id=96231
    Reported-by: David Ahern <david.ahern@oracle.com>
    Tested-by: David Ahern <david.ahern@oracle.com>
    Signed-off-by: Yinghai Lu <yinghai@kernel.org>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Acked-by: David S. Miller <davem@davemloft.net>
    CC: stable@vger.kernel.org  # v3.19+

:040000 040000 ce493c3ad8e7b3e9b1f48f53588880827a48a082 76798494194e545219eb18dbb9f5209e02796820 M      Documentation
:040000 040000 19b4d25aa55534c88947c00c5862baf292f836dd 7adaff85e1fd7b27f053bdbf52d3bf6184a9fa54 M      drivers
:040000 040000 37493ef5238ad154ccad6a184617975e8502730e 93e417046cd848c639c9c4364009224bd4fa0500 M      include
