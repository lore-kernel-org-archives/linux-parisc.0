Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id F417248BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 13:37:14 -0700 (MST)
Date: Sun, 14 Mar 2004 21:28:25 +0100
From: Martin Schulze <joey@infodrom.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
Message-ID: <20040314202825.GF9104@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<Pine.LNX.4.58.0403141509130.14547@sal.ucc.ie>
	<20040314181256.GA9104@finlandia.infodrom.north.de>
	<200403142055.12668.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200403142055.12668.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Helge Deller wrote:
> On Sunday 14 March 2004 19:12, Martin Schulze wrote:
> > > > For what it's worth, these settings don't activate my keyboard,
> > > > but... tadam...  the mouse is recognised, finally.  
> 
> Cool.

Well, not anymore, but more on that later.

> > > > CONFIG_INPUT_KEYBOARD=y
> > > > CONFIG_KEYBOARD_ATKBD=y
> > > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > > # CONFIG_KEYBOARD_XTKBD is not set
> > > > # CONFIG_KEYBOARD_NEWTON is not set
> > > > CONFIG_KEYBOARD_HIL=y
> > > 
> > > Why do you include HIL keyboard support?
> > 
> > Because the keyboad is connected to a HIL hub and it's also a
> > reminiscent of the time before I learned that the keyboard and mouse
> > are not handled entirely separate anymore.  I still have to strip some
> > config options from the configuration.
> 
> I think the main question here is which type of keyboard you have.
> Either it's a HIL keyboard (with the special HIL connector), or it's a 
> PS/2 keyboard.

It's HP A2840-60201 (according to the plate on the bottom).  It's
connected to a HIL hub with a PS/2 like connector.  The HIL hub is
connected to the machine with an RJ45 (like) connector.

The keyboard onlyworks with these three set:

CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_HIL=y

> My 715/64 for example has a HIL HUB too, and here the mouse and
> keyboard are 100% HIL only devices.

I can connect a regular PC PS/2 keyboard to the HIL hub and it'll
work.  I have an obscure PS/2 keyboard as well, which produces
'failure initializing keyboard' or something alike.  Now that I look
at the keyboard more closely, it's really a strange one, dunno where I
got *that* one from.  Anyway, regular PS/2 works fine.  HP keyboard
works fine as well.

> AFAIK, there are other HIL Hubs too, which provides original PS/2
> ports and HIL ports. So, which kind of connector does your keyboard has ?

Looks like I need to take picture.  Ah, found one:
<http://www.schrotthal.de/hp/hp_hil_ps2_hub.jpg> That's the HIL hub,
named HIL PS/2 hub, well.  I also have a very old HIL hub without PS/2
(like) jacks, but that's for an entirely different machine and
generation.

> Serial mice should work. I didn't tested it for some time now, but if
> it's broken I would like to know.

I'll have to retry that as well.

> Ok. So your keyboard seem to be a HIL keyboard ?

Since a regular PS/2 keyboard works as well, I guess it's a PS/2
keyboard actually.

> But it's strange, that your PS/2 mouse works then... I'm confused.

Don't be confused, it doesn't work anymore.

> I'm not sure right now about the status of the HIL keyboard/mouse driver, e.g.
> if it works or not in the 2.6 kernel series...

FWIW: I had mouse support and I had keyboard support.  Just not at the
same time unfortunately.  So in general it works at least.  The
configuration is a bit non-intuitive since you'll have to enable
HIL_KBD and AT_KBD.  However, logically it makes sense.

> > > So far I thought that you cannot attach a PS/2 mouse to a HIL adapter,
> > > you can only attach HIL devices ... (at least this is the case for my 730)
> > 
> > Well, at least physically this is possible.  I haven't tried to use
> > that combination, though, since I have the original mouse and
> > keyboard as well.  However, I could give it a try once I find a
> > working config combination.
> 
> Yes, please.

I'll connect a regular PC PS/2 mouse once I have mouse support again.
PS/2 keyboard works fine.

Regards,

	Joey

-- 
Life is too short to run proprietary software.  -- Bdale Garbee
