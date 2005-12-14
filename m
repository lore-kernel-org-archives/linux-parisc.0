From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: -pa2 broke N4000/A500
Date: Thu, 15 Dec 2005 00:01:41 +0100
Message-ID: <200512150001.41553.deller@gmx.de>
References: <20051212151131.GD9286@parisc-linux.org>
	<20051214190219.GC15899@colo.lackof.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_VRKoDL7YKgeVdzi"
Cc: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051214190219.GC15899@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_VRKoDL7YKgeVdzi
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Patch tested on my c3k.
Seems OK.
Bootlog is attached.

Helge

On Wednesday 14 December 2005 20:02, Grant Grundler wrote:
> On Mon, Dec 12, 2005 at 08:11:31AM -0700, Matthew Wilcox wrote:
> > 
> > Grant, your lba_pci changes to support rp3440 broke A500 and N4000.
> > CVS2_6_15_RC5_PA1 boots fine.
> 
> Willy,
> Just wanted to ACK on p-l mailing list that I did break this - apologies again.
> 
> I've posted the following patch (on top of what willy committed)
> to parisc-linux-cvs mailing list and it only needs testing on C3000.
> 
> thanks,
> grant
> 
> > willy@palinux:~/linux-2.6$ cvs up -rCVS2_6_15_RC5_PA2
> > U Makefile
> > U drivers/parisc/lba_pci.c
> ...
> 
> 
> Index: drivers/parisc/lba_pci.c
> ===================================================================
> RCS file: /var/cvs/linux-2.6/drivers/parisc/lba_pci.c,v
> retrieving revision 1.35
> diff -u -p -r1.35 lba_pci.c
> --- drivers/parisc/lba_pci.c	12 Dec 2005 15:50:34 -0000	1.35
> +++ drivers/parisc/lba_pci.c	12 Dec 2005 17:21:26 -0000
> @@ -809,8 +809,7 @@ lba_fixup_bus(struct pci_bus *bus)
>  		}
>  		/* advertize Host bridge resources to PCI bus */
>  		bus->resource[0] = &(ldev->hba.io_space);
> -		bus->resource[1] = &(ldev->hba.lmmio_space);
> -		i = 2;
> +		i = 1;
>  
>  		if (ldev->hba.elmmio_space.start) {
>  			err = request_resource(&iomem_resource,
> @@ -831,7 +830,7 @@ lba_fixup_bus(struct pci_bus *bus)
>  
>  		/*   Overlaps with elmmio can (and should) fail here.
>  		 *   We will prune (or ignore) the distributed range.
> -
> +		 *
>  		 *   FIXME: SBA code should register all elmmio ranges first.
>  		 *      that would take care of elmmio ranges routed
>  		 *	to a different rope (already discovered) from
> @@ -851,7 +850,8 @@ lba_fixup_bus(struct pci_bus *bus)
>  					"lmmio_space [%lx/%lx]\n",
>  					ldev->hba.lmmio_space.start,
>  					ldev->hba.lmmio_space.end);
> -			}
> +			} else
> +				bus->resource[i++] = &(ldev->hba.lmmio_space);
>  		}
>  
>  #ifdef CONFIG_64BIT
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 

--Boundary-00=_VRKoDL7YKgeVdzi
Content-Type: text/plain;
  charset="iso-8859-1";
  name="bootlog"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bootlog"

Linux version 2.6.15-rc5-pa5 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #242 Wed Dec 14 23:51:28 CET 2005
FP[0] enabled: Rev 1 Model 19
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/C3700
Total Memory: 2048 MB
On node 0 totalpages: 524288
  DMA zone: 524288 pages, LIFO batch:31
  DMA32 zone: 0 pages, LIFO batch:0
  Normal zone: 0 pages, LIFO batch:0
  HighMem zone: 0 pages, LIFO batch:0
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 65536 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Memory: 2097152k available
Calibrating delay loop... 1497.49 BogoMIPS (lpj=7487488)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Whole cache flush 863173 cycles, flushing 4294848 bytes 859323 cycles
Setting cache flush threshold to 300 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
LBA version TR4.0 (0x5) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
LBA version TR4.0 (0x5) found at 0xfed32000
iosapic: no IRTE for 0000:01:04.0 (IRQ not connected?)
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
LBA version TR4.0 (0x5) found at 0xfed38000
LBA version TR4.0 (0x5) found at 0xfed3c000
iosapic: hpa not registered for 0000:03:02.0
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
unwind_init: start = 0x103e4430, end = 0x10411a10, entries = 11614
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 67) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.10
Soft power switch enabled, polling @ 0xf0400804.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f2400000 (64 kB), fb at f8000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1024
STI PCI graphic ROM found at f3800000 (2048 kB), fb at f6000000 (32 MB)
    id 35acda30-9a02587, conforms to spec rev. 8.0d
    graphics card name: A1262A
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
Console: switching to colour frame buffer device 128x48
fb0: stifb 1024x768-8 frame buffer device, PCI_GRAFFITIX1024, id: 2d08c0a7, mmio: 0xf8100000
stifb: 'A1262A' (id: 0x35acda30) not supported.
sstfb: Voodoo2 (revision 2) with ICS ICS5342 dac
sstfb: framebuffer at 0xfb400000, mapped to 0xfb400000, size 2MB
fb1: Voodoo2 frame buffer device at 0xfb400000
lp: driver loaded but no devices found
Generic RTC Driver v1.07
HP SDC: No SDC found.
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
RAMDISK driver initialized: 4 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 1.1.13-NAPI (December 15, 2004)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/DS21143 Tulip rev 65 at 80001000, 00:30:6E:48:AA:64, IRQ 65.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY (2) block.
tulip1:  Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth1: Digital DS21142/DS21143 Tulip rev 33 at 80028000, 00:60:B0:7A:12:89, IRQ 71.
sym0: <896> rev 0x7 at pci 0000:00:0f.0 irq 68
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.2
sym1: <896> rev 0x7 at pci 0000:00:0f.1 irq 68
sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.2
  Vendor: SEAGATE   Model: ST39102LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:5: tagged command queuing enabled, command queue depth 16.
 target1:0:5: Beginning Domain Validation
 target1:0:5: asynchronous.
 target1:0:5: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 15)
 target1:0:5: Domain Validation skipping write tests
 target1:0:5: Ending Domain Validation
  Vendor: HP 36.4G  Model: ST336607LC        Rev: HPC3
  Type:   Direct-Access                      ANSI SCSI revision: 03
 target1:0:6: tagged command queuing enabled, command queue depth 16.
 target1:0:6: Beginning Domain Validation
 target1:0:6: asynchronous.
 target1:0:6: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 31)
 target1:0:6: Domain Validation skipping write tests
 target1:0:6: Ending Domain Validation
st: Version 20050830, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write through
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write through
 sda: sda1 sda2 sda3 sda4
sd 1:0:5:0: Attached scsi disk sda
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
SCSI device sdb: drive cache: write through
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
SCSI device sdb: drive cache: write through
 sdb: sdb1 sdb2 sdb3 sdb4
sd 1:0:6:0: Attached scsi disk sdb
sd 1:0:5:0: Attached scsi generic sg0 type 0
sd 1:0:6:0: Attached scsi generic sg1 type 0
ohci_hcd: 2005 April 22 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
ohci_hcd 0000:00:0e.2: OHCI Host Controller
drivers/usb/core/inode.c: creating file 'devices'
drivers/usb/core/inode.c: creating file '001'
ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:0e.2: irq 1, io mem 0xf2007000
ohci_hcd 0000:00:0e.2: Using NSC SuperIO setup
ohci_hcd 0000:00:0e.2: resetting from state 'reset', control = 0x0
ohci_hcd 0000:00:0e.2: OHCI controller state
ohci_hcd 0000:00:0e.2: OHCI 1.0, NO legacy support registers
ohci_hcd 0000:00:0e.2: control 0x083 HCFS=operational CBSR=3
ohci_hcd 0000:00:0e.2: cmdstatus 0x00000 SOC=0
ohci_hcd 0000:00:0e.2: intrstatus 0x00000000
ohci_hcd 0000:00:0e.2: intrenable 0x8000001a MIE UE RD WDH
ohci_hcd 0000:00:0e.2: hcca frame #0000
ohci_hcd 0000:00:0e.2: roothub.a 00001003 POTPGT=0 NOCP NDP=3(3)
ohci_hcd 0000:00:0e.2: roothub.b 000e0000 PPCM=000e DR=0000
ohci_hcd 0000:00:0e.2: roothub.status 00008000 DRWE
ohci_hcd 0000:00:0e.2: roothub.portstatus [0] 0x00000100 PPS
ohci_hcd 0000:00:0e.2: roothub.portstatus [1] 0x00000100 PPS
ohci_hcd 0000:00:0e.2: roothub.portstatus [2] 0x00000100 PPS
ohci_hcd 0000:00:0e.2: created debug files
usb usb1: default language 0x0409
usb usb1: new device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: OHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.15-rc5-pa5 ohci_hcd
usb usb1: SerialNumber: 0000:00:0e.2
usb usb1: hotplug
usb usb1: adding 1-0:1.0 (config #1, interface 0)
usb 1-0:1.0: hotplug
hub 1-0:1.0: usb_probe_interface
hub 1-0:1.0: usb_probe_interface - got id
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
hub 1-0:1.0: standalone hub
hub 1-0:1.0: ganged power switching
hub 1-0:1.0: no over-current protection
hub 1-0:1.0: power on to power good time: 0ms
hub 1-0:1.0: local power source is good
hub 1-0:1.0: enabling power on all ports
hub 1-0:1.0: state 5 ports 3 chg 0000 evt 0000
drivers/usb/core/inode.c: creating file '001'
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
mice: PS/2 mouse device common for all mice
Advanced Linux Sound Architecture Driver Version 1.0.10rc3 (Mon Nov 07 13:30:21 2005 UTC).
ALSA device list:
  No soundcards found.
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP route cache hash table entries: 131072 (order: 7, 524288 bytes)
TCP established hash table entries: 524288 (order: 9, 2097152 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 524288 bind 65536)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.70
IP-Config: Complete:
      device=eth0, addr=192.168.178.70, mask=255.255.255.0, gw=192.168.178.1,
     host=c3000, domain=box, nis-domain=(none),
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
eth0: Setting full-duplex based on MII#1 link partner capability of 05e1.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 356k freed
Adding 263144k swap on /dev/sda1.  Priority:-1 extents:1 across:263144k
Adding 1953784k swap on /dev/sdb3.  Priority:-2 extents:1 across:1953784k
EXT3 FS on sda3, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sdb4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.

--Boundary-00=_VRKoDL7YKgeVdzi
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_VRKoDL7YKgeVdzi--
