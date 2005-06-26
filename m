From: Ullrich Seibel <useibel@bigfoot.de>
Subject: [parisc-linux] Problem with two NICs on B132L+
Date: Sun, 26 Jun 2005 16:20:37 +0200
Message-ID: <42BEB9B5.4090108@bigfoot.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
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

Hallo,

I've some trouble with my NICs on *two* B132L+ (Digital DS21143 Tulip). 
When I switch-on the power only one of them works fine. The other one 
generates an error message:

    "***WARNING***: No MII transceiver found!"

during the boot process. After rebooting both NICs are running properly. 
I've added the related dmesg log entries.

--- schnipp ---

Linux version 2.6.8-2-32 (kyle@caradhras) (gcc version 3.3.5 (Debian 
1:3.3.5-7)) #1 Tue Feb 8 00:15:05 EST 2005
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005030 00000481 00000000 02020202 77a47330 100000f0 00000004 
000000ba 0
00000ba
vers  00000018
CPUID vers 15 rev 24 (0x000001f8)
capabilities 0x2
model 9000/778/B132L+
Total Memory: 384 Mb
initrd: 27b70000-27fee000
initrd: reserving 17b70000-17fee000 (mem_max 18000000)
On node 0 totalpages: 98304
  DMA zone: 98304 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LED display at f0190001 registered
Built 1 zonelists
Kernel command line:  root=/dev/sda3 HOME=/ console=tty0 sti=8/24 
sti_font=VGA8
x16 TERM=linux palo_kernel=1/vmlinux
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 393216k available
Calibrating delay loop... 87.85 BogoMIPS
Security Scaffold v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
checking if image is initramfs...it isn't (ungzip failed); looks like an 
initrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
2. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
3. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a },  
additional
 addresses: 0xf0800000
4. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 
0x0008c }
5. Merlin+ 132 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03e, 0x00081 
},  addit
ional addresses: 0xffd0c000 0xffc00000
6. Merlin+ 132 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03e, 
0x00074
 },  additional addresses: 0xffd01000 0xffd03000
7. Merlin+ 132 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03e, 0x0007b }
8. Merlin+ 132 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03e, 
0x0008c }
9. Merlin+ 132 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03e, 0x00082 }
10. Merlin+ 132 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03e, 
0x00084
 }
11. Merlin+ 132 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03e, 
0x00084
 }
12. Merlin+ 132 Core PC Floppy at 0xffd0a000 [8/16/10] { 10, 0x0, 0x03e, 
0x0008
3 }
13. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 
0x00085 },
additional addresses: 0xf0011000
14. Merlin L2+ 132 (9000/778/B132L) at 0xfffbe000 [62] { 0, 0x0, 0x503, 
0x00004
 }
15. Memory at 0xfffbf000 [63] { 1, 0x0, 0x061, 0x00009 }
CPU(s): 1 x PA7300LC (PCX-L2) at 132.000000 MHz
Lasi version 0 at 0xffd00000 found.
Dino [8/0] version 3.1 found at 0xfff80000
SCSI subsystem initialized
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
STI GSC/PCI core graphics driver Version 0.9a
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: INTERNAL_EG_640
fb0: stifb 640x480-8 frame buffer device, INTERNAL_EG_640, id: 2d08c0a7, 
mmio:
0xf8100000
unwind_init: start = 0x10325720, end = 0x103468a0, entries = 8472
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 80x30
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 25 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xfff83800 (irq = 106) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
input: AT Raw Set 2 keyboard on parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 4600 blocks [1 disk] into ram disk...done.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory: 316k freed
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0:  EEPROM default media type Autosense.
tulip0:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip0: ***WARNING***: No MII transceiver found!
eth0: Digital DS21143 Tulip rev 65 at 0xf0801000, 00:60:B0:B3:25:1E, IRQ 97.
tulip1: no phy info, aborting mtable build
tulip1:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth1: Digital DS21143 Tulip rev 65 at 0xf0802000, 00:10:83:03:FD:E6, IRQ 96.

--- schnipp ---


Any idea how to solve the Problem ?!


TIA

Ullrich Seibel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
