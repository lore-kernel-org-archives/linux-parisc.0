Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA09318
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 02:29:09 -0700
Sender: marteaut@esiee.fr
Message-ID: <3A2E0864.DA3BAE28@esiee.fr>
Date: Wed, 06 Dec 2000 10:35:32 +0100
From: Thomas Marteaut <marteaut@esiee.fr>
MIME-Version: 1.0
To: Thierry Simonnet <t.simonnet@esiee.fr>,
        Puffin Group <parisc-linux@thepuffingroup.com>
Content-Type: multipart/mixed;
 boundary="------------73AF70C852DBEB8621980FB6"
Subject: [parisc-linux] Les logs des deux machines
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------73AF70C852DBEB8621980FB6
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

A remarquer:
Il trouve bien les leds sur la B132
Il ne fait qu'une fois la sti
J'ai la liaison série


Pour l'horloge de la 712, je me demande si la pile n'est pas à plat?




PS:Je les ai attaché car tu n'es pas un fou du pine ou de elm
--------------73AF70C852DBEB8621980FB6
Content-Type: text/plain; charset=us-ascii;
 name="sti+frame"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sti+frame"

The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02d7000
start_parisc(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX console=tty root=/dev/sda3'
PALO initrd 0-0
model	00006010 00000481 00000000 00000000 7803b0d6 00000000 00000004 00000072 00000072
vers	0000000c
CPUID	vers 0 rev 0
model	9000/712
led_init: CPU_HVERSION 601
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Gecko 80 GSC Core Graphics (10) at 0xf8000000, versions 0x1c, 0x0, 0x85, 0x0, 0x0
2. Gecko 80 Core BA (11) at 0xf0100000, versions 0x1c, 0x0, 0x81, 0x0, 0x0
3. Gecko 80 Core SCSI (10) at 0xf0106000, versions 0x1c, 0x0, 0x82, 0x0, 0x0
4. Gecko 80 Core Lan (802.3) (10) at 0xf0107000, versions 0x1c, 0x0, 0x8a, 0x0, 0x0
5. Gecko 80 Core RS-232 (10) at 0xf0105000, versions 0x1c, 0x0, 0x8c, 0x0, 0x0
6. Gecko 80 Core Centronics (10) at 0xf0102000, versions 0x1c, 0x0, 0x74, 0x0, 0x0
7. Gecko 80 Audio (10) at 0xf0104000, versions 0x1c, 0x0, 0x7b, 0x0, 0x0
8. Gecko 80 Core PC Floppy (10) at 0xf010a000, versions 0x1c, 0x0, 0x83, 0x0, 0x0
9. Gecko 80 Core PC Keyboard (10) at 0xf0108000, versions 0x1c, 0x0, 0x84, 0x0, 0x0
10. Gecko 80 Core PC Keyboard (10) at 0xf0108100, versions 0x1c, 0x0, 0x84, 0x0, 0x0
11. Gecko 80 (712/80) (0) at 0xfffbe000, versions 0x601, 0x0, 0x4, 0x0, 0x81
12. Gecko 80 (1) at 0xfffbf000, versions 0x38, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 80.000000 MHz
Linux version 2.4.0-test10 (mklinux@pc5158a) (gcc version 2.96 20000925 (experimental)) #3 Wed Dec 6 09:49:48 CET 2000
free_bootmem(0x2d8000, 0x7d28000)
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX console=tty root=/dev/sda3
trap_init
Console: colour dummy device 80x25
Calibrating delay loop... 79.67 BogoMIPS
Memory: 125840k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
LED display at 00000000
parport_init_chip: initialize bidirectional-mode.
Found i82596 at 0xf0107000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xf0108000...
Support for Lasi PS/2-psaux not yet available !
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
searching for word mode STI ROMs
STI ROM from PDC at f0080000
found potential STI ROM at f0080000
STI word mode ROM at f0080000
STI word mode ROM type 3
 supports 13 monitors
 conforms to STI ROM spec revision 8.04
 graphics id 2b4ded6d40a00499
 font start 000037d4
 region list 000037c0
 init_graph 00000808
 alternate code type 0
f8000000 g
3 text planes
1280 x 1024 screen resolution
   0 x    0 offscreen
2048 x 1024 layout
regions at f0080000 f9000000 f8100000 f8380000
regions at f8000000 f8000000 f8204000 f8000000
reent_lvl 0
save_addr 07f96800
monitor 1
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 07f96c00
Switching from PDC console
Console: switching to mono frame buffer device 160x64
fb0: STI Generic frame buffer device
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
eth0: 82596 at 0xf0107000, 08 00 09 6D C1 EC IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: HP        Model: C3725S            Rev: 4299
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST31230N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 3, lun 0
Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
SCSI device sda: 4238836 512-byte hdwr sectors (2170 MB)
Partition check:
 sda: sda1 sda2 sda3
SCSI device sdb: 2051460 512-byte hdwr sectors (1050 MB)
 sdb: sdb1 sdb2 sdb3
searching for word mode STI ROMs
STI ROM from PDC at f0080000
found potential STI ROM at f0080000
STI word mode ROM at f0080000
STI word mode ROM type 3
 supports 13 monitors
 conforms to STI ROM spec revision 8.04
 graphics id 2b4ded6d40a00499
 font start 000037d4
 region list 000037c0
 init_graph 00000808
 alternate code type 0
f8000000 g
3 text planes
1280 x 1024 screen resolution
   0 x    0 offscreen
2048 x 1024 layout
regions at f0080000 f9000000 f8100000 f8380000
regions at f8000000 f8000000 f8204000 f8000000
reent_lvl 0
save_addr 07f3f400
monitor 1
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 07f3f800
Switching from PDC console
Console: switching to colour STI console 160x64
searching for byte mode STI ROMs
STI ROM from PDC at f0080000
found potential STI ROM at f0080000
STI word mode ROM at f0080000, ignored
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
IP-Config: Incomplete network configuration information.
eth0: link ok.
Trying to free nonexistent resource <f0107000-f010700b>
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kmem_create: Forcing size word alignment - nfs_fh
VFS: Mounted root (ext2 filesystem) readonly.
Unable to handle swap header version 16777216
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
Unable to handle swap header version 16777216
eth0: link ok.
NFS: NFSv3 not supported.
nfs warning: mount version older than kernel

--------------73AF70C852DBEB8621980FB6
Content-Type: text/plain; charset=us-ascii;
 name="sti+frame_B132"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sti+frame_B132"

The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02d7000
start_parisc(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX console=tty root=/dev/sdb3'
PALO initrd 0-0
model	00005030 00000481 00000000 02020202 78094fbe 100000f0 00000004 000000ba 000000ba
vers	00000008
cpuid	000001e8
CPUID	vers 15 rev 8
model	9000/778/B132L+
led_init: CPU_HVERSION 503
led_init: chassis info: model 2, lcd_width=0, cmd_delay=40, ret0=8, ret1=8
LED display at f0190000
Searching for devices in PDC firmware... processor hpa 0xfffbe000
a newer box...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
2. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, versions 0x22, 0x0, 0x8c, 0x0, 0x0
3. Merlin L2+ 132 (9000/778/B132L) (0) at 0xfffbe000, versions 0x503, 0x0, 0x4, 0x0, 0x81
4. Merlin+ L2 132 (1) at 0xfffbf000, versions 0x61, 0x0, 0x9, 0x0, 0x0
5. Merlin+ 132 Core BA (11) at 0xffd00000, versions 0x3e, 0x0, 0x81, 0x0, 0x0
6. Merlin+ 132 Core RS-232 (10) at 0xffd05000, versions 0x3e, 0x0, 0x8c, 0x0, 0x0
7. Merlin+ 132 Core SCSI (10) at 0xffd06000, versions 0x3e, 0x0, 0x82, 0x0, 0x0
8. Merlin+ 132 Core Centronics (10) at 0xffd02000, versions 0x3e, 0x0, 0x74, 0x0, 0x0
9. Merlin+ 132 Core Audio (10) at 0xffd04000, versions 0x3e, 0x4, 0x7b, 0x0, 0x0
10. Merlin+ 132 Core PC Keyboard (10) at 0xffd08000, versions 0x3e, 0x0, 0x84, 0x0, 0x0
11. Merlin+ 132 Core PC Keyboard (10) at 0xffd08100, versions 0x3e, 0x0, 0x84, 0x0, 0x0
12. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
13. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0, 0x0
That's a total of 13 devices.
CPU(s): 1 x PA7300LC (PCX-L2) at 132.000000 MHz
Linux version 2.4.0-test10 (mklinux@pc5158a) (gcc version 2.96 20000925 (experimental)) #3 Wed Dec 6 09:49:48 CET 2000
free_bootmem(0x2d8000, 0x7d28000)
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX console=tty root=/dev/sdb3
trap_init
Console: colour dummy device 80x25
Calibrating delay loop... 87.86 BogoMIPS
Memory: 125840k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
parport_init_chip: initialize bidirectional-mode.
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
Dino version 3.1 (bridge mode) found at 0xfff80000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
searching for word mode STI ROMs
found potential STI ROM at f8000000
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
busdevice_alloc_irq(0xc02c1c68): No known LASI/ASP/WAX owns device at 0xfff83000 !
IRQ not found for serial device at 0xfff83000
Warning : device (10, 0x22, 0x0, 0x8c, 0x0) NOT claimed by serial device 715/new or similiar
ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Linux Tulip driver version 0.9.10 (September 6, 2000)
eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:60:B0:EB:BB:3D, IRQ 96.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER...(fix-up)
sym53c8xx: 53c875 detected 
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
sym53c875-0: NCR clock is 40585KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xf0ffe000
sym53c875-0: restart (scsi reset).
sym53c875-0: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.6b
  Vendor: SEAGATE   Model: ST34572WS         Rev: HP00
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c875-0-<6,0>: tagged command queue depth set to 8
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86
scsi1: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi1: Good, target data areas are dma coherent
scsi1: test 1 completed ok.
scsi1 : LASI/Simple 53c7xx
  Vendor: HP        Model: C3725S            Rev: 4299
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 6, lun 0
Detected scsi disk sdb at scsi1, channel 0, id 3, lun 0
sym53c875-0-<6,0>: wide msgout: 1-2-3-1.
sym53c875-0-<6,0>: wide msgin: 1-2-3-1.
sym53c875-0-<6,0>: wide: wide=1 chg=0.
sym53c875-0-<6,0>: wide msgout: 1-2-3-1.
sym53c875-0-<6,0>: wide msgin: 1-2-3-1.
sym53c875-0-<6,0>: wide: wide=1 chg=0.
sym53c875-0-<6,0>: sync msgout: 1-3-1-c-10.
sym53c875-0-<6,0>: sync msg in: 1-3-1-c-f.
sym53c875-0-<6,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: unknown partition table
SCSI device sdb: 4238836 512-byte hdwr sectors (2170 MB)
 sdb: sdb1 sdb2 sdb3
searching for word mode STI ROMs
found potential STI ROM at f8000000
searching for byte mode STI ROMs
found potential STI ROM at f8000000
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
IP-Config: Incomplete network configuration information.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kmem_create: Forcing size word alignment - nfs_fh
VFS: Mounted root (ext2 filesystem) readonly.
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
NFS: NFSv3 not supported.
nfs warning: mount version older than kernel

--------------73AF70C852DBEB8621980FB6--
