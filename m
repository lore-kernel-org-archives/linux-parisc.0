From: Davidlohr Bueso <davidlohr@hp.com>
Subject: [PATCH 2/2] locking/rwsem: Disable optimistic spinning for PA-RISC
Date: Fri,  6 Jun 2014 08:55:40 -0700
Message-ID: <1402070140-15090-3-git-send-email-davidlohr@hp.com>
References: <1402070140-15090-1-git-send-email-davidlohr@hp.com>
Cc: mpatocka@redhat.com, torvalds@linux-foundation.org,
	jason.low2@hp.com, waiman.long@hp.com, jejb@parisc-linux.org,
	paulmck@linux.vnet.ibm.com, dave.anglin@bell.net, aswin@hp.com,
	davidlohr@hp.com, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: peterz@infradead.org, mingo@kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402070140-15090-1-git-send-email-davidlohr@hp.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PA-RISC's cmpxchg is not save against normal stores and the code used
for optimistic spinning is known broken because of this.

Disable for now.

[Changelog from PeterZ]
Reported-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Davidlohr Bueso <davidlohr@hp.com>
---
 kernel/Kconfig.locks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
index e4c3162..125c77a 100644
--- a/kernel/Kconfig.locks
+++ b/kernel/Kconfig.locks
@@ -226,7 +226,7 @@ config MUTEX_SPIN_ON_OWNER
 
 config RWSEM_SPIN_ON_OWNER
        def_bool y
-       depends on SMP && RWSEM_XCHGADD_ALGORITHM
+       depends on SMP && RWSEM_XCHGADD_ALGORITHM && !PARISC
 
 config ARCH_USE_QUEUE_RWLOCK
 	bool
-- 
1.8.1.4
