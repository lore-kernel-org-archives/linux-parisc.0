From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] suppress led task for KittyHawk's LCD
Date: Sun, 12 Nov 2006 01:45:35 +0100
Message-ID: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Sun__12_Nov_2006_01_45_35_+0100_v2fihL715RsiaKYq"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.

--Multipart=_Sun__12_Nov_2006_01_45_35_+0100_v2fihL715RsiaKYq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi All,

I've noticed that the LCD on my K410 is filled at a constant rate with black characters.
After some investigation, it looked like the code updating the led status was filling the LCD.

I believe there is not led support on K class but I didn't checked.

The attached patch disable the led_task, which is updating the led status, for KittyHawk hardware.

Thanks for reviewing :)

  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port Lead


--Multipart=_Sun__12_Nov_2006_01_45_35_+0100_v2fihL715RsiaKYq
Content-Type: text/x-patch;
 name="no-led-on-kittyhawk.patch"
Content-Disposition: attachment;
 filename="no-led-on-kittyhawk.patch"
Content-Transfer-Encoding: 7bit

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 8dac2ba..29cb1fe 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -56,6 +56,7 @@ #include <asm/uaccess.h>
    relatively large amount of CPU time, some of the calculations can be 
    turned off with the following variables (controlled via procfs) */
 
+static int no_led = 0;
 static int led_type __read_mostly = -1;
 static unsigned char lastleds;	/* LED state from most recent update */
 static unsigned int led_heartbeat __read_mostly = 1;
@@ -65,7 +66,7 @@ static char lcd_text[32]          __read
 static char lcd_text_default[32]  __read_mostly;
 
 
-static struct workqueue_struct *led_wq;
+static struct workqueue_struct *led_wq = NULL;
 static void led_work_func(void *);
 static DECLARE_WORK(led_task, led_work_func, NULL);
 
@@ -134,6 +135,9 @@ static int start_task(void) 
 	/* Display the default text now */
 	if (led_type == LED_HASLCD) lcd_print( lcd_text_default );
 
+	/* There is no led support on KittyHawk */
+	if (no_led) return 0;
+
 	/* Create the work queue and queue the LED task */
 	led_wq = create_singlethread_workqueue("led_wq");	
 	queue_work(led_wq, &led_task);
@@ -695,6 +699,7 @@ int __init led_init(void)
 	case 0x58B:		/* KittyHawk DC2 100 (K200) */
 		printk(KERN_INFO "%s: KittyHawk-Machine (hversion 0x%x) found, "
 				"LED detection skipped.\n", __FILE__, CPU_HVERSION);
+		no_led = 1;	/* no led support on KittyHawk */
 		goto found;	/* use the preinitialized values of lcd_info */
 	}
 

--Multipart=_Sun__12_Nov_2006_01_45_35_+0100_v2fihL715RsiaKYq
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Sun__12_Nov_2006_01_45_35_+0100_v2fihL715RsiaKYq--
