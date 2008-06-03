From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: parisc: add barriers to mmio accessors
Date: Tue, 3 Jun 2008 06:42:29 -0600
Message-ID: <20080603124229.GA8434@parisc-linux.org>
References: <20080603054212.GA31771@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080603054212.GA31771@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 03, 2008 at 01:42:12AM -0400, Kyle McMartin wrote:
> +#ifdef CONFIG_64BIT
> +	asm volatile(
> +	"	ldq	0(%0), %1\n"
> +	: : "r"(addr), "r"(q) : "memory");
> +#else
> +	unsigned int q_lo, q_hi;
> +	q_hi = __raw_readl(addr);
> +	q_lo = __raw_readl(addr+4);
> +	q = (unsigned long long)(q_hi << 32) | (q_lo);
> +#endif

Are you sure this is correct?  Seems to me it should be:

	q = ((unsigned long long)q_hi << 32) | q_lo;

I would have thought GCC would complain about a shift exceeding the
width of the type.

> +static inline void __raw_writeq(unsigned long long q, volatile void __iomem *addr)
>  {
> -	*(volatile unsigned long long __force *) addr = b;
> +#ifdef CONFIG_64BIT
> +	asm volatile(
> +	"	stq	%1, 0(%0)\n"
> +	: : "r"(addr), "r"(q) : "memory");
> +#else
> +	unsigned int q_hi = (q >> 32) & ~0UL;
> +	unsigned int q_lo = (q) & ~0UL;
> +	__raw_writel(q_hi, addr);
> +	__raw_writel(q_lo, addr+4);
> +#endif

It feels a little funny to be masking with UL when assigning to an
unsigned int.  I'd personally use 0xffffffff or ~0U or nothing at all
since it'll be truncated anyway.  (I recognise the value of saying "I do
intend to truncate this value" explicitly though.)

A third thing is that you're doing this to the __raw_ variants which
don't have to be serialised.  How about we keep the current definitions of
__raw_readX/__raw_writeX, define the regular readX/writeX to be the inline
assembler you've just posted, and add new defines of __readX/__writeX
as byteswapping versions of __raw_readX/__raw_writeX?

[For those who aren't on linux-arch, there's just been a long thread
about the semantics of the different accessors and the above reflects my
understanding of that thread.]

Should we add memory clobbers to gsc_readX/gsc_writeX?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
