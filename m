From: j.raspe@t-online.de (Johannes Raspe)
Subject: Re: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Mon, 27 Sep 2004 18:28:31 +0200
Message-ID: <200409271828.31259.j.raspe@t-online.de>
References: <200409241533.15399.j.raspe@t-online.de>
	<200409261719.31774.j.raspe@t-online.de>
	<4156F0FE.2010301@tiscali.be>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_v+DWB2rtvEm+zsJ"
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4156F0FE.2010301@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_v+DWB2rtvEm+zsJ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Hello Johannes,
>
> Johannes Raspe wrote:
> >>Johannes Raspe wrote:
> >>>Hi all,
> >>>
> >>>I tried the "official" 2.6.8 Debian-image and 2.6.8.1-pa11-image but
> >>> none worked.
> >>>After booting, the message "if this is the last..." about graphic and
> >>>serial-console is printed and after that (I suppose when the kernel
> >>> tries to initialize the framebuffer) the screen turns blue, no
> >>> HDD-activity anymore, the system hangs.
> >>>As far as I can see no other messages.
> >>>With 2.4.27-pa4 everything is fine.
> >>>
> >>>machine: 735/125
> >>>graphics: CRX24
> >>>palo-commandline: 2/vmlinux root=/dev/sda6 HOME=/
> >>>32-bit kernel
> >>>
> >>>Any clues?
> >>
> >>I have no clue about 735 model but do you have the opportunity to check
> >>what hapened if you try to boot from serial console?
> >>
> >>hth,
> >> Joel
> >
> > Hi Joel,
> >
> > after soldering a nullmodem-cable I was able to get the serial console
> > running, unfortunately the output is not very informative, I think:
> >
> > Command line for kernel: 'root=/dev/sda6 HOME=/ console=ttyS0 TERM=vt102
> > palo_k'
> > Selected kernel: /vmlinux-2.6 from partition 2
> > ELF32 executable
> > Entry 001001b0 first 00100000 n 2
> > Segment 0 load 00100000 size 2494432 mediaptr 0x1000
> > Segment 1 load 00361000 size 1175685 mediaptr 0x262000
> > Branching to kernel entry point 0x001001b0.  If this is the last
> > message you see, you may need to switch your console.  This is
> > a common symptom -- search the FAQ and mailing list at parisc-linux.org
> >
> > After this, the screen on the HP-machine turns blue and the system hangs.
> > Tried with palinux-32-2.6.8.1-pa11
>
> too bad.
>
> May be try a more scpecific build: looking at the hw db it seems to me that
> the palinux-712-defconfig-2.6.8.1-pa11 or
> palinux-b180-defconfig-2.6.8.1-pa11 should be helpfull?
>
> If none of this give you much more info we would have to grab a piminfo and
> analyse it to see where the kernel failed :(
>
> Joel
>
> PS: may be a dmesg of a 2.4 boot would also be interesting to see if there
> are some know issue in 2.6 about some driver used by your 735 model

Hi Joel,

I tried:
palinux-712-defconfig-2.6.8.1-pa11
palinux-b180-defconfig-2.6.8.1-pa11
palinux-32-2.6.6-pa4
palinux-712-defconfig-2.6.6-pa4
palinux-b180-defconfig-2.6.6-pa4

all with the same result as before.

After that I compiled a 2.6.9-rc2-pa7 kernel without support for framebuffer 
(CONFIG_FB) which booted perfectly with serial console.
So I think we can track down the problem to the framebuffer driver in the 
kernels > 2.6 with my graphics device, which should be supported according to 
the beginning of stifb.c.

I attached both, the 2.4 and the 2.6 dmesg.

What could I try next ??

Johannes

-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105

--Boundary-00=_v+DWB2rtvEm+zsJ
Content-Type: text/plain;
  charset="iso-8859-1";
  name="dmesg-2.4.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg-2.4.txt"

Linux version 2.4.27-pa4-APOLLO-20040924 (johio@APOLLO) (gcc version 3.2.3 (Debian)) #5 Sa Sep 25 15:40:46 CEST 2004
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00002060 00000481 00000000 00000000 77584fb0 ffffffff 00000004 0000000a 0000000a
vers  00000015
model 9000/735
Total Memory: 272 Mb
pagetable_init
On node 0 totalpages: 69632
zone(0): 69632 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda6 HOME=/ console=tty0 sti=1 sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 124.51 BogoMIPS
Memory: 272480k available
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf8000000 [1], versions 0x4, 0x0, 0x77
2. Outfield Core BA (11) at 0xf082f000 [2], versions 0x9, 0x0, 0x70
3. Outfield Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x9, 0x0, 0x71
4. Outfield Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 0x9, 0x0, 0x72
5. Outfield Core HIL (10) at 0xf0821000 [2/0/3], versions 0x9, 0x0, 0x73
6. Outfield Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x9, 0x0, 0x75
7. Outfield Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x9, 0x0, 0x75
8. Outfield Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x9, 0x0, 0x74
9. Outfield FW SCSI (10) at 0xf0830000 [2/0/7], versions 0x9, 0x0, 0x7c
10. Outfield Audio (10) at 0xf1000000 [2/0/8], versions 0x9, 0x0, 0x7f
11. Cobra EISA BA (11) at 0xfc000000 [4], versions 0x4, 0x0, 0x76
12. Snake Cheetah (735/130) (0) at 0xfffbe000 [8], versions 0x206, 0x0, 0x4
13. Memory (1) at 0xfffbf000 [9], versions 0x37, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Starting kswapd
Journalled Block Device driver loaded
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f8000000, hpa at f8000000
STI id 26d148ee-40a00499, conforms to spec rev. 8.02
STI device: HPA1439A
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 26d148ee, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.07
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 0B BB 22 IRQ 87.
82596.c $Revision: 1.32 $
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0 
scsi0 : LASI SCSI 53c700
  Vendor: IBM       Model: DDRS-34560        Rev: S97B
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 4, lun 0
scsi0: (4:0) Enabling Tag Command Queuing
SCSI device sda: 8925000 512-byte hdwr sectors (4570 MB)
Partition check:
 /dev/scsi/host0/bus0/target4/lun0: p1 p2 p3 p4 < p5 p6 >
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 0 at 0xf1000000, IRQ 82
mice: PS/2 mouse device common for all mice
HP SDC: HP SDC at 0xf0821000, IRQ 94 (NMI IRQ 93)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP i8042 SDC + MSM-58321 RTC support loaded (RTC v 1.10d)
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
SCTP: Hash tables configured (established 8192 bind 16384)
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 186k freed
HIL KEYB: HIL keyboard found (did = 0xcf, lang = german)
input0: HIL keyboard on hil0
kernel BUG at slab.c:1130!
HIL PTR: HIL pointer device found (did: 0x68, axis: relative)
HIL PTR: HIL pointer has 3 buttons and 1 sets of 2 axes
input1: HIL mouse on hil0
Adding Swap: 498284k swap-space (priority -1)
EXT3 FS 2.4-0.9.19, 19 August 2002 on sd(8,6), internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on sd(8,5), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
eth0: link ok.

--Boundary-00=_v+DWB2rtvEm+zsJ
Content-Type: text/plain;
  charset="iso-8859-1";
  name="dmesg-2.6.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg-2.6.txt"

Command line for kernel: 'root=/dev/sda6 HOME=/ console=ttyS0 TERM=vt102 palo_k'
Selected kernel: /vmlinux-2.6 from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 2203048 mediaptr 0x1000
Segment 1 load 0031a000 size 745606 mediaptr 0x21b000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

vice: ID = 'parisc2'
Found devices:
1. Coral SGC Graphics at 0xf8000000 [1] { 10, 0x0, 0x004, 0x00077 }
2. Outfield Core BA at 0xf082f000 [2] { 11, 0x0, 0x009, 0x00070 }
3. Outfield Core SCSI at 0xf0825000 [2/0/1] { 10, 0x0, 0x009, 0x00071 }
4. Outfield Core LAN (802.3) at 0xf0826000 [2/0/2] { 10, 0x0, 0x009, 0x00072 }
5. Outfield Core HIL at 0xf0821000 [2/0/3] { 10, 0x0, 0x009, 0x00073 }
6. Outfield Core RS-232 at 0xf0823000 [2/0/4] { 10, 0x0, 0x009, 0x00075 }
7. Outfield Core RS-232 at 0xf0822000 [2/0/5] { 10, 0x0, 0x009, 0x00075 }
8. Outfield Core Centronics at 0xf0824000 [2/0/6] { 10, 0x0, 0x009, 0x00074 }
9. Outfield FW SCSI at 0xf0830000 [2/0/7] { 10, 0x0, 0x009, 0x0007c }
10. Outfield Audio at 0xf1000000 [2/0/8] { 10, 0x0, 0x009, 0x0007f }
11. Cobra EISA BA at 0xfc000000 [4] { 11, 0x0, 0x004, 0x00076 }
12. Snake Cheetah (735/130) at 0xfffbe000 [8] { 0, 0x0, 0x206, 0x00004 }
13. Memory at 0xfffbf000 [9] { 1, 0x0, 0x037, 0x00009 }
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
SCSI subsystem initialized
unwind_init: start = 0x1031c060, end = 0x1033d050, entries = 8447
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xf0823800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xf0822800 (irq = 89) is a 16550A
loop: loaded (max 8 devices)
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xf0826000, IRQ 87
drivers/net/lasi_82596.c: MAC of HP700 LAN read from EEPROM
eth0: 82596 at 0xf0826000, 08 00 09 0B BB 22 IRQ 87.
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
Using anticipatory io scheduler
  Vendor: IBM       Model: DDRS-34560        Rev: S97B
  Type:   Direct-Access                      ANSI SCSI revision: 02
st: Version 20040403, fixed bufsize 32768, s/g segs 256
scsi0: (4:0) Enabling Tag Command Queuing
SCSI device sda: 8925000 512-byte hdwr sectors (4570 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
Attached scsi disk sda at scsi0, channel 0, id 4, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 4, lun 0,  type 0
mice: PS/2 mouse device common for all mice
HP SDC: HP SDC at 0xf0821000, IRQ 94 (NMI IRQ 93)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
Advanced Linux Sound Architecture Driver Version 1.0.6 (Sun Aug 15 07:17:53 200.
Lasi Harmony Audio driver h/w id 20, rev. 0 at 0xf1000000, IRQ 82
ALSA device list:
  #0: ALSA driver for LASI Harmony at h/w, id 20, rev. 0 hpa 0xf1000000, IRQ 82

NET: Registered protocol family 2
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 196k freed
INIT: version 2.86 booting
Usage: vt-is-UTF8 [option]
valid options are:
        -q  --quiet    don't print result
        -h --help      display this help text and exit
        -V --version   display version information and exit
Activating swap.
Adding 498284k swap on /dev/sda3.  Priority:-1 extents:1
Checking root file system...
fsck 1.35 (28-Feb-2004)
/dev/sda6: clean, 84780/367264 files, 390625/734320 blocks
EXT3 FS on sda6, internal journal
System time was Fri Sep 24 16:10:41 UTC 2004.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Fri Sep 24 16:10:43 UTC 2004.
Cleaning up ifupdown...done.
Checking all file systems...
fsck 1.35 (28-Feb-2004)
/dev/sda2: clean, 21/7680 files, 12159/30597 blocks
/dev/sda5 has been mounted 27 times without being checked, check forced.
./dev/sda5: 172/121856 files (4.1% non-contiguous), 10151/243675 blocks
Setting kernel variables ...
... done.
Mounting local filesystems...
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda5, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
/dev/sda2 on /boot type ext2 (rw)
/dev/sda5 on /home type ext3 (rw)
Cleaning /tmp /var/run /var/lock.
Running 0dns-down to make sure resolv.conf is ok...done.
Initializing: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces...Internet Software Consortium DHCP Client 2.0pl5
Copyright 1995, 1996, 1997, 1998, 1999 The Internet Software Consortium.
All rights reserved.

Please contribute if you find this software useful.
For info, please visit http://www.isc.org/dhcp-contrib.html

eth0: link ok.
Listening on LPF/eth0/08:00:09:0b:bb:22
Sending on   LPF/eth0/08:00:09:0b:bb:22
Sending on   Socket/fallback/fallback-net
DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 4
DHCPOFFER from 192.168.0.1
DHCPREQUEST on eth0 to 255.255.255.255 port 67
DHCPACK from 192.168.0.1
bound to 192.168.0.4 -- renewal in 43200 seconds.
done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Fri Sep 24 18:11:03 CEST 2004

Initializing random number generator...done.
Recovering nvi editor sessions... done.
Setting up X server socket directory /tmp/.X11-unix...done.
Setting up ICE socket directory /tmp/.ICE-unix...done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting printing system service: cupsd
HIL KEYB: HIL keyboard found (did = 0xcf)
input: HIL keyboard, ID: 207
HIL PTR: HIL pointer device found (did: 0x68, axis: relative)
HIL PTR: HIL pointer has 3 buttons and 1 sets of 2 axes
input: HIL pointer device (HIL mouse), ID: 104
.
Starting internet superserver: inetd.
Starting Samba daemons: nmbd smbd.
Starting OpenBSD Secure Shell server: sshd.
Starting Xprint servers: Xprt.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
Not starting WINGs display manager (wdm); it is not the default display manager.
Starting X display manager: xdm.
--Boundary-00=_v+DWB2rtvEm+zsJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_v+DWB2rtvEm+zsJ--
