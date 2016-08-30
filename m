From: Bhaktipriya Shridhar <bhaktipriya96@gmail.com>
Subject: [PATCH] parisc: led: Remove deprecated create_singlethread_workqueue
Date: Tue, 30 Aug 2016 22:03:43 +0530
Message-ID: <20160830163343.GA25952@Karyakshetra>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Tejun Heo <tj@kernel.org>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The workqueue "led_wq" queues a single work item &led_task and hence
doesn't require ordering. It is involved in managing when and which
chassis LCD/LED gets updated and hence, is not being used on a memory
reclaim path. Hence, it has been converted to use system_wq.

System workqueues have been able to handle high level of concurrency
for a long time now and hence it's not required to have a singlethreaded
workqueue just to gain concurrency. Unlike a dedicated per-cpu workqueue
created with create_singlethread_workqueue(), system_wq allows multiple
work items to overlap executions even on the same CPU; however, a
per-cpu workqueue doesn't have any CPU locality or global ordering
guarantee unless the target CPU is explicitly specified and thus the
increase of local concurrency shouldn't make any difference.

The work item has been sync cancelled in led_halt to ensure that
there are no pending tasks while disconnecting the driver.

Signed-off-by: Bhaktipriya Shridhar <bhaktipriya96@gmail.com>
---
 drivers/parisc/led.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index b482431..89dff2e 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -67,7 +67,6 @@ static char lcd_text_default[32]  __read_mostly;
 static int  lcd_no_led_support    __read_mostly = 0; /* KittyHawk doesn't support LED on its LCD */


-static struct workqueue_struct *led_wq;
 static void led_work_func(struct work_struct *);
 static DECLARE_DELAYED_WORK(led_task, led_work_func);

@@ -140,8 +139,7 @@ static int start_task(void)
 	if (lcd_no_led_support) return 0;

 	/* Create the work queue and queue the LED task */
-	led_wq = create_singlethread_workqueue("led_wq");
-	queue_delayed_work(led_wq, &led_task, 0);
+	schedule_delayed_work(&led_task, 0);

 	return 0;
 }
@@ -524,12 +522,8 @@ static int led_halt(struct notifier_block *nb, unsigned long event, void *buf)
 	default:		return NOTIFY_DONE;
 	}

-	/* Cancel the work item and delete the queue */
-	if (led_wq) {
-		cancel_delayed_work_sync(&led_task);
-		destroy_workqueue(led_wq);
-		led_wq = NULL;
-	}
+	/* Cancel the work item */
+	cancel_delayed_work_sync(&led_task);

 	if (lcd_info.model == DISPLAY_MODEL_LCD)
 		lcd_print(txt);
@@ -594,9 +588,7 @@ int __init register_led_driver(int model, unsigned long cmd_reg, unsigned long d
 	register_reboot_notifier(&led_notifier);

 	/* Ensure the work is queued */
-	if (led_wq) {
-		queue_delayed_work(led_wq, &led_task, 0);
-	}
+	schedule_delayed_work(&led_task, 0);

 	return 0;
 }
@@ -644,8 +636,7 @@ int lcd_print( const char *str )
 	    return 0;

 	/* temporarily disable the led work task */
-	if (led_wq)
-		cancel_delayed_work_sync(&led_task);
+	cancel_delayed_work_sync(&led_task);

 	/* copy display string to buffer for procfs */
 	strlcpy(lcd_text, str, sizeof(lcd_text));
@@ -664,9 +655,7 @@ int lcd_print( const char *str )
 	}

 	/* re-queue the work */
-	if (led_wq) {
-		queue_delayed_work(led_wq, &led_task, 0);
-	}
+	schedule_delayed_work(&led_task, 0);

 	return lcd_info.lcd_width;
 }
--
2.1.4

