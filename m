From: Helge Deller <deller@gmx.de>
Subject: [PATCH] Add compile-time check for __ARCH_SI_PREAMBLE_SIZE
Date: Sun, 17 Jan 2016 22:00:46 +0100
Message-ID: <20160117210046.GA11472@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The value of __ARCH_SI_PREAMBLE_SIZE defines the size (including padding) of
the part of the struct siginfo that is before the union, and it is then used to
calculate the needed padding (SI_PAD_SIZE) to make the size of struct siginfo
equal to 128 (SI_MAX_SIZE) bytes.

Depending on the target architecture and word width it equals to either
3 or 4 times sizeof int.

Since the very beginning we had __ARCH_SI_PREAMBLE_SIZE wrong on the parisc
architecture for the 64bit kernel build. It's even more frustrating, because it
can easily be checked at compile time if the value was defined correctly.

This patch adds such a check for the correctness of __ARCH_SI_PREAMBLE_SIZE in
the hope that it will prevent existing and future architectures from running
into the same problem.

I refrained from replacing __ARCH_SI_PREAMBLE_SIZE by offsetof() in
copy_siginfo() in include/asm-generic/siginfo.h, because a) it doesn't make any
difference and b) it's used in the Documentation/kmemcheck.txt example.

I ran this patch through the 0-DAY kernel test infrastructure and only the
parisc architecture triggered as expected. That means that this patch should be
OK for all major architectures.
 
Signed-off-by: Helge Deller <deller@gmx.de>
 
diff --git a/kernel/signal.c b/kernel/signal.c
index f3f1f7a..1ccd218 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3579,6 +3579,10 @@ __weak const char *arch_vma_name(struct vm_area_struct *vma)
 
 void __init signals_init(void)
 {
+	/* If this check fails, the __ARCH_SI_PREAMBLE_SIZE value is wrong! */
+	BUILD_BUG_ON(__ARCH_SI_PREAMBLE_SIZE
+		!= offsetof(struct siginfo, _sifields._pad));
+
 	sigqueue_cachep = KMEM_CACHE(sigqueue, SLAB_PANIC);
 }
 
