From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: flush pages through tmpalias space
Date: Sat, 25 Dec 2010 22:52:19 +0100
Message-ID: <4D166793.30901@gmx.de>
References: <1293034931.3019.8.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1293034931.3019.8.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/22/2010 05:22 PM, James Bottomley wrote:
> The kernel has an 8M tmpailas space (originally designed for copying
> and clearing pages but now only used for clearing).  The idea is
> to place zeros into the cache above a physical page rather than into
> the physical page and flush the cache, because often the zeros end up
> being replaced quickly anyway.
> 
> We can also use the tmpalias space for flushing a page.  The difference
> here is that we have to do tmpalias processing in the non access data and
> instruction traps.  The principle is the same: as long as we know the physical
> address and have a virtual address congruent to the real one, the flush will
> be effective.
> 
> In order to use the tmpalias space, the icache miss path has to be enhanced to
> check for the alias region to make the fic instruction effective.
> 
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>


Hi James,

Cool, I assume this patch intends to fix the "Threads and fork on VIPT-WB machines" bug as described here: http://wiki.parisc-linux.org/TestCases ?

I did some initial testing and it seems to really fix it...
I'll continue testing during the next few days (with 2.6.37-rc7-32bit).

Helge


BTW: compilation gives one small warning:
arch/parisc/kernel/cache.c: In function 'flush_dcache_page':
arch/parisc/kernel/cache.c:310: warning: pointer type mismatch in conditional expression
arch/parisc/kernel/cache.c:310: warning: format '%s' expects type 'char *', but argument 4 has type 'void * const'
