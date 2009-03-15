From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Possible accelerated X on PA-RISC with kernel modesetting --
	anyone investigating?
Date: Sat, 14 Mar 2009 22:03:01 -0400
Message-ID: <20090315020301.GG3167@bombadil.infradead.org>
References: <b4198de60903141802p14f3d7f8ra33ba382ae6b8d85@mail.gmail.com> <20090315014621.GF3167@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090315014621.GF3167@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Mar 14, 2009 at 09:46:21PM -0400, Kyle McMartin wrote:
> I don't know if the newer cards can do DAC, but if they can, then we
> could at least use the distributed GMMIO (greater-than-4GB mmio)
> range to map a wide swath to every rope, which /would/ work.
> 
> (My C8000 won't boot with a PCI r500 card in it, it fails during PDC
>  init, sadly. I think it was a X1300 or something.)
> 

Ah, more stuff I remembered. Pluto's GMMIO_DIST_BASE register has useful
features that let it clip the top 32-bits of the transaction address
off, so you can give each rope a full 4GB mmio space and a bit to turn
off the port-IO space from each range, reclaiming another 64MB for each
rope.

I should pick up another couple models of PCI r[56]00 to try in the
C8000... not sure why the firmware choked on the old r500.
