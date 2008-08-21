From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Thu, 21 Aug 2008 08:55:12 -0500
Message-ID: <1219326912.3265.2.camel@localhost.localdomain>
References: <s5hk5eezcfe.wl%tiwai@suse.de>
	 <1219249633.3258.18.camel@localhost.localdomain>
	 <s5hzln7vd9d.wl%tiwai@suse.de>
	 <1219255088.3258.45.camel@localhost.localdomain>
	 <s5hr68ivfer.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <s5hr68ivfer.wl%tiwai@suse.de>
Errors-to: linux-mips-bounce@linux-mips.org
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 2008-08-21 at 12:19 +0200, Takashi Iwai wrote:
> At Wed, 20 Aug 2008 12:58:08 -0500,
> James Bottomley wrote:
> > 
> > On Wed, 2008-08-20 at 18:53 +0200, Takashi Iwai wrote:
> > > > I'm afraid there are several problems.  The first is that it doesn't do
> > > > what you want.  You can't map a coherent page to userspace (which is at
> > > > a non congruent address on parisc) and still expect it to be
> > > > coherent ... there's going to have to be fiddling with the page table
> > > > caches to make sure coherency isn't destroyed by aliasing effects
> > > 
> > > Hmm...  how bad would be the coherency with such a simple mmap method?
> > > In most cases, we don't need the "perfect" coherency.  Usually one
> > > process mmaps the whole buffer and keep reading/writing.  There is
> > > another use case (sharing the mmapped buffer by multiple processes),
> > > but this can be disabled if we know it's not feasible beforehand.
> > 
> > Unfortunately, the incoherency is between the user and the kernel.
> > That's where the aliasing effects occur, so realistically, even though
> > you've mapped coherent memory to the user, the coherency of that memory
> > is only device <-> kernel.  When the any single user space process
> > writes to it, the device won't see the write unless the user issues a
> > flush.
> 
> I see.  In the case of ALSA mmap mode, a user issues an ioctl to
> notify after the read/write access, so it'd be relatively easy to add
> a sync operation.
> 
> Does the call of dma_sync_*_for_device() suffice for that purpose?

No ... dma_sync_* sync's from the kernel to the device ... you don't
need that if the memory is already coherent.

The problem is that the data you want the device to see is held in a
cache above the user space mapping ... it's that cache that has to be
flushed (i.e. you need to flush through the user mappings, not through
the kernel ones).

> (BTW, how does the fb driver work on this?)

It sets the shared page to uncached on all its mappings.  Turning off
caching (assuming the platform can do it ... not all can) is a good way
to eliminate aliasing issues.

James
