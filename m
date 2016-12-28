From: Davidlohr Bueso <dave@stgolabs.net>
Subject: [PATCH] parisc: use generic current.h
Date: Tue, 27 Dec 2016 19:48:23 -0800
Message-ID: <1482896903-25761-1-git-send-email-dave@stgolabs.net>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Davidlohr Bueso <dave@stgolabs.net>,
        Davidlohr Bueso <dbueso@suse.de>
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Given that the arch does not add its own implementations, simply
use the asm-generic/current.h (generic-y) header instead of
duplicating code.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 arch/parisc/include/asm/Kbuild    |  1 +
 arch/parisc/include/asm/current.h | 15 ---------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 arch/parisc/include/asm/current.h

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 91f53c07f410..a07448dc2b29 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -3,6 +3,7 @@ generic-y += auxvec.h
 generic-y += barrier.h
 generic-y += clkdev.h
 generic-y += cputime.h
+generic-y += current.h
 generic-y += device.h
 generic-y += div64.h
 generic-y += emergency-restart.h
diff --git a/arch/parisc/include/asm/current.h b/arch/parisc/include/asm/current.h
deleted file mode 100644
index 0fb9338e3bf2..000000000000
--- a/arch/parisc/include/asm/current.h
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef _PARISC_CURRENT_H
-#define _PARISC_CURRENT_H
-
-#include <linux/thread_info.h>
-
-struct task_struct;
-
-static inline struct task_struct * get_current(void)
-{
-	return current_thread_info()->task;
-}
- 
-#define current get_current()
-
-#endif /* !(_PARISC_CURRENT_H) */
-- 
2.6.6
