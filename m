From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: What's about ccio-rm-dma?
Date: Mon, 27 Dec 2004 11:24:02 -0700
Message-ID: <20041227182402.GC15046@colo.lackof.org>
References: <20041225175939.7DEF71ED41@trashy.coderock.org>
	<20041227063313.GH29492@colo.lackof.org>
	<41CFF780.7000700@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41CFF780.7000700@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 27, 2004 at 11:52:32AM +0000, Joel Soete wrote:
> Grant,
> 
> couldn't you do the same with ccio-rm-dma.c?

Yes, I could. But ccio is co-owned by James Bottomley (guilt
by association) and Ryan Bradetich. It's their decision if
they want to keep it around or not.

> the only ref is in drivers/parisc/Makefile:

No other references are necessary since the code hooks itself
in by updating hppa_dma_ops function table.

> [...]
> # Only use one of them: ccio-rm-dma is for PCX-W systems *only*
> # obj-$(CONFIG_IOMMU_CCIO)      += ccio-rm-dma.o
> obj-$(CONFIG_IOMMU_CCIO)        += ccio-dma.o
> [...]
> 
> commented and replaced by ccio-dma.c for a long time ;-) (may also 
> outdated?)

ccio-rm-dma.c is a replacement for ccio-dma.c on the one machine
that supports it: C360.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
