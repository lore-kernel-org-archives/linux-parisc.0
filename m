From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Wed, 27 Aug 2008 09:06:46 -0500
Message-ID: <1219846006.3292.3.camel@localhost.localdomain>
References: <K6047O$07C3A675C0E02FC7BE973C0D5DEF9AAA@scarlet.be>
	 <s5hy72pmefh.wl%tiwai@suse.de> <48B0678E.9010208@scarlet.be>
	 <s5hej4blrx7.wl%tiwai@suse.de> <20080826210118.GA26235@colo.lackof.org>
	 <s5h4p57hv4h.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Joel Soete <soete.joel@scarlet.be>,
	linux-mips <linux-mips@linux-mips.org>,
	ralf <ralf@linux-mips.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <s5h4p57hv4h.wl%tiwai@suse.de>
Errors-to: linux-mips-bounce@linux-mips.org
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 2008-08-27 at 07:42 +0200, Takashi Iwai wrote:
> At Tue, 26 Aug 2008 15:01:18 -0600,
> Grant Grundler wrote:
> > 
> > On Tue, Aug 26, 2008 at 05:25:24PM +0200, Takashi Iwai wrote:
> > ...
> > > Now updated my git tree:
> > >     http://git.kernel.org/?p=linux/kernel/git/tiwai/sound-2.6.git;a=shortlog;h=topic/dma-fix
> > > I'll post each patch again if preferred.
> > 
> > +#ifdef CONFIG_SND_COHERENT_DMA
> >  #define SNDRV_DMA_TYPE_DEV_SG          3       /* generic device SG-buffer */
> > +#else
> > +#define SNDRV_DMA_TYPE_DEV_SG  SNDRV_DMA_TYPE_DEV /* no SG-buf support */
> > +#endif
> > 
> > Hi Takashi,
> > I had to look at a previous patch to figure out CONFIG_SND_COHERENT_DMA
> > is an arch dependent flag:
> > 
> > +config SND_COHERENT_DMA
> > +       def_bool y
> > +       depends on !PPC32 || !NOT_COHERENT_CACHE
> > +       depends on !ARM
> > +       depends on !MIPS
> > +       depends on !PARISC
> > 
> > In general, I don't expect this to be a compile time option.
> 
> Right now it has to be a compile-time option because
> - dma_mmap_coherent() isn't implemented in every architecture (thus
>   fails to build), and 
> - pages allocated via dma_mmap_coherent() aren't always suitable for
>   SG-mapping.

This is trivially fixable by the usual methods, so, as Grant says, we
should employ them rather than non-standard ways of doing this

Basically, you're asking to extend the DMA API, so this should be taken
to linux-arch.  That way, it might also give visibility to the graphics
people and we can negotiate over a unified API.

James
