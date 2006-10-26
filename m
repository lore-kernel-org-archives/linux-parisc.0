From: Troy Nelson <tnelson@scires.com>
Subject: [parisc-linux] Floppy Drive problem on 715/75
Date: Thu, 26 Oct 2006 15:12:43 -0400
Message-ID: <454108AB.7060503@scires.com>
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

Greetings! When boot I get the following boot message below. In short my 
sda which is my scsi floppy drive is trying to send up but fails. This 
happens a couple of times then times out and continues to boot. Once 
logged into the system I can't mount my floppy. If i trying to mount it, it
just hangs until i remove the disk. Any help would be appreciated!

Linux version 2.6.17.10-pa6 (root@PALINUX) (gcc version 3.3.5 (Gentoo 
3.3.5-r1, pie-8.7.7.1)) #2 Thu Oct 26 13:50:13 EST 2006
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: Snake.
model 00003160 00000481 00000000 00000000 77bbccf4 ffffffff 00000004 
0000000a 0000000a
vers  00000013
model 9000/715
Total Memory: 64 MB
On node 0 totalpages: 16384
  DMA zone: 16384 pages, LIFO batch:3
Built 1 zonelists
Kernel command line:  root=/dev/sdb4 console=tty0 sti=0 sti_font=VGA8x16 
palo_kernel=2/vmlinux
PID hash table entries: 512 (order: 9, 2048 bytes)
Console: colour dummy device 128x48
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 65536k available
Calibrating delay loop... 74.75 BogoMIPS (lpj=373760)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Stinger Optional Graphics at 0xf4000000 [0] { 10, 0x0, 0x006, 0x00077 }
2. Scorpio Sr. Core BA at 0xf082f000 [2] { 11, 0x0, 0x019, 0x00070 }
3. Scorpio Sr. Core SCSI at 0xf0825000 [2/0/1] { 10, 0x0, 0x019, 0x00071 }
4. Scorpio Sr. Core LAN (802.3) at 0xf0826000 [2/0/2] { 10, 0x0, 0x019, 
0x00072 }
5. Scorpio Sr. Core HIL at 0xf0821000 [2/0/3] { 10, 0x0, 0x019, 0x00073 }
6. Scorpio Sr. Core RS-232 at 0xf0823000 [2/0/4] { 10, 0x0, 0x019, 0x00075 }
7. Scorpio Sr. Core RS-232 at 0xf0822000 [2/0/5] { 10, 0x0, 0x019, 0x00075 }
8. Scorpio Sr. Core Centronics at 0xf0824000 [2/0/6] { 10, 0x0, 0x019, 
0x00074 }
9. Scorpio Sr. Audio at 0xf1000000 [2/0/8] { 10, 0x0, 0x019, 0x0007b }
10. Scorpio Sr. EISA BA at 0xfc000000 [4] { 11, 0x0, 0x019, 0x00076 }
11. Scorpio Sr.(715/75) at 0xfffbe000 [8] { 0, 0x0, 0x316, 0x00004 }
12. Memory at 0xfffbf000 [9] { 1, 0x0, 0x027, 0x00009 }
Enabling regular chassis codes support v0.05
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz
Whole cache flush 233043 cycles, flushing 6168576 bytes 686816 cycles
Setting cache flush threshold to 1140 (1 CPUs online)
Asp version 1 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
Enumerating EISA bus
EISA slot 1: HWP1850 EISA IRQ 10
EISA: Probing bus 0 at 4
EISA: Mainboard HWPC000 detected.
EISA: slot 1 : HWP1850 detected.
EISA: Detected 1 card.
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 2048 bind 1024)
TCP reno registered
Chassis warnings not supported.
unwind_init: start = 0x10502680, end = 0x105416d0, entries = 16133
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
EISA EEPROM at 0x00008400
PDC Stable Storage facility v0.30
Soft power switch support not available.
STI GSC/PCI core graphics driver Version 0.9a
    id 27f12392-40a00499, conforms to spec rev. 8.02
    graphics card name: HPA1991AC19
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, HPA1991AC19, id: 27f12392, 
mmio: 0xf4100000
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
2:0:4: ttyS0 at MMIO 0xf0823800 (irq = 20) is a 16550A
2:0:5: ttyS1 at MMIO 0xf0822800 (irq = 21) is a 16550A
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 22 [PCSPP]
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
usbcore: registered new driver ub
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xf0826000, IRQ 17
drivers/net/lasi_82596.c: MAC of HP700 LAN read from EEPROM
eth0: 82596 at 0xf0826000, 08 00 09 4F 83 68 IRQ 17.
orinoco 0.15rc3 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel 
Roskin <proski@gnu.org>, et al)
orinoco_cs 0.15rc3 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel 
Roskin <proski@gnu.org>, et al)
spectrum_cs 0.15rc3 (Pavel Roskin <proski@gnu.org>, David Gibson 
<hermes@gibson.dropbear.id.au>, et al)
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
st: Version 20050830, fixed bufsize 32768, s/g segs 256
SCSI Media Changer driver v0.25
usbmon: debugfs is not available
ohci_hcd: 2005 April 22 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
USB Universal Host Controller Interface driver v3.0
sl811: driver sl811-hcd, 19 May 2005
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
  Vendor: TEAC      Model: FC-1     HF   07  Rev: RV B
  Type:   Direct-Access                      ANSI SCSI revision: 01 CCS
HP SDC: HP SDC at 0xf0821000, IRQ 18 (NMI IRQ 19)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036
  Type:   CD-ROM                             ANSI SCSI revision: 02
mice: PS/2 mouse device common for all mice
hil_kbd: probe of serio0 failed with error -5
hil_kbd: probe of serio1 failed with error -5
hil_kbd: probe of serio2 failed with error -5
hil_kbd: probe of serio3 failed with error -5
hil_kbd: probe of serio4 failed with error -5
hil_kbd: probe of serio5 failed with error -5
hil_kbd: probe of serio6 failed with error -5
hil_kbd: probe of serio7 failed with error -5
hil_kbd: probe of serio8 failed with error -5
hil_kbd: probe of serio9 failed with error -5
hil_kbd: probe of serio10 failed with error -5
hil_kbd: probe of serio11 failed with error -5
hil_kbd: probe of serio12 failed with error -5
hil_kbd: probe of serio13 failed with error -5
hil_kbd: probe of serio14 failed with error -5
hil_kbd: probe of serio15 failed with error -5
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   8regs     :    52.000 MB/sec
   8regs_prefetch:    55.600 MB/sec
   32regs    :    63.600 MB/sec
   32regs_prefetch:    67.200 MB/sec
raid5: using function: 32regs_prefetch (67.200 MB/sec)
raid6: int32x1     14 MB/s
raid6: int32x2     17 MB/s
raid6: int32x4     20 MB/s
raid6: int32x8     17 MB/s
raid6: using algorithm int32x4 (20 MB/s)
md: raid6 personality registered for level 6
md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: bitmap version 4.39
device-mapper: 4.6.0-ioctl (2006-02-17) initialised: dm-devel@redhat.com
Advanced Linux Sound Architecture Driver Version 1.0.11rc4 (Wed Mar 22 
10:27:24 2006 UTC).
  Vendor: SEAGATE   Model: ST32151N          Rev: HP02
  Type:   Direct-Access                      ANSI SCSI revision: 02
harmony: cannot allocate graveyard buffer!
harmony: probe of 2:0:8 failed with error -12
ALSA device list:
  No soundcards found.
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
scsi: waiting for bus probes to complete ...
sda: Spinning up 
disk................................................................<6>HIL 
KEYB: HIL keyboard found (did = 0xdf, lang = english.us)
input: HIL keyboard as /class/input/input0
input: HIL keyboard, ID: 223
hil_kbd: probe of serio1 failed with error -5
..............................not responding...
sda : READ CAPACITY failed.
sda : status=1, message=00, host=0, driver=08
sd: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
sda: Write Protect is on
sda: Mode Sense: 37 88 80 08
sda: cache data unavailable
sda: assuming drive cache: write through
sda: Spinning up disk.........ready
SCSI device sda: 5120 256-byte hdwr sectors (1 MB)
sda: Write Protect is off
sda: Mode Sense: 37 88 00 08
sda: cache data unavailable
sda: assuming drive cache: write through
SCSI device sda: 5120 256-byte hdwr sectors (1 MB)
sda: Write Protect is off
sda: Mode Sense: 37 88 00 08
sda: cache data unavailable
sda: assuming drive cache: write through
 sda:<6>sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x1 ASCQ=0x0
end_request: I/O error, dev sda, sector 0
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 4
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 6
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 7
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 7
Buffer I/O error on device sda, logical block 0
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 0
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 4
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 6
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 7
sd 0:0:2:0: Device not ready: <6>: Current: sense key=0x2
    ASC=0x4 ASCQ=0x0
end_request: I/O error, dev sda, sector 7
Buffer I/O error on device sda, logical block 0
 unable to read partition table
sd 0:0:2:0: Attached scsi removable disk sda
sd 0:0:2:0: Attached scsi generic sg0 type 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
sr 0:0:4:0: Attached scsi CD-ROM sr0
sr 0:0:4:0: Attached scsi generic sg1 type 5
sd 0:0:6:0: Enabling Tag Command Queuing
SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
sdb: Write Protect is off
sdb: Mode Sense: 87 00 10 08
SCSI device sdb: drive cache: write back w/ FUA
SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
sdb: Write Protect is off
sdb: Mode Sense: 87 00 10 08
SCSI device sdb: drive cache: write back w/ FUA
 sdb: sdb1 sdb2 sdb3 sdb4
sd 0:0:6:0: Attached scsi disk sdb
sd 0:0:6:0: Attached scsi generic sg2 type 0
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 376k freed
Adding 267924k swap on /dev/sdb3.  Priority:-1 extents:1 across:267924k
EXT3 FS on sdb4, internal journal
eth0: link ok.
eth0: no IPv6 routers present

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
