From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PARISC] fix pacache .size with new binutils
Date: Mon, 21 Mar 2011 15:51:59 -0500
Message-ID: <1300740719.10634.44.camel@mulgrave.site>
References: <alpine.SOC.1.00.1103212212040.27981@math.ut.ee>
	 <1300739513.10634.39.camel@mulgrave.site>
	 <alpine.SOC.1.00.1103212247170.27981@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103212247170.27981@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2011-03-21 at 22:49 +0200, Meelis Roos wrote:
> > This won't apply because of upstream changes to the file
> > (flush_alias_page got removed) ... does the problem even still exist
> > upstream?
> 
> By the way, the new code compiles with warnings:
> 
>   CC      arch/parisc/kernel/cache.o
> arch/parisc/kernel/cache.c: In function 'flush_dcache_page':
> arch/parisc/kernel/cache.c:310: warning: pointer type mismatch in conditional expression
> arch/parisc/kernel/cache.c:310: warning: format '%s' expects type 'char *', but argument 4 has type 'void * const'
> 
> Is it just a lacking cast in printk argument?

It's a reminder to me to dump the code.  However, we still don't have
agreement on the dump, and the alias warning is useful to people who are
working on the binutils update.

James



