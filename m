Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA13620
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 17:11:42 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by palrel3.hp.com (Postfix) with ESMTP id 678A82D31
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 16:11:37 -0700 (PDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id C96B64FE7D
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 18:11:36 -0400 (EDT)
Message-Id: <200004142311.QAA20419@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] msdos_partion+120 == code 28 
In-reply-to: Your message of "Fri, 14 Apr 2000 15:33:45 PDT."
             <200004142233.PAA20334@milano.cup.hp.com>
Date: Fri, 14 Apr 2000 16:11:42 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> code 28 == "Unaligned Data Reference Trap".
> (Gee, where have I seen this before? :^(  )
> 
> IAOQ  == 0xc016939c msdos_partition+120

So here's the output using "CONFIG_MAC_PARTITION=y"
and "# CONFIG_MSDOS_PARTITION is not set". It gets
just as far as without SCSI (dies after getting BOOTP reply).

grant

ps. I still have to write the sba_map_sg() and sba_unmap_sg()
for "real" SCSI support...but a simple version (no optimizations)
should be easy.

Grant Grundler
Unix Development Lab
+1.408.447.7253


Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.77
Server IP Address 15.8.80.76

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@rock Fri Apr 14 15:46:37 PDT 2000
0/vmlinux 2204600 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
0/ramdisk 614400 bytes @ 0x220bb8
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 0010190c first 00100000 n 3
Segment 0 load 00100000 size 1226084 mediaptr 0x1000
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
Linux version 2.3.99-pre1 (grundler@rock) (gcc version 2.9-hppa-991112) #84 Fri Apr 14 15:46:12 PDT 2000
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

IOS_DIRECT_BASE : 000000ff fee00200
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
request_irq(768, c01cf7d4, 0x4000000, sym53c8xx, c7f76000)
sym53c875-0: restart (scsi reset).
sym53c875-0: Downloading SCSI SCRIPTS.
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 0 irq 513
sym53c896-1: NCR clock is 40218KHz
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: on-chip RAM at 0xf4002000
request_irq(513, c01cf7d4, 0x4000000, sym53c8xx, c7f70000)
sym53c896-1: suspicious SCSI data while resetting the BUS.
sym53c896-1: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 0x4000100, expecting 0x100
sym53c896-1: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE POWER etc.!
sym53c896-1: giving up ...
kernel BUG at sym53c8xx.c:707!
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 513
sym53c896-1: NCR clock is 40218KHz
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: on-chip RAM at 0xf4000000
request_irq(513, c01cf7d4, 0x4000000, sym53c8xx, c7f70000)
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
 sdb: unknown partition table
sym53c875-0-<10,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sdc: hdwr sector= 512 bytes. Sectors= 8388314 [4095 MB] [4.1 GB]
 sdc: unknown partition table
sym53c896-1-<5,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sdd: hdwr sector= 512 bytes. Sectors= 17783112 [8683 MB] [8.7 GB]
 sdd: unknown partition table
sym53c896-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sde: hdwr sector= 512 bytes. Sectors= 17773524 [8678 MB] [8.7 GB]
 sde: unknown partition table
Linux Tulip driver version 0.9.4.2 (Mar 21, 2000)
pcibios_enable_device: Enabling device 00:0c.0 (0057 -> 0157)
eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:36:00:89, IRQ 514.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
request_irq(514, c01b3434, 0x4000000, eth0, c7fb0800)
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 15.8.80.76, my address is 15.8.80.77
