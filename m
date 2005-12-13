From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Tue, 13 Dec 2005 15:28:15 -0700
Message-ID: <20051213222815.GA22809@colo.lackof.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca> <20051212073003.GA15901@colo.lackof.org> <1134398708.9994.3.camel@mulgrave> <200512122217.16864.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 James Bottomley <James.Bottomley@steeleye.com>,
 Grant Grundler <grundler@parisc-linux.org>,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200512122217.16864.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 12, 2005 at 10:17:16PM +0100, Helge Deller wrote:
> I agree. As long as we don't know if this is a generic cirrus/parisc/dino problem I think it's not good to add code to the generic drivers/pci.c driver.
> Furthermore, since I don't think there are many people out there who have the possibility to test cirrus pcmcia hw on parisc I would propose to put the (temporary) quirk in drivers/parisc/dino.c instead.
> Attached is a patch for this parisc-specific quirk which works for me. 
> Ok to commit to the local parisc CVS tree ?

yes - please do.

> Helge
> 
> BTW, I tested the orinoco_cs and ide_cs drivers. Both worked like a charm out of the box on my tadpole laptop (B160L) :-)

Very cool :)

thanks,
grant
