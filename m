Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 668664837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 09:38:47 -0600 (MDT)
Date: Thu, 17 Jul 2003 17:38:39 +0200
Message-ID: <3F0BEA8300002113@ocpmta1.freegates.net>
In-Reply-To: <20030717001528.GA20610@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	"Randolph Chung" <tausq@debian.org>,
	"Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi pa,

>My rp2430 has yet to boot into a usable userspace, it always dies at
>some point after serial console setup.

I also encounter a similar pb with my b2k (with 2.6.0-test1-pa1 _32bits_
compiled).
It start to boot:
Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux-2.6.0-test1-pa1'
Selected kernel: /vmlinux-2.6.0-test1-pa1 from partition 3
ELF32 executable
Entry 00100260 first 00100000 n 3
Segment 0 load 00100000 size 2526736 mediaptr 0x1000
Segment 1 load 0036a000 size 389364 mediaptr 0x26a000
Segment 2 load 003cc000 size 516223 mediaptr 0x2ca000
Branching to kernel entry point 0x00100260.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.0-test1-pa1 (root@palx2000) (gcc version 3.3.1 20030626
(Debian prerelease)) #1 Wed Jul 16 16:09:48 CEST 2003
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005d00 00000481 00000000 00000002 77e93910 100000f0 00000008 000000b2
000000b2
vers  00000301
CPUID vers 17 rev 11 (0x0000022b)
capabilities 0x3
model 9000/785/B2000
Total Memory: 256 Mb
pagetable_init
On node 0 totalpages: 65536
  DMA zone: 65536 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.6.0-test1-pa1
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Calibrating delay loop... 799.53 BogoMIPS
Memory: 255656k available
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
-> /dev
-> /dev/console
-> /root
POSIX conformance testing by UNIFIX
Initializing RT netlink socket
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
4. Kazoo W+ (0) at 0xfffa0000 [32], versions 0x5d0, 0x0, 0x4
5. Memory (1) at 0xfed10200 [49], versions 0x9d, 0x0, 0x9
CPU(s): 1 x PA8600 (PCX-W+) at 400.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR4.0 (0x5) found at 0xfed30000
PCI: Ignoring BAR0-3 of IDE controller 0000:00:0e.0
lba version TR4.0 (0x5) found at 0xfed32000
BIO: pool of 256 setup, 14Kb (56 bytes/bio)
biovec pool[0]:   1 bvecs: 256 entries (12 bytes)
biovec pool[1]:   4 bvecs: 256 entries (48 bytes)
biovec pool[2]:  16 bvecs: 256 entries (192 bytes)
biovec pool[3]:  64 bvecs: 256 entries (768 bytes)
biovec pool[4]: 128 bvecs: 256 entries (1536 bytes)
biovec pool[5]: 256 bvecs: 256 entries (3072 bytes)
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver hub
pty: 256 Unix98 ptys configured
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing enabled
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 64) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
ttyS0 at I/O 0x3f8 (irq = 99) is a 16550A
ttyS1 at I/O 0x2f8 (irq = 100) is a 16550A
Soft power switch enabled, polling @ 0xf0400804.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.07
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
airo:  Probing for PCI adapters
airo:  Finished probing for PCI adapters
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:30:D3:01:5A:3B, IRQ 66.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth1: Digital DS21143 Tulip rev 65 at 0x12100, 00:30:6E:06:23:D0, IRQ 130.
sym0: <875> rev 0x26 on pci bus 1 device 3 function 0 irq 131
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
sym1: <895a> rev 0x1 on pci bus 0 device 15 function 0 irq 65
sym1: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi0 : sym-2.1.16a
anticipatory scheduling elevator
scsi1 : sym-2.1.16a
  Vendor: QUANTUM   Model: ATLAS5-9LVD       Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym1:5:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST336704LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym1:6:0: tagged command queuing enabled, command queue depth 16.
st: Version 20030622, fixed bufsize 32768, s/g segs 256
sym1:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 31)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 sda11 sda12 >
Attached scsi disk sda at scsi1, channel 0, id 5, lun 0
sym1:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 31)
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
SCSI device sdb: drive cache: write through
 sdb: sdb1
Attached scsi disk sdb at scsi1, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi1, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi1, channel 0, id 6, lun 0,  type 0
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f4940000 (128 kB), fb at fb000000 (16 MB)
STI word mode ROM at f4940044, hpa at fb000000
STI id 35acda16-9a02587, conforms to spec rev. 8.0c
STI device: HPA4982A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
ohci-hcd 0000:00:0e.2: National Semiconduct USB Controller
ohci-hcd 0000:00:0e.2: irq 97, pci mem f4004000
ohci-hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
ohci-hcd 0000:00:0e.2: Using NSC SuperIO setup
usb usb1: Product: National Semiconduct USB Controller
usb usb1: Manufacturer: Linux 2.6.0-test1-pa1 ohci-hcd
usb usb1: SerialNumber: 0000:00:0e.2
hub 1-0:0: USB hub found
hub 1-0:0: 3 ports detected
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   913.200 MB/sec
   8regs_prefetch:   932.000 MB/sec
   32regs    :   877.200 MB/sec
   32regs_prefetch:   867.200 MB/sec
raid5: using function: 8regs_prefetch (932.000 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
oprofile: using timer interrupt.
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 508k freed
Adding 250872k swap on /dev/sda2.  Priority:-1 extents:1

Here it hangs. (just in case, i tried a telnet but no success)

I so do a toc.

Unfortunately the IAOQ = 0x00000000000172b8  is not a relevant value?

On the other hand when I reboot with a working 2.4 kernel I noticed that
only some fs were already mounted during the boot with 2.6:
[...]
Freeing unused kernel memory: 242k freed
INIT: version 2.85 booLoading /etc/console/boottime.kmap.gz
Activating swap.
Adding Swap: 250872k swap-space (priority -1)
Checking root file system...
fsck 1.34-WIP (21-May-2003)
/dev/sda5 was not cleanly unmounted, check forced.
/dev/sda5: [...=======================| 100.0%
/dev/sda5: 54062/203008 files (2.7% non-contiguous), 256055/406012 blocks
modprobe: modprobe: Can't locate module char-major-10-135
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
System time was Thu Jul 17 14:52:05 UTC 2003.
Setting the System Clock using the Hardware Clock as reference...
modprobe: modprobe: Can't locate module char-major-10-135
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
modprobe: modprobe: Can't locate module char-major-10-135
System Clock set. System local time is now Thu Jul 17 14:52:05 UTC 2003.
Calculating module dependencies... done.
Loading modules: 
Checking all file systems...
fsck 1.34-WIP (21-May-2003)
/dev/sda3 was not cleanly unmounted, check forced.
/dev/sda3: [...]======================| 100.0%
/dev/sda3: 28/15616 files (35.7% non-contiguous), 31760/62464 blocks
/dev/sda6 was not cleanly unmounted, check forced.
/dev/sda6: [...]======================| 100.0%
/dev/sda6: 5112/62496 files (4.6% non-contiguous), 114738/249840 blocks
/dev/sda7 was not cleanly unmounted, check forced.
/dev/sda7: [...]======================| 100.0%
/dev/sda7: 14/31232 files (0.0% non-contiguous), 3965/124912 blocks
/dev/sda8: clean, 132/31232 files, 11041/124912 blocks
/dev/sda9: clean, 109247/250368 files, 465650/499964 blocks
/dev/sda10: clean, 5352/250368 files, 429756/499964 blocks
/dev/sda11: clean, 47353/250368 files, 239067/499964 blocks
[...]

[sda5==/; sda3==/boot; sda6==/var; sda7==/tmp; sda8==/home; sda9==/usr/src;...]

hth,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
