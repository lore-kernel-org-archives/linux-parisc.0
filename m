From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] Call for Testing
Date: Sun, 27 Mar 2005 22:08:31 +0000
Message-ID: <200503272308.32745.dmp@davidmpye.dyndns.org>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0650743443=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0650743443==
Content-Type: multipart/signed; boundary="nextPart2711293.7WC6fXtIWC";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2711293.7WC6fXtIWC
Content-Type: multipart/mixed;
  boundary="Boundary-01=_f7yRCg00yAOqkZo"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_f7yRCg00yAOqkZo
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 27 March 2005 21:45, Kyle McMartin wrote:
> Hi,
>
> I've backported some more patches to 2.6.8 for possible[1] inclusion in
> sarge (they fix some possibly important bits).

<snip>

> Please reply either to the list, or to me personally with the dmesg
> output from a boot, and what machine(s) you were able to test on.

Attached is the dmesg output from a J5000, with an EG graphics card.

The only thing I'm a bit curious about are these:

module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd =
in=20
17 bits)
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd =
in=20
17 bits)

Are these anything to worry about?

Cheers,

David

> Thanks,
>  Kyle

--Boundary-01=_f7yRCg00yAOqkZo
Content-Type: text/plain;
  charset="iso-8859-1";
  name="test_output"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="test_output"

01000 00002000 00004000 00008000 00010000 00020000 00040000 00080000 001000=
00 00200000 00400000 00800000 01000000 02000000 04000000 08000000 10000000 =
20000000 40000000 80000000 00000001 00000002 00000004 00000008 00000010 000=
00020 00000040
CPU8: offline
 domain 0: span ffffffff
  groups: 00000100 00000200 00000400 00000800 00001000 00002000 00004000 00=
008000 00010000 00020000 00040000 00080000 00100000 00200000 00400000 00800=
000 01000000 02000000 04000000 08000000 10000000 20000000 40000000 80000000=
 00000001 00000002 00000004 00000008 00000010 00000020 00000040 00000080
CPU9: offline
 domain 0: span ffffffff
  groups: 00000200 00000400 00000800 00001000 00002000 00004000 00008000 00=
010000 00020000 00040000 00080000 00100000 00200000 00400000 00800000 01000=
000 02000000 04000000 08000000 10000000 20000000 40000000 80000000 00000001=
 00000002 00000004 00000008 00000010 00000020 00000040 00000080 00000100
CPU10: offline
 domain 0: span ffffffff
  groups: 00000400 00000800 00001000 00002000 00004000 00008000 00010000 00=
020000 00040000 00080000 00100000 00200000 00400000 00800000 01000000 02000=
000 04000000 08000000 10000000 20000000 40000000 80000000 00000001 00000002=
 00000004 00000008 00000010 00000020 00000040 00000080 00000100 00000200
CPU11: offline
 domain 0: span ffffffff
  groups: 00000800 00001000 00002000 00004000 00008000 00010000 00020000 00=
040000 00080000 00100000 00200000 00400000 00800000 01000000 02000000 04000=
000 08000000 10000000 20000000 40000000 80000000 00000001 00000002 00000004=
 00000008 00000010 00000020 00000040 00000080 00000100 00000200 00000400
CPU12: offline
 domain 0: span ffffffff
  groups: 00001000 00002000 00004000 00008000 00010000 00020000 00040000 00=
080000 00100000 00200000 00400000 00800000 01000000 02000000 04000000 08000=
000 10000000 20000000 40000000 80000000 00000001 00000002 00000004 00000008=
 00000010 00000020 00000040 00000080 00000100 00000200 00000400 00000800
CPU13: offline
 domain 0: span ffffffff
  groups: 00002000 00004000 00008000 00010000 00020000 00040000 00080000 00=
100000 00200000 00400000 00800000 01000000 02000000 04000000 08000000 10000=
000 20000000 40000000 80000000 00000001 00000002 00000004 00000008 00000010=
 00000020 00000040 00000080 00000100 00000200 00000400 00000800 00001000
CPU14: offline
 domain 0: span ffffffff
  groups: 00004000 00008000 00010000 00020000 00040000 00080000 00100000 00=
200000 00400000 00800000 01000000 02000000 04000000 08000000 10000000 20000=
000 40000000 80000000 00000001 00000002 00000004 00000008 00000010 00000020=
 00000040 00000080 00000100 00000200 00000400 00000800 00001000 00002000
CPU15: offline
 domain 0: span ffffffff
  groups: 00008000 00010000 00020000 00040000 00080000 00100000 00200000 00=
400000 00800000 01000000 02000000 04000000 08000000 10000000 20000000 40000=
000 80000000 00000001 00000002 00000004 00000008 00000010 00000020 00000040=
 00000080 00000100 00000200 00000400 00000800 00001000 00002000 00004000
CPU16: offline
 domain 0: span ffffffff
  groups: 00010000 00020000 00040000 00080000 00100000 00200000 00400000 00=
800000 01000000 02000000 04000000 08000000 10000000 20000000 40000000 80000=
000 00000001 00000002 00000004 00000008 00000010 00000020 00000040 00000080=
 00000100 00000200 00000400 00000800 00001000 00002000 00004000 00008000
CPU17: offline
 domain 0: span ffffffff
  groups: 00020000 00040000 00080000 00100000 00200000 00400000 00800000 01=
000000 02000000 04000000 08000000 10000000 20000000 40000000 80000000 00000=
001 00000002 00000004 00000008 00000010 00000020 00000040 00000080 00000100=
 00000200 00000400 00000800 00001000 00002000 00004000 00008000 00010000
CPU18: offline
 domain 0: span ffffffff
  groups: 00040000 00080000 00100000 00200000 00400000 00800000 01000000 02=
000000 04000000 08000000 10000000 20000000 40000000 80000000 00000001 00000=
002 00000004 00000008 00000010 00000020 00000040 00000080 00000100 00000200=
 00000400 00000800 00001000 00002000 00004000 00008000 00010000 00020000
CPU19: offline
 domain 0: span ffffffff
  groups: 00080000 00100000 00200000 00400000 00800000 01000000 02000000 04=
000000 08000000 10000000 20000000 40000000 80000000 00000001 00000002 00000=
004 00000008 00000010 00000020 00000040 00000080 00000100 00000200 00000400=
 00000800 00001000 00002000 00004000 00008000 00010000 00020000 00040000
CPU20: offline
 domain 0: span ffffffff
  groups: 00100000 00200000 00400000 00800000 01000000 02000000 04000000 08=
000000 10000000 20000000 40000000 80000000 00000001 00000002 00000004 00000=
008 00000010 00000020 00000040 00000080 00000100 00000200 00000400 00000800=
 00001000 00002000 00004000 00008000 00010000 00020000 00040000 00080000
CPU21: offline
 domain 0: span ffffffff
  groups: 00200000 00400000 00800000 01000000 02000000 04000000 08000000 10=
000000 20000000 40000000 80000000 00000001 00000002 00000004 00000008 00000=
010 00000020 00000040 00000080 00000100 00000200 00000400 00000800 00001000=
 00002000 00004000 00008000 00010000 00020000 00040000 00080000 00100000
CPU22: offline
 domain 0: span ffffffff
  groups: 00400000 00800000 01000000 02000000 04000000 08000000 10000000 20=
000000 40000000 80000000 00000001 00000002 00000004 00000008 00000010 00000=
020 00000040 00000080 00000100 00000200 00000400 00000800 00001000 00002000=
 00004000 00008000 00010000 00020000 00040000 00080000 00100000 00200000
CPU23: offline
 domain 0: span ffffffff
  groups: 00800000 01000000 02000000 04000000 08000000 10000000 20000000 40=
000000 80000000 00000001 00000002 00000004 00000008 00000010 00000020 00000=
040 00000080 00000100 00000200 00000400 00000800 00001000 00002000 00004000=
 00008000 00010000 00020000 00040000 00080000 00100000 00200000 00400000
CPU24: offline
 domain 0: span ffffffff
  groups: 01000000 02000000 04000000 08000000 10000000 20000000 40000000 80=
000000 00000001 00000002 00000004 00000008 00000010 00000020 00000040 00000=
080 00000100 00000200 00000400 00000800 00001000 00002000 00004000 00008000=
 00010000 00020000 00040000 00080000 00100000 00200000 00400000 00800000
CPU25: offline
 domain 0: span ffffffff
  groups: 02000000 04000000 08000000 10000000 20000000 40000000 80000000 00=
000001 00000002 00000004 00000008 00000010 00000020 00000040 00000080 00000=
100 00000200 00000400 00000800 00001000 00002000 00004000 00008000 00010000=
 00020000 00040000 00080000 00100000 00200000 00400000 00800000 01000000
CPU26: offline
 domain 0: span ffffffff
  groups: 04000000 08000000 10000000 20000000 40000000 80000000 00000001 00=
000002 00000004 00000008 00000010 00000020 00000040 00000080 00000100 00000=
200 00000400 00000800 00001000 00002000 00004000 00008000 00010000 00020000=
 00040000 00080000 00100000 00200000 00400000 00800000 01000000 02000000
CPU27: offline
 domain 0: span ffffffff
  groups: 08000000 10000000 20000000 40000000 80000000 00000001 00000002 00=
000004 00000008 00000010 00000020 00000040 00000080 00000100 00000200 00000=
400 00000800 00001000 00002000 00004000 00008000 00010000 00020000 00040000=
 00080000 00100000 00200000 00400000 00800000 01000000 02000000 04000000
CPU28: offline
 domain 0: span ffffffff
  groups: 10000000 20000000 40000000 80000000 00000001 00000002 00000004 00=
000008 00000010 00000020 00000040 00000080 00000100 00000200 00000400 00000=
800 00001000 00002000 00004000 00008000 00010000 00020000 00040000 00080000=
 00100000 00200000 00400000 00800000 01000000 02000000 04000000 08000000
CPU29: offline
 domain 0: span ffffffff
  groups: 20000000 40000000 80000000 00000001 00000002 00000004 00000008 00=
000010 00000020 00000040 00000080 00000100 00000200 00000400 00000800 00001=
000 00002000 00004000 00008000 00010000 00020000 00040000 00080000 00100000=
 00200000 00400000 00800000 01000000 02000000 04000000 08000000 10000000
CPU30: offline
 domain 0: span ffffffff
  groups: 40000000 80000000 00000001 00000002 00000004 00000008 00000010 00=
000020 00000040 00000080 00000100 00000200 00000400 00000800 00001000 00002=
000 00004000 00008000 00010000 00020000 00040000 00080000 00100000 00200000=
 00400000 00800000 01000000 02000000 04000000 08000000 10000000 20000000
CPU31: offline
 domain 0: span ffffffff
  groups: 80000000 00000001 00000002 00000004 00000008 00000010 00000020 00=
000040 00000080 00000100 00000200 00000400 00000800 00001000 00002000 00004=
000 00008000 00010000 00020000 00040000 00080000 00100000 00200000 00400000=
 00800000 01000000 02000000 04000000 08000000 10000000 20000000 40000000
checking if image is initramfs...it isn't (ungzip failed); looks like an in=
itrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
=46ound devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
7. Forte W 2-way at 0xfffa0000 [32] { 0, 0x0, 0x5bd, 0x00004 }
8. Forte W 2-way at 0xfffa2000 [34] { 0, 0x0, 0x5bd, 0x00004 }
9. Memory at 0xfed10200 [49] { 1, 0x0, 0x088, 0x00009 }
Releasing cpu 1 now, hpa=3Dfffa2000
=46P[1] enabled: Rev 1 Model 16
CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR2.1 (0x2) found at 0xfed30000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
PCI: Enabled native mode for NS87415 (pif=3D0x8f)
lba version TR2.1 (0x2) found at 0xfed32000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
iosapic: hpa not registered for 0000:01:06.0
lba version TR2.1 (0x2) found at 0xfed34000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
lba version TR2.1 (0x2) found at 0xfed38000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
lba version TR2.1 (0x2) found at 0xfed3c000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
SCSI subsystem initialized
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f4800000 (64 kB), fb at fa000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1024
fb0: stifb 1024x768-8 frame buffer device, PCI_GRAFFITIX1024, id: 2d08c0a7,=
 mmio: 0xfa100000
unwind_init: start =3D 0x103b5720, end =3D 0x103d6f30, entries =3D 8577
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 64)=20
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
Soft power switch enabled, polling @ 0xf0400804.
Console: switching to colour frame buffer device 128x48
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 25 ports, IRQ sharing enabled
ttyS0 at I/O 0x3f8 (irq =3D 99) is a 16550A
ttyS1 at I/O 0x2f8 (irq =3D 100) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
mice: PS/2 mouse device common for all mice
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
NET: Registered protocol family 2
IP: routing cache hash table of 1024 buckets, 24Kbytes
TCP: Hash tables configured (established 32768 bind 52428)
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 5208 blocks [1 disk] into ram disk... |=08/=08-=08\=08|=08=
/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=
=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08=
=2D=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=
=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08=
\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=
=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08=
|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=
=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08=
/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=
=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08=
=2D=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=
=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08=
\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=
=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08=
|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=
=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08=
/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=
=08|=08/=08-=08\=08|=08/=08done.
VFS: Mounted root (cramfs filesystem) readonly.
=46reeing unused kernel memory: Badness in smp_call_function at arch/parisc=
/kernel/smp.c:342
Backtrace:
 [<1011963c>] smp_call_function+0x408/0x410
 [<101088dc>] flush_data_cache+0x24/0x40
 [<10107a38>] free_initmem+0x78/0x38c
 [<10103d30>] init+0x304/0x410
 [<10110c5c>] ret_from_kernel_thread+0x1c/0x24

344k freed
NET: Registered protocol family 1
sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
scsi0 : sym-2.1.18k
sym0: SCSI BUS has been reset.
Using anticipatory io scheduler
sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 65
sym1: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18k
  Vendor: SEAGATE   Model: ST39102LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym1:3:0: tagged command queuing enabled, command queue depth 16.
scsi(1:0:3:0): Beginning Domain Validation
sym1:3: wide asynchronous.
sym1:3: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 15)
scsi(1:0:3:0): Domain Validation skipping write tests
scsi(1:0:3:0): Ending Domain Validation
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write back
 /dev/scsi/host1/bus0/target3/lun0: p1 p2 p3 < p5 p6 >
Attached scsi disk sda at scsi1, channel 0, id 3, lun 0
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Adding 359400k swap on /dev/sda6.  Priority:-1 extents:1
EXT3 FS on sda5, internal journal
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0xf4008000, 00:10:83:7B:E2:5B, IRQ 66.
8139too Fast Ethernet driver 0.9.27
eth1: RealTek RTL8139 at 0xf6000000, 00:c0:df:0c:2a:12, IRQ 128
eth1:  Identified 8139 chip type 'RTL-8139C'
usbcore: registered new driver hub
ohci_hcd: 2004 Feb 02 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
ohci_hcd 0000:00:0e.2: National Semiconductor Corporation USB Controller
ohci_hcd 0000:00:0e.2: irq 97, pci mem f4007000
ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:0e.2: Using NSC SuperIO setup
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
usb 1-1: new full speed USB device using address 2
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 3 ports detected
usb 1-1.1: new full speed USB device using address 3
usbcore: registered new driver hiddev
input: USB HID v1.00 Keyboard [Chicony  PFU-65 USB Keyboard] on usb-0000:00=
:0e.2-1.1
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
8139cp: 10/100 PCI Ethernet driver v1.2 (Mar 22, 2004)
USB Universal Host Controller Interface driver v2.2
NET: Registered protocol family 17
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.
eth1: link down
parport_pc: Unknown symbol dma_spin_lock
lp: driver loaded but no devices found
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd =
in 17 bits)
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefffd =
in 17 bits)

--Boundary-01=_f7yRCg00yAOqkZo--

--nextPart2711293.7WC6fXtIWC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRy7gOIrGtzS07WgRAu59AJ0X6sPc47cnKCD+MPtoEqEW7G9hPgCbB7X0
9nHxtBV53RllJLCkcNf95Uc=
=LWxm
-----END PGP SIGNATURE-----

--nextPart2711293.7WC6fXtIWC--

--===============0650743443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0650743443==--
