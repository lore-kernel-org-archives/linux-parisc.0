Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B75D482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 07:37:43 -0600 (MDT)
Subject: Re: [parisc-linux] palinux 0.9.1
To: "Richard Hirst <rhirst" <rhirst%linuxcare.com%SMTP%EUROPAY@mastercard.com>
Cc: parisc-linux@lists.parisc-linux.org, puffin@esiee.net
Message-ID: <OF661BE745.10F18F0D-ONC1256A81.004953CA@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Fri, 6 Jul 2001 15:25:42 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

My kern.log.last should be more readable like this:

Jul  6 14:41:23 palin kernel: klogd 1.4.1#2, log source =3D /proc/kmsg
started.
Jul  6 14:41:23 palin kernel: Inspecting /boot/System.map
Jul  6 14:41:25 palin kernel: Loaded 24720 symbols from /boot/System.map.
Jul  6 14:41:25 palin kernel: Symbols match kernel version 2.4.0.
Jul  6 14:41:25 palin kernel: No module symbols loaded.
Jul  6 14:41:25 palin kernel: Linux version 2.4.0-32 (root@slab) (gcc
version 3.0 (Debian)) #1 Thu Jun 28 11:49:00 BST 2001
Jul  6 14:41:25 palin kernel: FP[0] enabled: Rev 1 Model 15
Jul  6 14:41:25 palin kernel: The 32-bit Kernel has started...
Jul  6 14:41:25 palin kernel: Determining PDC firmware type: Newer Box
Jul  6 14:41:25 palin kernel: model^I00005040 00000481 00000000 02020202
77ea2456 100000f0 00000004 000000ba 000000ba
Jul  6 14:41:25 palin kernel: vers^I00000018
Jul  6 14:41:25 palin kernel: cpuid^I000001f8
Jul  6 14:41:25 palin kernel: CPUID^Ivers 15 rev 24
Jul  6 14:41:25 palin kernel: model^I9000/778/B180L
Jul  6 14:41:25 palin kernel: Total Memory: 128 Mb
Jul  6 14:41:25 palin kernel: On node 0 totalpages: 32768
Jul  6 14:41:25 palin kernel: zone(0): 32768 pages.
Jul  6 14:41:25 palin kernel: zone(1): 0 pages.
Jul  6 14:41:25 palin kernel: zone(2): 0 pages.
Jul  6 14:41:25 palin kernel: led_init: chassis info: model=3D1 (unknown),
lcd_width=3D16, cmd_delay=3D40, sizecnt=3D32, actcnt=3D8, maxcnt=3D8
Jul  6 14:41:25 palin kernel: PDC reported no LCD or LED.
Jul  6 14:41:25 palin kernel: Searching for devices...
Jul  6 14:41:25 palin kernel: Found devices:
Jul  6 14:41:25 palin kernel: 1. Phantom PseudoBC GSC+ Port (7) at
0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 2. Merlin+ 132 Dino RS-232 (10) at
0xfff83000, versions 0x22, 0x0, 0x8c, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 3. Merlin L2+ 180 (9000/778/B180L) (0) at
0xfffbe000, versions 0x504, 0x0, 0x4, 0x0, 0x81
Jul  6 14:41:25 palin kernel: 4. Merlin+ L2 180 (1) at 0xfffbf000, versions
0x5a, 0x0, 0x9, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 5. Merlin+ 180 Core BA (11) at 0xffd00000,
versions 0x3f, 0x0, 0x81, 0x0, 0x0,  additional addresses: 0xffd0c000
0xffc00000
Jul  6 14:41:25 palin kernel: 6. Merlin+ 180 Core RS-232 (10) at
0xffd05000, versions 0x3f, 0x0, 0x8c, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 7. Merlin+ 180 Core SCSI (10) at 0xffd06000,
versions 0x3f, 0x0, 0x82, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 8. Merlin+ 180 Core Centronics (10) at
0xffd02000, versions 0x3f, 0x0, 0x74, 0x0, 0x0,  additional addresses:
0xffd01000 0xffd03000
Jul  6 14:41:25 palin kernel: 9. Merlin+ 180 Core Audio (10) at 0xffd04000,
versions 0x3f, 0x4, 0x7b, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 10. Merlin+ 180 Core PS/2 Port (10) at
0xffd08000, versions 0x3f, 0x0, 0x84, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 11. Merlin+ 180 Core PS/2 Port (10) at
0xffd08100, versions 0x3f, 0x0, 0x84, 0x0, 0x0
Jul  6 14:41:25 palin kernel: 12. Gecko GSC Core Graphics (10) at
0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0,  additional addresses:
0xf0011000
Jul  6 14:41:25 palin kernel: 13. Dino PCI Bridge (13) at 0xfff80000,
versions 0x680, 0x3, 0xa, 0x0, 0x0,  additional addresses: 0xf0800000
Jul  6 14:41:25 palin kernel: 14. Merlin+ 132 Dino PS/2 Port (10) at
0xfff81000, versions 0x22, 0x0, 0x96, 0x0, 0x0
Jul  6 14:41:25 palin kernel: That's a total of 14 devices.
Jul  6 14:41:25 palin kernel: CPU(s): 1 x PA7300LC (PCX-L2) at 180.000000
MHz
Jul  6 14:41:25 palin kernel: Kernel command line: root=3D/dev/sda3 HOME=3D/
console=3Dtty0 TERM=3Dlinux
Jul  6 14:41:25 palin kernel: Console: colour dummy device 160x64
Jul  6 14:41:25 palin kernel: Calibrating delay loop... 119.60 BogoMIPS
Jul  6 14:41:25 palin kernel: Memory: 126364k available
Jul  6 14:41:25 palin kernel: Dentry-cache hash table entries: 16384
(order: 5, 131072 bytes)
Jul  6 14:41:25 palin kernel: Buffer-cache hash table entries: 4096 (order:
2, 16384 bytes)
Jul  6 14:41:25 palin kernel: Page-cache hash table entries: 32768 (order:
5, 131072 bytes)
Jul  6 14:41:25 palin kernel: Inode-cache hash table entries: 8192 (order:
4, 65536 bytes)
Jul  6 14:41:25 palin kernel: POSIX conformance testing by UNIFIX
Jul  6 14:41:25 palin kernel: Dino version 3.1 (bridge mode) found at
0xfff80000
Jul  6 14:41:25 palin kernel: Lasi version 0 at 0xffd00000 found.
Jul  6 14:41:25 palin kernel: LED display at ffd0c000 registered
Jul  6 14:41:25 palin kernel: Lasi PS/2 wait 2318
Jul  6 14:41:25 palin kernel: Lasi PS/2 wait 4370
Jul  6 14:41:25 palin kernel: PS/2 keyboard controller at 0xffd08000 (irq
133) found, device attached.
Jul  6 14:41:25 palin kernel: Lasi PS/2 wait 3209
Jul  6 14:41:25 palin kernel: PS/2 psaux controller at 0xffd08100 (irq 133)
found, device attached.
Jul  6 14:41:25 palin kernel:
Jul  6 14:41:25 palin kernel: sticonsole_init: searching for STI ROMs
Jul  6 14:41:25 palin kernel: STI word mode ROM at f0011000, hpa=3Df8000000
Jul  6 14:41:25 palin kernel: STI word mode ROM, id 2d08c0a7-9a02587,
conforms to spec rev. 8.07
Jul  6 14:41:25 palin kernel: STI device: INTERNAL_EG_1280
Jul  6 14:41:25 palin kernel: Console: switching to colour STI console
160x64
Jul  6 14:41:25 palin kernel: Linux NET4.0 for Linux 2.4
Jul  6 14:41:25 palin kernel: Based upon Swansea University Computer
Society NET3.039
Jul  6 14:41:25 palin kernel: Starting kswapd v1.8
Jul  6 14:41:25 palin kernel: stifb: Unsupported graphics card
(id=3D0x2d08c0a7) - skipping.
Jul  6 14:41:25 palin kernel: pty: 256 Unix98 ptys configured
Jul  6 14:41:25 palin kernel: request_module[parport_lowlevel]: Root fs not
mounted
Jul  6 14:41:25 palin kernel: lp: driver loaded but no devices found
Jul  6 14:41:25 palin kernel: RAMDISK driver initialized: 16 RAM disks of
6144K size 1024 blocksize
Jul  6 14:41:25 palin kernel: loop: enabling 8 loop devices
Jul  6 14:41:25 palin kernel: Lasi PS/2 wait 2270
Jul  6 14:41:25 palin kernel: Lasi PS/2 wait 4364
Jul  6 14:41:25 palin kernel: Serial driver version 5.02 (2000-08-09) with
MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Jul  6 14:41:25 palin kernel: ttyS00 at iomem 0xffd05800 (irq =3D 154) is a
16550A
Jul  6 14:41:25 palin kernel: ttyS01 at iomem 0xfff83800 (irq =3D 74) is a
16550A
Jul  6 14:41:25 palin kernel: Generic RTC Driver v1.02 05/27/1999 Sam
Creasey (sammy@oh.verio.com)
Jul  6 14:41:25 palin kernel: Linux Tulip driver version 0.9.13 (January 2,
2001)
Jul  6 14:41:25 palin kernel: eth0: Digital DS21143 Tulip rev 65 at 0xff00,
00:10:83:65:09:4B, IRQ 64.
Jul  6 14:41:25 palin kernel: eth0:  MII transceiver #1 config 1000 status
782d advertising 01e1.
Jul  6 14:41:25 palin kernel: parport_init_chip: initialize
bidirectional-mode.
Jul  6 14:41:25 palin kernel: parport0: PC-style at 0xffd02800, irq 152
[PCSPP,TRISTATE]
Jul  6 14:41:25 palin kernel: lp0: using parport0 (interrupt-driven).
Jul  6 14:41:25 palin kernel: SCSI subsystem driver Revision: 1.00
Jul  6 14:41:25 palin kernel: sym53c8xx: at PCI bus 0, device 19, function
0
Jul  6 14:41:25 palin kernel: sym53c8xx: 53c875 detected
Jul  6 14:41:25 palin kernel: sym53c875-0: rev 0x4 on pci bus 0 device 19
function 0 irq 67
Jul  6 14:41:25 palin kernel: sym53c875-0: NCR clock is 40401KHz
Jul  6 14:41:25 palin kernel: sym53c875-0: ID 7, Fast-20, Parity Checking
Jul  6 14:41:25 palin kernel: sym53c875-0: on-chip RAM at 0xf0ffe000
Jul  6 14:41:25 palin kernel: sym53c875-0: restart (scsi reset).
Jul  6 14:41:25 palin kernel: sym53c875-0: Downloading SCSI SCRIPTS.
Jul  6 14:41:25 palin kernel: scsi0 : sym53c8xx - version 1.6b
Jul  6 14:41:25 palin kernel:   Vendor: SEAGATE   Model: ST39140WS
Rev: HP03
Jul  6 14:41:25 palin kernel:   Type:   Direct-Access
ANSI SCSI revision: 02
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: tagged command queue depth
set to 8
Jul  6 14:41:25 palin kernel: sim700: Configuring 53c710 (SCSI-ID 7) at
ffd06100, IRQ 150, options 0
Jul  6 14:41:25 palin kernel: scsi1: Revision 0x2
Jul  6 14:41:25 palin kernel: scsi1: test 1 completed ok.
Jul  6 14:41:25 palin kernel: scsi1 : LASI/Simple 53c7xx
Jul  6 14:41:25 palin kernel:   Vendor: HP        Model: DVD-ROM 6x/32x
Rev: 1.08
Jul  6 14:41:25 palin kernel:   Type:   CD-ROM
ANSI SCSI revision: 02
Jul  6 14:41:25 palin kernel: Detected scsi disk sda at scsi0, channel 0,
id 6, lun 0
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: wide msgout: 1-2-3-1.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: wide msgin: 1-2-3-1.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: wide: wide=3D1 chg=3D0.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: wide msgout: 1-2-3-1.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: wide msgin: 1-2-3-1.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: wide: wide=3D1 chg=3D0.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: sync msgout: 1-3-1-c-10.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: sync msg in: 1-3-1-c-f.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,0>: sync: per=3D12 scntl3=3D0x=
90
scntl4=3D0x0 ofs=3D15 fak=3D0 chg=3D0.
Jul  6 14:41:25 palin kernel: sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0
MB/s (50 ns, offset 15)
Jul  6 14:41:25 palin kernel: SCSI device sda: 17773524 512-byte hdwr
sectors (9100 MB)
Jul  6 14:41:25 palin kernel: Partition check:
Jul  6 14:41:25 palin kernel:  sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 >
Jul  6 14:41:25 palin kernel: Detected scsi CD-ROM sr0 at scsi1, channel 0,
id 0, lun 0
Jul  6 14:41:25 palin kernel: sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2
cdda tray
Jul  6 14:41:25 palin kernel: Uniform CD-ROM driver Revision: 3.12
Jul  6 14:41:25 palin kernel: Lasi Harmony Audio rev. 0 at 0xffd04000,
using IRQ 146
Jul  6 14:41:25 palin kernel: md driver 0.90.0 MAX_MD_DEVS=3D256,
MD_SB_DISKS=3D27
Jul  6 14:41:25 palin kernel: md.c: sizeof(mdp_super_t) =3D 4096
Jul  6 14:41:25 palin kernel: NET4: Linux TCP/IP 1.0 for NET4.0
Jul  6 14:41:25 palin kernel: IP Protocols: ICMP, UDP, TCP
Jul  6 14:41:25 palin kernel: IP: routing cache hash table of 512 buckets,
4Kbytes
Jul  6 14:41:25 palin kernel: TCP: Hash tables configured (established 8192
bind 16384)
Jul  6 14:41:25 palin kernel: IP-Config: Incomplete network configuration
information.
Jul  6 14:41:25 palin kernel: NET4: Unix domain sockets 1.0/SMP for Linux
NET4.0.
Jul  6 14:41:25 palin kernel: VFS: Mounted root (ext2 filesystem) readonly.
Jul  6 14:41:25 palin kernel: Adding Swap: 124924k swap-space (priority -1)

Joel,

PS: Sorry in the office we have to change of mail program and I not yet
familiar with it.



                                                                           =
                                  =20
                    Richard Hirst                                          =
                                  =20
                    <rhirst@linux        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD                        =20
                    care.com>            cc:     puffin@esiee.net@SMTP@EURO=
PAY,                              =20
                                         parisc-linux@lists.parisc-linux.or=
g@SMTP@EUROPAY                    =20
                    06-07-01             Subject:     Re: [parisc-linux] pa=
linux 0.9.1                       =20
                    01:08 PM                                               =
                                  =20
                                                                           =
                                  =20
                                                                           =
                                  =20



On Wed, Jul 04, 2001 at 06:44:02PM +0200, Jo=EBl Soete wrote:
> Hi all,
>
> Very nice on 712 model.
> Just a small problem after the configuration of the inet interface:
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> skb: pf=3D2 (unowned) dev=3Dl0 len=3D328
> PROTO=3D17 0.0.0.0:68 255.255.255.255:67 L=3D328 S=3D0x10 I=3D0 F=3D0x000=
0 T=3D16
>
> This message is repeated severall times?

Don't know what causes that.

> But on the B180, I met the same problem as I met with the kernel
> vmlinux-20010629 (from puffin also with your vmlinux-712+sound+mouse):
> all seems to work fine but the keyboard does not answer (and no serial
> consol yet available) also it is impossible to contine the install?

I'm just installing a B180 using the 0.9.1 ISO, using the graphical
console.  I have a keyboard and mouse connected, and it is working
fine.  I'll try a serial console install next.

Richard





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
