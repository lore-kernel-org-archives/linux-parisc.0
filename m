From: Alexander Bartolich <alexander.bartolich@gmx.at>
Subject: Re: [parisc-linux] C240 and Linux 2.6.x
Date: Mon, 3 Jan 2005 19:13:34 +0100
Message-ID: <20050103181334.GB21212__9420.47079229287$1416624525$gmane$org@nilpferd.asyl>
References: <20041230231420.GA15674@nilpferd.asyl>
	<41D553CB.6070802@tiscali.be>
	<20041231174649.GA21212@nilpferd.asyl>
	<20041231212330.GB23592@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1065558582=="
To: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041231212330.GB23592@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============1065558582==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2004 at 02:23:30PM -0700, Grant Grundler wrote:
> Yes, STI should continue to work with 2.6.x kernels.
> This sounds like a bug.

I fetched palinux-b180-defconfig-2.6.10-pa2_0-2_all.deb from
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/b180_defconfig/
and build a nice vmlinux-2.6.10-pa2.

This gives me nice console output on booting, so there is definitely
something wrong with Debian's kernel-image-2.6.8-1-32.

Howver, now comes the bad news.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Command line for kernel: 'root=3D/dev/sda2 HOME=3D/ max_loop=3D64 console=
=3DttyS0 TERM=3Dvt102 palo_kernel=3D2/boot/vmlinux'
Selected kernel: /boot/vmlinux from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 1
Segment 0 load 00100000 size 3514501 mediaptr 0x1000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

CPU'
CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
Setting cache flush threshold to 40 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
Dino [8/0] version 3.1 found at 0xf2000000
Cujo version 2.0 found at 0xf1000000
SCSI subsystem initialized
unwind_init: start =3D 0x1034aea0, end =3D 0x1036ed70, entries =3D 9197
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f1e00000 (2048 kB), fb at f6000000 (32 MB)
    id 2fc1066b-9a02587, conforms to spec rev. 8.09
    graphics card name: HPA4554A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
stifb: 'HPA4554A' (id: 0x2fc1066b) not supported.
lp: driver loaded but no devices found
Generic RTC Driver v1.07
serio: GSC PS/2 keyboard port at 0xffd08000 irq 69 @ 8:16:7
serio: GSC PS/2 mouse port at 0xffd08100 irq 69 @ 8:16:8
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq =3D 90) is a 16550A
ttyS1 at MMIO 0xf2003800 (irq =3D 106) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 64 devices)
PPP generic driver version 2.4.2
Linux Tulip driver version 1.1.13 (May 11, 2002)
Backtrace:
 [<10202ea4>] pci_device_probe_static+0x60/0x78
 [<10202ed8>] __pci_device_probe+0x1c/0x34
 [<10202f1c>] pci_device_probe+0x2c/0x58
 [<1023dbe0>] driver_probe_device+0x48/0x90
 [<1023dd5c>] driver_attach+0x80/0xa8
 [<1023e2e0>] bus_add_driver+0xb8/0xe0
 [<1023e878>] driver_register+0x44/0x50
 [<102031f8>] pci_register_driver+0x54/0x60
 [<103d189c>] do_initcalls+0x8c/0x138
 [<10103760>] init+0x38/0x104
 [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=3D26 regs=3D11474480 (Addr=3D00000004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 10460010 103eb100 0000000c
r04-07  103915cc 10391590 ffffffed 11750000
r08-11  11462800 00000003 10313800 11750220
r12-15  10332800 10391810 80000080 11462848
r16-19  f000167c 00000060 f00001f0 00000000
r20-23  00000030 0000000e f2000000 00000020
r24-27  11750230 00000a00 11462848 1036f010
r28-31  00000000 11474488 11474480 1020119c
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 103eb120 103eb124
 IIR: 0e681096    ISR: 00000000  IOR: 00000004
 CPU:        0   CR30: 11474000 CR31: 103c8000
 ORIG_R28: 1048a1a0
 IAOQ[0]: tulip_init_one+0x23c/0xdc0
 IAOQ[1]: tulip_init_one+0x240/0xdc0
 RP(r2): tulip_init_one+0x21c/0xdc0
Kernel panic - not syncing: Kernel Fault
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

2.4.27-pa4 runs fine with the Tulip NIC.

$ grep -i tulip /var/log/dmesg=20
Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:60:B0:EA:C8:DE, IRQ 96.

$ /usr/bin/lspci
0000:00:13.0 SCSI storage controller: LSI Logic / Symbios Logic 53c875 (rev=
 04)
0000:00:14.0 Ethernet controller: Digital Equipment Corporation DECchip 211=
42/43 (rev 30)
0000:01:04.0 Display controller: Hewlett-Packard Company Visualize FX4 (rev=
 02)

Alright. Where is the right place to send this?=20

--=20
This ain't no sig.

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUBQdmLTYatRCO2qiMiAQIuEwP/YwEVMcCpeThydyuWNeWnAGCwbWVGUiwT
/btK25KMArB/gC+tzV/41I4FsIlqmJSUUs61P+EyK2U7ZDXLb8UBmCkQolyqB7jK
yy6skTWgnkUpnQGP6MYPLZntIy7p0R9ULuLjEdTdUZDD3mcBBwBHm7A/OHZoiLeX
Bz0F4B6zN4c=
=PSuz
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--

--===============1065558582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1065558582==--
