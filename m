From: Helge Deller <deller@gmx.de>
Subject: [PATCH] ldcw inline assembler patch
Date: Sun, 24 Aug 2008 21:04:26 +0200
Message-ID: <200808242104.27135.deller@gmx.de>
References: <200808242026.06295.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200808242026.06295.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There are two reasons to expose the memory *a in the asm:

1) To prevent the compiler from discarding a preceeding write to *a, and
2) to prevent it from caching *a in a register over the asm.

The change has had a few days testing with a SMP build of 2.6.22.19
running on a rp3440.

This patch is about the correctness of the __ldcw() macro itself. 
The use of the macro should be confined to small inline functions 
to try to limit the effect of clobbering memory on GCC's optimization 
of loads and stores.

Signed-off-by: Dave Anglin <dave.anglin@nrc-cnrc.gc.ca>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/asm/system.h
index ee80c92..d91357b 100644
--- a/arch/parisc/include/asm/system.h
+++ b/arch/parisc/include/asm/system.h
@@ -168,8 +168,8 @@ static inline void set_eiem(unsigned long val)
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
 #define __ldcw(a) ({						\
 	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
-		: "=r" (__ret) : "r" (a));			\
+	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
+		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
 	__ret;							\
 })
 
	
