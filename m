From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 14:37:57 -0600
Message-ID: <1134333477.3367.16.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	 <20051211175004.GA22449@colo.lackof.org> <1134324062.3367.9.camel@mulgrave>
	 <200512111955.09892.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <200512111955.09892.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 2005-12-11 at 19:55 +0100, Helge Deller wrote:
> Seems ok, but I still have the "stuck IRQ" problem:

Hmm, perhaps the place to start for this is the firmware information:
In my system, the firmware actually disables the PCMCIA bridge (I assume
because it doesn't understand it).  That's why I added all the code to
dino to redo the entire PCI resource tree, so that it automatically
brings up the PCMCIA bridge.  However, your firmware should understand
the PCMCIA bridge, but it might have some other way of routing the IRQ.

James
