Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id F133F482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jul 2001 02:32:06 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BAD4DB00C; Wed, 18 Jul 2001 09:30:04 +0100 (BST)
Date: Wed, 18 Jul 2001 09:30:04 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Tom <tom@alaskatech.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715/100 no longer boots into console?
Message-ID: <20010718093004.Z30356@linuxcare.com>
References: <200107172125.NAA09485@goliath> <Pine.LNX.4.33.0107171419400.8533-100000@goliath>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0107171419400.8533-100000@goliath>; from tom@alaskatech.org on Tue, Jul 17, 2001 at 02:21:16PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 17, 2001 at 02:21:16PM -0800, Tom wrote:
> On Tue, 17 Jul 2001, Helge Deller wrote:
> > > > I assume your /etc/inittab is spawning a getty on tty0?
> > >
> > > Tom: Does it ?  If not, then that's why it's failing.
> >
> > Tom, I just saw you already answered this.
> > So please forget about my mail.
> >
> > Greetings,
> > Helge
> 
> No problem :-)  Actually, my only remaining question is why disabling the
> tty[x] entries in inittab would be a default behavior; I had changed it
> with 0.9 and the install of 0.91 changed it back. Weird.
> 
> Anyway, that might be a good thing to change for a 1.0 release - assuming
> the console will be serial could be bad...

Installer should auto detect whether it is on a serial on graphical
console, and set up inittab appropriately.  Sounds like it got confused
in your case.  Not aware of anyone else having that problem.

Richard
