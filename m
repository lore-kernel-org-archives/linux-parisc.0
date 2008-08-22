From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Fri, 22 Aug 2008 16:36:22 +0200
Message-ID: <20080822143622.GA8413@alpha.franken.de>
References: <s5hzln7vd9d.wl%tiwai@suse.de> <1219255088.3258.45.camel@localhost.localdomain> <s5hr68ivfer.wl%tiwai@suse.de> <1219326912.3265.2.camel@localhost.localdomain> <s5hhc9enyqa.wl%tiwai@suse.de> <s5hfxoynyn4.wl%tiwai@suse.de> <20080821214118.GA12516@alpha.franken.de> <s5hbpzl8tvz.wl%tiwai@suse.de> <20080822094131.GA6717@alpha.franken.de> <s5h7ia9nya3.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: ralf@linux-mips.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-mips@linux-mips.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <s5h7ia9nya3.wl%tiwai@suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Aug 22, 2008 at 12:23:48PM +0200, Takashi Iwai wrote:
> 	unsigned long prot = pgprot_val(_prot) & ~_CACHE_MASK;
> #ifdef CONFIG_SGI_IP32
> #ifdef CONFIG_CPU_R10000
> 	prot = prot | _CACHE_UNCACHED_ACCELERATED;
> #else
> 	prot = prot | _CACHE_CACHABLE_NO_WA;
> #endif
> #else
> 	prot = prot | _CACHE_UNCACHED;
> #endif
> 	return __pgprot(prot);

this won't work for recording channels on IP32, because the write trough
mapping will hide updates done via DMA.

I'd start with just

prot |= _CACHE_UNCACHED

and if some MIPS system needs more specific treatment, we just add
that later.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
