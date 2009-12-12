From: Michal Ludvig <mludvig@logix.net.nz>
Subject: console handover: boot [ttyB0] -> real [ttyS0]
Date: Sat, 12 Dec 2009 22:31:23 +1300
Message-ID: <4B2362EB.2090409@logix.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

it is the first time I'm trying to install Linux on HP9000 rp3410
machine. I'm booting off Debian 5.0.3 CD, PALO selects 64bit kernel,
later on the kernel detects ttyS0 but the console output stops at:

PDC Stable Storage facility v0.30
STI GSC/PCI core graphics driver Version 0.9a
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 74) is a 16550A
console handover: boot [ttyB0] -> real [ttyS0]
<that's it>

I tried to pass serial=ttyS0 to the kernel but then the output stops a
wee while later as well:

STI GSC/PCI core graphics driver Version 0.9a
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 74) is a 16550A
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 74) is a 16550A
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 74) is a 16550A
0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 74) is a 16550A
brd: module loaded
mice: PS/2 mouse device common for all mice
TCP cubic registered
NET: Registered protocol family 17
turn off boot console ttyB0
<that's it>

I'm connected over serial to MP and using COnsole from there.

What am I doing wrong / how to make it work?

Thanks!

Michal


