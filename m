From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [bug] gcc-4.3 miscompiling causing networking to bugger up
Date: Sat, 31 May 2008 04:58:58 -0600
Message-ID: <20080531105858.GD28074@parisc-linux.org>
References: <20080528234110.GD30501@phobos.i.cabal.ca> <20080529000059.9C6434E77@hiauly1.hia.nrc.ca> <20080529000219.GE30501@phobos.i.cabal.ca> <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com> <20080531041010.GA27970@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080531041010.GA27970@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 31, 2008 at 12:10:10AM -0400, Kyle McMartin wrote:
> I've found the solution to the bug, it seems something is going wonky
> because of ip_fast_csum missing a "memory" clobber.
> 
> This should fix it, but I have no idea whether this is a legitimate bug,
> or masking a problem with gcc due to too much inlining.

*veeery* interesting.  It's entirely possible that this is the correct
fix:

 If your assembler instructions access memory in an unpredictable
 fashion, add `memory' to the list of clobbered registers.  This will
 cause GCC to not keep memory values cached in registers across the
 assembler instruction and not optimize stores or loads to that memory.

So if GCC has something in a register, it might not bother to write it
back to ram before this asm if we don't have the memory clobber.

Fantastic work, Kyle.  Thanks for spending so much time on this.

> diff --git a/include/asm-parisc/checksum.h b/include/asm-parisc/checksum.h
> index cc3ec1b..1916ebe 100644
> --- a/include/asm-parisc/checksum.h
> +++ b/include/asm-parisc/checksum.h
> @@ -65,7 +65,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  "2:\n"
>  	: "=r" (sum), "=r" (iph), "=r" (ihl)
>  	: "1" (iph), "2" (ihl)
> -	: "r19", "r20", "r21" );
> +	: "r19", "r20", "r21", "memory" );
>  
>  	return (__force __sum16)sum;
>  }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
