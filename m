Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 861D648BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 12:55:24 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
Date: Sun, 14 Mar 2004 20:55:12 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<Pine.LNX.4.58.0403141509130.14547@sal.ucc.ie>
	<20040314181256.GA9104@finlandia.infodrom.north.de>
In-Reply-To: <20040314181256.GA9104@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403142055.12668.deller@gmx.de>
Cc: Martin Schulze <joey@infodrom.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 14 March 2004 19:12, Martin Schulze wrote:
> > > For what it's worth, these settings don't activate my keyboard,
> > > but... tadam...  the mouse is recognised, finally.  

Cool.

> > > However, if 
> > > I have to choose to use either keyboard or mouse, I'd choose the
> > > keyboard.

Of course.

> > > CONFIG_INPUT_KEYBOARD=y
> > > CONFIG_KEYBOARD_ATKBD=y
> > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > # CONFIG_KEYBOARD_XTKBD is not set
> > > # CONFIG_KEYBOARD_NEWTON is not set
> > > CONFIG_KEYBOARD_HIL=y
> > 
> > Why do you include HIL keyboard support?
> 
> Because the keyboad is connected to a HIL hub and it's also a
> reminiscent of the time before I learned that the keyboard and mouse
> are not handled entirely separate anymore.  I still have to strip some
> config options from the configuration.

I think the main question here is which type of keyboard you have.
Either it's a HIL keyboard (with the special HIL connector), or it's a 
PS/2 keyboard.
My 715/64 for example has a HIL HUB too, and here the mouse and
keyboard are 100% HIL only devices.
AFAIK, there are other HIL Hubs too, which provides original PS/2
ports and HIL ports. So, which kind of connector does your keyboard has ?

> > > CONFIG_INPUT_MOUSE=y
> > > CONFIG_MOUSE_PS2=y
> > > CONFIG_MOUSE_SERIAL=y
> > 
> > do you need serial mouse support?
> 
> Well, at one time I tried to fix the mouse problem by connecting a
> serial mouse to ttyS0/ttyS1 but it didn't work either, even though a
> getty on that port worked and I could log in, hence the port works at
> least and is supported in the kernel.

Serial mice should work. I didn't tested it for some time now, but if
it's broken I would like to know.

> > > CONFIG_MOUSE_HIL=y
> > 
> > and why do you include HIL mouse support?
> 
> Same as above, because the mouse is connected to a HIL hub and it's a
> reminiscent from the time before I learned that the keyboard and mouse
> are not handled entirely separate anymore for parisc.
> 
> > > Any idea how to get the keyboard detected again?
> > > (This is a 725/100)
> > 
> > I don't know the 725, but from what I understand it uses (GSC) PS/2, so you
> > attach keyboard and mouse directly, without any converters. Is that correct?
> 
> No it isn't.  That's the case for 712, not this one.  There's a HIL
> hub where I can connect one keyboard, one mouse and another HIL hub.
> The case doesn't have any PS/2 socket.

Ok. So your keyboard seem to be a HIL keyboard ?
But it's strange, that your PS/2 mouse works then... I'm confused.

> > If this is the cause, get rid of all HIL drivers and use PS/2 exclusively.
> > I think using a combination of HIL and PS/2 drivers might cause some
> > sort of driver confusion in your case.
> 
> Might well be.  I'm still working on stripping the stuff and testing
> various combinations.

Ok.
> > > If it helps to provide more information, please let me know and I'll
> > > dig them out.
> > >
> > >  	  Say Y here if you have a PS/2 mouse connected to your system. This
> > >  	  includes the standard 2 or 3-button PS/2 mouse, as well as PS/2
> > >  	  mice with wheels and extra buttons, Microsoft, Logitech or Genius
> > > -	  compatible.
> > > +	  compatible. This also includes a PS/2 mouse connected to your HIL
> > > +	  hub on PA-RISC.
> > 
> > I'm confused here!
> >
> > AFAIK if you are using HIL, you ONLY have to use the HIL keyboard/mouse
> > drivers, PS/2 is a different thing and is not involved at all.
> > (I hope I don't say anything stupid here).
> 
> Aha.  I thought it was different.  Maybe I misread Helges mail.

I'm not sure right now about the status of the HIL keyboard/mouse driver, e.g.
if it works or not in the 2.6 kernel series...
 
> > So far I thought that you cannot attach a PS/2 mouse to a HIL adapter,
> > you can only attach HIL devices ... (at least this is the case for my 730)
> 
> Well, at least physically this is possible.  I haven't tried to use
> that combination, though, since I have the original mouse and
> keyboard as well.  However, I could give it a try once I find a
> working config combination.

Yes, please.

Regards,
Helge
