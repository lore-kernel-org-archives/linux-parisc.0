From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: kernel fault when booting with dual link network card
Date: Sun, 29 Jun 2008 15:11:14 -0600
Message-ID: <20080629211114.GA9572@colo.lackof.org>
References: <20080629151759.GA7856@spring.luon.net> <1214755234.3405.5.camel@localhost.localdomain> <20080629162220.GL14894@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Sjoerd Simons <sjoerd@luon.net>, linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080629162220.GL14894@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 29, 2008 at 10:22:21AM -0600, Matthew Wilcox wrote:
...
> > the I/O module error seems to indicate an incorrect GSC DMA read.
> 
> I don't think it's going to tell us anything useful.  I believe that
> we've not set up the cardmode Dino correctly to respond to iomem space
> and as a result the first access to iomem space will fault.

It depends on if the first access is a read or a write. If it's a read
(and odds are good that's true), we will get the exact IP that faulted 
and get something about "CPU timeout" in the PIM dump.

> Of course, this is a machine with CCIO, so it could be something going
> wrong with the CCIO programming too.  But I think it's Dino.

I doubt it too. I agree it's much more likely something with Dino.

thanks,
grant
