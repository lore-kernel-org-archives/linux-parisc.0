Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id B27F54857
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 10:17:25 -0700 (MST)
Date: Mon, 15 Mar 2004 18:14:20 +0100
From: Martin Schulze <joey@infodrom.org>
To: Helge Deller <deller@gmx.de>
Message-ID: <20040315171420.GW9104@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403142055.12668.deller@gmx.de>
	<20040314202825.GF9104@finlandia.infodrom.north.de>
	<200403142219.00823.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200403142219.00823.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Helge Deller wrote:
> > Don't be confused, it doesn't work anymore.
> 
> I would be interested in your dmesg log.

It's at http://luonnotar.infodrom.org/~joey/dmesg.txt

> Mine (HIL only!) looks like this:
> 
> mice: PS/2 mouse device common for all mice
> serio: GSC PS2 keyboard port at 0xf0108000 irq 69 @ parisc2:0:11
> gscps2.c: timeout - could not write byte 0xed
> gscps2.c: sending byte 0xed failed.

mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xf0108000 irq 69 @ parisc2:0:11
input: AT Raw Set 2 keyboard on parisc2:0:11
serio: GSC PS2 mouse port at 0xf0108100 irq 69 @ parisc2:0:12

> HP SDC: HP SDC reports successful PUP.
> HP SDC: HP SDC at 0xf0201000, IRQ 126 (NMI IRQ 125)
> HP SDC: New style SDC
> HP SDC: Revision: 1820-4784
> HP SDC: TI SN76494 beeper present
> HP SDC: OKI MSM-58321 BBRTC present
> HP SDC: Spunking the self test register to force PUP on next firmware reset.
> HP SDC MLC: Registering the System Domain Controller's HIL MLC.
> 
> -> OK, the HIL stuff is detected. (BTW, test this after power-cycling the machine!)

HP SDC: HP SDC at 0xf0201000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.

> and then nearly at the end of dmesg:
> HIL KEYB: HIL keyboard found (did = 0xcf, lang = german)
> input: HIL keyboard, ID: 207

Not found here, of course.

> HIL PTR: HIL pointer device found (did: 0x68, axis: relative)
> HIL PTR: HIL pointer has 3 buttons and 1 sets of 2 axes
> input: HIL pointer device (HIL mouse), ID: 104

Not found here as well.

> This is now HIL keyboard and HIL mouse.
> So my HIL mouse is detected, but doesn't seem to work yet.... :-( 

*sigh*

> > FWIW: I had mouse support and I had keyboard support.  Just not at the
> > same time unfortunately.  So in general it works at least.  The
> > configuration is a bit non-intuitive since you'll have to enable
> > HIL_KBD and AT_KBD.  However, logically it makes sense.
> 
> No. You should disable HIL_KBD (but it doesn't hurt either).

Done.  Keyboard still works.

> As said above: Hard Power-cycle the machine before each test!

Of course.  I'll have to turn it off for keyboard / mouse changes
or the machine will drop support for what I changed.

> Furthermore you might try to increase the value of mdelay(6); in line 168
> in file linux-2.6/drivers/input/serio/gscps2.c...
> Maybe it's a timing issue ?

Apparently, it was.  I now have keyboard and mouse support.
I set the delay to 12.

> This is what you should have in your .config:
> CONFIG_SERIO_GSCPS2=y
> CONFIG_INPUT_KEYBOARD=y
> CONFIG_KEYBOARD_ATKBD=y
> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y

All there.

Everything's working fine now, btw.

Regards,

	Joey

-- 
Whenever you meet yourself you're in a time loop or in front of a mirror.

Please always Cc to me when replying to me on the lists.
