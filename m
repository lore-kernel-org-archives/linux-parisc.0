Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20021013044033.88A544829@dsl2.external.hp.com>
Date: Sat, 12 Oct 2002 22:40:33 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] rp2470 hang...getting closer
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

Hi friends of rp2470,

I'm getting closer to figuring out why rp2470 (a500-6x) hangs at boot time.
Here's the sequence I see so far:
o scsi_register_host() acquires io_request_lock (tpnt->use_new_eh_code is true)
o scsi_register_host() calls tpnt->detect(tpnt)
o detect() points to sym53c8xx_detect()
o sym53c8xx_detect() calls sym_attach() 
o sym_attach() initializes s.timer to point at sym53c8xx_timer but
  directly calls sym_timer() to kick off the self-arming timer.
  timer will pop in 0.5 seconds.
o other interfaces are detected/initialized.
o timer_interrupt() calls timer_bh() and invokes sym53c8xx_timer().
o sym53c8xx_timer() attempts to reacquire the io_request_lock.  checkmate.

The problem is we shouldn't see *any* interrupts, not even timers.
scsi_register_host() used spin_lock_irqsave() to acquire io_request_lock.
Either someone is clobbering the irqsave or it's being ignored.
That's the part the still needs to be worked out.

[ Does sym2 driver have a lock-related bug?
scsi_register_host() only acquires io_request_lock if
tpnt->use_new_eh_code is true. I wonder why sym2 driver advertises 
"New EH Code" but then uses io_request_lock as well. ]

My A500-4X boots and has 4 built-in SCSI ports (1 53c896 and 1 53c876).
The A500-6X which hangs has an additional add-on 53c896.
I suspect the two extra SCSI ports make the difference.

I've posted a patch on
	ftp://dsl2.external.hp.com/patches/rp2470-smp-hang.diff
Note it *removes* io_request_lock completely from sym2 driver.
The rp2470 boots with this patch though it doesn't fix the root cause.

The appended console output uses this patch *except* it calls
sym_timer() instead of add_timer() to trace original behavior.
Using 10second delay for the first timer pop also "works" (it boots)
with io_request_lock intact in sym2 driver.

I'll look at this some more if no one has ideas on why timer_bh()
is invoked (besides timer_interrupt).

grant


[ "ret 270725880" == scsi_register_module+50 == caller of io_r*_lock owner ]

grundler@gsyprf11:~$ dmesg
Linux version 2.4.19-pa21 (grundler@gsyprf11.external.hp.com) (gcc version 3.0) #17 SMP Sat Oct 12 18:02:20 PDT 2002
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005e20 00000491 00000000 00000001 73a33d02 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-6X
Total Memory: 1024 Mb
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sdb3 HOME=/ console=ttyS0 TERM=linux palo_kernel=3/boot/vmlinux-2.4.19-pa21
Initialized PDC Console for debugging.
Calibrating delay loop... 1297.61 BogoMIPS
Memory: 1019504k available
Dentry cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode cache hash table entries: 65536 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 16384 (order: 6, 262144 bytes)
Buffer-cache hash table entries: 65536 (order: 7, 524288 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. Crescendo 650 W2 (0) at 0xfffffffffffa0000 [160], versions 0x5e2, 0x0, 0x4
2. Crescendo 650 W2 (0) at 0xfffffffffffa2000 [162], versions 0x5e2, 0x0, 0x4
3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582, 0x0, 0xb
4. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0, 0xa
6. Elroy PCI Bridge (13) at 0xfffffffffed38000 [0/4], versions 0x782, 0x0, 0xa
7. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0, 0xa
8. Memory (1) at 0xfffffffffed08000 [8], versions 0x9b, 0x0, 0x9
CPU(s): 2 x PA8700 (PCX-W2) at 650.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
POSIX conformance testing by UNIFIX
SMP: bootstrap CPU ID is 0
FP[1] enabled: Rev 1 Model 19
SMP: Total 2 of 2 processors activated (2595.23 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x2)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Performance monitoring counters enabled for Crescendo 650 W2
Starting kswapd
Journalled Block Device driver loaded
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (103c,1048,103c,104b)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS00 at iomem 0xfffffffff8000000 (irq = 132) is a 16550A
ttyS01 at iomem 0xfffffffff8000008 (irq = 132) is a 16550A
ttyS02 at iomem 0xfffffffff8000010 (irq = 132) is a 16550A
ttyS03 at iomem 0xfffffffff8000038 (irq = 132) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre11 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:30:6E:26:61:A3, IRQ 128.
eth1: Digital DS21143 Tulip rev 65 at 0x30000, 00:10:83:F6:5D:F6, IRQ 320.
SCSI subsystem driver Revision: 1.00
scsi_register_host: acquiring iorl
sym.0.2.0: setting PCI_COMMAND_MASTER...
sym.0.2.1: setting PCI_COMMAND_MASTER...
sym.0.1.0: setting PCI_COMMAND_MASTER...
sym.32.0.0: setting PCI_COMMAND_MASTER...
sym.32.0.1: setting PCI_COMMAND_MASTER...
sym0: <875> rev 0x37 on pci bus 0 device 2 function 0 irq 130
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
sym_attach: settle flag 1  time 0x2e06  iorl 0
sym1: <875> rev 0x37 on pci bus 0 device 2 function 1 irq 131
sym1: No NVRAM, ID 7, Fast-20, SE, parity checking
sym1: SCSI BUS has been reset.
sym_attach: settle flag 1  time 0x2e1d  iorl 0
sym2: <896> rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym2: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym2: SCSI BUS has been reset.
sym_attach: settle flag 1  time 0x2e2c  iorl 0
sym3: <896> rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym3: No NVRAM, ID 7, Fast-40, SE, parity checking
sym3: SCSI BUS has been reset.
sym_attach: settle flag 1  time 0x2e3c  iorl 0
sym3: SCSI BUS mode change from SE to SE.
sym3: SCSI BUS has been reset.
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym4: <896> rev 0x1 on pci bus 32 device 0 function 0 irq 256
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym4: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym4: SCSI BUS has been reset.
sym_attach: settle flag 1  time 0x2e62  iorl 0
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym5: <896> rev 0x1 on pci bus 32 device 0 function 1 irq 257
sym5: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym5: SCSI BUS has been reset.
sym_attach: settle flag 1  time 0x2e91  iorl 0
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
sym53c8xx_timer(): iorl cpu 0  ret 270725880  line 1895
scsi_register_host: released iorl
scsi0 : sym-2.1.17a
scsi1 : sym-2.1.17a
scsi2 : sym-2.1.17a
scsi3 : sym-2.1.17a
scsi4 : sym-2.1.17a
scsi5 : sym-2.1.17a
  Vendor: HP 73.4G  Model: ST373405LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym1:15:0: tagged command queuing enabled, command queue depth 8.
  Vendor: SEAGATE   Model: ST39173LC         Rev: 6381
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym3:15:0: tagged command queuing enabled, command queue depth 8.
  Vendor: HP        Model: D5989B            Rev: 1.02
  Type:   Processor                          ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:11: wide asynchronous.
sym4:11:0:M_REJECT to send for : 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:12: wide asynchronous.
sym4:12:0:M_REJECT to send for : 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:13: wide asynchronous.
sym4:13:0:M_REJECT to send for : 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:14: wide asynchronous.
sym4:14:0:M_REJECT to send for : 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:15: wide asynchronous.
sym4:15:0:M_REJECT to send for : 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:10:0: tagged command queuing enabled, command queue depth 8.
sym4:11:0: tagged command queuing enabled, command queue depth 8.
sym4:12:0: tagged command queuing enabled, command queue depth 8.
sym4:13:0: tagged command queuing enabled, command queue depth 8.
sym4:14:0: tagged command queuing enabled, command queue depth 8.
sym4:15:0: tagged command queuing enabled, command queue depth 8.
Attached scsi disk sda at scsi1, channel 0, id 15, lun 0
Attached scsi disk sdb at scsi3, channel 0, id 15, lun 0
Attached scsi disk sdc at scsi4, channel 0, id 10, lun 0
Attached scsi disk sdd at scsi4, channel 0, id 11, lun 0
Attached scsi disk sde at scsi4, channel 0, id 12, lun 0
Attached scsi disk sdf at scsi4, channel 0, id 13, lun 0
Attached scsi disk sdg at scsi4, channel 0, id 14, lun 0
Attached scsi disk sdh at scsi4, channel 0, id 15, lun 0
sym1:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
Partition check:
 sda: unknown partition table
sym3:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdb: 17781521 512-byte hdwr sectors (9104 MB)
 sdb: sdb1 sdb2 sdb3 sdb4
sym4:10: wide asynchronous.
SCSI device sdc: 8388314 512-byte hdwr sectors (4295 MB)
 sdc: unknown partition table
SCSI device sdd: 17773524 512-byte hdwr sectors (9100 MB)
 sdd: unknown partition table
SCSI device sde: 17773524 512-byte hdwr sectors (9100 MB)
 sde: unknown partition table
SCSI device sdf: 17773524 512-byte hdwr sectors (9100 MB)
 sdf: sdf1 sdf2
SCSI device sdg: 17773524 512-byte hdwr sectors (9100 MB)
 sdg:
SCSI device sdh: 17773524 512-byte hdwr sectors (9100 MB)
 sdh: unknown partition table
Attached scsi generic sg2 at scsi4, channel 0, id 5, lun 0,  type 3
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  2983.600 MB/sec
   8regs_prefetch:  2400.000 MB/sec
   32regs    :  2430.800 MB/sec
   32regs_prefetch:  2285.600 MB/sec
raid5: using function: 8regs (2983.600 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 64Kbytes
TCP: Hash tables configured (established 32768 bind 43690)
ip_conntrack (3982 buckets, 31856 max)
ip_tables: (C) 2000-2002 Netfilter core team
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 224k freed
Adding Swap: 525288k swap-space (priority -1)
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,19), internal journal
LVM version 1.0.3(19/02/2002) module loaded
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,20), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,32), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,48), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,64), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,81), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,82), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,96), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
eth0: Setting full-duplex based on MII#1 link partner capability of 41e1.
sym53c8xx_timer(): iorl cpu 1  ret 270760060  line 700
sym53c8xx_timer(): iorl cpu 1  ret 270760060  line 700
grundler@gsyprf11:~$ 
