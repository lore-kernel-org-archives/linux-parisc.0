Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA19493
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 07:32:09 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "Thomas Marteau" <marteaut@esiee.fr>
Subject: Re: [parisc-linux] The config for 712 hp boxes
Date: Fri, 17 Nov 2000 15:34:09 +0100
References: <00a801c04ff1$4e9b7f20$a832d793@esiee.fr> <00111622285001.00336@P100> <000f01c05083$89805240$a832d793@esiee.fr>
In-Reply-To: <000f01c05083$89805240$a832d793@esiee.fr>
Cc: parisc-linux@puffin.external.hp.com
MIME-Version: 1.0
Message-Id: <00111715340901.11253@P100>
List-ID: <linux-parisc.vger.kernel.org>

[CC'ed the list, so maybe someone else can comment too....]

On Friday 17 November 2000 11:45, Thomas Marteau wrote:
> Hi Helge,

Hi,

> 
> 
> ----- Original Message -----
> From: Helge Deller <deller@gmx.de>
> To: Thomas Marteau <marteaut@esiee.fr>
> Cc: <parisc-linux@puffin.external.hp.com>
> Sent: Thursday, November 16, 2000 10:28 PM
> Subject: Re: [parisc-linux] The config for 712 hp boxes
> 
> 
> > On Thursday 16 November 2000 18:18, Thomas Marteau wrote:
> > > Hi all,
> > >
> > > [....]
> > > Also, in this mail, you have the diff between our hp_keyb.c and the
> official
> > > one but it gives you the ~ and the ' and others scancodes.
> > > [....]
> >
> > Hi ESIEE-Team !
> >
> > Thanks for your patch !
> >
> > I committed your patch into CVS and just tweaked it a little for
> > CONFIG_MAGIC_SYSRQ. I hope this is ok for you ?
> We didn't really understand why pckbd_sysrq_xlate was here for.
> If you can explain to us, it will be fine.

The best documentation you can find is in linux/Documentation/sysrq.txt.
The copy of pckbd_sysrq_xlate[] is a simple implementation of 
keyboard-scancodes to chars, which is used by drivers/char/keyboard.c to call 
handle_sysrq() from /drivers/char/sysrq.c.
This means, that you can press Alt-PrintScr (=> SysRQ) and a char at the 
keyboard simultaniously and your machine for example syncs the disks, mounts 
all discs read-only or reboots your machine immediately.
 

> > If your time permits, I would like to ask, if you maybe also want to look
> at
> > getting the CAPS-Lock-, Scroll-Lock- & Num-Lock-LED's working ?

> Normally, you can see yours leds switching on/off but we did not init them.
> So they are like boot admin switch them...
                               ^^^^^^^ ^^^^^ ^^^
Sorry ?

> But we would like to know how and where we have to init them
> because we know how to. We have made test and it was working...

I'm not sure, but I think you should check the code in lasikbd_leds() in 
hp_psaux.c.
The initialization should maybe be done in the same file in the function 
lasi_ps2_register() before calling register_kbd_ops().

> 
> > Furthermore you mention in your project-history on your homepage something
> > about "keyboard and soundchip problems" (Oct. 24). I'm asking just out of
> > curiousity: Did you thought about programming the on-board sound-chips
> (which
> > I believe would be a hard job.)  ?
> Yes, it is in our internal todo list, if we have time to. Because we look at
> it with Thierry, we saw that, for LASI,
> you have an interface and then the chip to configure. But it is very
> interesting...

Yes it is, and it would be great if you worked on that too ! 

> 
> Also, we want to rule the power leds but they are different if  the box is
> 712 or B132 or ... So our question is how to implement
> this kind of initialsation and deinitialisation in a linux kernel and in a
> second time, how to do for differents kind of boxes.

As far as I know / have heard, there are only two types of LED's (but I may 
be wrong here !). One is where the LED's are organized in a row on the front 
panel (as my local machines here), and the other one, where you have 
(LED/)LCD-Numbers on your front panel ?

They differ how to be accessed and where the controlling registers are 
located. One method to distiguish them is maybe to place the special 
initialisation code into drivers/gsc/lasi.c and asp.c, depending on the 
machine and which method needs to be used.
Since I don't have any real documentation or knowledge of the programming of 
the LEDs (beside of the PDC-calls I placed into setup.c), maybe someone else 
can better comment on that or give some documentation ?

> 
> Thanks for your answers, Helge
> Bye,
> ESIEE Team

Best regards,

	Helge Deller.
