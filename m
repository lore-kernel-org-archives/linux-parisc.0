From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix out-of-register compiler error in ldcw inline
 assembler function
Date: Tue, 21 Oct 2014 21:46:14 +0200
Message-ID: <20141021194614.GA14418@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sometimes we face this compiler error:

arch/parisc/include/asm/ldcw.h:39:2: error: can't find a register in class 'R1_REGS' while reloading 'asm'
	__asm__ __volatile__(__LDCW " 0(%2),%0"...
	note: in expansion of macro '__ldcw'
	error: 'asm' operand has impossible constraints

Dave suggested:
Likely the problem can be fixed by making __ldcw a static inline function and
forcing the argument 'a' to a specific register before using in ldcw.

Since it's not easy to reproduce this bug, this patch now tries to still let
the compiler decide on which register should be used. If it doesn't work, we'll
have to assign a specific register as suggested by Dave.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index d2d11b7..b951e01 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -34,12 +34,14 @@
 #endif /*!CONFIG_PA20*/
 
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
-#define __ldcw(a) ({						\
-	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
-		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
-	__ret;							\
-})
+static inline unsigned int __ldcw(volatile unsigned int *address)
+{
+	unsigned int ret;
+	register volatile unsigned int *a = address;
+	__asm__ __volatile__(__LDCW " 0(%2),%0"
+		: "=r" (ret), "+m" (*(a)) : "r" (a));
+	return ret;
+}
 
 #ifdef CONFIG_SMP
 # define __lock_aligned __attribute__((__section__(".data..lock_aligned")))
