From: Meelis Roos <mroos@linux.ee>
Subject: A500 boot crash in 4.2.0-rc3-00246-g763e326
Date: Wed, 12 Aug 2015 23:35:30 +0300 (EEST)
Message-ID: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Tried 4.2.0-rc3-00246-g763e326 on A500 but it crashes on boot. This is 
still present in todays 4.2.0-rc6+git. 4.1 was fine, I Will bisect but 
it takes time.

PDC Stable Storage facility v0.30
STI GSC/PCI core graphics driver Version 0.9b
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial 0000:00:04.0: enabling device (0146 -> 0147)
console [ttyS0] disabled
0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 21, base_baud = 115200) is a 16550A
console [ttyS0] enabled
console [ttyS0] enabled
bootconsole [ttyB0] disabled
bootconsole [ttyB0] disabled
0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 21, base_baud = 115200) is a 16550A
0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 21, base_baud = 115200) is a 16550A
serial 0000:00:05.0: enabling device (0000 -> 0003)
serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
0000:00:05.0: ttyS3 at MMIO 0xfffffffff8003000 (irq = 22, base_baud = 115200) is a 16550A
serial 0000:00:05.0: Couldn't register serial port 0, irq 22, type 2, error -28
sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)

************* SYSTEM ALERT **************
SYSTEM NAME: a500-m
DATE: 07/26/2015 TIME: 06:06:56
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system 
down.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 00000000 00000000 - type  0 = Data Field Unused
0x5800087000FF6292 00007306 1A060638 - type 11 = Timestamp 07/26/2015 
06:06:56
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:a
*****************************************




-- 
Meelis Roos (mroos@linux.ee)
