Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90EB548E4
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 00:37:10 -0700 (MST)
Received: at Infodrom Oldenburg (/\##/\ Smail-3.2.0.102 1998-Aug-2 #2)
	from infodrom.org by finlandia.Infodrom.North.DE via smail from stdin
	id <m1B2QBG-000ok4C@finlandia.Infodrom.North.DE>
	for parisc-linux@lists.parisc-linux.org;
	Sun, 14 Mar 2004 08:37:06 +0100 (CET)
Date: Sun, 14 Mar 2004 08:37:06 +0100
From: Martin Schulze <joey@infodrom.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040314073706.GA28440@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200403091103.29310.deller@gmx.de>
Subject: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Helge Deller wrote:
> > I've a B132L running Gentoo. With 2.4 I had the PS/2 keyboard working fine
> > throught a Raritan Compuswitch KVM, but the mouse (wireless Intellimouse
> > clone - 2 buttons pluss roller/middle) was dead. Decided to try out 2.6
> > partly to excercise udev, but mostly in the hope that all the input layer
> > work and PS/2 changes would bring the mouse to life. I should probably add
> > that there are two PCs on the KVM - one running 2.6.3 and one running
> > 2.4.24. Both run the mouse and keyboard flawlessly.
> > 
> > To the point. I grabbed 2.6.3-pa0 from Gentoo hppa-dev-kernel, configured
> > and compiled it. The keyboard and mouse are both dead. I downloaded
> > 2.6.4-rc1-pa2 from cvs.parisc-linux.org but the result is exactly the same.
> > Some info below. Clues anybody?
> .....
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=y
> > # CONFIG_KEYBOARD_ATKBD is not set
> 
> Please enable this one (CONFIG_KEYBOARD_ATKBD), and....
> 
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > CONFIG_KEYBOARD_HIL=y
> > CONFIG_INPUT_MOUSE=y
> > # CONFIG_MOUSE_PS2 is not set
> 
> this one too.
> 

For what it's worth, these settings don't activate my keyboard,
but... tadam...  the mouse is recognised, finally.  However, if
I have to choose to use either keyboard or mouse, I'd choose the
keyboard.

CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_HIL=y
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_HIL=y
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_UINPUT is not set
# CONFIG_HP_SDC_RTC is not set

Any idea how to get the keyboard detected again?
(This is a 725/100)

If it helps to provide more information, please let me know and I'll
dig them out.

> In the latest 2.6 kernel series, we switched from a parisc-only
> PS/2 mouse/keyboard driver to the standard linux kernel PS/2
> mouse keyboard drivers.

Makes sense.  However, would it be useful to add this to the config
help texts?  Same for the dependency of a HIL mouse to the MOUSE_PS2,
if HIL always takes PS/2 mice.  I know this is not the case in general,
since my 425 uses HIL but doesn't use PS/2, but then again, it's m68k
and not parisc.  However, it may be the case on PA-RISC, I don't know.
In that case it may make sense to rearrange the ordering and move
MOUSE_HIL up so it can pre-select MOUSE_PS2.

Anyway, here's a short improvement for the MOUSE_PS2 help text:

--- Kconfig.orig	Sun Mar 14 08:27:51 2004
+++ Kconfig	Sun Mar 14 08:31:18 2004
@@ -22,7 +22,8 @@
 	  Say Y here if you have a PS/2 mouse connected to your system. This
 	  includes the standard 2 or 3-button PS/2 mouse, as well as PS/2
 	  mice with wheels and extra buttons, Microsoft, Logitech or Genius
-	  compatible.
+	  compatible. This also includes a PS/2 mouse connected to your HIL
+	  hub on PA-RISC.
 
 	  Synaptics TouchPad users might be interested in a specialized
 	  XFree86 driver at:

Regards,

	Joey

-- 
Life is too short to run proprietary software.  -- Bdale Garbee

Please always Cc to me when replying to me on the lists.
