From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] Banshee and Voodoo2
Date: Sat, 08 Jan 2005 21:47:09 +0000
Message-ID: <1105216425.10519.68.camel@localhost.localdomain>
References: <Pine.BSO.4.61.0501081917230.2715@gate.helzinki.net>
	 <200501082033.33830.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <alan@lxorguk.ukuu.org.uk>
In-Reply-To: <200501082033.33830.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sad, 2005-01-08 at 19:33, Helge Deller wrote:
> On Saturday 08 January 2005 18:26, Jyry Suuntala wrote:
> > Does anyone know is this list the actual list of supported hardware? If 
> > so, does X work with Banshee and at what resolution? And the same 
> > questions apply for Voodoo2, too :)
> 
> Vodoo2: 800x600x16bpp (1024x768x16bpp worked unreliable for me)
> No idea about Banshee.

I test it at 1024x768 on a PC. With the current XOrg the voodoo driver
limits are:

Voodoo1: 800x600x16bpp unaccelerated but pretty decent ram bandwidth so
its not bad. I think for 2D with some violence you could do 1024x768 but
it would be right on the DAC limits

Voodoo2: 1024x768x16bpp accelerated (including render acceleration). 

We have enough info to do full DRI for the Voodoo2 but nobody has been
sufficiently drunk to volunteer.

Alan
