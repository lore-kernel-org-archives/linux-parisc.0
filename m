From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 18:26:15 -0500
Message-ID: <1245540375.31688.2.camel@mulgrave.site>
References: <20090620224613.GB853@lackof.org>
	 <20090620231151.GA21477@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620231151.GA21477@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2009-06-20 at 17:11 -0600, Grant Grundler wrote:
> On Sat, Jun 20, 2009 at 04:46:13PM -0600, Grant Grundler wrote:
> > gcc 4.4 warns about:
> > drivers/parisc/lba_pci.c: In function 'lba_pat_resources':
> > drivers/parisc/lba_pci.c:1099: warning: the frame size of 8280 bytes is larger than 4096 bytes
> > 
> > The problem is we declare two large structures on the stack. They don't need
> > to be on the stack since they are only used during LBA initialization (which
> > is serialized). Moving to be "static".
> 
> Take 2. Per Kyle's request (offlist), use kzalloc instead since it's not
> ever used again after boot.

Um, wouldn't one of the points of using kzalloc over a static allocation
be to free the memory again after we've finished using it?  Otherwise we
leek a page for every lba.

James


