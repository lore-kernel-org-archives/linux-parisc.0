Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57BA248BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 13:57:08 -0700 (MST)
Received: at Infodrom Oldenburg (/\##/\ Smail-3.2.0.102 1998-Aug-2 #2)
	from infodrom.org by finlandia.Infodrom.North.DE via smail from stdin
	id <m1B2cVk-000pzIC@finlandia.Infodrom.North.DE>
	for parisc-linux@lists.parisc-linux.org;
	Sun, 14 Mar 2004 21:47:04 +0100 (CET)
Date: Sun, 14 Mar 2004 21:47:04 +0100
From: Martin Schulze <joey@infodrom.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040314204704.GG9104@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<20040314073706.GA28440@finlandia.infodrom.north.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20040314073706.GA28440@finlandia.infodrom.north.de>
Subject: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Martin Schulze wrote:
> > > # Input Device Drivers
> > > #
> > > CONFIG_INPUT_KEYBOARD=y
> > > # CONFIG_KEYBOARD_ATKBD is not set
> > 
> > Please enable this one (CONFIG_KEYBOARD_ATKBD), and....
> > 
> > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > # CONFIG_KEYBOARD_XTKBD is not set
> > > # CONFIG_KEYBOARD_NEWTON is not set
> > > CONFIG_KEYBOARD_HIL=y
> > > CONFIG_INPUT_MOUSE=y
> > > # CONFIG_MOUSE_PS2 is not set
> > 
> > this one too.
> > 
> 
> For what it's worth, these settings don't activate my keyboard,
> but... tadam...  the mouse is recognised, finally.  However, if

That must have been a strange accidential coincidence, since I haven't
been able to use the mouse again but the keyboard worked as expected.
I'm totally puzzled at the moment.

Keyboard: yes
Mouse: no

CONFIG_INPUT=y
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_HIL=y
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_GSCPS2=y

Anything missing?

If anybody is interested, here's the kernel config
http://luonnotar.infodrom.org/~joey/config

FWIW, without CONFIG_KEYBOARD_ATKBD (in connection to CONFIG_KEYBOARD_HIL)
the keyboard is dead as a doornail, hint-thanks go to Helge.

Here's what the kernel says during boot:

mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xf0108000 irq 69 @ parisc2:0:11
input: AT Raw Set 2 keyboard on parisc2:0:11
serio: GSC PS2 mouse port at 0xf0108100 irq 69 @ parisc2:0:12

That would make me think that the mouse is detected, though.

It also says lots of:
HP SDC: Transaction add failed: transaction already queued?
I guess this has nothing to do with the mouse problem.

Regards,

	Joey

-- 
Life is too short to run proprietary software.  -- Bdale Garbee
