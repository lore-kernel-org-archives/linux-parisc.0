Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp003pub.verizon.net (smtp003pub.verizon.net [206.46.170.182])
	by dsl2.external.hp.com (Postfix) with ESMTP id 344A8482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 13:00:33 -0700 (MST)
Received: from verizon.net (pool-151-201-224-254.pitt.east.verizon.net [151.201.224.254])
	by smtp003pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id fAEJxv324452
	Wed, 14 Nov 2001 13:59:58 -0600 (CST)
Message-ID: <3BF2CDD3.2030503@verizon.net>
Date: Wed, 14 Nov 2001 15:02:27 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------090207000509040806010706"
Subject: [parisc-linux] XFree86 and the 715/75 doesn't work
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
--------------090207000509040806010706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

The next thing I'd like to ask is support for X in the 715/75. I 
configured the kernel with "make oldconfig", Starting X generates the 
attached log. My XF86Config is also attached.

-- 
      Rafael

--------------090207000509040806010706
Content-Type: text/plain;
 name="XFree86.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="XFree86.0.log"


This is a pre-release version of XFree86, and is not supported in any
way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted
to fixes@XFree86.Org.  Before reporting bugs in pre-release versions,
please check the latest version in the XFree86 CVS repository
(http://www.XFree86.Org/cvs)

XFree86 Version 4.1.0.1 / X Window System
(protocol Version 11, revision 0, vendor release 6510)
Release Date: xx August 2001
	If the server is older than 6-12 months, or if your card is
	newer than the above date, look for a newer version before
	reporting problems.  (See http://www.XFree86.Org/FAQ)
Build Operating System: Linux 2.4.0-pa43 parisc64 [ELF] 
(==) Log file: "/var/log/XFree86.0.log", Time: Wed Nov 14 02:15:15 2001
(==) Using config file: "/etc/X11/XF86Config"
Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) ServerLayout "Simple Layout"
(**) |-->Screen "Screen 1" (0)
(**) |   |-->Monitor "lcd"
(**) |   |-->Device "fbdev"
(**) |-->Input Device "Mouse1"
(**) |-->Input Device "Keyboard1"
(**) Option "AutoRepeat" "500 30"
(**) Option "XkbRules" "xfree86"
(**) XKB: rules: "xfree86"
(**) Option "XkbModel" "hphil"
(**) XKB: model: "hphil"
(**) Option "XkbLayout" "us"
(**) XKB: layout: "us"
(==) Keyboard: CustomKeycode disabled
(**) FontPath set to "/usr/X11R6/lib/X11/fonts/misc/,/usr/X11R6/lib/X11/fonts/75dpi/:unscaled,/usr/X11R6/lib/X11/fonts/100dpi/:unscaled,/usr/X11R6/lib/X11/fonts/Type1/,/usr/X11R6/lib/X11/fonts/Speedo/,/usr/X11R6/lib/X11/fonts/75dpi/,/usr/X11R6/lib/X11/fonts/100dpi/"
(**) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(--) using VT number 7

(WW) Cannot open APM
(EE) No OS PCI support available
(II) Addressable bus resource ranges are
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
	[1] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) All system resource ranges:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
	mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400
(II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, pm2v,
	pm2, pm, 300sx, 500tx, mx, delta
	S3VIdentify
(II) S3VIRGE: driver (version 1.6.0) for S3 ViRGE chipsets: virge, 86C325,
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
	trio 3d/2x, 86C362, 86C368
(II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,
	SIS300, SIS630, SIS540
(II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,
	Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
	Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133, Twister,
	TwisterK
(II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320, cyber9388,
	cyber9397, cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4,
	tgui9420dgi, tgui9440agi, tgui9660, tgui9680, providia9682,
	providia9685, cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d,
	cyberbladei7, cyberbladei7d, cyberbladei1, cyberbladei1d,
	cyberbladeAi1, cyberbladeAi1d, cyberbladeXP, cyberbladeXPm
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, ct65525,
	ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,
	ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300
(II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,
	3dfx Voodoo3, 3dfx Voodoo5
(II) FBDev: driver for framebuffer: fbdev, afb
(II) ATI: ATI driver (version 6.3.6) for chipsets: ati
(II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
	ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),
	ATI Rage 128 RL (AGP), ATI Rage 128 Pro PD (PCI),
	ATI Rage 128 Pro PF (AGP), ATI Rage 128 Pro PP (PCI),
	ATI Rage 128 Pro PR (PCI), ATI Rage 128 Mobility LE (PCI),
	ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),
	ATI Rage 128 Mobility ML (AGP)
(II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
	ATI Radeon VE (AGP)
(II) imstt: driver (version 1.0.0 for IMS TwinTurbo chipsets : imstt128,
	imstt3d
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
(II) v4l driver for Video4Linux
	S3VProbe begin
(EE) No devices detected.

Fatal server error:
no screens found

When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please report problems to submit@bugs.debian.org.


--------------090207000509040806010706
Content-Type: text/plain;
 name="XF86Config"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="XF86Config"

#
# Copyright (c) 1999 by The XFree86 Project, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE XFREE86 PROJECT BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
# OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Except as contained in this notice, the name of the XFree86 Project shall
# not be used in advertising or otherwise to promote the sale, use or other
# dealings in this Software without prior written authorization from the
# XFree86 Project.
#

# **********************************************************************
# Refer to the XF86Config(4/5) man page for details about the format of
# this file.
# **********************************************************************

# **********************************************************************
# Module section -- this  section  is used to specify
# which dynamically loadable modules to load.
# **********************************************************************
#
Section "Module"

# This loads the DBE extension module.

    Load        "dbe"   # Double buffer extension

# This loads the miscellaneous extensions module, and disables
# initialisation of the XFree86-DGA extension within that module.
    SubSection  "extmod"
      Option    "omit xfree86-dga"   # don't initialise the DGA extension
    EndSubSection

# This loads the Type1 and FreeType font modules
    Load        "type1"
    Load        "freetype"

# This loads the GLX module
#    Load       "glx"

EndSection

# **********************************************************************
# Files section.  This allows default font and rgb paths to be set
# **********************************************************************

Section "Files"

# The location of the RGB database.  Note, this is the name of the
# file minus the extension (like ".txt" or ".db").  There is normally
# no need to change the default.

    RgbPath     "/usr/X11R6/lib/X11/rgb"

# Multiple FontPath entries are allowed (which are concatenated together),
# as well as specifying multiple comma-separated entries in one FontPath
# command (or a combination of both methods)
#
# If you don't have a floating point coprocessor and emacs, Mosaic or other
# programs take long to start up, try moving the Type1 and Speedo directory
# to the end of this list (or comment them out).
#

#    FontPath   "/usr/X11R6/lib/X11/fonts/local/"
    FontPath   "/usr/X11R6/lib/X11/fonts/misc/"
    FontPath   "/usr/X11R6/lib/X11/fonts/75dpi/:unscaled"
    FontPath   "/usr/X11R6/lib/X11/fonts/100dpi/:unscaled"
    FontPath   "/usr/X11R6/lib/X11/fonts/Type1/"
    FontPath   "/usr/X11R6/lib/X11/fonts/Speedo/"
    FontPath   "/usr/X11R6/lib/X11/fonts/75dpi/"
    FontPath   "/usr/X11R6/lib/X11/fonts/100dpi/"

# The module search path.  The default path is shown here.

#    ModulePath "/usr/X11R6/lib/modules"

EndSection

# **********************************************************************
# Server flags section.
# **********************************************************************

Section "ServerFlags"

# Uncomment this to cause a core dump at the spot where a signal is
# received.  This may leave the console in an unusable state, but may
# provide a better stack trace in the core dump to aid in debugging

#    Option "NoTrapSignals"

# Uncomment this to disable the <Crtl><Alt><BS> server abort sequence
# This allows clients to receive this key event.

#    Option "DontZap"

# Uncomment this to disable the <Crtl><Alt><KP_+>/<KP_-> mode switching
# sequences.  This allows clients to receive these key events.

#    Option "Dont Zoom"

# Uncomment this to disable tuning with the xvidtune client. With
# it the client can still run and fetch card and monitor attributes,
# but it will not be allowed to change them. If it tries it will
# receive a protocol error.

#    Option "DisableVidModeExtension"

# Uncomment this to enable the use of a non-local xvidtune client.

#    Option "AllowNonLocalXvidtune"

# Uncomment this to disable dynamically modifying the input device
# (mouse and keyboard) settings.

#    Option "DisableModInDev"

# Uncomment this to enable the use of a non-local client to
# change the keyboard or mouse settings (currently only xset).

#    Option "AllowNonLocalModInDev"

EndSection

# **********************************************************************
# Input devices
# **********************************************************************

# **********************************************************************
# Core keyboard's InputDevice section
# **********************************************************************

Section "InputDevice"

    Identifier  "Keyboard1"
    Driver      "Keyboard"
# For most OSs the protocol can be omitted (it defaults to "Standard").
# When using XQUEUE (only for SVR3 and SVR4, but not Solaris),
# uncomment the following line.

#    Option     "Protocol"      "Xqueue"

    Option "AutoRepeat" "500 30"

# Specify which keyboard LEDs can be user-controlled (eg, with xset(1))
#    Option     "Xleds"      "1 2 3"

#    Option "LeftAlt"     "Meta"
#    Option "RightAlt"    "ModeShift"

# To customise the XKB settings to suit your keyboard, modify the
# lines below (which are the defaults).  For example, for a non-U.S.
# keyboard, you will probably want to use:
#    Option "XkbModel"    "pc102"
# If you have a US Microsoft Natural keyboard, you can use:
#    Option "XkbModel"    "microsoft"
#
# Then to change the language, change the Layout setting.
# For example, a german layout can be obtained with:
#    Option "XkbLayout"   "de"
# or:
#    Option "XkbLayout"   "de"
#    Option "XkbVariant"  "nodeadkeys"
#
# If you'd like to switch the positions of your capslock and
# control keys, use:
#    Option "XkbOptions"  "ctrl:swapcaps"

# These are the default XKB settings for XFree86
#    Option "XkbRules"    "xfree86"
#    Option "XkbModel"    "pc101"
#    Option "XkbLayout"   "us"
#    Option "XkbVariant"  ""
#    Option "XkbOptions"  ""

#    Option "XkbDisable"

    Option "XkbRules"   "xfree86"
    Option "XkbModel"   "hphil"
    Option "XkbLayout"  "us"
#    Option "XkbVariant"        "nodeadkeys"

EndSection

# **********************************************************************
# Core Pointer's InputDevice section
# **********************************************************************

Section "InputDevice"

# Identifier and driver

    Identifier  "Mouse1"
    Driver      "mouse"
    Option "Protocol"    "PS/2"
    Option "Device"      "/dev/mouse"

# When using XQUEUE, comment out the above two lines, and uncomment
# the following line.

#    Option "Protocol"  "Xqueue"

# Baudrate and SampleRate are only for some Logitech mice. In
# almost every case these lines should be omitted.

#    Option "BaudRate"  "9600"
#    Option "SampleRate"        "150"

# Emulate3Buttons is an option for 2-button Microsoft mice
# Emulate3Timeout is the timeout in milliseconds (default is 50ms)

#    Option "Emulate3Buttons"
#    Option "Emulate3Timeout"    "100"

# ChordMiddle is an option for some 3-button Logitech mice

#    Option "ChordMiddle"

EndSection

# **********************************************************************
# Monitor section
# **********************************************************************

# Any number of monitor sections may be present

Section "Monitor"

    Identifier  "lcd"

    HorizSync   61-78
    VertRefresh 57-73
    UseModes     "Modes[1]"
EndSection

Section "Modes"
  Identifier   "Modes[1]"
  Modeline      "1280x1024" 135 1280 1344 1536 1728 1024 1027 1030 1085
EndSection

# **********************************************************************
# Graphics device section
# **********************************************************************

Section "Device"
    Identifier  "fbdev"
    Driver      "fbdev"
    #VideoRam    8192
    # Insert Clocks lines here if appropriate
EndSection

# **********************************************************************
# Screen sections
# **********************************************************************

# Any number of screen sections may be present.  Each describes
# the configuration of a single screen.  A single specific screen section
# may be specified from the X server command line with the "-screen"
# option.
Section "Screen"
    Identifier  "Screen 1"
    Device      "fbdev"
    Monitor     "lcd"
    DefaultDepth 8

    Subsection "Display"
        Depth       8
        Modes       "1280x1024"
        ViewPort    0 0
    EndSubsection
    Subsection "Display"
        Depth       16
        Modes       "1280x1024"
        ViewPort    0 0
    EndSubsection
    Subsection "Display"
        Depth       24
        Modes       "1024x768"
        ViewPort    0 0
    EndSubsection
EndSection

# **********************************************************************
# ServerLayout sections.
# **********************************************************************

# Any number of ServerLayout sections may be present.  Each describes
# the way multiple screens are organised.  A specific ServerLayout
# section may be specified from the X server command line with the
# "-layout" option.  In the absence of this, the first section is used.
# When now ServerLayout section is present, the first Screen section
# is used alone.

Section "ServerLayout"

# The Identifier line must be present
    Identifier  "Simple Layout"

# Each Screen line specifies a Screen section name, and optionally
# the relative position of other screens.  The four names after
# primary screen name are the screens to the top, bottom, left and right
# of the primary screen.  In this example, screen 2 is located to the
# right of screen 1.

    Screen "Screen 1"

# Each InputDevice line specifies an InputDevice section name and
# optionally some options to specify the way the device is to be
# used.  Those options include "CorePointer", "CoreKeyboard" and
# "SendCoreEvents".

    InputDevice "Mouse1" "CorePointer"
    InputDevice "Keyboard1" "CoreKeyboard"

EndSection


--------------090207000509040806010706--
