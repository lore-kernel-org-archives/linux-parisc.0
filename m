From: Joel Soete <soete.joel@tiscali.be>
Subject: What's about ccio-rm-dma? [Was: [parisc-linux] Re: [patch 1/1] delete
	unused file]
Date: Mon, 27 Dec 2004 11:52:32 +0000
Message-ID: <41CFF780.7000700@tiscali.be>
References: <20041225175939.7DEF71ED41@trashy.coderock.org>
	<20041227063313.GH29492@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041227063313.GH29492@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant,

couldn't you do the same with ccio-rm-dma.c?
the only ref is in drivers/parisc/Makefile:
[...]
# Only use one of them: ccio-rm-dma is for PCX-W systems *only*
# obj-$(CONFIG_IOMMU_CCIO)      += ccio-rm-dma.o
obj-$(CONFIG_IOMMU_CCIO)        += ccio-dma.o
[...]

commented and replaced by ccio-dma.c for a long time ;-) (may also outdated?)

Joel


Grant Grundler wrote:
> On Sat, Dec 25, 2004 at 06:59:49PM +0100, domen@coderock.org wrote:
> 
>>Remove nowhere referenced file. (egrep "filename\." didn't find anything)
>>
>>Signed-off-by: Domen Puncer <domen@coderock.org>
> 
> 
> Thanks - I will delete it from cvs.parisc-linux.org repository once
> a "sanity check build" completes. I also couldn't find any references.
> palo (parisc boot loader) doesn't use this file either.
> 
> thanks again,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
