From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Mon, 22 Dec 2008 16:43:36 -0600
Message-ID: <1229985816.3345.43.camel@localhost.localdomain>
References: <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca>
	 <494EC89A.9000802@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, kyle@infradead.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <494EC89A.9000802@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-12-21 at 23:52 +0100, Helge Deller wrote:
> John David Anglin wrote:
> >> I think the bug may be in flush_user_cache_page_non_current.  It hijacks
> >> sr3 temporarily and I don't think cr8 is updated when this is done.  The
> >> switch may need to be atomic.
> > 
> > The following might fix the protection ID bug.
> > 
> > --- cache.c.orig	2008-07-17 21:24:46.000000000 -0400
> > +++ cache.c	2008-12-21 11:53:54.000000000 -0500
> > @@ -312,14 +312,14 @@
> >  
> >  	/* make us current */
> >  	mtctl(__pa(vma->vm_mm->pgd), 25);
> > -	mtsp(vma->vm_mm->context, 3);
> > +	load_context(vma->vm_mm->context);
> >  
> >  	flush_user_dcache_page(vmaddr);
> >  	if(vma->vm_flags & VM_EXEC)
> >  		flush_user_icache_page(vmaddr);
> >  
> >  	/* put the old current process back */
> > -	mtsp(space, 3);
> > +	load_context(space);
> 
> I came to the similar conclusion and tried exactly this patch earlier
> today. It didn't fixed the problem (although I had the feeling that the
> bug didn't appeared as often then).

Actually, it should bug more often.  This function:
flush_user_cache_page_non_current() is very rarely called (which is
hopefully why you don't see an increase in bugs).  However, this is a
kernel function ... if you call load_context() here, you'll get the user
protection IDs in the register and it will immediately fault when it
returns to the kernel.  All it should be doing (which is what it
currently does) is to set up sr3 to allow the kernel to poke into a user
address space, which is the design of the function.

James


