From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Hacking SuperDome
Date: Sat, 7 Feb 2009 23:30:32 -0500
Message-ID: <20090208043032.GA11398@bombadil.infradead.org>
References: <20090207142906.GA8553@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207142906.GA8553@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Oh, I'm jealous now. :)

On Sat, Feb 07, 2009 at 03:29:06PM +0100, Thomas Bogendoerfer wrote:
> +#if 0
>         int ret;
> 
>         ret = mem_pdc_call(PDC_MODEL, PDC_MODEL_CAPABILITIES,
>                 __pa(pdc_result), 0);
>         convert_to_wide(pdc_result);
>         if (pdc_result[0] != NARROW_FIRMWARE)
> +#endif

Yeah, this won't work on Superdome, which has no 32-bit firmware. At
this point in boot, we've got parisc_narrow_firmware set, which will
go kaboom.

We can fix this pretty easily, palo knows if it was started with 64-bit
firmware, we can just bring this into the kernel. I'll hack a patch for
palo this weekend, but you might as well continue just using what you've
got until then.

regards, Kyle
