Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF25B4852
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Dec 2003 09:29:30 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1AYSvx-0008QQ-00
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Dec 2003 17:29:29 +0100
Date: Mon, 22 Dec 2003 17:29:28 +0100
Message-ID: <3FB265EC00018510@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] serial 2 broken in 2.6.0 for b180?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I just got a small problem with my 2.6.0 teting b180: no mean to use the
second serial port.

here is my dmesg file:
Linux version 2.6.0-pa4 (root@fw02.office.palinux) (gcc version 3.3.2 (Debian))
#1 Mon Dec 22 11:43:03 CET 2003
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005040 00000481 00000000 02020202 77d03653 100000f0 00000004 000000ba
000000ba
vers  00000018
CPUID vers 15 rev 24 (0x000001f8)
capabilities 0x2
model 9000/778/B180L
Total Memory: 128 Mb
On node 0 totalpages: 32768
  DMA zone: 32768 pages, LIFO batch:8
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LED display at f0190001 registered
Building zonelist for node : 0
Kernel command line: root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0-pa4
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Memory: 125956k available
Calibrating delay loop... 119.60 BogoMIPS
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096
}
2. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000
}
3. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a },  additional
addresses: 0xf0800000 
4. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c
}
5. Merlin+ 180 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03f, 0x00081 },
 additional addresses: 0xffd0c000 0xffc00000 
6. Merlin+ 180 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03f, 0x00074
},  additional addresses: 0xffd01000 0xffd03000 
7. Merlin+ 180 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03f, 0x0007b
}
8. Merlin+ 180 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03f, 0x0008c
}
9. Merlin+ 180 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03f, 0x00082
}
10. Merlin+ 180 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03f, 0x00084
}
11. Merlin+ 180 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03f, 0x00084
}
12. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085
},  additional addresses: 0xf0011000 
13. Merlin L2+ 180 (9000/778/B180L) at 0xfffbe000 [62] { 0, 0x0, 0x504, 0x00004
}
14. Memory at 0xfffbf000 [63] { 1, 0x0, 0x05a, 0x00009 }
CPU(s): 1 x PA7300LC (PCX-L2) at 180.000000 MHz
Lasi version 0 at 0xffd00000 found.
Dino parisc8:0 version 3.1 found at 0xfff80000
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver hub
STI GSC/PCI core graphics driver Version 0.9a
STI word mode ROM at f0011000, hpa at f8000000
STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio: 0xf8100000
ikconfig 0.7 with /proc/config*
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 160x64
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xfff83800 (irq = 106) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
airo:  Probing for PCI adapters
airo:  Finished probing for PCI adapters
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:10:83:35:2A:A9, IRQ 96.
sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18i
Using anticipatory io scheduler
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:5:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
st: Version 20030811, fixed bufsize 32768, s/g segs 256
sym0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 >
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 sdb10 >
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 6, lun 0,  type 0
Console: switching to colour frame buffer device 160x64
ehci_hcd: block sizes: qh 128 qtd 96 itd 128 sitd 64
ohci_hcd: 2003 Oct 13 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
mice: PS/2 mouse device common for all mice
Keyboard initialization sequence failled
input: PS/2 keyboard port at 0xffd08000 (irq 69) found and attached
input: PS/2 mouse port at 0xffd08100 (irq 69) found and attached
HP SDC: No SDC found.
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   143.600 MB/sec
   8regs_prefetch:   143.600 MB/sec
   32regs    :   169.600 MB/sec
   32regs_prefetch:   169.600 MB/sec
raid5: using function: 32regs_prefetch (169.600 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdb10 ...
md:  adding sdb10 ...
md: sdb9 has different UUID to sdb10
md: sdb8 has different UUID to sdb10
md: sdb7 has different UUID to sdb10
md: sdb6 has different UUID to sdb10
md: sdb5 has different UUID to sdb10
md: sdb3 has different UUID to sdb10
md: sdb2 has different UUID to sdb10
md:  adding sda10 ...
md: sda9 has different UUID to sdb10
md: sda8 has different UUID to sdb10
md: sda7 has different UUID to sdb10
md: sda6 has different UUID to sdb10
md: sda5 has different UUID to sdb10
md: sda3 has different UUID to sdb10
md: sda2 has different UUID to sdb10
md: created md7
md: bind<sda10>
md: bind<sdb10>
md: running: <sdb10><sda10>
raid1: raid set md7 active with 2 out of 2 mirrors
md: considering sdb9 ...
md:  adding sdb9 ...
md: sdb8 has different UUID to sdb9
md: sdb7 has different UUID to sdb9
md: sdb6 has different UUID to sdb9
md: sdb5 has different UUID to sdb9
md: sdb3 has different UUID to sdb9
md: sdb2 has different UUID to sdb9
md:  adding sda9 ...
md: sda8 has different UUID to sdb9
md: sda7 has different UUID to sdb9
md: sda6 has different UUID to sdb9
md: sda5 has different UUID to sdb9
md: sda3 has different UUID to sdb9
md: sda2 has different UUID to sdb9
md: created md6
md: bind<sda9>
md: bind<sdb9>
md: running: <sdb9><sda9>
raid1: raid set md6 active with 2 out of 2 mirrors
md: considering sdb8 ...
md:  adding sdb8 ...
md: sdb7 has different UUID to sdb8
md: sdb6 has different UUID to sdb8
md: sdb5 has different UUID to sdb8
md: sdb3 has different UUID to sdb8
md: sdb2 has different UUID to sdb8
md:  adding sda8 ...
md: sda7 has different UUID to sdb8
md: sda6 has different UUID to sdb8
md: sda5 has different UUID to sdb8
md: sda3 has different UUID to sdb8
md: sda2 has different UUID to sdb8
md: created md5
md: bind<sda8>
md: bind<sdb8>
md: running: <sdb8><sda8>
raid1: raid set md5 active with 2 out of 2 mirrors
md: considering sdb7 ...
md:  adding sdb7 ...
md: sdb6 has different UUID to sdb7
md: sdb5 has different UUID to sdb7
md: sdb3 has different UUID to sdb7
md: sdb2 has different UUID to sdb7
md:  adding sda7 ...
md: sda6 has different UUID to sdb7
md: sda5 has different UUID to sdb7
md: sda3 has different UUID to sdb7
md: sda2 has different UUID to sdb7
md: created md4
md: bind<sda7>
md: bind<sdb7>
md: running: <sdb7><sda7>
raid1: raid set md4 active with 2 out of 2 mirrors
md: considering sdb6 ...
md:  adding sdb6 ...
md: sdb5 has different UUID to sdb6
md: sdb3 has different UUID to sdb6
md: sdb2 has different UUID to sdb6
md:  adding sda6 ...
md: sda5 has different UUID to sdb6
md: sda3 has different UUID to sdb6
md: sda2 has different UUID to sdb6
md: created md3
md: bind<sda6>
md: bind<sdb6>
md: running: <sdb6><sda6>
raid1: raid set md3 active with 2 out of 2 mirrors
md: considering sdb5 ...
md:  adding sdb5 ...
md: sdb3 has different UUID to sdb5
md: sdb2 has different UUID to sdb5
md:  adding sda5 ...
md: sda3 has different UUID to sdb5
md: sda2 has different UUID to sdb5
md: created md2
md: bind<sda5>
md: bind<sdb5>
md: running: <sdb5><sda5>
raid1: raid set md2 active with 2 out of 2 mirrors
md: considering sdb3 ...
md:  adding sdb3 ...
md: sdb2 has different UUID to sdb3
md:  adding sda3 ...
md: sda2 has different UUID to sdb3
md: created md1
md: bind<sda3>
md: bind<sdb3>
md: running: <sdb3><sda3>
raid1: raid set md1 active with 2 out of 2 mirrors
md: considering sdb2 ...
md:  adding sdb2 ...
md:  adding sda2 ...
md: created md0
md: bind<sda2>
md: bind<sdb2>
md: running: <sdb2><sda2>
raid1: raid set md0 active with 2 out of 2 mirrors
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 504k freed
Adding 127928k swap on /dev/md1.  Priority:-1 extents:1
EXT3 FS on md2, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md0, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md3, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md5, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md6, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on md7, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
Trying to free nonexistent resource <fff83800-fff83807>

I am rying to use minicom to connect a serial console running on the serial
port2 of another b180 runing 2.4: i don't reach to get any connection (OTC
it
works very fine with the same 2.6.0-pa4 on b2k model :) ).

(i reboot with 2.4.20-pa35 and it's working, so it exclude hw pb)

Test without sucess:
* restart the console on the other b180 running 2.4
* try to reproduce the setserial setup of the working serial 1:
# setserial /dev/ttyS1 -a
/dev/ttyS1, Line 1, UART: 16550A, Port: 0xfff83800, IRQ: 106
        Baud_base: 460800, close_delay: 50, divisor: 0
        closing_wait: 3000
        Flags: spd_normal

# setserial /dev/ttyS0 -a
/dev/ttyS0, Line 0, UART: 16550A, Port: 0x0000, IRQ: 90
        Baud_base: 454545, close_delay: 50, divisor: 0
        closing_wait: 3000
        Flags: spd_normal

# setserial /dev/ttyS1  uart 16550A port 0xfff83800 irq 106 baud_base 454545
spd_normal
(also try with port 0x0000)

* also try with stty:
# stty -F /dev/ttyS1
speed 9600 baud; line = 0;
-brkint -imaxbel

# stty -F /dev/ttyS0
speed 9600 baud; line = 0;
kill = ^X; min = 1; time = 0;
-brkint -icrnl -imaxbel
-opost -onlcr
-isig -icanon -iexten -echo -echoe -echok -echoctl -echoke

# stty -F /dev/ttyS1 kill = ^X ignbrk -brki
t -icrnl ixoff -imaxbel -opost
-onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke

No success?

Any idea?

thanks in advance,
    Joel

PS: I noticed this pb for all 2.6.0 i testes (iirc since 2.6.0-test1-pa...)
but forget to report it, please appology



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
