From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] palinux AWOL
Date: Sun, 21 Jan 2007 18:35:59 +0100
Message-ID: <7d01f9f00701210935se78f8er65b276e67a68f502__38203.2956266359$1416624266$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

palinux is in bad shape:

Begin: Loading essential drivers... ...
SCSI subsystem initialized
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 67
sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
sym1: <896> rev 0x7 at pci 0000:00:01.1 irq 68
sym1: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym1: SCSI BUS has been reset.
sym1: SCSI BUS mode change from SE to SE.
scsi1 : sym-2.2.3
sym1: SCSI BUS has been reset.
  Vendor: HP 73.4G  Model: ST373405LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:15: tagged command queuing enabled, command queue depth 16.
 target1:0:15: Beginning Domain Validation
 target1:0:15: asynchronous
 target1:0:15: wide asynchronous
 target1:0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 31)
 target1:0:15: Domain Validation skipping write tests
 target1:0:15: Ending Domain Validation
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write through w/ FUA
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write through w/ FUA
 sda: sda1 sda2
sd 1:0:15:0: Attached scsi disk sda
sym2: <875> rev 0x14 at pci 0000:00:02.0 irq 68
sym2: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.2.3
sym3: <875> rev 0x14 at pci 0000:00:02.1 irq 69
sym3: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.2.3
  Vendor: HP 73.4G  Model: ST373405LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target3:0:15: tagged command queuing enabled, command queue depth 16.
 target3:0:15: Beginning Domain Validation
 target3:0:15: asynchronous
 target3:0:15: wide asynchronous
 target3:0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
 target3:0:15: Domain Validation skipping write tests
 target3:0:15: Ending Domain Validation
SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
sdb: Write Protect is off
SCSI device sdb: drive cache: write through w/ FUA
SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
sdb: Write Protect is off
SCSI device sdb: drive cache: write through w/ FUA
 sdb: sdb1 sdb3 sdb4 < sdb5 sdb6 >
sd 3:0:15:0: Attached scsi disk sdb
Done.
Begin: Running /scripts/init-premount ...
Linux Tulip driver version 1.1.13-NAPI (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21142/43 Tulip rev 65 at Port 0x80, 00:30:6E:0C:6A:EA, IRQ 66.
tg3.c:v3.65 (August 07, 2006)
eth1: Tigon3 [partno(BCM95700A6) rev 7102 PHY(5401)]
(PCI:66MHz:64-bit) 10/100/1000BaseT Ethernet 00:04:76:3b:0e:a3
eth1: RXcsums[1] LinkChgREG[1] MIirq[1] ASF[0] Split[0] WireSpeed[0] TSOcap[0]
eth1: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
eth2: Tigon3 [partno(BCM95700A6) rev 7102 PHY(5401)]
(PCI:66MHz:64-bit) 10/100/1000BaseT Ethernet 00:04:76:3b:13:e7
eth2: RXcsums[1] LinkChgREG[1] MIirq[1] ASF[0] Split[0] WireSpeed[0] TSOcap[0]
eth2: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
Done.
Begin: Mounting root file system... ...
Begin: Running /scripts/local-top ...
Done.
Begin: Running /scripts/local-premount ...
Done.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: sdb5: orphan cleanup on readonly fs
EXT3-fs: sdb5: 5 orphan inodes deleted
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
Begin: Running /scripts/local-bottom ...
Done.
Done.
Begin: Running /scripts/init-bottom ...
Done.
INIT: version 2.86 booting
Setting hostname to 'palinux'...done.
Starting the hotplug events dispatcher: udevd.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...done.
Activating swap:swapon on /dev/sdb3
Adding 2097136k swap on /dev/sdb3.  Priority:-1 extents:1 across:2097136k
.
Will now check root file system:fsck 1.40-WIP (14-Nov-2006)
[/sbin/fsck.ext3 (1) -- /] fsck.ext3 -a -C0 /dev/sdb5
/dev/sdb5: clean, 148055/1251712 files, 676876/2500107 blocks
.
EXT3 FS on sdb5, internal journal
Setting the system clock again..
System Clock set. Local time: Sun Jan 21 17:25:01 UTC 2007.
Cleaning up ifupdown....
Loading kernel module tulip.
Loading kernel module tg3.
Loading kernel module ip_tables.
ip_tables: (C) 2000-2006 Netfilter Core Team
Loading kernel module ip_conntrack.
Netfilter messages via NETLINK v0.30.
ip_conntrack version 2.4 (8192 buckets, 65536 max) - 304 bytes per conntrack
Loading kernel module ipt_state.
Loading kernel module ip_conntrack_ftp.
Loading device-mapper supportdevice-mapper: ioctl: 4.7.0-ioctl
(2006-06-24) initialised: dm-devel@redhat.com
.
Will now check all file systems.
fsck 1.40-WIP (14-Nov-2006)
Checking all file systems.
[/sbin/fsck.ext2 (1) -- /boot] fsck.ext2 -a -C0 /dev/sdb1
[/sbin/fsck.ext3 (2) -- /var/lib/cvs] fsck.ext3 -a /dev/sda1
/dev/sdb1: clean, 31/16064 files, 30944/64228 blocks
/dev/sda1: recovering journal
[/sbin/fsck.ext3 (2) -- /var] fsck.ext3 -a -C0 /dev/sdb6
/dev/sda1: clean, 250086/2252160 files, 1552790/4500200 blocks
[/sbin/fsck.ext3 (2) -- /home] fsck.ext3 -a /dev/sda2
/dev/sda2: recovering journal
/dev/sda2: clean, 2533673/6717440 files, 11741194/13420299 blocks
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: ABORT operation started.
sd 3:0:15:0: ABORT operation timed-out.
sd 3:0:15:0: DEVICE RESET operation started.
sd 3:0:15:0: DEVICE RESET operation timed-out.
sd 3:0:15:0: BUS RESET operation started.
sd 3:0:15:0: BUS RESET operation timed-out.
sd 3:0:15:0: HOST RESET operation started.
sym3: SCSI BUS has been reset.
sd 3:0:15:0: HOST RESET operation timed-out.
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not r error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: scsi: Device offlined - not ready after error recovery
sd 3:0:15:0: rejecting I/O to offline device
Buffer I/O error on device sdb6, logical block 42205184
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
Buffer I/O error on device sdb5, logical block 524298
lost page write due to I/O error on sdb5
sd 3:0:15:0: rejecting I/O to offline device
Buffer I/O error on device sdb5, logical block 524303
lost page write due to I/O error on sdb5
sd 3:0:15:0: rejecting I/O to oer I/O error on device sdb5, logical
block 786436lost page write due to I/O error on sdb5
Buffer I/O error on device sdb5, logical block 786437
lost page write due to I/O error on sdb5
sd 3:0:15:0: rejecting I/O to offline device
Buffer I/O error on device sdb5, logical block 786439
lost page write due to I/O error on sdb5
Buffer I/O error on device sdb5, logical block 786440
lost page write due to I/O error on sdb5
sd 3:0:15:0: rejectioffline device
Buffer I/O error on device sdb5, logical block 786448
lost page write due to I/O error on sdb5
sd 3:0:15:0: rejecting I/O to offline device
Buffer I/O error on device sdb5, logical block 851973
lost page write due to I/O error on sdb5
Buffer I/O error on device sdb5, logical block 851974
lost page write due to I/O error on sdb5
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rI/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
timer_interrupt(CPU 0): delayed! cycles 370FB9E3 rem 1775E3  next/now
2210D2F9B6/2247E2B399
sd 3:0:15:0: SCSI error: return code = 0x00010000
end_request: I/O error, dev sdb, sector 12061705
sd 3:0:15:0: rejting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
Aborting journal on device sdb5.
EXT3-fs error (device sdb5) in ext3_reserve_inode_write: Journal has aborted
Remounting filesystem read-only
sd 3:0:15:0: rejting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
EXT3-fs error (device sdb5) in ext3_reserve_inode_write: Journal has aborted
sd 3:0:15:0: rejcting I/O to offline device
sd 3:0:15:0: rejecting I/O to offline device
EXT3-fs error (device sdb5) in ext3_reserve_inode_write: Journal has aborted
sd 3:0:15:0: rejecting I/O to offline device
Error reading block 10551296 (Atsd 3:0:15:0: rejecting I/O to offline device
tempt to read block from filesyssd 3:0:15:0: rejecting I/O to offline device
tem resulted in short read) while reading inode and block bitmaps.

/dev/sdb6: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
        (i.e., without -a or -p options)
fscksd 3:0:15:0:g I/O to offline device
 died with exit status 4
File system check failsd 3:0:15:0: rejecting I/O to offline device
ed.
A log is being saved in /vsd 3:0:15:0: rejecting I/O to offline device
ar/log/fsck/checkfs if that location is writable.
Please repair the file system manually.
A maintenance shell will now be started.
CONTROL-D will terminate this shell and resume system boot.
/etc/rcS.d/S30checkfs.sh: line 69: /sbin/sulogin: Input/output error
Attempt to start maintenance shell failed.
Continuing with system boot in 5 seconds.
timer_interrupt(CPU 0): delayed! cycles 100001022 rem 8B822  next/now
2247E618B6/2347E628D8
timer_interrupt(CPU 0): delayed! cycles 100000373 rem 8AB73  next/now
2347F84BB6/2447F84F29
timer_interrupt(CPU 0): delayed! cycles 1000002ED rem 8AAED  next/now
24480A7EB6/25480A81A3


-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
