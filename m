From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: kernel fault when booting with dual link network card
Date: Sun, 29 Jun 2008 10:22:21 -0600
Message-ID: <20080629162220.GL14894@parisc-linux.org>
References: <20080629151759.GA7856@spring.luon.net> <1214755234.3405.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sjoerd Simons <sjoerd@luon.net>, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1214755234.3405.5.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 29, 2008 at 11:00:34AM -0500, James Bottomley wrote:
> On Sun, 2008-06-29 at 16:17 +0100, Sjoerd Simons wrote:
> > Hi,
> > 
> >   Kernel 2.6.24 causes the machine to fault when a dual-link network card is
> >   installed right after loading the tulip module. Output of SER PIM attached.
> 
> I'm afraid just the hex dump isn't really any use.  To be possibly
> useful, we need at least the symbolic addresses of IAOQ and %r2.
> That's:
> 
> %r2: 0x10245748
> IAOQ[0]: 0x10252bdc
> IAOQ[1]: 0x10252be0
> 
> the I/O module error seems to indicate an incorrect GSC DMA read.

I don't think it's going to tell us anything useful.  I believe that
we've not set up the cardmode Dino correctly to respond to iomem space
and as a result the first access to iomem space will fault.

Of course, this is a machine with CCIO, so it could be something going
wrong with the CCIO programming too.  But I think it's Dino.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
