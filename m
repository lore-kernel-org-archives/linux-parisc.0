Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD78E485A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 13:36:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17PTRV-0004AU-00; Tue, 02 Jul 2002 20:36:05 +0100
Date: Tue, 2 Jul 2002 20:36:05 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C240 and PCI (PC) graphics card (attached files)
Message-ID: <20020702203605.F27706@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0207021953230.16680-100000@sal.ucc.ie> <Pine.LNX.4.44.0207022018060.16680-600000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0207022018060.16680-600000@sal.ucc.ie>; from xam@cs.ucc.ie on Tue, Jul 02, 2002 at 08:22:15PM +0100
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

On Tue, Jul 02, 2002 at 08:22:15PM +0100, M. Grabert wrote:
> (II) resource ranges after xf86ClaimFixedResources() call:
> 	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
> 	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
> 	[2] -1 0	0xf2fff000 - 0xf2fff07f (0x80) MX[B]
> 	[3] -1 0	0xf2ffe000 - 0xf2ffefff (0x1000) MX[B]
> 	[4] -1 0	0xf2ffd000 - 0xf2ffd0ff (0x100) MX[B]
> 	[5] -1 0	0xf1ff0000 - 0xf1ffffff (0x10000) MX[B](B)
> 	[6] -1 0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
> 	[7] -1 0	0xf6000000 - 0xf7ffffff (0x2000000) MX[B](B)
> 	[8] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
> 	[9] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
> 	[10] -1 0	0x0000ff00 - 0x0000ff7f (0x80) IX[B]
> 	[11] -1 0	0x0000fe00 - 0x0000feff (0x100) IX[B]
> 	[12] -1 0	0x0000ff00 - 0x0000ffff (0x100) IX[B](B)
> (WW) ****INVALID IO ALLOCATION**** b: 0xff00 e: 0xffff correcting=07

Hrm, see, I think this is wrong.  We're on PCI Bus 1, which has IO port
range 0x10000 to 0x1ffff.  I suspect Xfree is truncating us down to 16 bits.

> (II) Setting vga for screen 0.
> (II) TDFX(0): Softbooting the board (through the int10 interface).
> c000:195a: F1 ILLEGAL X86 OPCODE!
> (II) TDFX(0): Softbooting the board succeeded.
> (**) TDFX(0): Depth 24, (--) framebuffer bpp 32
> (=3D=3D) TDFX(0): RGB weight 888
> (=3D=3D) TDFX(0): Default visual is TrueColor
> (--) TDFX(0): Chipset: "3dfx Voodoo3"
> (--) TDFX(0): Linear framebuffer at 0xF8000000
> (--) TDFX(0): MMIO registers at addr 0xF6000000
> (EE) TDFX(0): No valid PIO address in PCI config space
> (EE) Screen(s) found, but none have a usable configuration.

Yeah.  I bet it's trying to do port IO to the wrong address, and things
are going splat.

> (--) TDFX(0): Linear framebuffer at 0xF8000000
> (--) TDFX(0): MMIO registers at addr 0xF6000000
> (--) TDFX(0): PIO registers at addr 0xFD00

=2E.. much more plausible ...

> (II) TDFX(0): DRAMINIT1 read 0x0, programming 0x202031 (not Banshee)
> (**) TDFX(0): VideoRAM: 16384 kByte Mapping 32768 kByte
> (=3D=3D) TDFX(0): Using gamma correction (1.0, 1.0, 1.0)
> (II) TDFX(0): Generic Monitor: U
>=20
> Lasi: barking without apparent reason.
>=20
> High Priority Machine Check (HPMC): Code=3D1 regs=3D10284080 (Addr=3D0000=
0000)

Fun.  I wonder exactly what X is (trying to) do.

--=20
Revolutions do not require corporate support.
