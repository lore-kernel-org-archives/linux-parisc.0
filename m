Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A651490B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 13:57:08 -0700 (MST)
Date: Sun, 14 Mar 2004 21:49:59 +0100
From: Martin Schulze <joey@infodrom.org>
To: Helge Deller <deller@gmx.de>
Message-ID: <20040314204959.GA32470@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<20040314073706.GA28440@finlandia.infodrom.north.de>
	<200403142048.27506.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200403142048.27506.deller@gmx.de>
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
> On Sunday 14 March 2004 08:37, Martin Schulze wrote:
> > > In the latest 2.6 kernel series, we switched from a parisc-only
> > > PS/2 mouse/keyboard driver to the standard linux kernel PS/2
> > > mouse keyboard drivers.
> > 
> > Makes sense.  However, would it be useful to add this to the config
> > help texts?  Same for the dependency of a HIL mouse to the MOUSE_PS2,
> > if HIL always takes PS/2 mice.  I know this is not the case in general,
> > since my 425 uses HIL but doesn't use PS/2, but then again, it's m68k
> > and not parisc.  However, it may be the case on PA-RISC, I don't know.
> > In that case it may make sense to rearrange the ordering and move
> > MOUSE_HIL up so it can pre-select MOUSE_PS2.
> > 
> > Anyway, here's a short improvement for the MOUSE_PS2 help text:
> > 
> > --- Kconfig.orig	Sun Mar 14 08:27:51 2004
> > +++ Kconfig	Sun Mar 14 08:31:18 2004
> > @@ -22,7 +22,8 @@
> >  	  Say Y here if you have a PS/2 mouse connected to your system. This
> >  	  includes the standard 2 or 3-button PS/2 mouse, as well as PS/2
> >  	  mice with wheels and extra buttons, Microsoft, Logitech or Genius
> > -	  compatible.
> > +	  compatible. This also includes a PS/2 mouse connected to your HIL
> > +	  hub on PA-RISC.
> >  
> >  	  Synaptics TouchPad users might be interested in a specialized
> >  	  XFree86 driver at:
> 
> Hi Joey
> 
> I don't know if this makes sense to be too verbose here....
> "...a PS/2 mouse connected to your system..." looks pretty ok, independed
> if it is connected to a HIL hub or not.

Well, if you *know* that it's a PS/2 mouse and PS/2 keyboard, you're
correct.  However, does everybody know that who gets hold of a PARISC
machine fully equipped with HIL hub and stuff?  Maybe it's just me
who hasn't expected that since the old (really old) machines didn't
use pc standard equipment and since PA machines usually use different
parts.  You choose since you're more familiar with the port.

Regards,

	Joey

-- 
Life is too short to run proprietary software.  -- Bdale Garbee
