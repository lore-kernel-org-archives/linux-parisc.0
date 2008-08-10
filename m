From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH] ide: remove unused macros from <asm-parisc/ide.h>
Date: Sun, 10 Aug 2008 20:03:27 +0200
Message-ID: <200808102003.27727.bzolnier@gmail.com>
References: <200808101747.08025.bzolnier@gmail.com> <20080810155437.GA6576@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20080810155437.GA6576@phobos.i.cabal.ca>
List-ID: <linux-ide.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sunday 10 August 2008, Kyle McMartin wrote:
> On Sun, Aug 10, 2008 at 05:47:07PM +0200, Bartlomiej Zolnierkiewicz wrote:
> > 
> > Cc: Kyle McMartin <kyle@mcmartin.ca>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> > ---
> >  include/asm-parisc/ide.h |    4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > Index: b/include/asm-parisc/ide.h
> > ===================================================================
> > --- a/include/asm-parisc/ide.h
> > +++ b/include/asm-parisc/ide.h
> > @@ -13,10 +13,6 @@
> >  
> >  #ifdef __KERNEL__
> >  
> > -#define ide_request_irq(irq,hand,flg,dev,id)	request_irq((irq),(hand),(flg),(dev),(id))
> > -#define ide_free_irq(irq,dev_id)		free_irq((irq), (dev_id))
> > -#define ide_request_region(from,extent,name)	request_region((from), (extent), (name))
> > -#define ide_release_region(from,extent)		release_region((from), (extent))
> >  /* Generic I/O and MEMIO string operations.  */
> >  
> 
> Thanks Bart!
> 
> Groovy... Want me to merge this, or will you shepherd it in?

In the fear of include/asm-parisc/ shuffle I would prefer that you pick it.

Thanks.
