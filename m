From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 17:29:27 -0600
Message-ID: <20090620232927.GA21560@lackof.org>
References: <20090620224613.GB853@lackof.org> <20090620231151.GA21477@lackof.org> <1245540375.31688.2.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1245540375.31688.2.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 06:26:15PM -0500, James Bottomley wrote:
> On Sat, 2009-06-20 at 17:11 -0600, Grant Grundler wrote:
> > On Sat, Jun 20, 2009 at 04:46:13PM -0600, Grant Grundler wrote:
> > > gcc 4.4 warns about:
> > > drivers/parisc/lba_pci.c: In function 'lba_pat_resources':
> > > drivers/parisc/lba_pci.c:1099: warning: the frame size of 8280 bytes is larger than 4096 bytes
> > > 
> > > The problem is we declare two large structures on the stack. They don't need
> > > to be on the stack since they are only used during LBA initialization (which
> > > is serialized). Moving to be "static".
> > 
> > Take 2. Per Kyle's request (offlist), use kzalloc instead since it's not
> > ever used again after boot.
> 
> Um, wouldn't one of the points of using kzalloc over a static allocation
> be to free the memory again after we've finished using it?  Otherwise we
> leek a page for every lba.

Doh...of course!
I was too worried about the error case to think about the regular release.
I'll repost a clean version.

In the meantime...if someone can explain this error I could build and test:
fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict

something to do with __setup(nfs_root_setup) but it's not obvious to me what.


thanks,
grant
