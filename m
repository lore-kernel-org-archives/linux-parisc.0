From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] Help wanted: Getting Matrox Mystique to run on
	HPPA B2000
Date: Tue, 5 Jul 2005 16:51:59 +0200
Message-ID: <20050705165159.0953c3ac.gmsoft@gentoo.org>
References: <5.1.1.6.1.20050705220226.02abcec0@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0084206296=="
Cc: parisc-linux@lists.parisc-linux.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050705220226.02abcec0@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0084206296==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__5_Jul_2005_16_51_59_+0200_RLCkQChTb3KddQ5H"

--Signature=_Tue__5_Jul_2005_16_51_59_+0200_RLCkQChTb3KddQ5H
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

What about=20
video=3Dmatroxfb:vesa:0x111,depth:16,mem:4,noaccel,init console=3Dtty0
passed to the kernel or something which best correspond to your vga card ?

Mine is this :
0000:02:03.0 VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG [M=
ystique] (rev 02)
and it works fine.

Guy


On Tue, 05 Jul 2005 22:47:16 +0800
"J. L. Lee" <jllee@singnet.com.sg> wrote:

> Hi,
>=20
> I have set up Matrox Millennum II on B2000 running Linux 2.6.12-rc6-pa1=20
> kernel. Am now trying to set up Matrox Mystique to run on it too.
>=20
> In my first attempt I compiled the "Matrox acceleration" as MODULE with=20
> "Millennium I/II support" and "Mystique support" compiled into the KERNEL=
=20
> (they are not "module" selectable). After rebooting, 'matroxfb' was not=20
> loaded automatically. Executed a command "modprobe matroxfb" it returned =
an=20
> error msg "FATAL: Module matroxfb not found".
>=20
> Recompiled the second time with "Matrox acceleration", "Millennium I/II=20
> support" and "Mystique support" all compiled into the KERNEL. Rebooted=20
> successfully but the Mystique card was not initialized nor the kernel=20
> crashes as it did running Linux 2.6.8.
>=20
> The relevant boot msgs are as follows: (3 extra 'printk' s were added to=
=20
> drivers/video/matrox/matroxfb_base.h before kernel recompilation so there=
=20
> are extra outputs)
>=20
>=20
> STI GSC/PCI core graphics driver Version 0.9a
> STI PCI graphic ROM found at fd820000 (128 kB), fb at fb000000 (16 MB)
>      id 35acda16-9a02587, conforms to spec rev. 8.0c
>      graphics card name: HPA4982A
> sticon: Initializing STI text console.
> Console: switching to colour STI console 160x64
> matroxfb: Matrox Mystique (PCI) detected
> mga_ioremap: phys=3D4253024256 size=3D16384 flags=3D1 virt=3D104f49e0=20
> virt->vaddr=3Dfd800000
> mga_ioremap: phys=3D4244635648 size=3D8388608 flags=3D1 virt=3D104f49cc=20
> virt->vaddr=3Dfd000000
> matroxfb: cannot determine memory size
> mga_iounmap: before iounmap() va->vaddr=3Dfd000000
> mga_iounmap: after iounmap() va->vaddr=3Dfd000000
> mga_iounmap: before iounmap() va->vaddr=3Dfd800000
> mga_iounmap: after iounmap() va->vaddr=3Dfd800000
> matroxfb: probe of 0000:01:01.0 failed with error -1
> stifb: 'HPA4982A' (id: 0x35acda16) not supported.
> Generic RTC Driver v1.07
>=20
>=20
> The 'lspci -v' outputs are as follows:
>=20
> DebianHPPA01:~# lspci -v
> 0000:00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip=20
> 21142/43 (rev 41)
> 	Subsystem: Hewlett-Packard Company: Unknown device 104f
> 	Flags: bus master, medium devsel, latency 255, IRQ 66
> 	I/O ports at 0f00 [size=3D128]
> 	Memory at f4005000 (32-bit, non-prefetchable) [size=3D1K]
> 	Expansion ROM at f4040000 [disabled] [size=3D256K]
>=20
> 0000:00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
> 	Subsystem: Analog Devices AD1889 sound chip
> 	Flags: bus master, medium devsel, latency 255, IRQ 67
> 	Memory at f4009000 (32-bit, prefetchable) [size=3D512]
> 	Memory at f4008000 (32-bit, prefetchable) [size=3D16]
> 	Memory at f4007000 (32-bit, prefetchable) [size=3D16]
> 	Memory at f4006000 (32-bit, prefetchable) [size=3D16]
> 	Capabilities: [dc] Power Management version 1
>=20
> 0000:00:0e.0 IDE interface: National Semiconductor Corporation 87415/8756=
0=20
> IDE (rev 03) (prog-if 8f [Master SecP SecO PriP PriO])
> 	Flags: bus master, medium devsel, latency 255, IRQ 7
> 	I/O ports at 0e00 [size=3D8]
> 	I/O ports at 0d00 [size=3D4]
> 	I/O ports at 0b00 [size=3D8]
> 	I/O ports at 0a00 [size=3D4]
> 	I/O ports at 0900 [size=3D16]
>=20
> 0000:00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O=
=20
> (rev 01)
> 	Flags: bus master, medium devsel, latency 255, IRQ 68
>=20
> 0000:00:0e.2 USB Controller: National Semiconductor Corporation USB=20
> Controller (rev 02) (prog-if 10 [OHCI])
> 	Flags: bus master, medium devsel, latency 240, IRQ 1
> 	Memory at f4004000 (32-bit, non-prefetchable) [size=3D4K]
> 	Memory at f4003000 (32-bit, non-prefetchable) [size=3D4K]
>=20
> 0000:00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a=20
> (rev 01)
> 	Subsystem: LSI Logic / Symbios Logic LSI53C895A PCI to Ultra2 SCSI Contr=
oller
> 	Flags: bus master, medium devsel, latency 255, IRQ 69
> 	I/O ports at 0800 [size=3D256]
> 	Memory at f4002000 (32-bit, non-prefetchable) [size=3D1K]
> 	Memory at f4000000 (32-bit, non-prefetchable) [size=3D8K]
> 	Capabilities: [40] Power Management version 2
>=20
> 0000:01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
> 	Subsystem: Hewlett-Packard Company: Unknown device 108c
> 	Flags: bus master, 66MHz, medium devsel, latency 255, IRQ 70
> 	Memory at fb000000 (64-bit, prefetchable) [size=3D16M]
> 	Memory at fa000000 (64-bit, non-prefetchable) [size=3D16M]
> 	Expansion ROM at fd820000 [disabled] [size=3D128K]
>=20
> 0000:01:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG=
=20
> [Mystique] (rev 02) (prog-if 00 [VGA])
> 	Flags: bus master, stepping, medium devsel, latency 248, IRQ 71
> 	Memory at fd800000 (32-bit, non-prefetchable) [size=3D16K]
> 	Memory at fd000000 (32-bit, prefetchable) [size=3D8M]
> 	Memory at f4800000 (32-bit, non-prefetchable) [size=3D8M]
> 	Expansion ROM at fd820000 [disabled] [size=3D64K]
>=20
>=20
> The 'cat /proc/iomem' outputs are as follows:
>=20
> DebianHPPA01:~# cat /proc/iomem
> 00000000-0fffffff : System RAM
>    00000000-000009ff : PDC data (Page Zero)
>    00100000-0039cfff : Kernel code
>    0039d000-0050d89b : Kernel data
> f05d0000-f05d0000 : lcd_data
> f05d0008-f05d0008 : lcd_cmd
> f4000000-f47fffff : PCI00 LMMIO
>    f4000000-f4001fff : sym53c8xx
>    f4002000-f40023ff : sym53c8xx
>    f4004000-f4004fff : ohci_hcd
>    f4005000-f40053ff : tulip
>    f4009000-f40091ff : ad1889
> f4800000-f4ffffff : PCI01 LMMIO
> fd000000-fdffffff : PCI01 ELMMIO
> fed00000-fed00fff : SBA
> fed30000-fed30fff : LBA
> fed32000-fed32fff : LBA
> fef00000-feffffff : Astro Intr Ack
> fff80000-fffaffff : Central Bus
>    fffa0000-fffa0fff : CPU
> fffb0000-fffdffff : Local Broadcast
> fffe0000-ffffffff : Global Broadcast
> DebianHPPA01:~#
>=20
>=20
> Any suggestion what should I do next to see if Matrox Mytique cards are=20
> indeed usable on HPPA boxes.
>=20
> Tks,
> Lee
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


--=20
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team

--Signature=_Tue__5_Jul_2005_16_51_59_+0200_RLCkQChTb3KddQ5H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCyp6RrpShrnoH4YYRAkRhAJsFCIbGPoLP53jE1ppEqwAccBTpUQCgqc40
si1W7UUnkeujhOtbOuE+n+4=
=gSmN
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Jul_2005_16_51_59_+0200_RLCkQChTb3KddQ5H--

--===============0084206296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0084206296==--
