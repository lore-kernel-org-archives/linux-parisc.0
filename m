Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D2D0E48BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 14:24:59 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
Date: Sun, 14 Mar 2004 22:24:54 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<20040314073706.GA28440@finlandia.infodrom.north.de>
	<20040314204704.GG9104@finlandia.infodrom.north.de>
In-Reply-To: <20040314204704.GG9104@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403142224.54035.deller@gmx.de>
Cc: Martin Schulze <joey@infodrom.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 14 March 2004 21:47, Martin Schulze wrote:
> That must have been a strange accidential coincidence, since I haven't
> been able to use the mouse again but the keyboard worked as expected.
> I'm totally puzzled at the moment.
> 
> Keyboard: yes
> Mouse: no
> 
> CONFIG_INPUT=y
> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y
> CONFIG_MOUSE_HIL=y
> CONFIG_SERIO=y
> CONFIG_SERIO_SERPORT=y
> CONFIG_SERIO_GSCPS2=y
> 
> Anything missing?

CONFIG_INPUT_KEYBOARD=y, but it seems you just forgot to add it to this list.

> Here's what the kernel says during boot:
> 
> mice: PS/2 mouse device common for all mice
> serio: GSC PS2 keyboard port at 0xf0108000 irq 69 @ parisc2:0:11
> input: AT Raw Set 2 keyboard on parisc2:0:11
> serio: GSC PS2 mouse port at 0xf0108100 irq 69 @ parisc2:0:12
> 
> That would make me think that the mouse is detected, though.

No, it's not.
I'm missing something like:
"input: Logitech mouse on parisc2:0:12".....

> It also says lots of:
> HP SDC: Transaction add failed: transaction already queued?
> I guess this has nothing to do with the mouse problem.

Disable all HIL/SDC stuff.

Helge
