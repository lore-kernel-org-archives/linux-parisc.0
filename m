From: Joel Soete <soete.joel@scarlet.be>
Subject: [PATCH] ccio_clear_io_tlb() don't need to compute io page number
 a second time.
Date: Sat, 19 Jul 2008 21:34:08 +0000
Message-ID: <48825DD0.5000308@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-kernel@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Kyle,

In ccio-dma.c, I noticed that eventhought the prototype of the function ccio_clear_io_tlb() is:
static CCIO_INLINE void
ccio_clear_io_tlb(struct ioc *ioc, dma_addr_t iovp, size_t byte_cnt)

i.e. the second arg being iovp (afaik the io virtual page number) deduced from the iova (io virtual address)

it's so useless to:
         iovp &= IOVP_MASK;      /* clear offset bits, just want pagenum */

and the only place where it's called is:
         ccio_clear_io_tlb(ioc, CCIO_IOVP(iova), saved_byte_cnt);

it's well an iovp given the macro definition:
#define CCIO_IOVP(iova) ((iova) & IOVP_MASK)

May I so suggest following patch:
--- a/drivers/parisc/ccio-dma.c	2008-07-19 21:17:37.000000000 +0000
+++ b/drivers/parisc/ccio-dma.c	2008-07-19 21:32:54.000000000 +0000
@@ -643,7 +643,6 @@
  {
  	u32 chain_size = 1 << ioc->chainid_shift;

-	iovp &= IOVP_MASK;	/* clear offset bits, just want pagenum */
  	byte_cnt += chain_size;

  	while(byte_cnt > chain_size) {
=== <> ===

Tia,
	J.
