Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 39820495C
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Apr 2004 01:59:28 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo 2
Date: Tue, 13 Apr 2004 09:59:22 +0200
References: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
	<200404122309.59140.deller@gmx.de>
	<200404130021.13209.vapier@gentoo.org>
In-Reply-To: <200404130021.13209.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200404130959.23054.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tuesday 13 April 2004 06:21, Mike Frysinger wrote:
> On Monday 12 April 2004 05:09 pm, Helge Deller wrote:
> > On Monday 12 April 2004 01:12, M. Grabert wrote:
> > > - What about 2.6? I don't think that it's been forwarded to 2.6 yet?
> >
> > It's in 2.6. I just tested my Vodoo2 in my c3k and it works.
> > Linux version 2.6.5-pa6 (root@p100) (gcc version 3.0.2 20010829
> > (prerelease)) #29 Mon Apr 12 22:46:03 CEST 2004 The 32-bit Kernel has
> > started...
> > ..
> > sstfb: Voodoo2 (revision 2) with ICS ICS5342 dac
> > sstfb: framebuffer at 0xfb400000, mapped to 0xfb400000, size 2MB
> > fb0: Voodoo2 frame buffer device at 0xfb400000
> > ..
> 
> this interests me since i'd love to get something better than the 8bit vid 
> card running in my C360 :)
> 
> i threw my obsidian voodoo2 into my box, but it did what it always has for 
> me ... i build the sstfb as a module and when i modprobe it, the box locks 
> up ... i builld it as a module because otherwise it'll lock at boot and i 
> have to do a little manual rescue foo :)

My above test was with the sstfb driver built-in into the kernel and with all
other graphics drivers (incl. stifb and STI text console) disabled.

FYI, this is what my graphics-relevant part of .config looked like:
#
# Graphics support
#
CONFIG_FB=y
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_STI is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON_OLD is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
CONFIG_FB_VOODOO1=y
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_VIRTUAL is not set

#
# Console display driver support
#
# CONFIG_MDA_CONSOLE is not set
# CONFIG_STI_CONSOLE is not set
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_PCI_CONSOLE=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y

#
# Logo configuration
#
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
CONFIG_LOGO_PARISC_CLUT224=y


Then, in a second test I enabled STIFB, and choosed SSTFB as module.
Booting up worked:
Linux version 2.6.5-pa6 (root@p100) (gcc version 3.0.2 20010829 (prerelease)) #30 Tue Apr 13 09:49:08 CEST 2004
....
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f2400000 (64 kB), fb at f8000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1024
STI PCI graphic ROM found at f3800000 (2048 kB), fb at f6000000 (32 MB)
    id 35acda30-9a02587, conforms to spec rev. 8.0d
    graphics card name: A1262A
fb0: stifb 1024x768-8 frame buffer device, PCI_GRAFFITIX1024, id: 2d08c0a7, mmio: 0xf8100000
stifb: 'A1262A' (id: 0x35acda30) not supported.
.... (the second card 'A1262A' is a Visualize FX4 - it doesn't work!)

c3000:~# modprobe sstfb
sstfb: Voodoo2 (revision 2) with ICS ICS5342 dac
sstfb: framebuffer at 0xfb400000, mapped to 0xfb400000, size 2MB
fb1: Voodoo2 frame buffer device at 0xfb400000

c3000:~# cat /proc/fb 
0 stifb
1 Voodoo2

Works too...

Helge
