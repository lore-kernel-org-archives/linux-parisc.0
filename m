From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] mips: Add dma_mmap_coherent()
Date: Wed, 27 Aug 2008 11:38:58 +0100
Message-ID: <20080827103858.GA26940@linux-mips.org>
References: <K6047O$07C3A675C0E02FC7BE973C0D5DEF9AAA@scarlet.be> <s5hy72pmefh.wl%tiwai@suse.de> <48B0678E.9010208@scarlet.be> <s5hej4blrx7.wl%tiwai@suse.de> <20080826210118.GA26235@colo.lackof.org> <s5h4p57hv4h.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Joel Soete <soete.joel@scarlet.be>,
	"James.Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-mips <linux-mips@linux-mips.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <s5h4p57hv4h.wl%tiwai@suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 27, 2008 at 07:42:06AM +0200, Takashi Iwai wrote:

> Right now it has to be a compile-time option because
> - dma_mmap_coherent() isn't implemented in every architecture (thus
>   fails to build), and 
> - pages allocated via dma_mmap_coherent() aren't always suitable for
>   SG-mapping.

I suggest you take this issue to linux-arch or linux-kernel.  There will
be some more people who will have input on this.

  Ralf
