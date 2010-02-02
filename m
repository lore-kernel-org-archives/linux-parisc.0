From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: drop unnecessary cast in __ldcw_align() macro
Date: Tue, 2 Feb 2010 20:06:23 +0100
Message-ID: <20100202190623.GA7059@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

__ldcw_align() can directly access the slock member of struct arch_spinlock_t
instead of using an ugly cast.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/asm/system.h
--- a/arch/parisc/include/asm/system.h
+++ b/arch/parisc/include/asm/system.h
@@ -160,7 +160,7 @@ static inline void set_eiem(unsigned long val)
    ldcd). */
 
 #define __PA_LDCW_ALIGNMENT	4
-#define __ldcw_align(a) ((volatile unsigned int *)a)
+#define __ldcw_align(a) (&(a)->slock)
 #define __LDCW	"ldcw,co"
 
 #endif /*!CONFIG_PA20*/
