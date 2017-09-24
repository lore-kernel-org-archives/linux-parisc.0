From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] parisc: Export __cmpxchg_u64 unconditionally
Date: Sun, 24 Sep 2017 10:28:09 -0700
Message-ID: <1506274089-28269-1-git-send-email-linux@roeck-us.net>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
To: "James E . J . Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

__cmpxchg_u64 is built and used outside CONFIG_64BIT and thus needs
to be exported. This fixes the following build error seen when building
parisc:allmodconfig.

ERROR: "__cmpxchg_u64" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/kernel/parisc_ksyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index c6d6272a934f..7baa2265d439 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -35,12 +35,12 @@ EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(__xchg8);
 EXPORT_SYMBOL(__xchg32);
 EXPORT_SYMBOL(__cmpxchg_u32);
+EXPORT_SYMBOL(__cmpxchg_u64);
 #ifdef CONFIG_SMP
 EXPORT_SYMBOL(__atomic_hash);
 #endif
 #ifdef CONFIG_64BIT
 EXPORT_SYMBOL(__xchg64);
-EXPORT_SYMBOL(__cmpxchg_u64);
 #endif
 
 #include <linux/uaccess.h>
-- 
2.7.4
