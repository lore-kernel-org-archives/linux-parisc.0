Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9203A48D9
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 08:28:54 -0700 (MST)
Date: Sun, 14 Mar 2004 15:28:23 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Martin Schulze <joey@infodrom.org>
Subject: Re: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
In-Reply-To: <20040314073706.GA28440@finlandia.infodrom.north.de>
Message-ID: <Pine.LNX.4.58.0403141509130.14547@sal.ucc.ie>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<20040314073706.GA28440@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 14 Mar 2004, Martin Schulze wrote:

> For what it's worth, these settings don't activate my keyboard,
> but... tadam...  the mouse is recognised, finally.  However, if
> I have to choose to use either keyboard or mouse, I'd choose the
> keyboard.
>
> CONFIG_INPUT_KEYBOARD=y
> CONFIG_KEYBOARD_ATKBD=y
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> CONFIG_KEYBOARD_HIL=y

Why do you include HIL keyboard support?

> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y
> CONFIG_MOUSE_SERIAL=y

do you need serial mouse support?

> CONFIG_MOUSE_HIL=y

and why do you include HIL mouse support?

[...]

> Any idea how to get the keyboard detected again?
> (This is a 725/100)

I don't know the 725, but from what I understand it uses (GSC) PS/2, so you
attach keyboard and mouse directly, without any converters. Is that correct?

If this is the cause, get rid of all HIL drivers and use PS/2 exclusively.
I think using a combination of HIL and PS/2 drivers might cause some
sort of driver confusion in your case.

> If it helps to provide more information, please let me know and I'll
> dig them out.
>
>  	  Say Y here if you have a PS/2 mouse connected to your system. This
>  	  includes the standard 2 or 3-button PS/2 mouse, as well as PS/2
>  	  mice with wheels and extra buttons, Microsoft, Logitech or Genius
> -	  compatible.
> +	  compatible. This also includes a PS/2 mouse connected to your HIL
> +	  hub on PA-RISC.

I'm confused here!

AFAIK if you are using HIL, you ONLY have to use the HIL keyboard/mouse
drivers, PS/2 is a different thing and is not involved at all.
(I hope I don't say anything stupid here).

So far I thought that you cannot attach a PS/2 mouse to a HIL adapter,
you can only attach HIL devices ... (at least this is the case for my 730)


Greetings,
 Max
