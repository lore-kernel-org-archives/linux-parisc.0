From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] parisc: set ARCH_KMALLOC_MINALIGN
Date: Tue, 29 Jun 2010 15:50:50 +0900
Message-ID: <20100629154801C.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org,
	linux-kernel@vger.kernel.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a resend:

http://marc.info/?t=127432584100006&r=1&w=2

I thought that it was merged but seems that it was lost somewhere?

=
From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] parisc: set ARCH_KMALLOC_MINALIGN

Architectures that handle DMA-non-coherent memory need to set
ARCH_KMALLOC_MINALIGN to make sure that kmalloc'ed buffer is DMA-safe:
the buffer doesn't share a cache with the others.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: James E.J. Bottomley <jejb@parisc-linux.org>
Cc: stable@kernel.org
---
 arch/parisc/include/asm/cache.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index 45effe6..5d87f27 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -22,6 +22,8 @@
 #define L1_CACHE_SHIFT 5
 #endif
 
+#define ARCH_KMALLOC_MINALIGN	L1_CACHE_BYTES
+
 #ifndef __ASSEMBLY__
 
 #define L1_CACHE_ALIGN(x)       (((x)+(L1_CACHE_BYTES-1))&~(L1_CACHE_BYTES-1))
-- 
1.6.5

