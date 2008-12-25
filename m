From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 1/7] arch/parisc: Use DEFINE_SPINLOCK
Date: Thu, 25 Dec 2008 15:33:11 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812251532430.22039@ask.diku.dk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
in Documentation/spinlocks.txt

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
declarer name DEFINE_SPINLOCK;
identifier xxx_lock;
@@

- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
+ DEFINE_SPINLOCK(xxx_lock);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
--- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -52,7 +52,7 @@
 #include <linux/tty.h>
 #include <asm/pdc.h>		/* for iodc_call() proto and friends */
 
-static spinlock_t pdc_console_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_SPINLOCK(pdc_console_lock);
 
 static void pdc_console_write(struct console *co, const char *s, unsigned count)
 {
