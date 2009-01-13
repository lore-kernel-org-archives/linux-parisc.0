From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] remove klist iterators
Date: Tue, 13 Jan 2009 15:21:11 -0600
Message-ID: <1231881671.21012.2.camel@localhost.localdomain>
References: <1231549026.3235.84.camel@localhost.localdomain>
	 <496CFF77.8090101@gmx.de>  <20090113205816.GC25103@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090113205816.GC25103@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2009-01-13 at 15:58 -0500, Kyle McMartin wrote:
> On Tue, Jan 13, 2009 at 09:54:15PM +0100, Helge Deller wrote:
> > James Bottomley wrote:
> > > commit 11c3b5c3e08f4d855cbef52883c266b9ab9df879
> > > Author: Greg Kroah-Hartman <gregkh@suse.de>
> > > Date:   Tue Dec 16 12:24:56 2008 -0800
> > > 
> > >     driver core: move klist_children into private structure
> > > 
> > > Broke our parisc build pretty badly because we touch the klists directly
> > > in three cases (AGP, SBA and GSC).  Although GregKH will revert this
> > > patch, there's no reason we should be using the iterators directly, we
> > > can just move to the standard device_for_each_child() API.
> > > 
> > > Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> > 
> > I just tested this patch on my 715/64 and c3000 with 2.6.29-rc1. Everything OK.
> > 
> > Tested-by: Helge Deller <deller@gmx.de>
> > 
> 
> Thanks. Applied.

So you think I'd send an untested and uncompiled patch to the list?  ...
Hey, I strongly resemble that allegation!

The quicksilver AGP will need testing on a c8000 system, I think.

James


