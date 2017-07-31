From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: pdc_stable: Fix locking when creating sysfs links
Date: Mon, 31 Jul 2017 15:49:54 +0200
Message-ID: <20170731134954.GA2466@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

There's no need to take the write lock when creating sysfs links.

This patch fixes the following BUG: 
 BUG: sleeping function called from invalid context at mm/slab.h:416
 in_atomic(): 1, irqs_disabled(): 0, pid: 1, name: swapper/0
 CPU: 2 PID: 1 Comm: swapper/0 Not tainted 4.13.0-rc2-00110-g0b5477d9dabd #111
 Backtrace:
 [<0000000040217ac8>] show_stack+0x20/0x38
 [<00000000406fbbb0>] dump_stack+0xb0/0x128
 [<0000000040274090>] ___might_sleep+0x180/0x1b8
 [<0000000040274144>] __might_sleep+0x7c/0xe8
 [<0000000040373874>] kmem_cache_alloc+0x14c/0x1e0
 [<0000000040419514>] __kernfs_new_node+0x84/0x1b8
 [<000000004041b09c>] kernfs_new_node+0x3c/0x78
 [<000000004041e040>] kernfs_create_link+0x40/0xd8
 [<000000004041f320>] sysfs_do_create_link_sd.isra.0+0xb0/0x130
 [<000000004041f3d4>] sysfs_create_link+0x34/0x58
 [<000000004011b4a4>] pdc_stable_init+0x2c4/0x458
 [<0000000040200250>] do_one_initcall+0x70/0x1d8
 [<0000000040101644>] kernel_init_freeable+0x27c/0x390
 [<000000004020be44>] kernel_init+0x24/0x1c0

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Reported-by: Meelis Roos <mroos@linux.ee>

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 7147aa5..b1ff46f 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -333,11 +333,11 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, const char *buf, size_t coun
 	
 	/* Update the symlink to the real device */
 	sysfs_remove_link(&entry->kobj, "device");
+	write_unlock(&entry->rw_lock);
+
 	ret = sysfs_create_link(&entry->kobj, &entry->dev->kobj, "device");
 	WARN_ON(ret);
 
-	write_unlock(&entry->rw_lock);
-	
 	printk(KERN_INFO PDCS_PREFIX ": changed \"%s\" path to \"%s\"\n",
 		entry->name, buf);
 	
@@ -998,6 +998,7 @@ pdcs_register_pathentries(void)
 		/* kobject is now registered */
 		write_lock(&entry->rw_lock);
 		entry->ready = 2;
+		write_unlock(&entry->rw_lock);
 		
 		/* Add a nice symlink to the real device */
 		if (entry->dev) {
@@ -1005,7 +1006,6 @@ pdcs_register_pathentries(void)
 			WARN_ON(err);
 		}
 
-		write_unlock(&entry->rw_lock);
 		kobject_uevent(&entry->kobj, KOBJ_ADD);
 	}
 	
