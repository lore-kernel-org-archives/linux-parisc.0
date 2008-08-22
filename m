From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Fri, 22 Aug 2008 11:41:31 +0200
Message-ID: <20080822094131.GA6717@alpha.franken.de>
References: <s5hk5eezcfe.wl%tiwai@suse.de> <1219249633.3258.18.camel@localhost.localdomain> <s5hzln7vd9d.wl%tiwai@suse.de> <1219255088.3258.45.camel@localhost.localdomain> <s5hr68ivfer.wl%tiwai@suse.de> <1219326912.3265.2.camel@localhost.localdomain> <s5hhc9enyqa.wl%tiwai@suse.de> <s5hfxoynyn4.wl%tiwai@suse.de> <20080821214118.GA12516@alpha.franken.de> <s5hbpzl8tvz.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: ralf@linux-mips.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-mips@linux-mips.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <s5hbpzl8tvz.wl%tiwai@suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Aug 22, 2008 at 08:07:44AM +0200, Takashi Iwai wrote:
> I don't think that this must work for *every* platform, too, and it's
> not expected from the driver.  The systems without uncached memory
> access can simply return an error from  dma_mmap_coherent() call, so
> that the driver can disable the mmap.  That'd be enough.

true, I've used snd_pcm_indirect for HAL2 driver, which works even on
SGI IP28 machines.

> Now, how to handle these exceptions: a question comes into my mind
> again -- how does the framebuffer handle these as well?

most framebuffers have a dedicated set of video memory and this memory is
just mmaped uncached either via TLB/MMU (MIPS) or rules inside
the system (PARISC uses IO space memory, which is always uncached). 
The code which does this mmaping is in drivers/video/fbmem.c plus
fb_pgprotect out of an include/asm header file. 

For framebuffers without dedicated video memory the memory is mmaped
write through or uncached. A driver, which uses this, is 
drivers/video/gbefb.c.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
