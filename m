From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0207/1529] Fix typo
Date: Sat, 21 May 2016 14:03:06 +0200
Message-ID: <20160521120306.10712-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jejb@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/include/asm/ldcw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index 8121aa6..8be707e 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -40,7 +40,7 @@
    memory to indicate to the compiler that the assembly code reads
    or writes to items other than those listed in the input and output
    operands.  This may pessimize the code somewhat but __ldcw is
-   usually used within code blocks surrounded by memory barriors.  */
+   usually used within code blocks surrounded by memory barriers.  */
 #define __ldcw(a) ({						\
 	unsigned __ret;						\
 	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
-- 
2.8.2.534.g1f66975

