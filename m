Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 857B048BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 14:19:03 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: Martin Schulze <joey@infodrom.org>
Subject: Re: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
Date: Sun, 14 Mar 2004 22:19:00 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403142055.12668.deller@gmx.de>
	<20040314202825.GF9104@finlandia.infodrom.north.de>
In-Reply-To: <20040314202825.GF9104@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403142219.00823.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Martin,

On Sunday 14 March 2004 21:28, Martin Schulze wrote:
> > I think the main question here is which type of keyboard you have.
> > Either it's a HIL keyboard (with the special HIL connector), or it's a 
> > PS/2 keyboard.
> 
> It's HP A2840-60201 (according to the plate on the bottom).  It's
> connected to a HIL hub with a PS/2 like connector.  The HIL hub is
> connected to the machine with an RJ45 (like) connector.
> 
> The keyboard onlyworks with these three set:
> 
> CONFIG_INPUT_KEYBOARD=y
> CONFIG_KEYBOARD_ATKBD=y
> CONFIG_KEYBOARD_HIL=y

CONFIG_KEYBOARD_ATKBD and CONFIG_KEYBOARD_HIL
have nothing to do with each other. Reading your reply below,
it seems, that you will only need CONFIG_KEYBOARD_ATKBD.
I think, the HUB is only used to "transport" the PS/2 signals to your computer,
and uses some cables inside the HIL cable.

> > My 715/64 for example has a HIL HUB too, and here the mouse and
> > keyboard are 100% HIL only devices.
> 
> I can connect a regular PC PS/2 keyboard to the HIL hub and it'll
> work.  I have an obscure PS/2 keyboard as well, which produces
> 'failure initializing keyboard' or something alike.  Now that I look
> at the keyboard more closely, it's really a strange one, dunno where I
> got *that* one from.  Anyway, regular PS/2 works fine.  HP keyboard
> works fine as well.

Yup, then it's definitively a PS/2 keyboard.

> > AFAIK, there are other HIL Hubs too, which provides original PS/2
> > ports and HIL ports. So, which kind of connector does your keyboard has ?
> 
> Looks like I need to take picture.  Ah, found one:
> <http://www.schrotthal.de/hp/hp_hil_ps2_hub.jpg> That's the HIL hub,
> named HIL PS/2 hub, well.  I also have a very old HIL hub without PS/2
> (like) jacks, but that's for an entirely different machine and
> generation.

Yes. My HUB has only HIL connectors and is for a 715/64.
 
> > Serial mice should work. I didn't tested it for some time now, but if
> > it's broken I would like to know.
> 
> I'll have to retry that as well.

Ok.

> > But it's strange, that your PS/2 mouse works then... I'm confused.
> 
> Don't be confused, it doesn't work anymore.

I would be interested in your dmesg log.
Mine (HIL only!) looks like this:

mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xf0108000 irq 69 @ parisc2:0:11
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.

-> OK, since I only have a HIL keyboard.

serio: GSC PS2 mouse port at 0xf0108100 irq 69 @ parisc2:0:12
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.

-> OK, since I only have a HIL mouse.

HP SDC: HP SDC reports successful PUP.
HP SDC: HP SDC at 0xf0201000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.

-> OK, the HIL stuff is detected. (BTW, test this after power-cycling the machine!)

and then nearly at the end of dmesg:
HIL KEYB: HIL keyboard found (did = 0xcf, lang = german)
input: HIL keyboard, ID: 207
HIL PTR: HIL pointer device found (did: 0x68, axis: relative)
HIL PTR: HIL pointer has 3 buttons and 1 sets of 2 axes
input: HIL pointer device (HIL mouse), ID: 104

This is now HIL keyboard and HIL mouse.
So my HIL mouse is detected, but doesn't seem to work yet.... :-( 
 
> > I'm not sure right now about the status of the HIL keyboard/mouse driver, e.g.
> > if it works or not in the 2.6 kernel series...
> 
> FWIW: I had mouse support and I had keyboard support.  Just not at the
> same time unfortunately.  So in general it works at least.  The
> configuration is a bit non-intuitive since you'll have to enable
> HIL_KBD and AT_KBD.  However, logically it makes sense.

No. You should disable HIL_KBD (but it doesn't hurt either).

> > > > So far I thought that you cannot attach a PS/2 mouse to a HIL adapter,
> > > > you can only attach HIL devices ... (at least this is the case for my 730)
> > > 
> > > Well, at least physically this is possible.  I haven't tried to use
> > > that combination, though, since I have the original mouse and
> > > keyboard as well.  However, I could give it a try once I find a
> > > working config combination.
> > 
> > Yes, please.
> 
> I'll connect a regular PC PS/2 mouse once I have mouse support again.
> PS/2 keyboard works fine.

As said above: Hard Power-cycle the machine before each test!
Furthermore you might try to increase the value of mdelay(6); in line 168
in file linux-2.6/drivers/input/serio/gscps2.c...
Maybe it's a timing issue ?

This is what you should have in your .config:
CONFIG_SERIO_GSCPS2=y
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y

Helge
