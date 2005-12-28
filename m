From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] X startup failure
Date: Wed, 28 Dec 2005 18:01:28 -0500 (EST)
Message-ID: <200512282301.jBSN1SX1028943@hiauly1.hia.nrc.ca>
References: <20051228223113.GA22014@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051228223113.GA22014@quicksilver.road.mcmartin.ca> from "Kyle
	McMartin" at Dec 28, 2005 05:31:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Try installing xserver-xorg. That should help.

Still no joy.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

X Window System Version 6.8.2 (Debian 6.8.2.dfsg.1-11 20051202210922 root@)
Release Date: 9 February 2005
X Protocol Version 11, Revision 0, Release 6.8.2
Build Operating System: Linux 2.6.12-1-64-smp parisc64 [ELF] 
Current Operating System: Linux hiauly6 2.6.15-rc6-pa1 #1 Mon Dec 19 15:13:14 MST 2005 parisc
Build Date: 02 December 2005
	Before reporting problems, check http://wiki.X.Org
	to make sure that you have the latest version.
OS Kernel: Linux version 2.6.15-rc6-pa1 (bame@palinux) (gcc version 3.3.5 (Debian 1:3.3.5-13)) #1 Mon Dec 19 15:13:14 MST 2005 
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Wed Dec 28 17:55:22 2005
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "NEC LCD1980SX"
(**) |   |-->Device "PCI_GRAFFITIX1280"
(**) |-->Input Device "Generic Keyboard"
(**) Option "XkbRules" "xfree86"
(**) XKB: rules: "xfree86"
(**) Option "XkbModel" "pc104"
(**) XKB: model: "pc104"
(**) Option "XkbLayout" "us"
(**) XKB: layout: "us"
(==) Keyboard: CustomKeycode disabled
(**) |-->Input Device "USB Mouse"
(**) FontPath set to "unix/:7100,/usr/lib/X11/fonts/misc,/usr/lib/X11/fonts/cyrillic,/usr/lib/X11/fonts/100dpi/:unscaled,/usr/lib/X11/fonts/75dpi/:unscaled,/usr/lib/X11/fonts/Type1,/usr/lib/X11/fonts/Speedo,/usr/lib/X11/fonts/100dpi,/usr/lib/X11/fonts/75dpi"
(==) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(WW) Open APM failed (/dev/apm_bios) (No such file or directory)
(--) using VT number 2

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:0c:0: chip 1011,0019 card 103c,104f rev 41 class 02,00,00 hdr 00
(II) PCI: 00:0d:0: chip 11d4,1889 card 11d4,1889 rev 00 class 04,01,00 hdr 00
(II) PCI: 00:0e:0: chip 100b,0002 card 0000,0000 rev 03 class 01,01,8f hdr 80
(II) PCI: 00:0e:1: chip 100b,000e card 0000,0000 rev 01 class 06,80,00 hdr 80
(II) PCI: 00:0e:2: chip 100b,0012 card 0000,0000 rev 02 class 0c,03,10 hdr 80
(II) PCI: 00:0f:0: chip 1000,000b card 1000,1000 rev 07 class 01,00,00 hdr 80
(II) PCI: 00:0f:1: chip 1000,000b card 1000,1000 rev 07 class 01,00,00 hdr 80
(II) PCI: 01:06:0: chip 1011,0019 card 103c,1067 rev 21 class 02,00,00 hdr 00
(II) PCI: 02:03:0: chip 103c,1005 card 0000,0000 rev 03 class 03,80,00 hdr 00
(II) PCI: 03:02:0: chip 103c,1008 card 0000,0000 rev 02 class 03,80,00 hdr 00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (0,0,0), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Host-to-PCI bridge:
(II) Bus 1: bridge is at (0:0:0), (1,1,0), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 1 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 1 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 1 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Host-to-PCI bridge:
(II) Bus 2: bridge is at (0:0:0), (2,2,0), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 2 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 2 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 2 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Host-to-PCI bridge:
(II) Bus 3: bridge is at (0:0:0), (3,3,0), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 3 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 3 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 3 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(--) PCI: (2:3:0) Hewlett-Packard Company A4977A Visualize EG rev 3, Mem @ 0xf8000000/25, BIOS @ 0xf6000000/16
(--) PCI: (3:2:0) Hewlett-Packard Company Visualize FX4 rev 2, Mem @ 0xfa000000/25, BIOS @ 0xf7000000/21
(II) Addressable bus resource ranges are
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
	[1] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) Active PCI resource ranges:
	[0] -1	0	0xf4800000 - 0xf480007f (0x80) MX[B]
	[1] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[2] -1	0	0xf4004000 - 0xf40043ff (0x400) MX[B]
	[3] -1	0	0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[4] -1	0	0xf4005000 - 0xf40053ff (0x400) MX[B]
	[5] -1	0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[6] -1	0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[7] -1	0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[8] -1	0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[9] -1	0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[10] -1	0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[11] -1	0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[12] -1	0	0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[13] -1	0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[14] -1	0	0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
	[15] -1	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[16] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[17] -1	0	0x00000800 - 0x000008ff (0x100) IX[B]
	[18] -1	0	0x00000900 - 0x000009ff (0x100) IX[B]
	[19] -1	0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[20] -1	0	0x00000b00 - 0x00000b03 (0x4) IX[B]
	[21] -1	0	0x00000d00 - 0x00000d07 (0x8) IX[B]
	[22] -1	0	0x00000e00 - 0x00000e03 (0x4) IX[B]
	[23] -1	0	0x00000f00 - 0x00000f07 (0x8) IX[B]
	[24] -1	0	0x00001000 - 0x0000107f (0x80) IX[B]
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0	0xf4800000 - 0xf480007f (0x80) MX[B]
	[1] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[2] -1	0	0xf4004000 - 0xf40043ff (0x400) MX[B]
	[3] -1	0	0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[4] -1	0	0xf4005000 - 0xf40053ff (0x400) MX[B]
	[5] -1	0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[6] -1	0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[7] -1	0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[8] -1	0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[9] -1	0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[10] -1	0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[11] -1	0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[12] -1	0	0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[13] -1	0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[14] -1	0	0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
	[15] -1	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[16] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[17] -1	0	0x00000800 - 0x000008ff (0x100) IX[B]
	[18] -1	0	0x00000900 - 0x000009ff (0x100) IX[B]
	[19] -1	0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[20] -1	0	0x00000b00 - 0x00000b03 (0x4) IX[B]
	[21] -1	0	0x00000d00 - 0x00000d07 (0x8) IX[B]
	[22] -1	0	0x00000e00 - 0x00000e03 (0x4) IX[B]
	[23] -1	0	0x00000f00 - 0x00000f07 (0x8) IX[B]
	[24] -1	0	0x00001000 - 0x0000107f (0x80) IX[B]
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) All system resource ranges:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0	0xf4800000 - 0xf480007f (0x80) MX[B]
	[3] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[4] -1	0	0xf4004000 - 0xf40043ff (0x400) MX[B]
	[5] -1	0	0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[6] -1	0	0xf4005000 - 0xf40053ff (0x400) MX[B]
	[7] -1	0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[8] -1	0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[9] -1	0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[10] -1	0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[11] -1	0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[12] -1	0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[13] -1	0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[14] -1	0	0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[15] -1	0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[16] -1	0	0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
	[17] -1	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[20] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[21] -1	0	0x00000800 - 0x000008ff (0x100) IX[B]
	[22] -1	0	0x00000900 - 0x000009ff (0x100) IX[B]
	[23] -1	0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[24] -1	0	0x00000b00 - 0x00000b03 (0x4) IX[B]
	[25] -1	0	0x00000d00 - 0x00000d07 (0x8) IX[B]
	[26] -1	0	0x00000e00 - 0x00000e03 (0x4) IX[B]
	[27] -1	0	0x00000f00 - 0x00000f07 (0x8) IX[B]
	[28] -1	0	0x00001000 - 0x0000107f (0x80) IX[B]
(II) ATI: ATI driver (version 6.5.6) for chipset: ati
(II) R128: Driver for ATI Rage 128 chipsets:
	ATI Rage 128 Mobility M3 LE (PCI), ATI Rage 128 Mobility M3 LF (AGP),
	ATI Rage 128 Mobility M4 MF (AGP), ATI Rage 128 Mobility M4 ML (AGP),
	ATI Rage 128 Pro GL PA (AGP?), ATI Rage 128 Pro GL PB (AGP?),
	ATI Rage 128 Pro GL PC (AGP?), ATI Rage 128 Pro GL PD (PCI),
	ATI Rage 128 Pro GL PE (AGP?), ATI Rage 128 Pro GL PF (AGP),
	ATI Rage 128 Pro VR PG (AGP?), ATI Rage 128 Pro VR PH (AGP?),
	ATI Rage 128 Pro VR PI (AGP?), ATI Rage 128 Pro VR PJ (AGP?),
	ATI Rage 128 Pro VR PK (AGP?), ATI Rage 128 Pro VR PL (AGP?),
	ATI Rage 128 Pro VR PM (AGP?), ATI Rage 128 Pro VR PN (AGP?),
	ATI Rage 128 Pro VR PO (AGP?), ATI Rage 128 Pro VR PP (PCI),
	ATI Rage 128 Pro VR PQ (AGP?), ATI Rage 128 Pro VR PR (PCI),
	ATI Rage 128 Pro VR PS (AGP?), ATI Rage 128 Pro VR PT (AGP?),
	ATI Rage 128 Pro VR PU (AGP?), ATI Rage 128 Pro VR PV (AGP?),
	ATI Rage 128 Pro VR PW (AGP?), ATI Rage 128 Pro VR PX (AGP?),
	ATI Rage 128 GL RE (PCI), ATI Rage 128 GL RF (AGP),
	ATI Rage 128 RG (AGP), ATI Rage 128 VR RK (PCI),
	ATI Rage 128 VR RL (AGP), ATI Rage 128 4X SE (AGP?),
	ATI Rage 128 4X SF (AGP?), ATI Rage 128 4X SG (AGP?),
	ATI Rage 128 4X SH (AGP?), ATI Rage 128 4X SK (AGP?),
	ATI Rage 128 4X SL (AGP?), ATI Rage 128 4X SM (AGP),
	ATI Rage 128 4X SN (AGP?), ATI Rage 128 Pro ULTRA TF (AGP),
	ATI Rage 128 Pro ULTRA TL (AGP), ATI Rage 128 Pro ULTRA TR (AGP),
	ATI Rage 128 Pro ULTRA TS (AGP?), ATI Rage 128 Pro ULTRA TT (AGP?),
	ATI Rage 128 Pro ULTRA TU (AGP?)
(II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
	ATI Radeon VE/7000 QY (AGP/PCI), ATI Radeon VE/7000 QZ (AGP/PCI),
	ATI Radeon Mobility M7 LW (AGP),
	ATI Mobility FireGL 7800 M7 LX (AGP),
	ATI Radeon Mobility M6 LY (AGP), ATI Radeon Mobility M6 LZ (AGP),
	ATI Radeon IGP320 (A3) 4136, ATI Radeon IGP320M (U1) 4336,
	ATI Radeon IGP330/340/350 (A4) 4137,
	ATI Radeon IGP330M/340M/350M (U2) 4337,
	ATI Radeon 7000 IGP (A4+) 4237, ATI Radeon Mobility 7000 IGP 4437,
	ATI FireGL 8700/8800 QH (AGP), ATI Radeon 8500 QL (AGP),
	ATI Radeon 9100 QM (AGP), ATI Radeon 8500 AIW BB (AGP),
	ATI Radeon 8500 AIW BC (AGP), ATI Radeon 7500 QW (AGP/PCI),
	ATI Radeon 7500 QX (AGP/PCI), ATI Radeon 9000/PRO If (AGP/PCI),
	ATI Radeon 9000 Ig (AGP/PCI), ATI FireGL Mobility 9000 (M9) Ld (AGP),
	ATI Radeon Mobility 9000 (M9) Lf (AGP),
	ATI Radeon Mobility 9000 (M9) Lg (AGP),
	ATI Radeon 9100 IGP (A5) 5834,
	ATI Radeon Mobility 9100 IGP (U3) 5835, ATI Radeon 9100 PRO IGP 7834,
	ATI Radeon Mobility 9200 IGP 7835, ATI Radeon 9200PRO 5960 (AGP),
	ATI Radeon 9200 5961 (AGP), ATI Radeon 9200 5962 (AGP),
	ATI Radeon 9200SE 5964 (AGP), ATI FireMV 2200 (PCI),
	ATI Radeon Mobility 9200 (M9+) 5C61 (AGP),
	ATI Radeon Mobility 9200 (M9+) 5C63 (AGP), ATI Radeon 9500 AD (AGP),
	ATI Radeon 9500 AE (AGP), ATI Radeon 9600TX AF (AGP),
	ATI FireGL Z1 AG (AGP), ATI Radeon 9700 Pro ND (AGP),
	ATI Radeon 9700/9500Pro NE (AGP), ATI Radeon 9700 NF (AGP),
	ATI FireGL X1 NG (AGP), ATI Radeon 9600 AP (AGP),
	ATI Radeon 9600SE AQ (AGP), ATI Radeon 9600XT AR (AGP),
	ATI Radeon 9600 AS (AGP), ATI FireGL T2 AT (AGP),
	ATI FireGL RV360 AV (AGP),
	ATI Radeon Mobility 9600/9700 (M10/M11) NP (AGP),
	ATI Radeon Mobility 9600 (M10) NQ (AGP),
	ATI Radeon Mobility 9600 (M11) NR (AGP),
	ATI Radeon Mobility 9600 (M10) NS (AGP),
	ATI FireGL Mobility T2 (M10) NT (AGP),
	ATI FireGL Mobility T2e (M11) NV (AGP), ATI Radeon 9650,
	ATI Radeon 9800SE AH (AGP), ATI Radeon 9800 AI (AGP),
	ATI Radeon 9800 AJ (AGP), ATI FireGL X2 AK (AGP),
	ATI Radeon 9800PRO NH (AGP), ATI Radeon 9800 NI (AGP),
	ATI FireGL X2 NK (AGP), ATI Radeon 9800XT NJ (AGP),
	ATI Radeon X600 (RV380) 3E50 (PCIE),
	ATI FireGL V3200 (RV380) 3E54 (PCIE),
	ATI Radeon Mobility X600 (M24) 3150 (PCIE),
	ATI FireGL M24 GL 3154 (PCIE), ATI Radeon X300 (RV370) 5B60 (PCIE),
	ATI Radeon X600 (RV370) 5B62 (PCIE),
	ATI FireGL V3100 (RV370) 5B64 (PCIE),
	ATI FireGL D1100 (RV370) 5B65 (PCIE),
	ATI Radeon Mobility M300 (M22) 5460 (PCIE),
	ATI FireGL M22 GL 5464 (PCIE), ATI Radeon XPRESS 200 5A41 (PCIE),
	ATI Radeon XPRESS 200M 5A42 (PCIE),
	ATI Radeon XPRESS 200 5A61 (PCIE),
	ATI Radeon XPRESS 200M 5A62 (PCIE),
	ATI Radeon XPRESS 200 5954 (PCIE),
	ATI Radeon XPRESS 200M 5955 (PCIE),
	ATI Radeon XPRESS 200 5974 (PCIE),
	ATI Radeon XPRESS 200M 5975 (PCIE), ATI FireGL V5000 (RV410) (PCIE),
	ATI Mobility FireGL V5000 (M26) (PCIE),
	ATI Mobility FireGL V5000 (M26) (PCIE),
	ATI Mobility Radeon X700 (M26) (PCIE),
	ATI Mobility Radeon X700 (M26) (PCIE),
	ATI Radeon X700 PRO (RV410) (PCIE),
	ATI Radeon X700 XT (RV410) (PCIE), ATI Radeon X700 (RV410) (PCIE),
	ATI Radeon X700 SE (RV410) (PCIE), ATI Radeon X700 SE (RV410) (PCIE),
	ATI Radeon X800 (R420) JH (AGP), ATI Radeon X800PRO (R420) JI (AGP),
	ATI Radeon X800SE (R420) JJ (AGP), ATI Radeon X800 (R420) JK (AGP),
	ATI Radeon X800 (R420) JL (AGP), ATI FireGL X3 (R420) JM (AGP),
	ATI Radeon Mobility 9800 (M18) JN (AGP),
	ATI Radeon X800XT (R420) JP (AGP), ATI Radeon X800 SE (R420) (AGP),
	ATI Radeon X800 (R423) UH (PCIE),
	ATI Radeon X800PRO (R423) UI (PCIE),
	ATI Radeon X800LE (R423) UJ (PCIE),
	ATI Radeon X800SE (R423) UK (PCIE),
	ATI FireGL V7200 (R423) UQ (PCIE), ATI FireGL V5100 (R423) UR (PCIE),
	ATI FireGL V7100 (R423) UT (PCIE),
	ATI Radeon X800XT (R423) 5D57 (PCIE), ATI FireGL V7100 (R423) (PCIE),
	ATI Mobility FireGL V5100 (M28) (PCIE),
	ATI Mobility Radeon X800 (M28) (PCIE),
	ATI Mobility Radeon X800 XT (M28) (PCIE),
	ATI Radeon X800 (R430) (PCIE), ATI Radeon X800 XL (R430) (PCIE),
	ATI Radeon X800 SE (R430) (PCIE), ATI Radeon X800 XTP (R430) (PCIE),
	ATI Radeon X850 5D4C (PCIE), ATI Radeon FireGL (R480) GL 5D50 (PCIE),
	ATI Radeon X850 SE (R480) (PCIE), ATI Radeon X850 PRO (R480) (PCIE),
	ATI Radeon X850 XT (R480) (PCIE),
	ATI Radeon X850 XT PE (R480) (PCIE),
	ATI Radeon X850 PRO (R480) (AGP), ATI Radeon X850 SE (R480) (AGP),
	ATI Radeon X850 XT (R480) (AGP), ATI Radeon X850 XT PE (R480) (AGP)
(II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
	mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400,
	mgag550
(II) GLINT: driver for 3Dlabs chipsets: gamma, gamma2, ti_pm2, ti_pm, r4,
	pm4, pm3, pm2v, pm2, pm, 300sx, 500tx, mx, delta
(II) NV: driver for NVIDIA chipsets: RIVA 128, RIVA TNT, RIVA TNT2,
	Unknown TNT2, Vanta, RIVA TNT2 Ultra, RIVA TNT2 Model 64,
	Aladdin TNT2, GeForce 256, GeForce DDR, Quadro, GeForce2 MX/MX 400,
	GeForce2 MX 100/200, GeForce2 Go, Quadro2 MXR/EX/Go,
	GeForce2 Integrated GPU, GeForce2 GTS, GeForce2 Ti, GeForce2 Ultra,
	Quadro2 Pro, GeForce4 MX 460, GeForce4 MX 440, GeForce4 MX 420,
	GeForce4 MX 440-SE, GeForce4 440 Go, GeForce4 420 Go,
	GeForce4 420 Go 32M, GeForce4 460 Go, Quadro4 550 XGL,
	GeForce4 440 Go 64M, Quadro4 NVS, Quadro4 500 GoGL,
	GeForce4 410 Go 16M, GeForce4 MX 440 with AGP8X,
	GeForce4 MX 440SE with AGP8X, GeForce4 MX 420 with AGP8X,
	GeForce4 MX 4000, GeForce4 448 Go, GeForce4 488 Go, Quadro4 580 XGL,
	Quadro4 280 NVS, Quadro4 380 XGL, Quadro NVS 50 PCI, GeForce4 448 Go,
	GeForce4 MX Integrated GPU, GeForce3, GeForce3 Ti 200,
	GeForce3 Ti 500, Quadro DCC, GeForce4 Ti 4600, GeForce4 Ti 4400,
	0x0252, GeForce4 Ti 4200, Quadro4 900 XGL, Quadro4 750 XGL,
	Quadro4 700 XGL, GeForce4 Ti 4800, GeForce4 Ti 4200 with AGP8X,
	GeForce4 Ti 4800 SE, GeForce4 4200 Go, Quadro4 700 GoGL,
	Quadro4 980 XGL, Quadro4 780 XGL, GeForce FX 5800 Ultra,
	GeForce FX 5800, Quadro FX 2000, Quadro FX 1000,
	GeForce FX 5600 Ultra, GeForce FX 5600, 0x0313, GeForce FX 5600SE,
	0x0316, 0x0317, GeForce FX Go5600, GeForce FX Go5650,
	Quadro FX Go700, 0x031D, 0x031E, 0x031F, GeForce FX 5200,
	GeForce FX 5200 Ultra, GeForce FX 5200, GeForce FX 5200SE,
	GeForce FX Go5200, GeForce FX Go5250, GeForce FX 5500,
	GeForce FX 5100, GeForce FX Go5200 32M/64M, 0x0329,
	Quadro NVS 280 PCI, Quadro FX 500/600 PCI, GeForce FX Go53xx Series,
	GeForce FX Go5100, 0x032F, GeForce FX 5900 Ultra, GeForce FX 5900,
	GeForce FX 5900XT, GeForce FX 5950 Ultra, Quadro FX 700,
	GeForce FX 5900ZT, Quadro FX 3000, GeForce FX 5700 Ultra,
	GeForce FX 5700, GeForce FX 5700LE, GeForce FX 5700VE, 0x0345,
	GeForce FX Go5700, GeForce FX Go5700, 0x0349, 0x034B,
	Quadro FX Go1000, Quadro FX 1100, 0x034F, GeForce 6800 Ultra,
	GeForce 6800, GeForce 6800 LE, 0x0043, GeForce 6800 GT, 0x0049,
	Quadro FX 4000, Quadro FX 4400, 0x00C0, 0x00C1, GeForce 6800 LE,
	0x00C8, 0x00C9, 0x00CC, 0x00CE, GeForce 6600 GT, GeForce 6600,
	0x0142, 0x0143, GeForce Go 6600, GeForce 6610 XL,
	GeForce Go 6600 TE/6200 TE, 0x0147, GeForce Go 6600, 0x0149, 0x014B,
	0x014C, 0x014D, Quadro FX 540, GeForce 6200, 0x0160, 0x0166, 0x0210,
	0x0211, 0x021D, 0x021E
(II) S3: driver (version 0.3.5 for S3 chipset: 964-0, 964-1, 968,
	Trio32/64, Aurora64V+, Trio64UV+, Trio64V2/DX/GX
(II) S3VIRGE: driver (version 1.8.6) for S3 ViRGE chipsets: virge, 86C325,
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
	trio 3d/2x, 86C362, 86C368
(II) SIS: driver for SiS chipsets: SIS5597/5598, SIS530/620,
	SIS6326/AGP/DVD, SIS300/305, SIS630/730, SIS540, SIS315, SIS315H,
	SIS315PRO, SIS550, SIS650/M650/651/740, SIS330(Xabre),
	SIS660/661FX/M661FX/M661MX/741/741GX/M741/760/M760, SIS340
(II) SAVAGE: driver (version 2.0.0) for S3 Savage chipsets: Savage4,
	Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
	Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133,
	Twister PN133, Twister KN133, SuperSavage/MX 128, SuperSavage/MX 64,
	SuperSavage/MX 64C, SuperSavage/IX 128, SuperSavage/IX 128,
	SuperSavage/IX 64, SuperSavage/IX 64, SuperSavage/IXC 64,
	SuperSavage/IXC 64, ProSavage DDR, ProSavage DDR-K
(II) TRIDENT: driver for Trident chipsets: tvga9000, tvga9000i, tvga8900c,
	tvga8900d, tvga9200cxr, tgui9400cxi, cyber9320, cyber9388, cyber9397,
	cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4, tgui9420dgi,
	tgui9440agi, tgui9660, tgui9680, providia9682, providia9685,
	cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d, cyberbladei7,
	cyberbladei7d, cyberbladei1, cyberbladei1d, cyberbladeAi1,
	cyberbladeAi1d, bladeXP, cyberbladeXPAi1, cyberbladeXP4
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, ct65525,
	ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,
	ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300
(II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,
	3dfx Voodoo3, 3dfx Voodoo5
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
(II) FBDEV: driver for framebuffer: fbdev
(II) v4l driver for Video4Linux
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0	0xf4800000 - 0xf480007f (0x80) MX[B]
	[3] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[4] -1	0	0xf4004000 - 0xf40043ff (0x400) MX[B]
	[5] -1	0	0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[6] -1	0	0xf4005000 - 0xf40053ff (0x400) MX[B]
	[7] -1	0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[8] -1	0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[9] -1	0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[10] -1	0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[11] -1	0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[12] -1	0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[13] -1	0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[14] -1	0	0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[15] -1	0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[16] -1	0	0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
	[17] -1	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[20] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[21] -1	0	0x00000800 - 0x000008ff (0x100) IX[B]
	[22] -1	0	0x00000900 - 0x000009ff (0x100) IX[B]
	[23] -1	0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[24] -1	0	0x00000b00 - 0x00000b03 (0x4) IX[B]
	[25] -1	0	0x00000d00 - 0x00000d07 (0x8) IX[B]
	[26] -1	0	0x00000e00 - 0x00000e03 (0x4) IX[B]
	[27] -1	0	0x00000f00 - 0x00000f07 (0x8) IX[B]
	[28] -1	0	0x00001000 - 0x0000107f (0x80) IX[B]
(**) FBDEV(0): claimed PCI slot 2:3:0
(II) FBDEV(0): using default device
(II) resource ranges after probing:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1	0	0xf4800000 - 0xf480007f (0x80) MX[B]
	[3] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[4] -1	0	0xf4004000 - 0xf40043ff (0x400) MX[B]
	[5] -1	0	0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[6] -1	0	0xf4005000 - 0xf40053ff (0x400) MX[B]
	[7] -1	0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[8] -1	0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[9] -1	0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[10] -1	0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[11] -1	0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[12] -1	0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[13] -1	0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[14] -1	0	0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[15] -1	0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[16] -1	0	0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
	[17] -1	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[18] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[19] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[20] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[21] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[22] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[23] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[24] -1	0	0x00000800 - 0x000008ff (0x100) IX[B]
	[25] -1	0	0x00000900 - 0x000009ff (0x100) IX[B]
	[26] -1	0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[27] -1	0	0x00000b00 - 0x00000b03 (0x4) IX[B]
	[28] -1	0	0x00000d00 - 0x00000d07 (0x8) IX[B]
	[29] -1	0	0x00000e00 - 0x00000e03 (0x4) IX[B]
	[30] -1	0	0x00000f00 - 0x00000f07 (0x8) IX[B]
	[31] -1	0	0x00001000 - 0x0000107f (0x80) IX[B]
	[32] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[33] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(==) FBDEV(0): Default visual is PseudoColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware: stifb (video memory: 2048kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0): 	mode "1280x1024" ok
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDEV(0):  Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
(II) FBDEV(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync
(++) FBDEV(0): DPI set to (100, 100)
(**) FBDEV(0): using shadow framebuffer
(II) resource ranges after preInit:
	[0] 0	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B]
	[1] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[2] -1	0	0x00000000 - 0x00000000 (0x1) MX[B]
	[3] -1	0	0xf4800000 - 0xf480007f (0x80) MX[B]
	[4] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[5] -1	0	0xf4004000 - 0xf40043ff (0x400) MX[B]
	[6] -1	0	0xf4002000 - 0xf4003fff (0x2000) MX[B]
	[7] -1	0	0xf4005000 - 0xf40053ff (0x400) MX[B]
	[8] -1	0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[9] -1	0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[10] -1	0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[11] -1	0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[12] -1	0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[13] -1	0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[14] -1	0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[15] -1	0	0xf7000000 - 0xf71fffff (0x200000) MX[B](B)
	[16] -1	0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[17] -1	0	0xf6000000 - 0xf600ffff (0x10000) MX[B](B)
	[18] -1	0	0xf8000000 - 0xf9ffffff (0x2000000) MX[B](B)
	[19] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[20] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[21] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[22] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[24] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[25] -1	0	0x00000800 - 0x000008ff (0x100) IX[B]
	[26] -1	0	0x00000900 - 0x000009ff (0x100) IX[B]
	[27] -1	0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[28] -1	0	0x00000b00 - 0x00000b03 (0x4) IX[B]
	[29] -1	0	0x00000d00 - 0x00000d07 (0x8) IX[B]
	[30] -1	0	0x00000e00 - 0x00000e03 (0x4) IX[B]
	[31] -1	0	0x00000f00 - 0x00000f07 (0x8) IX[B]
	[32] -1	0	0x00001000 - 0x0000107f (0x80) IX[B]
	[33] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[34] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
(==) FBDEV(0): Backing store disabled
(**) Option "dpms"
(**) FBDEV(0): DPMS enabled
(==) RandR enabled
(II) Setting vga for screen 0.
(**) Generic Keyboard: Core Keyboard
(**) Option "Protocol" "standard"
(**) Generic Keyboard: Protocol: standard
(**) Option "AutoRepeat" "500 30"
(**) Option "XkbRules" "xfree86"
(**) Generic Keyboard: XkbRules: "xfree86"
(**) Option "XkbModel" "pc104"
(**) Generic Keyboard: XkbModel: "pc104"
(**) Option "XkbLayout" "us"
(**) Generic Keyboard: XkbLayout: "us"
(**) Option "CustomKeycodes" "off"
(**) Generic Keyboard: CustomKeycodes disabled
(**) Option "Protocol" "ImPS/2"
(**) USB Mouse: Device: "/dev/input/mice"
(**) USB Mouse: Protocol: "ImPS/2"
(**) Option "SendCoreEvents" "true"
(**) USB Mouse: always reports core events
(**) Option "CorePointer"
(**) USB Mouse: Core Pointer
(**) Option "Device" "/dev/input/mice"
(**) Option "Emulate3Buttons" "true"
(**) USB Mouse: Emulate3Buttons, Emulate3Timeout: 50
(**) Option "ZAxisMapping" "4 5"
(**) USB Mouse: ZAxisMapping: buttons 4 and 5
(**) USB Mouse: Buttons: 5
(II) XINPUT: Adding extended input device "USB Mouse" (type: MOUSE)
(II) XINPUT: Adding extended input device "Generic Keyboard" (type: KEYBOARD)
(II) USB Mouse: ps2EnableDataReporting: succeeded
Could not init font path element unix/:7100, removing from list!
Could not init font path element /usr/lib/X11/fonts/Speedo, removing from list!
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
