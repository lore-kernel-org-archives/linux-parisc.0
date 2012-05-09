From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 1/5] PA-RISC: fix compile errors
Date: Wed, 9 May 2012 18:16:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.1205091758310.1272@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
To: torvalds@linux-foundation.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Rolf Eike Beer <eike-kernel@sf-tec.de>

This leads to this errors:

In file included from /home/buildbot/repos/linux/arch/parisc/include/asm/atomic.h:20:0,
                 from /home/buildbot/repos/linux/include/linux/atomic.h:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h:56,
                 from /home/buildbot/repos/linux/include/linux/bitops.h:22,
                 from /home/buildbot/repos/linux/include/linux/kernel.h:19,
                 from /home/buildbot/repos/linux/include/linux/sched.h:55,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/asm-offsets.c:31:
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h: In function "arch_spin_is_locked":
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:9:2: error: implicit declaration of function "__ldcw_align" [-Werror=implicit-function-declaration]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:9:29: warning: initialization makes pointer from integer without a cast [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h: In function "arch_spin_lock_flags":
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:22:2: error: implicit declaration of function "mb" [-Werror=implicit-function-declaration]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:23:4: warning: assignment makes pointer from integer without a cast [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:24:2: error: implicit declaration of function "__ldcw" [-Werror=implicit-function-declaration]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
---
 arch/parisc/include/asm/spinlock.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 804aa28..3516e0b 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_SPINLOCK_H
 #define __ASM_SPINLOCK_H
 
+#include <asm/barrier.h>
+#include <asm/ldcw.h>
 #include <asm/processor.h>
 #include <asm/spinlock_types.h>
 
