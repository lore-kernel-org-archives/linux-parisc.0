From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 08/18] parisc: remove big kernel lock
Date: Tue, 14 Sep 2010 21:34:59 +0200
Message-ID: <1284492909-7147-9-git-send-email-arnd@arndb.de>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: arnd@arndb.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1284492909-7147-1-git-send-email-arnd@arndb.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The parisc version of the perf code is sufficiently
protected by its own spinlock, no need to use the BKL.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/perf.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index f9f6783..ba0c053 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -46,7 +46,6 @@
 #include <linux/init.h>
 #include <linux/proc_fs.h>
 #include <linux/miscdevice.h>
-#include <linux/smp_lock.h>
 #include <linux/spinlock.h>
 
 #include <asm/uaccess.h>
@@ -261,16 +260,13 @@ printk("Preparing to start counters\n");
  */
 static int perf_open(struct inode *inode, struct file *file)
 {
-	lock_kernel();
 	spin_lock(&perf_lock);
 	if (perf_enabled) {
 		spin_unlock(&perf_lock);
-		unlock_kernel();
 		return -EBUSY;
 	}
 	perf_enabled = 1;
  	spin_unlock(&perf_lock);
-	unlock_kernel();
 
 	return 0;
 }
-- 
1.7.1

