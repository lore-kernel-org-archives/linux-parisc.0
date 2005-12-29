From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] X startup failure
Date: Thu, 29 Dec 2005 10:41:23 -0500 (EST)
Message-ID: <200512291541.jBTFfNbf002585@hiauly1.hia.nrc.ca>
References: <43B3B693.6030803@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43B3B693.6030803@tiscali.be> from "Joel Soete" at Dec 29,
	2005 10:12:35 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> >>On Monday 26 December 2005 22:34, John David Anglin wrote:
> >>
> >>>X no longer starts on my c3k using unstable.  The problem seems
> >>>to be:
> >>>
> >>>(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
> >>>
> this is definitely the pb?

Helge says this message has always been there, so I don't know.

> I just remember of a pb encountered a long time ago: is your pdc settings set well the graphic device to PCI_GRAFFITIX1280?

Yes
> 
> How could we check that fb0 point well to this PCI_GRAFFITIX1280 and not to A1262A?

I was concerned about this so I added the BusID line:

Section "Device"
        Identifier      "PCI_GRAFFITIX1280"
	Driver          "fbdev"
	BusID           "PCI:2:3:0"
	Option          "UseFBDev"              "true"
EndSection

I see this in the Xorg.0.log:

(--) PCI: (2:3:0) Hewlett-Packard Company A4977A Visualize EG rev 3, Mem @ 0xf80
00000/25, BIOS @ 0xf6000000/16
(--) PCI: (3:2:0) Hewlett-Packard Company Visualize FX4 rev 2, Mem @ 0xfa000000/
25, BIOS @ 0xf7000000/21
...
(**) FBDEV(0): claimed PCI slot 2:3:0
(II) FBDEV(0): using default device
...
(II) Setting vga for screen 0.
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(==) FBDEV(0): Default visual is PseudoColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware: stifb (video memory: 2048kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0):  mode "1280x1024" ok
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDEV(0):  Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
(II) FBDEV(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync
(++) FBDEV(0): DPI set to (100, 100)
(**) FBDEV(0): using shadow framebuffer
(II) resource ranges after preInit:
	[0] 0   0       0xf8000000 - 0xf9ffffff (0x2000000) MX[B]
	[1] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
	[2] -1  0       0x00000000 - 0x00000000 (0x1) MX[B]
	[3] -1  0       0xf4800000 - 0xf480007f (0x80) MX[B]
	[4] -1  0       0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[5] -1  0       0xf4004000 - 0xf40043ff (0x400) MX[B]
	[6] -1  0       0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[7] -1  0       0xf4005000 - 0xf40053ff (0x400) MX[B]
	[8] -1  0       0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[9] -1  0       0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[10] -1 0       0xf4009000 - 0xf400900f (0x10) MX[B]
	[11] -1 0       0xf400a000 - 0xf400a00f (0x10) MX[B]
	[12] -1 0       0xf400b000 - 0xf400b00f (0x10) MX[B]
	[13] -1 0       0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[14] -1 0       0xf4008000 - 0xf40083ff (0x400) MX[B]
	[15] -1 0       0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[16] -1 0       0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[17] -1 0       0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
        [18] -1 0       0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[19] 0  0       0x000a0000 - 0x000affff (0x10000) MS[B]
	[20] 0  0       0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[21] 0  0       0x000b8000 - 0x000bffff (0x8000) MS[B]
	[22] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
	[24] -1 0       0x00002000 - 0x0000207f (0x80) IX[B]
	[25] -1 0       0x00000800 - 0x000008ff (0x100) IX[B]
	[26] -1 0       0x00000900 - 0x000009ff (0x100) IX[B]
	[27] -1 0       0x00000a00 - 0x00000a0f (0x10) IX[B]
	[28] -1 0       0x00000b00 - 0x00000b03 (0x4) IX[B]
	[29] -1 0       0x00000d00 - 0x00000d07 (0x8) IX[B]
	[30] -1 0       0x00000e00 - 0x00000e03 (0x4) IX[B]
	[31] -1 0       0x00000f00 - 0x00000f07 (0x8) IX[B]
	[32] -1 0       0x00001000 - 0x0000107f (0x80) IX[B]
	[33] 0  0       0x000003b0 - 0x000003bb (0xc) IS[B]
	[34] 0  0       0x000003c0 - 0x000003df (0x20) IS[B]
(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
(==) FBDEV(0): Backing store disabled
(**) Option "dpms"
(**) FBDEV(0): DPMS enabled
(==) RandR enabled
(II) Setting vga for screen 0.
(**) Generic Keyboard: Core Keyboard
...
(II) USB Mouse: ps2EnableDataReporting: succeeded
Could not init font path element unix/:7100, removing from list!
Could not init font path element /usr/lib/X11/fonts/Speedo, removing from list!

So, the two strange things are the FBIOPAN_DISPLAY and the font server
messages.  I killed and restarted xfs.  That didn't fix the problem.
It seems the X server just exits.

The tests that I did yesterday were done remotely and the monitor was
off at the time.  I noticed one debian bug report about X not starting
when the monitor was off.  However, I had the same problem on the 26th
when I was trying to use the console.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
