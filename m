Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel2.hp.com (palrel2.hp.com [156.153.255.234])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C7E6482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Aug 2001 16:57:32 -0600 (MDT)
Received: from i3107at1.atl.hp.com (i3107at1.atl.hp.com [15.45.88.34])
	by palrel2.hp.com (Postfix) with ESMTP id 1DF9A1679
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Aug 2001 15:57:31 -0700 (PDT)
Received: from hp.com (cas1@wahoo.atl.hp.com [15.50.81.145])
	by i3107at1.atl.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with ESMTP id SAA24090
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Aug 2001 18:57:43 -0400 (EDT)
Sender: cas1@i3107at1.atl.hp.com
Message-ID: <3B7AFE59.160764FE@hp.com>
Date: Wed, 15 Aug 2001 18:57:29 -0400
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] XFree86 - white pixel is blue
List-ID: <linux-parisc.vger.kernel.org>

I just loaded the ISO on a 712/60 and setup XFree86 to use the fbdev
driver. It seems to be OK, with the exception that "white" is "blue". If
I xwd the root  window dump and examine it on another X display, it
looks fine.

I know the monitor and cable are good. Also, the "HP" logo seen at the
boot is displayed correctly as is the STI text. I dug through the
mailing list archive, but can't find a similar case. 

Has anyone else seen this or have a suggestion of how to resolve the
problem? 

I'm including my XF86Config-4 file below.

-chuck


Section "ServerLayout"
        Identifier      "Single Head"
        Screen          0               "Screen0"
        InputDevice     "Mouse0"        "CorePointer"
        InputDevice     "Keyboard0"     "CoreKeyboard"
EndSection

Section "Files"
        FontPath "/usr/lib/X11/fonts/misc:unscaled"
        FontPath "/usr/lib/X11/fonts/100dpi:unscaled"
        FontPath "/usr/lib/X11/fonts/Speedo"
        FontPath "/usr/lib/X11/fonts/Type1"
        FontPath "/usr/lib/X11/fonts/75dpi:unscaled"
EndSection


Section "InputDevice"
        Identifier  "Keyboard0"
        Driver      "keyboard"
        Option      "XkbLayout" "us"
EndSection

Section "InputDevice"
        Identifier  "Mouse0"
        Driver      "mouse"
        Option      "Device" "/dev/psaux"
        Option      "Protocol" "PS/2"
        Option      "Emulate3Buttons" "off"
EndSection

Section "Monitor"
        Identifier "HPM900"
        VendorName "Hewlett-Packard"
        ModelName  "Unknown"
        HorizSync 31-95
        VertRefresh 50-150
EndSection

Section "Device"
        Driver "fbdev"
        Identifier "FrameBuffer"
EndSection

Section "Screen"
        Identifier "Screen0"
        Device "FrameBuffer"
        Monitor "HPM900"
        Subsection "Display"
                Depth 8
                Modes "1280x1024"
        EndSubSection
EndSection
