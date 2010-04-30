From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Patch for segfaults in minifail tests
Date: Fri, 30 Apr 2010 16:13:44 -0500
Message-ID: <1272662024.2844.44.camel@mulgrave.site>
References: <1272651697.2844.39.camel@mulgrave.site>
	 <20100430211136.GA11644@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100430211136.GA11644@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2010-04-30 at 17:11 -0400, John David Anglin wrote:
> On Fri, 30 Apr 2010, James Bottomley wrote:
> 
> > It's the essential patch we need to fix up our kmapping.  Right at the
> > moment kmap of a page with a dirty cache line in userspace sees stale
> > data and kunmap of a page the kernel has modified will see likewise.
> 
> Did you try using the version of copy_user_page_asm that uses
> equivalent aliasing?   There is an issue with needing cache flushing
> noted in pgtable.h, but if this works it may be less of a hammer.

Not yet.  I want to isolate the root cause first before I start adding
optimisations.  Although the optimisation is a fairly safe one, since
it's used by a lot of other architectures.

James


