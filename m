Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA13157
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 16:37:35 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by palrel1.hp.com (Postfix) with ESMTP id 7C24E1406
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 15:37:08 -0700 (PDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 3A9174FF76
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 17:33:39 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id PAA20334 for parisc-linux@thepuffingroup.com; Fri, 14 Apr 2000 15:33:45 -0700 (PDT)
Date: Fri, 14 Apr 2000 15:33:45 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200004142233.PAA20334@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] msdos_partion+120 == code 28
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
So we are making forward progress...LAN and SCSI both sort-of talk
on the C3k. I think something in the LAN stack is causing an HPMC
but am so fed up with tulip driver I decided to look at SCSI instead.
Mostly good news (we see disks and can query them) until msdos
partition code gets involved.

code 28 == "Unaligned Data Reference Trap".
(Gee, where have I seen this before? :^(  )

IAOQ  == 0xc016939c msdos_partition+120


Anyway, I'll figure out a way to ditch the msdos partitioning code
and then go back to figuring out the tulip driver/LAN problem.

I've appended the output from my c3k. All my changes are committed
at this point and it's just a matter of twiddling the .config
file to do this. 

enjoy your weekend!
grant


Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.77
Server IP Address 15.8.80.76

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@rock Thu Apr 13 21:02:08 PDT 2000
0/vmlinux 2204987 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
0/ramdisk 614400 bytes @ 0x220d3b
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 0010190c first 00100000 n 3
Segment 0 load 00100000 size 1227316 mediaptr 0x1000
Segment 1 load 0022c000 size 101928 mediaptr 0x12d000
Segment 2 load 00248000 size 90112 mediaptr 0x146000
branching to kernel entry point 0x0010190c
The Kernel has started...
Free memory starts at: 0xc02cc000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00005bb0 00000481 00000000 00000002 77cd9463 100000f0 00000008 000000b2 000000b2
vers    00000200
cpuid   00000224
CPUID vers 17 rev 4
CPU(s): 1 x PA8500 at 400.000000 MHz
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. AllegroHigh W  (0) at 0xfffa0000, versions 0x5bb, 0x0, 0x4, 0x0, 0x81
7. AllegroHigh Memory (1) at 0xfed10200, versions 0x86, 0x0, 0x9, 0x0, 0x0
That's a total of 7 devices.
Linux version 2.3.99-pre1 (grundler@rock) (gcc version 2.9-hppa-991112) #83 Thu Apr 13 21:01:17 PDT 2000
init_bootmem 716 32768
init_bootmem complete
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 758.58 BogoMIPS
Memory: 124740k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c7ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c7ffe004, name=test-cachep)
kmem_test() - finished
c7ff0000 c7ff8000 c7fee000 c7ffc000
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
lba version TR2.1 (0x2) found at 0xfed30000
Scanning bus 00
Found 00:60 [1011/0019] 000200 00
Found 00:68 [11d4/1889] 000401 00
Found 00:70 [100b/0002] 000101 00
Found 00:71 [100b/000e] 000680 00
Found 00:72 [100b/0012] 000c03 00
Found 00:78 [1000/000b] 000100 00
Found 00:79 [1000/000b] 000100 00
Fixups for bus 00
lba_fixup_bus(0xc7ffd660) bus 0 sysdata 0xc7feb0e0
request_irq(258, c0123e94, 0x0, iosapic, c7fbb060)
request_irq(259, c0123e94, 0x0, iosapic, c7fbb080)
request_irq(260, c0123e94, 0x0, iosapic, c7fbb020)
request_irq(261, c0123e94, 0x0, iosapic, c7fbb020)
request_irq(262, c0123e94, 0x0, iosapic, c7fbb020)
request_irq(263, c0123e94, 0x0, iosapic, c7fbb040)
request_irq(264, c0123e94, 0x0, iosapic, c7fbb040)
Bus scan for 00 returning with max=00
lba version TR2.1 (0x2) found at 0xfed32000
Scanning bus 01
Found 01:30 [1000/000f] 000100 00
Fixups for bus 01
lba_fixup_bus(0xc7ffd700) bus 1 sysdata 0xc7feb1a0
request_irq(265, c0123e94, 0x0, iosapic, c7fbb260)
Bus scan for 01 returning with max=01
lba version TR2.1 (0x2) found at 0xfed38000
Scanning bus 02
Found 02:08 [12ae/0001] 000200 00
Fixups for bus 02
lba_fixup_bus(0xc7ffd7a0) bus 2 sysdata 0xc7feb220
request_irq(266, c0123e94, 0x0, iosapic, c7fbb4c0)
Bus scan for 02 returning with max=02
lba version TR2.1 (0x2) found at 0xfed3c000
lba: iosapic_register says not used
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
SBA at 0xfed00000
IOS_DIST_BASE   : 000000ff fee00001
IOS_DIST_MASK   : 000000ff ffff0000
IOS_DIST_ROUTE  : 34000000 00000000

IOS_DIRECT_BASE : 000000ff fee00a00
IOS_DIRECT_MASK : 000000ff ffff0000
IOS_DIRECT_ROUTE: 00000000 00000000
SBA found Astro 2.1 at 0xfed00000
sba_hw_init() hpa 0xfed00000 ioc_ctl 0x29cf ->sba_ioc_init hpa 0xfed22000 mem 128MBIOV 16MB (24 bits) PDIR size 0x8000 base c7fa8000
sba_ioc_init IOV base 0x1 mask 0xff000000
lba_init_iregs() ibase 0x1 imask 0xfc000000
lba_init_iregs() base_addr fed38000
lba_init_iregs() base_addr fed32000
lba_init_iregs() base_addr fed30000
lba_init_iregs() done
sba_ioc_init done
sba_common_init() res_size 0x200
lba: lba_bios_init
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sym53c8xx: at PCI bus 1, device 6, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 15, function 0
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 15, function 1
sym53c8xx: 53c896 detected 
sym53c875-0: rev 0x3 on pci bus 1 device 6 function 0 irq 768
sym53c875-0: NCR clock is 40037KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xf4800000
request_irq(768, c01cfc94, 0x4000000, sym53c8xx, c7f76000)
sym53c875-0: restart (scsi reset).
sym53c875-0: Downloading SCSI SCRIPTS.
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 0 irq 513
sym53c896-1: NCR clock is 40218KHz
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: on-chip RAM at 0xf4002000
request_irq(513, c01cfc94, 0x4000000, sym53c8xx, c7f70000)
sym53c896-1: suspicious SCSI data while resetting the BUS.
sym53c896-1: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 0x4000100, expecting 0x100
sym53c896-1: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE POWER etc.!
sym53c896-1: giving up ...
kernel BUG at sym53c8xx.c:707!
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 513
sym53c896-1: NCR clock is 40218KHz
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: on-chip RAM at 0xf4000000
request_irq(513, c01cfc94, 0x4000000, sym53c8xx, c7f70000)
sym53c896-1: restart (scsi reset).
sym53c896-1: handling phase mismatch from SCRIPTS.
sym53c896-1: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.5k
scsi1 : sym53c8xx - version 1.5k
scsi : 2 hosts.
  Vendor: SEAGATE   Model: ST32272WC         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sdb at scsi0, channel 0, id 8, lun 0
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sdc at scsi0, channel 0, id 10, lun 0
sym53c875-0-<5,0>: tagged command queue depth set to 8
sym53c875-0-<8,0>: tagged command queue depth set to 8
sym53c875-0-<10,0>: tagged command queue depth set to 8
  Vendor: SEAGATE   Model: ST19171N          Rev: HP06
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sdd at scsi1, channel 0, id 5, lun 0
  Vendor: SEAGATE   Model: ST39102LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sde at scsi1, channel 0, id 6, lun 0
sym53c896-1-<5,0>: tagged command queue depth set to 8
sym53c896-1-<6,0>: tagged command queue depth set to 8
scsi : detected 5 SCSI disks total.
sym53c875-0-<5,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sda: hdwr sector= 512 bytes. Sectors= 4165272 [2033 MB] [2.0 GB]
Partition check:
 sda: unknown partition table
sym53c875-0-<8,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sdb: hdwr sector= 512 bytes. Sectors= 8388314 [4095 MB] [4.1 GB]
 sdb:
Dumping Stack from c7fbc000 to c7fbc980:
c000 00000000 00000140 00000000 00000000 c0233980 00000000 00000000 ffffffff
c020 00000007 00000014 00000000 00000000 c02396f8 00000000 00000000 c02317f0
c040 c02317f0 c7fa4000 c025c000 00000000 00000000 00000000 00000000 00000000
c060 00000000 00000000 00000001 00000000 00000000 00000000 00000000 c025c000
c080 c025c000 c7f7c000 00000000 00000000 00000000 c02c205c 00000000 c7fbc09c
c0a0 c7fbc09c c7fbc0a4 c012e9cc c7fbc688 00000000 00000000 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 00000000 c7fbc000 c01344f0
c0e0 00000000 00000000 000002ed 00000000 00000000 00000022 00000000 0000030f
c100 00000000 00000000 00000000 00000000 00000000 00000000 80000000 00000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1c0 fffffeff fffffeff ffffffff 00000000 ffffffff ffffffff ffffffff ffffffff
c1e0 ffffffff ffffffff 00800000 05000000 00000000 ffffffff ffffffff ffffffff
c200 00000800 00000800 00000400 00000400 ffffffff ffffffff ffffffff ffffffff
c220 00007377 61707065 72000000 00000000 00000000 00000000 00000000 00000000
c240 00000000 c7fee000 c063ff18 f00008c4 f0400004 00000000 c7ffee00 c0101e58
c260 c02c1800 00504d64 c7ff0000 c0130370 c01303a8 c0234000 c7fee000 c063ff18
c280 f0400004 c02626ab 0004000a 0000003c 0000003e 0000000b c0233000 c02626cf
c2a0 c02626cf 00000004 00000000 c0101fe0 00000001 00000000 0000003e 0000003c
c2c0 00000024 c02339c8 f000017c f0000174 000000ff 0025c5c0 c0260000 c025e000
c2e0 c00003a8 c02626cf 00000003 00000000 c022c000 00000000 c7fbca80 c01034f0
c300 c0130370 00000000 00000000 00000000 c023a000 c0239040 c0239050 00000000
c320 c02391f0 00000000 00000000 00000000 00000000 00000000 c7fbc334 00000000
c340 00000000 00000000 00000000 00000001 00000000 00000000 c7fbc358 c7fbc358
c360 c7fbc360 c012e9cc c7fbc368 00000000 00000000 00000000 00000000 00000000
c380 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c3a0 00000000 00000000 00000000 c0103448 00000000 00000000 00000000 00000000
c3c0 c02396f8 00000000 c025c000 00000000 00000000 00000000 00000000 00000000
c3e0 00000000 00000000 00000000 c0101ff4 00000000 00000000 00000000 00000000
c400 00000000 00000000 00000000 00000000 c7fbc000 c02396f8 00000000 c025c000
c420 c025c500 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c440 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c460 00000000 00000000 00000000 c0248a00 00000000 00000000 00000000 00000000
c480 00000001 c023d000 00000000 00000000 c00003a8 c02339bc c02339bc c01dba4c
c4a0 00000000 00000000 c0248938 c0248938 00000000 00000000 00000000 00000000
c4c0 c025c500 f0400004 00000000 c01de224 c0237800 ffffffff c7ffdde0 c0147284
c4e0 c7fbc000 c02396f8 c0255460 c024ba40 c025c500 00000000 00000000 00000000
c500 f00008c4 f0400004 00000000 ffffffff 00000000 c02c1800 00504d64 c7ff0000
c520 c02c0800 c02c3000 c022c000 c024c87c c025b0dc c025c000 c025c500 00000000
c540 00504d64 c7ff0000 c02c0800 c02c3000 c022c000 c025b104 c025b0ec c020c5e8
c560 00000004 00000037 c0130370 c024c848 00000064 0000003e 0000003c 0000003b
c580 c7ff0000 c02c0800 c02c3000 00000000 c00003a8 c02339bc c02339bc c01bad84
c5a0 00000004 00000000 c02507b0 c02507b0 0000000b 0000003e 0000003c 00000015
c5c0 c02c1800 c02ca800 c0242000 c0242000 c01bb000 00000000 00000000 c02426c4
c5e0 c02ca800 c0242000 c0242000 c01bb000 00000000 00000000 00000000 00000000
c600 00000000 00000000 00000000 007ffeda 00000000 00000000 c01bad8b 00000001
c620 00000000 00000000 c0130370 c01c725c 00000000 00000018 39393820 53656167
c640 c7feb720 c02ca800 25000000 00000000 00003000 00000000 00000000 c7f7b460
c660 c0242000 0000000b 00000000 c0168bd4 c02345fc 00000014 c01c3000 000000a0
c680 c0242000 00000010 c0242000 00000001 07fbc6c0 c0260000 c025e000 c00003a8
c6a0 c02626b2 00000003 00000000 c0168c78 00000000 00000400 c7fbc780 c0130370
c6c0 f0000174 f000017c 73646200 c7fbc780 f0000174 f000017c f00008c4 f0400004
c6e0 00000000 ffffffff 00000000 c02426c4 c02bf800 c0242000 c0242000 c0242000
c700 00000010 c0242000 c02bf800 c0242000 c0242000 c02c9800 00000020 00000010
c720 c0242720 00000023 00000000 c01449a0 00000000 0000003e 0000003c 00000024
c740 00000000 00000001 00000004 00000fff fffffffd c7fbc790 c7fbc6c8 c0168a64
c760 00000000 00000003 c0168b48 c0168b48 00000010 c02345fc 00000000 00000028
c780 f00008c4 f0400004 00000000 ffffffff 00000000 c02426c4 c02bf800 00000011
c7a0 c0242720 00000810 00000000 00000010 c0237800 c025f180 c7fbc880 0000001f
c7c0 00000010 00000005 f0000174 f000017c f00008c4 f0400004 00000000 ffffffff
c7e0 00000000 c02426c4 00000010 00000011 c0242720 00000810 00000000 c02372e4
c800 00000000 c02626ae ffffffff ffffffff 0000000b c0233000 c02626b3 c02626b4
c820 00000004 00000005 00000000 c0169324 00000001 c0237800 0000003c 0000004d
c840 0004ff0b 00000000 c0169324 c7f635be 00000001 c0242720 00000011 00000001
c860 c0100000 00000000 c7f63400 c02ab000 c7f62160 0000000f 00000002 c0169000
c880 c0169000 00000085 00005000 00000015 000055aa ffffffff 00000001 00000000
c8a0 c7fbc898 c7fbc898 c7f62160 c022c000 c7f62160 00000001 c7fbc980 00000000
c8c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c8e0 00000000 00000000 c016939c c01693a0 00000000 c7f6b000 00000000 00000000
c900 0c781096 00000000 c7f635ca c0242720 00000011 c0242720 00000001 00000810
c920 00000010 00000002 c02626f2 c019b790 00000000 00000000 00000000 00000000
c940 00000008 c02626f8 00000080 00000000 00000080 00000080 c0231800 c02626ab
c960 f0000174 f000017c c014e83c c01046d4 00000008 c7fbbca0 00000000 00000004

Unexpected Interruption!: Code=28 regs=c7fbc840 (Addr=00000000)

PSW  : 0004ff0b  GR 1 : 00000000  GR 2 : c0169324  GR 3 : c7f635be  
GR 4 : 00000001  GR 5 : c0242720  GR 6 : 00000011  GR 7 : 00000001  
GR 8 : c0100000  GR 9 : 00000000  GR10 : c7f63400  GR11 : c02ab000  
GR12 : c7f62160  GR13 : 0000000f  GR14 : 00000002  GR15 : c0169000  
GR16 : c0169000  GR17 : 00000085  GR18 : 00005000  GR19 : 00000015  
GR20 : 000055aa  GR21 : ffffffff  GR22 : 00000001  GR23 : 00000000  
GR24 : c7fbc898  GR25 : c7fbc898  GR26 : c7f62160  GR27 : c022c000  
GR28 : c7f62160  GR29 : 00000001  GR30 : c7fbc980  GR31 : 00000000  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  

IASQ : 00000000 00000000 IAOQ : c016939c c01693a0
 IIR : 0c781096 ISR : 00000000 IOR : c7f635ca
