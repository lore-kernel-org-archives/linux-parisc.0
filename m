From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Another ldcw inline assembler patch
Date: Sat, 28 Jun 2008 18:07:57 -0400
Message-ID: <20080628220756.GA8620@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Below is my take on how to write the ldcw asm.  I believe that Helge's
patch was essentially correct.

There are two reasons to expose the memory *a in the asm:

1) To prevent the compiler from discarding a preceeding write to *a, and
2) to prevent it from caching *a in a register over the asm.

The change has had a few days testing with a SMP build of 2.6.22.19
running on a rp3440.

Signed-off-by: Dave Anglin <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
index ee80c92..d91357b 100644
--- a/include/asm-parisc/system.h
+++ b/include/asm-parisc/system.h
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
 
