From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Call for Testing
Date: Mon, 28 Mar 2005 14:42:42 +0000
Message-ID: <424817E2.10705__42460.7376721271$1416623726$gmane$org@tiscali.be>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
Resent-Message-ID: <WV6y-.A.WFC.ZuBSCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hello Kyle,

I test it on a up 32bit c110 model, ...

Kyle McMartin wrote:
> Hi,
> 
> I've backported some more patches to 2.6.8 for possible[1] inclusion in
> sarge (they fix some possibly important bits).
> 
> You can find kernels here:
> 	http://www.parisc-linux.org/~kyle/debian-kernel/2005-03-27/
> 
so i consider kernel-image-2.6.8-2-32_2.6.8-7_hppa.deb, ok?

I tried for the first time to boot an initrd.img but unfortunaltely it failed to complete the boot (boot log):
Current command line:
3/vmlinux-2.6.8-2-32 root=/dev/md2 initrd=3/initrd.img HOME=/ panic=120 profile2 0: 3/vmlinux-2.6.8-2-32
  1: root=/dev/md2
  2: initrd=3/initrd.img
  3: HOME=/
  4: panic=120
  5: profile=2
  6: console=ttyS0
  7: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=/dev/md2 HOME=/ panic=120 profile=2 console=ttyS'Selected kernel: /vmlinux-2.6.8-2-32 from partition 3
Selected ramdisk: /initrd.img from partition 3
ELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 2242736 mediaptr 0x1000
Segment 1 load 00324000 size 1056902 mediaptr 0x225000
Loading ramdisk 4714496 bytes @ 1fb6d000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.8-2-32 (kyle@caradhras) (gcc version 3.3.5 (Debian 1:3.3.5-125FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a 0avers  0000000d
CPUID vers 11 rev 13 (0x0000016d)
model 9000/777/C110
Total Memory: 512 Mb
initrd: 2fb6d000-2ffec000
initrd: reserving 1fb6d000-1ffec000 (mem_max 20000000)
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: root=/dev/md2 HOME=/ panic=120 profile=2 console=ttyS0 TER2kernel profiling enabled
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 524288k available
Calibrating delay loop... 119.60 BogoMIPS
Security Scaffold v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
checking if image is initramfs...it isn't (ungzip failed); looks like an initrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
2. SkyHawk 100/120 FW-SCSI at 0xf3f8c000 [8/12] { 4, 0x0, 0x01f, 0x00089 }
3. Raven T' Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x032, 0x00081 },  addition
4. Raven T' Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x032, 0x00074 },
5. Raven T' Audio at 0xffd04000 [8/16/1] { 10, 0x0, 0x032, 0x0007b }
6. Raven T' Lasi Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x032, 0x0008c }
7. Raven T' Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x032, 0x00082 }
8. Raven T' Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x032, 0x0008a }
9. Raven T' Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x032, 0x00084 }
10. Raven T' Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x032, 0x00084 }
11. Raven T' Core PC Floppy at 0xffd0a000 [8/16/10] { 10, 0x0, 0x032, 0x00083 }
12. Raven T' Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x01e, 0x0008e },  addition
13. Raven T' Wax HIL at 0xffe01000 [8/20/1] { 10, 0x0, 0x01e, 0x00073 }
14. Raven T' Wax RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x01e, 0x0008c }
15. Raven T' Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x01e, 0x00090 },  a
16. U2-IOA BC GSC+ Port at 0xf3fbf000 [8/63] { 7, 0x1, 0x501, 0x0000c },  addit
17. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
18. Raven T' GSC Core Graphics at 0xf4000000 [10/16] { 10, 0x0, 0x032, 0x00085
19. U2-IOA BC GSC+ Port at 0xf3fff000 [10/63] { 7, 0x1, 0x501, 0x0000c }
20. Raven 120 T' at 0xfffa0000 [32] { 0, 0x0, 0x58e, 0x00004 }
21. Memory at 0xfffb1000 [49] { 1, 0x0, 0x049, 0x00009 }
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM: cannot register misc device.
Enumerating EISA bus
EISA: Probing bus 0 at parisc8:20:5
EISA: Mainboard HWPC0E1 detected.
EISA: Detected 0 cards.
SCSI subsystem initialized
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
STI GSC/PCI core graphics driver Version 0.9a
     id 2b4ded6d-40a00499, conforms to spec rev. 8.04
     graphics card name: HPA208LC1024
fb0: stifb 1024x768-8 frame buffer device, HPA208LC1024, id: 2b4ded6d, mmio: 0x0unwind_init: start = 0x10325720, end = 0x103468b0, 
entries = 8473
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 128x48
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 25 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 131072 bind 65536)
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 4604 blocks [1 disk] into ram disk... <4>HP SDC: Transaction a?HP SDC: Transaction add failed: transaction already 
queued?
HP SDC: read timeout (791509us)!
done.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory: 316k freed
initrd-tools: 0.1.77
NET: Registered protocol family 1
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: raid1 personality registered as nr 3
md: md1 stopped.
mdadm: cannot open device /dev/scsi/sdh0-f3f8c800c0i5l0p2: No such device or adsmdadm: /dev/scsi/sdh0-f3f8c800c0i5l0p2 has wrong uuid.
mdadm: cannot open device /dev/smd: md2 stopped.
csi/sdh0-f3f8c800c0i6l0p2: No such device or address
mdadm: /dev/scsi/sdh0-f3f8c800c0i6l0p2 has wrong uuid.
mdadm: no devices found for /devfs/md/1
mdadm: cannot open device /dev/scsi/sdh0-f3f8c800c0i5l0p5: No such device or adsmdadm: /dev/scsi/sdh0-f3f8c800c0i5l0p5 has wrong uuid.
mdadm: cannot open device /dev/scsi/sdh0-f3f8c800c0i6l0p5: No such device or adsmdadm: /dev/scsi/sdh0-f3f8c800c0i6l0p5 has wrong uuid.
mdadm: no devices found for /devfs/md/2
EXT3-fs: unable to read superblock
EXT2-fs: unable to read superblock
isofs_fill_super: bread failed, dev=md2, iso_blknum=16, block=32
pivot_root: No sKernel panic: Attempted to kill init!
uch file or dire ctory
/sbin/ini<0>Rebooting in 120 seconds..t: 431: cannot open dev/console: No such e

And not better if I try the kernel:
3/vmlinux root=/dev/md2 HOME=/ panic=120 profile=2 console=ttyS0 TERM=vt102
  0: 3/vmlinux
  1: root=/dev/md2
  2: HOME=/
  3: panic=120
  4: profile=2
  5: console=ttyS0
  6: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=/dev/md2 HOME=/ panic=120 profile=2 console=ttyS'Selected kernel: /vmlinux from partition 3
ELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 2242736 mediaptr 0x1000
Segment 1 load 00324000 size 1056902 mediaptr 0x225000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.8-2-32 (kyle@caradhras) (gcc version 3.3.5 (Debian 1:3.3.5-125FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a 0avers  0000000d
CPUID vers 11 rev 13 (0x0000016d)
model 9000/777/C110
Total Memory: 512 Mb
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: root=/dev/md2 HOME=/ panic=120 profile=2 console=ttyS0 TERxkernel profiling enabled
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 524288k available
Calibrating delay loop... 119.60 BogoMIPS
Security Scaffold v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
2. SkyHawk 100/120 FW-SCSI at 0xf3f8c000 [8/12] { 4, 0x0, 0x01f, 0x00089 }
3. Raven T' Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x032, 0x00081 },  addition
4. Raven T' Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x032, 0x00074 },
5. Raven T' Audio at 0xffd04000 [8/16/1] { 10, 0x0, 0x032, 0x0007b }
6. Raven T' Lasi Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x032, 0x0008c }
7. Raven T' Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x032, 0x00082 }
8. Raven T' Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x032, 0x0008a }
9. Raven T' Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x032, 0x00084 }
10. Raven T' Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x032, 0x00084 }
11. Raven T' Core PC Floppy at 0xffd0a000 [8/16/10] { 10, 0x0, 0x032, 0x00083 }
12. Raven T' Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x01e, 0x0008e },  addition
13. Raven T' Wax HIL at 0xffe01000 [8/20/1] { 10, 0x0, 0x01e, 0x00073 }
14. Raven T' Wax RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x01e, 0x0008c }
15. Raven T' Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x01e, 0x00090 },  a
16. U2-IOA BC GSC+ Port at 0xf3fbf000 [8/63] { 7, 0x1, 0x501, 0x0000c },  addit
17. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
18. Raven T' GSC Core Graphics at 0xf4000000 [10/16] { 10, 0x0, 0x032, 0x00085
19. U2-IOA BC GSC+ Port at 0xf3fff000 [10/63] { 7, 0x1, 0x501, 0x0000c }
20. Raven 120 T' at 0xfffa0000 [32] { 0, 0x0, 0x58e, 0x00004 }
21. Memory at 0xfffb1000 [49] { 1, 0x0, 0x049, 0x00009 }
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM: cannot register misc device.
Enumerating EISA bus
EISA: Probing bus 0 at parisc8:20:5
EISA: Mainboard HWPC0E1 detected.
EISA: Detected 0 cards.
SCSI subsystem initialized
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
STI GSC/PCI core graphics driver Version 0.9a
     id 2b4ded6d-40a00499, conforms to spec rev. 8.04
     graphics card name: HPA208LC1024
fb0: stifb 1024x768-8 frame buffer device, HPA208LC1024, id: 2b4ded6d, mmio: 0x0unwind_init: start = 0x10325720, end = 0x103468b0, 
entries = 8473
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 128x48
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 25 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
NET: Registered protocol family 2
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
...
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
IP: routing cache hash table of 4096 buckets, 32Kbytes
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: read timeout (791519us)!
TCP: Hash tables configured (established 131072 bind 65536)
Root-NFS: No NFS server available, giving up.
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "md2" or unknown-block(2,0)
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on unknown-block(2,0)

fwiw i never read disk init as in my custom kernel does:
...
eth0: 82596 at 0xffd07000, 00 60 B0 07 1E EA IRQ 18.
zalon_probe: Zalon version 1, IRQ 66
ncr53c720-0: rev 0xf irq 66
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
  target0:0:5: target did not report SYNC.
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target0:0:5: Beginning Domain Validation
  target0:0:5: asynchronous.
  target0:0:5: wide asynchronous.
  target0:0:5: Domain Validation skipping write tests
  target0:0:5: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
  target0:0:5: Ending Domain Validation
  target0:0:6: target did not report SYNC.
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target0:0:6: Beginning Domain Validation
  target0:0:6: asynchronous.
  target0:0:6: wide asynchronous.
  target0:0:6: Domain Validation skipping write tests
  target0:0:6: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
  target0:0:6: Ending Domain Validation
...

well my custom config is CONFIG_SCSI_ZALON=y while your CONFIG_SCSI_ZALON=m so should be loaded?

Any idea?

Thanks,
	Joel


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
