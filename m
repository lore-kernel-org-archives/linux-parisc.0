From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: parisc compile error
Date: Thu, 7 Feb 2008 18:20:15 -0500
Message-ID: <20080207232015.GA11653@phobos.i.cabal.ca>
References: <20080207231232.GF7198@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Christoph Lameter <clameter@sgi.com>, kyle@parisc-linux.org,
	matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080207231232.GF7198@cs181133002.pp.htv.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 08, 2008 at 01:12:32AM +0200, Adrian Bunk wrote:
> Commit 9e2779fa281cfda13ac060753d674bbcaa23367e broke parisc:
> 
> <--  snip  -->
> 
> ...
>   CC      arch/parisc/kernel/asm-offsets.s
> In file included from include/asm/pgtable.h:13,
>                  from arch/parisc/kernel/asm-offsets.c:36:
> include/linux/mm.h: In function 'is_vmalloc_addr':
> include/linux/mm.h:243: error: 'VMALLOC_START' undeclared (first use in this function)
> include/linux/mm.h:243: error: (Each undeclared identifier is reported only once
> include/linux/mm.h:243: error: for each function it appears in.)
> include/linux/mm.h:243: error: 'VMALLOC_END' undeclared (first use in this function)
> make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
> 

yes, it's in my batch of fixes.

thanks for the reminder.

cheers, kyle
