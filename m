Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080C82B2487.cpe.net.cable.rogers.com [24.112.142.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id AFA6A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 11:51:55 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id g0AIqqe03315
	for parisc-linux@lists.parisc-linux.org; Thu, 10 Jan 2002 13:52:52 -0500
Date: Thu, 10 Jan 2002 13:52:52 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020110135252.E3075@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Testing SCSI Driver - 53c700 - 715/50 problem.
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

PARISC'ers,

I have a stable cluster of 715/50's running 2.4.9-pa25.

In a recent attempt at moving to a newer kernel the following
problems started to crop up...

Originally 2.4.9-pa25 had to be booted with sim700=noneg:0xff,nodisc:0xff
or the SCSI drives would not respond to the driver. This was
understood since the driver was in development and did not support
all the required features.

In October a newer driver was merged into the tree... and herein
possibly lies the problem.

Most of my initial testing was with our 712/60 that had no issues.
However the 715/50's had other ideas...


---------------------------------
HD contains 0.9.3 latest install with a few apt-get upgrades.

/dev/sda1 = Swap
/dev/sda2 = ext2 /

Box is a 715/50

(2.4.17-pa6)
Searching for devices...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000 [0], versions 0x6, 0x0, 0x77
2. Scorpio Core BA (11) at 0xf082f000 [2], versions 0x7, 0x0, 0x70
3. Scorpio Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x7, 0x0, 0x71
4. Scorpio Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 0x7, 0x0, 0x72
5. Scorpio Core HIL (10) at 0xf0821000 [2/0/3], versions 0x7, 0x0, 0x73
6. Scorpio Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x7, 0x0, 0x75
7. Scorpio Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x7, 0x0, 0x75
8. Scorpio Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x7, 0x0, 0x74
9. Scorpio Audio (10) at 0xf1000000 [2/0/8], versions 0x7, 0x0, 0x7b
10. Scorpio (715/50) (0) at 0xfffbe000 [8], versions 0x310, 0x0, 0x4
11. Scorpio (1) at 0xfffbf000 [9], versions 0x17, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 50.000000 MHz
Asp version 1 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered


SCSI Disk Problems:
---------------------------------
Running 2.4.9-pa25 all is okay.

Kernel Parameters:
HOME=/ TERM=LINUX root=/dev/sda2 ip=bootp
console=ttyS0 sim700=noneg:0xff,nodisc:0xff

SCSI Output:
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: QUANTUM   Model: LPS525S           Rev: 3110
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 1023484 512-byte hdwr sectors (524 MB)
Partition check:
 sda: sda1 sda2
---------------------------------
Running 2.4.17-pa6 (Random hangs during startup)

Kernel Parameters:
TERM=linux ip=bootp root=/dev/sda2 console=ttyS0

SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
  Vendor: QUANTUM   Model: LPS525S           Rev: 3110
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 1023484 512-byte hdwr sectors (524 MB)
Partition check:
 sda: sda1 sda2
---------------------------------

Next I've disabled the 53c700/710 driver, booting from NFS
with init=/bin/sh. The nfsroot was created from the 0.9.3
install plus some apt-get upgrades.

This runs great, tested a few apps (vi,top,du...), ran
a tar/gzip of a few hundred megs.

Then mount -o rw,remount /
Followed by the startup of all daemons.
/etc/init.d/rcS -> Run all /etc/rc.S stuff
/etc/rc2.d -> Run it...

Done. Runs amazingly.

Which does lead me to assume that the 53c700 driver is having
some problems with these machines.

I'm all ears to suggestions, and willing to do some work
to get stuff back on track :)

Where do I go from here? Solid lockups are a new kind of problem
for me...

c.
