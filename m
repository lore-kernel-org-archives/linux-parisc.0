From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Wed, 20 Aug 2008 12:58:08 -0500
Message-ID: <1219255088.3258.45.camel@localhost.localdomain>
References: <s5hk5eezcfe.wl%tiwai@suse.de>
	 <1219249633.3258.18.camel@localhost.localdomain>
	 <s5hzln7vd9d.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <s5hzln7vd9d.wl%tiwai@suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2008-08-20 at 18:53 +0200, Takashi Iwai wrote:
> > I'm afraid there are several problems.  The first is that it doesn't do
> > what you want.  You can't map a coherent page to userspace (which is at
> > a non congruent address on parisc) and still expect it to be
> > coherent ... there's going to have to be fiddling with the page table
> > caches to make sure coherency isn't destroyed by aliasing effects
> 
> Hmm...  how bad would be the coherency with such a simple mmap method?
> In most cases, we don't need the "perfect" coherency.  Usually one
> process mmaps the whole buffer and keep reading/writing.  There is
> another use case (sharing the mmapped buffer by multiple processes),
> but this can be disabled if we know it's not feasible beforehand.

Unfortunately, the incoherency is between the user and the kernel.
That's where the aliasing effects occur, so realistically, even though
you've mapped coherent memory to the user, the coherency of that memory
is only device <-> kernel.  When the any single user space process
writes to it, the device won't see the write unless the user issues a
flush.

James


