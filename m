From: Meelis Roos <mroos@linux.ee>
Subject: Re: [PARISC] fix pacache .size with new binutils
Date: Mon, 21 Mar 2011 22:49:51 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103212247170.27981@math.ut.ee>
References: <alpine.SOC.1.00.1103212212040.27981@math.ut.ee> <1300739513.10634.39.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1300739513.10634.39.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This won't apply because of upstream changes to the file
> (flush_alias_page got removed) ... does the problem even still exist
> upstream?

By the way, the new code compiles with warnings:

  CC      arch/parisc/kernel/cache.o
arch/parisc/kernel/cache.c: In function 'flush_dcache_page':
arch/parisc/kernel/cache.c:310: warning: pointer type mismatch in conditional expression
arch/parisc/kernel/cache.c:310: warning: format '%s' expects type 'char *', but argument 4 has type 'void * const'

Is it just a lacking cast in printk argument?

-- 
Meelis Roos (mroos@linux.ee)
