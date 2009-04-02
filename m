From: Kyle McMartin <kyle@mcmartin.ca>
Subject: parisc: fix build when ARCH_HAS_KMAP
Date: Wed, 1 Apr 2009 22:42:21 -0400
Message-ID: <20090402024221.GJ1443@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Kyle McMartin <kyle@mcmartin.ca>

When we build for PA8X00, we define ARCH_HAS_KMAP, which results in
the kmap_types.h include in highmem.h getting skipped...

In file included from include/linux/pagemap.h:10,
                 from include/linux/mempolicy.h:62,
                 from init/main.c:52:
include/linux/highmem.h:196: warning: 'enum km_type' declared inside parameter list
include/linux/highmem.h:196: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/highmem.h:196: error: parameter 1 ('type') has incomplete type

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/include/asm/cacheflush.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index b7ca6dc..7243951 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -97,6 +97,9 @@ void mark_rodata_ro(void);
 
 #ifdef CONFIG_PA8X00
 /* Only pa8800, pa8900 needs this */
+
+#include <asm/kmap_types.h>
+
 #define ARCH_HAS_KMAP
 
 void kunmap_parisc(void *addr);
-- 
1.6.1.1

