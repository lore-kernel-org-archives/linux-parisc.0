From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Thu, 21 Aug 2008 23:41:18 +0200
Message-ID: <20080821214118.GA12516@alpha.franken.de>
References: <s5hk5eezcfe.wl%tiwai@suse.de> <1219249633.3258.18.camel@localhost.localdomain> <s5hzln7vd9d.wl%tiwai@suse.de> <1219255088.3258.45.camel@localhost.localdomain> <s5hr68ivfer.wl%tiwai@suse.de> <1219326912.3265.2.camel@localhost.localdomain> <s5hhc9enyqa.wl%tiwai@suse.de> <s5hfxoynyn4.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: ralf@linux-mips.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-mips@linux-mips.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <s5hfxoynyn4.wl%tiwai@suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Aug 21, 2008 at 06:03:43PM +0200, Takashi Iwai wrote:
> > Thanks for clarification.
> > How about the revised patch below (for PARISC)?

the PARISC part will not work for 735 systems, because the CPU can't
map memory uncached, iirc. 

> ... and the below is for MIPS.

for most MIPS system you need the same trick as for PARISC and use 
uncached memory. But there are systems, which can't use uncached
memory. 

One of the is SGI IP28, which needs to be switched to a special
slower mode for uncached accesses, which we avoid completly in the
kernel right now and I don't think making the switch to slow mode
possible in user space is a good idea.

SGI Origin 200/2000, SGI Onyx and some Challenge Systems have a
different problem:

"Uncached Memory Access in SGI Origin 2000 and in Challenge and Onyx Series

    Access to uncached memory is not supported in these systems, in which
    cache coherency is maintained by the hardware, even under access from
    CPUs and concurrent DMA.  There is never a need (and no approved way)
    to access uncached memory in these systems."

That's from the IRIX Device Driver guide.

Right now I can't think of a solutin, which works on every MIPS system.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
