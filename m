Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 13 Mar 2003 00:02:30 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030313070230.GB5865@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] FYA - C3000 adventure
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

Hi folks,

This is a reminder to check firmware rev's if you have problems
after changing HW configuration...just wanted to share my little
adventure today with C3000.

I added a Tigon3 (broadcom 570x) Gigabit Ethernet card and the
tg3 v1.5 driver wouldn't talk to it:
...
tg3.c:v1.5 (Feb 18, 2003)
tg3: Cannot find proper PCI device base address, aborting.
...
# lspci -vn -s 03:03.0
03:03.0 Class 0200: 14e4:16a7 (rev 02)
	Subsystem: 14e4:0009
	Flags: 66Mhz, medium devsel, IRQ 160
	Memory at <ignored> (64-bit, non-prefetchable) [size=f6010000]
	Capabilities: [40] PCI-X non-bridge device.
	Capabilities: [48] Power Management version 2
	Capabilities: [50] Vital Product Data
	Capabilities: [58] Message Signalled Interrupts: 64bit+ Queue=0/3 Enable

Darn it. The same card worked fine in B180:

00:02.0 Class 0200: 14e4:16a7 (rev 02)
	Subsystem: 14e4:0009
	Flags: bus master, 66Mhz, medium devsel, latency 248, IRQ 98
	Memory at f0ff0000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: [40] PCI-X non-bridge device.
	Capabilities: [48] Power Management version 2
	Capabilities: [50] Vital Product Data
	Capabilities: [58] Message Signalled Interrupts: 64bit+ Queue=0/3 Enable

After powering off all 20 SCSI drives (damn SCSI subsystem is *way*
too verbose), I was finally able to collect a full boot log via dmesg:
...
lba version TR2.0 (0x1) found at 0xfed38000
Can't support LBA older than TR2.1 - continuing under adversity.
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
PCI: Unable to handle 64-bit address for device 03:03.0
...

(The "Ignoring ELMMIO" is another issue that is related to me being,
uhm, "efficient" ;^) ...in a nutshell it's related to dodging
issues with overlapped MMIO ranges.)

The "Unable to handle 64-bit address" was the clue I needed.
(LESSON: read the *whole* boot log!)

It basically means the upper part of a 64-bit BAR is non zero
and that's not OK for a 32-bit OS (well...it's a physical address).
And that is in fact the case on the C3000:
grundler <511>cat /proc/bus/pci/03/03.0 | od -t x1 -Ax
000000 e4 14 a7 16 52 01 b0 02 02 00 00 02 10 f8 00 00
000010 04 00 00 f6 00 00 40 00 00 00 00 00 00 00 00 00
000020 00 00 00 00 00 00 00 00 00 00 00 00 e4 14 09 00
000030 00 00 00 00 40 00 00 00 00 00 00 00 00 01 40 00

bytes 14-17 should all be zero.
0xf6000004 is the lower half of a 64-bit BAR.

The good news is PF_CBCJ0050 (v5.0 firmware for BCJ-class) says
it fixed exactly this problem:
            - Clears upper 32 bit PCI BAR of a PCI card that has
	      64-bit BAR registers

I currently have v4.6 firmware on my C3000.
I'll be updating my firmware tomorrow. :^)

grant
