Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe45.law4.hotmail.com [216.33.148.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18E8B482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Apr 2002 10:38:20 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Helge Deller" <deller@gmx.de>,
	<parisc-linux@lists.parisc-linux.org>
References: <F124jLDxo1dHkLl0atJ00008874@hotmail.com> <OE54mEB4HGXAwxXSXI3000037e7@hotmail.com> <200204201751.27272.deller@gmx.de>
Subject: Re: [parisc-linux] not freeing initmem and power button
Date: Sat, 20 Apr 2002 18:35:18 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0052_01C1E89A.1F058E70"
Message-ID: <OE45GXh6xHs3X0yb7bO00001eac@hotmail.com>
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

This is a multi-part message in MIME format.

------=_NextPart_000_0052_01C1E89A.1F058E70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Nope, soft power-off is enabled as you can see in my attached dmesg. BTW,
when using the old 2.4.9 kernel nothing happened when pressing this switch.

----- Original Message -----
From: "Helge Deller" <deller@gmx.de>
To: "kenneth westelinck" <kennywest1@hotmail.com>;
<parisc-linux@lists.parisc-linux.org>
Sent: Saturday, April 20, 2002 5:51 PM
Subject: Re: [parisc-linux] not freeing initmem and power button


> Hi Kenneth,
>
> I think the problem is your 712/60, which (maybe) doesn't support
> soft-power-off.
> Please look into your dmesg, there you should see one of:
> 1. Gecko-style soft power switch enabled,
> 2. Soft power switch support not available.
> 3. Soft power switch enabled, polling @ 0x<addr>
>
> I suppose your 712/60 will give you #2 and that's why it will not work.
>
> Helge
>
> On Saturday 20 April 2002 15:48, kenneth westelinck wrote:
> > Hi again,
> >
> > Okay, I had a busy week and didn't get any chance to compile a new
kernel.
> > Today I've managed to get the 2.4.18-pa20 up and running, but the power
> > button is still not working as expected. Pressing the button with
"Software
> > power switch support: enabled" powers down the machine instantly (as
> > before). When I disable the powerswitch with "sysctl -w kernel/power=0"
I'm
> > having the same result. Am I missing something?
> > Attached to this mail you can find my .config - file
> > Thanks.
> >
> >
> > regards,
> >
> > Kenneth
>
>

------=_NextPart_000_0052_01C1E89A.1F058E70
Content-Type: application/octet-stream;
	name="dmesg"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="dmesg"

Linux version 2.4.18-pa20 (root@nero) (gcc version 3.0.4) #2 Fri Apr 19 =
19:29:16 CEST 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00006000 00000481 00000000 00000000 77c3f3d6 00000000 00000004 =
00000072 00000072
vers  0000000b
model 9000/712
Total Memory: 64 Mb
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=3D/dev/sda4 HOME=3D/ console=3Dtty0 sti=3D1 =
sti_font=3DVGA8x16 TERM=3Dlinux palo_kernel=3D3/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 59.80 BogoMIPS
Memory: 62012k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Gecko GSC Core Graphics (10) at 0xf8000000 [1], versions 0x16, 0x0, =
0x85
2. Gecko Core BA (11) at 0xf0100000 [2], versions 0x16, 0x0, 0x81
3. Gecko Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x16, 0x0, 0x82
4. Gecko Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x16, =
0x0, 0x8a
5. Gecko Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x16, 0x0, =
0x8c
6. Gecko Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x16, 0x0, =
0x74
7. Gecko Audio (10) at 0xf0104000 [2/0/8], versions 0x16, 0x0, 0x7b
8. Gecko Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x16, 0x0, =
0x83
9. Gecko Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x16, 0x0, =
0x84
10. Gecko Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x16, =
0x0, 0x84
11. Gecko (712/60) (0) at 0xfffbe000 [8], versions 0x600, 0x0, 0x4
12. Memory (1) at 0xfffbf000 [9], versions 0x26, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 60.000000 MHz
Lasi version 0 at 0xf0100000 found.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Gecko-style soft power switch enabled.
Starting kswapd
VFS: Diskquotas version dquot_6.4.0 initialized
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI word mode ROM at f0080000, hpa=3Df8000000
STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1024
Console: switching to colour frame buffer device 128x48
fb0: stifb 1024x768-8 frame buffer device, id: 2b4ded6d, mmio: =
0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq =3D 90) is a 16550A
PS/2 keyboard port at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=3D32
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 6D F5 E8 IRQ 87.
82596.c $Revision: 1.29 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2=20
scsi0 : LASI SCSI 53c700
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 18 at 0xf0104000, IRQ =
82
sticonsole_init: searching for STI ROMs
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 349k freed
Adding Swap: 124616k swap-space (priority -1)
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
eth0: link ok.

------=_NextPart_000_0052_01C1E89A.1F058E70--
