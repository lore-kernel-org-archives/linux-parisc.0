From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 12:09:04 -0700
Message-ID: <20051211190904.GB9286@parisc-linux.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca> <20051211175004.GA22449@colo.lackof.org> <1134324062.3367.9.camel@mulgrave> <200512111955.09892.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <willy@parisc-linux.org>
In-Reply-To: <200512111955.09892.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Dec 11, 2005 at 07:55:09PM +0100, Helge Deller wrote:
> Seems ok, but I still have the "stuck IRQ" problem:

We have that problem with cardmode dino too ... may or may not be the
same root cause.
