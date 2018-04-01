From: Shea Levy <shea@shealevy.com>
Subject: [PATCH v6 13/16] parisc: Switch to generic free_initrd_mem.
Date: Sun,  1 Apr 2018 10:59:27 -0400
Message-ID: <20180401145931.7932-13-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
Cc: Shea Levy <shea@shealevy.com>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180401145931.7932-1-shea@shealevy.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The first patch in this series added a weakly-defined generic
implementation, which is functionally identical to the
architecture-specific one removed here.

Series boot-tested on RISC-V (which now uses the generic
implementation) and x86_64 (which doesn't).

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/parisc/mm/init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index cab32ee824d2..3643399230f3 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -932,10 +932,3 @@ void flush_tlb_all(void)
 	spin_unlock(&sid_lock);
 }
 #endif
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2
