From: Helge Deller <deller@gmx.de>
Subject: ldcw inline assembler patch
Date: Sat, 14 Jun 2008 17:36:39 +0200
Message-ID: <4853E587.9020802@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I'm wondering if this patch might help people who are seeing locking 
problems on SMP boxes ?
Helge

diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
index ee80c92..4752684 100644
--- a/include/asm-parisc/system.h
+++ b/include/asm-parisc/system.h
@@ -168,8 +168,9 @@ static inline void set_eiem(unsigned long val)
  /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
  #define __ldcw(a) ({						\
  	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
-		: "=r" (__ret) : "r" (a));			\
+	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
+			: "=r" (__ret), "=m" (*(a))		\
+			: "r" (a), "m" (*(a))	);		\
  	__ret;							\
  })

