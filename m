From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc debian kernel - missing  modules for C8000 -
 linux-image-3.10-2-parisc64-smp
Date: Fri, 06 Sep 2013 10:14:11 -0700
Message-ID: <1378487651.2063.20.camel@dabdike.int.hansenpartnership.com>
References: <108451378018002@web28j.yandex.ru>
	 <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl>
	 <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk>
	 <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
	 <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk>
	 <52278FBD.2010304@bell.net> <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
	 <5228F071.4040000@gmx.de> <20130906085203.GA15333@alpha.franken.de>
	 <1378479057.2063.6.camel@dabdike.int.hansenpartnership.com>
	 <20130906161158.GA19991@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Alex Ivanov <gnidorah@p0n4ik.tk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130906161158.GA19991@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-09-06 at 18:11 +0200, Thomas Bogendoerfer wrote:
> On Fri, Sep 06, 2013 at 07:50:57AM -0700, James Bottomley wrote:
> > Hang on, if you bought a new Radeon card, how are you POSTing it?  The
> > BIOS will have the x86 POST code.
> 
> there is an x86 emulator in PDC. I even get PDC console on nvidia
> cards. I also tested matrox cards but their bios hangs the machine.

Hm, OK ... what you describe sounds like the card is incorrectly POSTed.

> > Yes, I've got (or rather had) one working on a power station (the IBM
> > Linux on Power workstation) before it died. It was an R128.
> 
> was that with the KMS/DRM driver or the aty one ?

It was with the vanilla kernel.  The machine went belly up about two
years ago, so it's not with anything recent.

James


