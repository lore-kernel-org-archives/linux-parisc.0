From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] Banshee and Voodoo2
Date: Sat, 8 Jan 2005 15:35:06 -0500
Message-ID: <20050108203506.GB22378@localhost.localdomain>
References: <Pine.BSO.4.61.0501081917230.2715@gate.helzinki.net> <200501082033.33830.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@engsoc.org>
In-Reply-To: <200501082033.33830.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jan 08, 2005 at 08:33:33PM +0100, Helge Deller wrote:
> > p.s. any news on Visualize-FX4?
> 
> Not as I know... :-(
> 

I've been working on a driver, based on the register list in the
x86 AGP driver, and some hints I got from the author of that driver. However,
as of yet, I've had no luck. Though, that's likely because it's taken
me quite a bit of time to become familiar with how the framebuffer
interfaces work.

The goal is a 24bpp raw, unaccelerated framebuffer... I'd be happy with
better, but I don't have enough information for that.

Cheers,
	Kyle
