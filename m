From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ASSERT() -> BUG_ON() (1/4):
	arch/parisc/kernel/pci-dma.c
Date: Sun, 7 Nov 2004 14:48:47 -0700
Message-ID: <20041107214847.GB16345@colo.lackof.org>
References: <418E1BD1.7010108@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418E1BD1.7010108@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 07, 2004 at 12:57:53PM +0000, Joel Soete wrote:
> This is a very first proposal because:
> 	a) BUG_ON() is not anymore conditional

Exactly, this is exactly why I'm not enthusiastic about replacing
ASSERT with BUG_ON. ASSERT is intended to catch developement bugs
that I know will not occur in production. Having the BUG_ON will
only slow down the production kernel in those cases.

So some BUG_ON are ok, but not a wholesale replacement of ASSERTs.
I'll apply the patch and then delete BUG_ON that I don't think
we need.

> 	b) I would like to change a bit such:
> [...]
> 	BUG_ON(pages_mapped == 0);
> 	BUG_ON((pages_mapped * PAGE_SIZE) >= DMA_CHUNK_SIZE);
> 	BUG_ON(pages_mapped >= (BITS_PER_LONG - PAGE_SHIFT));
> [...]
> into
> 	BUG_ON((pages_mapped == 0) || \
> 		((pages_mapped * PAGE_SIZE) >= DMA_CHUNK_SIZE) || \
> 		(pages_mapped >= (BITS_PER_LONG - PAGE_SHIFT));
> [...]

Please don't do this.
Then we won't know which part of the condition failed.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
