From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] parisc: remove homegrown L1_CACHE_ALIGN macro
Date: Tue, 29 Jun 2010 16:29:04 +0900
Message-ID: <20100629162611B.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, deller@gmx.de, jejb@parisc-linux.org,
	linux-kernel@vger.kernel.org
To: kyle@mcmartin.ca
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Let's use the standard L1_CACHE_ALIGN macro instead.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
---
 arch/parisc/include/asm/cache.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index 45effe6..a050f9f 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -24,8 +24,6 @@
 
 #ifndef __ASSEMBLY__
 
-#define L1_CACHE_ALIGN(x)       (((x)+(L1_CACHE_BYTES-1))&~(L1_CACHE_BYTES-1))
-
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
 
 #define __read_mostly __attribute__((__section__(".data..read_mostly")))
-- 
1.6.5
