From: Eric Biggers <ebiggers3@gmail.com>
Subject: [PATCH] parisc: use compat_sys_keyctl()
Date: Mon, 12 Jun 2017 23:18:30 -0700
Message-ID: <20170613061830.18013-1-ebiggers3@gmail.com>
Cc: "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, keyrings@vger.kernel.org,
        Eric Biggers <ebiggers@google.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Architectures with a compat syscall table must put compat_sys_keyctl()
in it, not sys_keyctl().  The parisc architecture was not doing this;
fix it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/parisc/kernel/syscall_table.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 44aeaa9c039f..6308749359e4 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -361,7 +361,7 @@
 	ENTRY_SAME(ni_syscall)	/* 263: reserved for vserver */
 	ENTRY_SAME(add_key)
 	ENTRY_SAME(request_key)		/* 265 */
-	ENTRY_SAME(keyctl)
+	ENTRY_COMP(keyctl)
 	ENTRY_SAME(ioprio_set)
 	ENTRY_SAME(ioprio_get)
 	ENTRY_SAME(inotify_init)
-- 
2.13.1

