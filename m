From: "Helge Deller" <deller@gmx.de>
Subject: Aw: A500 boot crash in 4.2.0-rc3-00246-g763e326
Date: Mon, 17 Aug 2015 16:06:21 +0200
Message-ID: <trinity-122a736f-3aac-4830-afc5-2abcd91792ea-1439820380917@3capp-gmx-bs71>
References: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: "Meelis Roos" <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Tried 4.2.0-rc3-00246-g763e326 on A500 but it crashes on boot. This is 
> still present in todays 4.2.0-rc6+git. 4.1 was fine, I Will bisect but 
> it takes time.
> 
> PDC Stable Storage facility v0.30
> STI GSC/PCI core graphics driver Version 0.9b
> Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> serial 0000:00:04.0: enabling device (0146 -> 0147)
> console [ttyS0] disabled
> 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 21, base_baud = 115200) is a 16550A
> console [ttyS0] enabled
> console [ttyS0] enabled
> bootconsole [ttyB0] disabled
> bootconsole [ttyB0] disabled
> 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 21, base_baud = 115200) is a 16550A
> 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 21, base_baud = 115200) is a 16550A
> serial 0000:00:05.0: enabling device (0000 -> 0003)
> serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
> 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8003000 (irq = 22, base_baud = 115200) is a 16550A
> serial 0000:00:05.0: Couldn't register serial port 0, irq 22, type 2, error -28
> sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
> sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)

I'm seeing the same problem on my rp5470 with Kernel 4.2-rc7. My machine just hangs though and doesn't crash.
The same kernel runs fine on a J5000:

[   14.100000] sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 69
[   14.168000] sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
[   14.248000] sym0: SCSI BUS has been reset.
[   14.304000] sym0: SCSI BUS mode change from SE to SE.
[   14.304000] sym0: SCSI BUS has been reset.
[   14.416000] scsi host0: sym-2.2.3
[   20.056000] sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 69
[   20.124000] sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
[   20.204000] sym1: SCSI BUS has been reset.
[   20.260000] sym1: SCSI BUS mode change from SE to SE.
[   20.260000] sym1: SCSI BUS has been reset.
[   20.372000] scsi host1: sym-2.2.3
[   22.420000] random: nonblocking pool is initialized
[   24.600000] scsi 1:0:3:0: Direct-Access     SEAGATE  ST118273WC       HP14 PQ: 0 ANSI: 2

Since the J5000 has another SCSI driver, I assume the problem is in changes in the SCSI layer or the sym53c8xx driver.

Helge
