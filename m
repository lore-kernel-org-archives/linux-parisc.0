From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sun, 27 Mar 2005 01:53:30 -0700
Message-ID: <20050327085330.GA17602@colo.lackof.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<200503252150.28207.dmp@davidmpye.dyndns.org>
	<20050326071349.GB28972@colo.lackof.org>
	<200503261514.43287.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503261514.43287.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 26, 2005 at 03:14:41PM +0000, David Pye wrote:
> Attached! The only real change now is that the minimum on-time is now LCD 
> only, so hopefully this gets us the best of both worlds. LED people won't 
> notice anything different, and the LCD should now be nicely responsive.

I've attached the patch I'm willing to commit...works for me.

And I really like the work-queue implementation. It nicely
solves the cmd/data pair problem and consolidates more of the
support in led.c.  The only drawback I can see so far is the
scheduler may chose to not run the led_func when it needs to
be run. If a machine is really busy, only the hearbeat will
suffer and I expect users will get other clues that the machine
is just really busy.

Sorry - I can't get warm to the implementation of minimum on time.
It was really cluttering up the main routine.
Can I commit this patch for now and then we follow up with another
patch for minimum on-time?

I think I would be ok with it implemented inside the led_get*
activity routines. They have access to lastleds and jiffies and
that should be enough to figure out how long an LED should stay
on if it's already on.  The main routine can stay simple/readable.

I also just realized because led_get* routines are static inline,
led_lanrxtx and led_diskio tests can be moved to the respective
routines as well with no harm to performance. May be a bad idea
though since current construct is pretty obvious what they do.

cheers,
grant


Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

Index: arch/parisc/kernel/time.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/time.c,v
retrieving revision 1.9
diff -u -p -r1.9 time.c
--- arch/parisc/kernel/time.c	21 Oct 2004 18:58:24 -0000	1.9
+++ arch/parisc/kernel/time.c	27 Mar 2005 08:33:00 -0000
@@ -89,14 +89,6 @@ irqreturn_t timer_interrupt(int irq, voi
 		}
 	}
     
-#ifdef CONFIG_CHASSIS_LCD_LED
-	/* Only schedule the led tasklet on cpu 0, and only if it
-	 * is enabled.
-	 */
-	if (cpu == 0 && !atomic_read(&led_tasklet.count))
-		tasklet_schedule(&led_tasklet);
-#endif
-
 	/* check soft power switch status */
 	if (cpu == 0 && !atomic_read(&power_tasklet.count))
 		tasklet_schedule(&power_tasklet);
Index: drivers/parisc/led.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/led.c,v
retrieving revision 1.12
diff -u -p -r1.12 led.c
--- drivers/parisc/led.c	18 Mar 2005 13:17:10 -0000	1.12
+++ drivers/parisc/led.c	27 Mar 2005 08:33:00 -0000
@@ -18,6 +18,9 @@
  * Changes:
  *      - Audit copy_from_user in led_proc_write.
  *                                Daniele Bellucci <bellucda@tiscali.it>
+ *	- Switch from using a tasklet to a work queue, so the led_LCD_driver
+ *	  	can sleep.
+ *	  			  David Pye <dmp@davidmpye.dyndns.org>
  */
 
 #include <linux/config.h>
@@ -37,6 +40,7 @@
 #include <linux/proc_fs.h>
 #include <linux/ctype.h>
 #include <linux/blkdev.h>
+#include <linux/workqueue.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/hardware.h>
@@ -46,25 +50,30 @@
 #include <asm/uaccess.h>
 
 /* The control of the LEDs and LCDs on PARISC-machines have to be done 
-   completely in software. The necessary calculations are done in a tasklet
-   which is scheduled at every timer interrupt and since the calculations 
-   may consume relatively much CPU-time some of the calculations can be 
+   completely in software. The necessary calculations are done in a work queue
+   task which is scheduled regularly, and since the calculations may consume a 
+   relatively large amount of CPU time, some of the calculations can be 
    turned off with the following variables (controlled via procfs) */
 
 static int led_type = -1;
-static int led_heartbeat = 1;
-static int led_diskio = 1;
-static int led_lanrxtx = 1;
+static unsigned char lastleds;	/* LED state from most recent update */
+static unsigned int led_heartbeat = 1;
+static unsigned int led_diskio = 1;
+static unsigned int led_lanrxtx = 1;
 static char lcd_text[32];
 static char lcd_text_default[32];
 
+
+static struct workqueue_struct *led_wq;
+static void led_work_func(void *);
+static DECLARE_WORK(led_task, led_work_func, NULL);
+
 #if 0
 #define DPRINTK(x)	printk x
 #else
 #define DPRINTK(x)
 #endif
 
-
 struct lcd_block {
 	unsigned char command;	/* stores the command byte      */
 	unsigned char on;	/* value for turning LED on     */
@@ -115,12 +124,24 @@ lcd_info __attribute__((aligned(8))) =
 #define LCD_DATA_REG	lcd_info.lcd_data_reg_addr	 
 #define LED_DATA_REG	lcd_info.lcd_cmd_reg_addr	/* LASI & ASP only */
 
+#define LED_HASLCD 1
+#define LED_NOLCD  0
+
+/* The workqueue must be created at init-time */
+static int start_task(void) 
+{	
+	/* Create the work queue and queue the LED task */
+	led_wq = create_singlethread_workqueue("led_wq");	
+	queue_work(led_wq, &led_task);
+
+	return 0;
+}
+
+device_initcall(start_task);
 
 /* ptr to LCD/LED-specific function */
 static void (*led_func_ptr) (unsigned char);
 
-#define LED_HASLCD 1
-#define LED_NOLCD  0
 #ifdef CONFIG_PROC_FS
 static int led_proc_read(char *page, char **start, off_t off, int count, 
 	int *eof, void *data)
@@ -285,52 +306,35 @@ static void led_LASI_driver(unsigned cha
 /*
    ** 
    ** led_LCD_driver()
-   ** 
-   ** The logic of the LCD driver is, that we write at every scheduled call
-   ** only to one of LCD_CMD_REG _or_ LCD_DATA_REG - registers.
-   ** That way we don't need to let this tasklet busywait for min_cmd_delay
-   ** milliseconds.
-   **
-   ** TODO: check the value of "min_cmd_delay" against the value of HZ.
    **   
  */
 static void led_LCD_driver(unsigned char leds)
 {
-	static int last_index;	/* 0:heartbeat, 1:disk, 2:lan_in, 3:lan_out */
-	static int last_was_cmd;/* 0: CMD was written last, 1: DATA was last */
-	struct lcd_block *block_ptr;
-	int value;
-
-	switch (last_index) {
-	    case 0:	block_ptr = &lcd_info.heartbeat;
-			value = leds & LED_HEARTBEAT;
-			break;
-	    case 1:	block_ptr = &lcd_info.disk_io;
-			value = leds & LED_DISK_IO;
-			break;					
-	    case 2:	block_ptr = &lcd_info.lan_rcv;
-			value = leds & LED_LAN_RCV;
-			break;					
-	    case 3:	block_ptr = &lcd_info.lan_tx;
-			value = leds & LED_LAN_TX;
-			break;
-	    default:	/* should never happen: */
-			return;
-	}
-
-	if (last_was_cmd) {
-	    /* write the value to the LCD data port */
-    	    gsc_writeb( value ? block_ptr->on : block_ptr->off, LCD_DATA_REG );
-	} else {
-	    /* write the command-byte to the LCD command register */
-    	    gsc_writeb( block_ptr->command, LCD_CMD_REG );
-	}    
-	
-	/* now update the vars for the next interrupt iteration */ 
-	if (++last_was_cmd == 2) { /* switch between cmd & data */
-	    last_was_cmd = 0;
-	    if (++last_index == 4) 
-		last_index = 0;	 /* switch back to heartbeat index */
+	static int i;
+	static unsigned char mask[4] = { LED_HEARTBEAT, LED_DISK_IO,
+		LED_LAN_RCV, LED_LAN_TX };
+	
+	static struct lcd_block * blockp[4] = {
+		&lcd_info.heartbeat,
+		&lcd_info.disk_io,
+		&lcd_info.lan_rcv,
+		&lcd_info.lan_tx
+	};
+
+	/* Convert min_cmd_delay to milliseconds */
+	unsigned int msec_cmd_delay = 1 + (lcd_info.min_cmd_delay / 1000);
+	
+	for (i=0; i<4; ++i) 
+	{
+		if ((leds & mask[i]) != (lastleds & mask[i])) 
+		{
+			gsc_writeb( blockp[i]->command, LCD_CMD_REG );
+			msleep(msec_cmd_delay);
+			
+			gsc_writeb( leds & mask[i] ? blockp[i]->on : 
+					blockp[i]->off, LCD_DATA_REG );
+			msleep(msec_cmd_delay);
+		}
 	}
 }
 
@@ -355,7 +359,7 @@ static __inline__ int led_get_net_activi
 
 	rx_total = tx_total = 0;
 	
-	/* we are running as tasklet, so locking dev_base 
+	/* we are running as a workqueue task, so locking dev_base 
 	 * for reading should be OK */
 	read_lock(&dev_base_lock);
 	for (dev = dev_base; dev; dev = dev->next) {
@@ -402,7 +406,7 @@ static __inline__ int led_get_diskio_act
 	static unsigned long last_pgpgin, last_pgpgout;
 	struct page_state pgstat;
 	int changed;
-	
+
 	get_full_page_state(&pgstat); /* get no of sectors in & out */
 
 	/* Just use a very simple calculation here. Do not care about overflow,
@@ -410,86 +414,68 @@ static __inline__ int led_get_diskio_act
 	changed = (pgstat.pgpgin != last_pgpgin) || (pgstat.pgpgout != last_pgpgout);
 	last_pgpgin  = pgstat.pgpgin;
 	last_pgpgout = pgstat.pgpgout;
-	
+
 	return (changed ? LED_DISK_IO : 0);
 }
 
 
 
 /*
-   ** led_tasklet_func()
+   ** led_work_func()
    ** 
-   ** is scheduled at every timer interrupt from time.c and
-   ** updates the chassis LCD/LED 
+   ** manages when and which chassis LCD/LED gets updated
 
     TODO:
     - display load average (older machines like 715/64 have 4 "free" LED's for that)
     - optimizations
  */
 
-#define HEARTBEAT_LEN (HZ*6/100)
-#define HEARTBEAT_2ND_RANGE_START (HZ*22/100)
+#define HEARTBEAT_LEN (HZ*10/100)
+#define HEARTBEAT_2ND_RANGE_START (HZ*28/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_LEN)
 
-#define NORMALIZED_COUNT(count) (count/(HZ/100))
+#define LED_UPDATE_INTERVAL (1 + (HZ*19/1000))
 
-static void led_tasklet_func(unsigned long unused)
+static void led_work_func (void *unused)
 {
-	static unsigned char lastleds;
-	unsigned char currentleds; /* stores current value of the LEDs */
-	static unsigned long count; /* static incremented value, not wrapped */
 	static unsigned long count_HZ; /* counter in range 0..HZ */
+	unsigned char currentleds = 0; /* stores current value of the LEDs */
 
 	/* exit if not initialized */
 	if (!led_func_ptr)
 	    return;
 
-	/* increment the local counters */
-	++count;
-	if (++count_HZ == HZ)
+	/* increment the local counter */
+	count_HZ += LED_UPDATE_INTERVAL;
+	if (count_HZ >= HZ)
 	    count_HZ = 0;
 
-	currentleds = lastleds;
-
 	if (led_heartbeat)
 	{
-		/* flash heartbeat-LED like a real heart (2 x short then a long delay) */
-		if (count_HZ<HEARTBEAT_LEN || 
-		    (count_HZ>=HEARTBEAT_2ND_RANGE_START && count_HZ<HEARTBEAT_2ND_RANGE_END)) 
-		    currentleds |= LED_HEARTBEAT;
-		else
-		    currentleds &= ~LED_HEARTBEAT;
+		/* flash heartbeat-LED like a real heart
+		 * (2 x short then a long delay)
+		 */
+		if (count_HZ < HEARTBEAT_LEN || 
+				(count_HZ >= HEARTBEAT_2ND_RANGE_START &&
+				count_HZ < HEARTBEAT_2ND_RANGE_END)) 
+			currentleds |= LED_HEARTBEAT;
 	}
 
-	/* look for network activity and flash LEDs respectively */
-	if (led_lanrxtx && ((NORMALIZED_COUNT(count)+(8/2)) & 7) == 0)
-	{
-		currentleds &= ~(LED_LAN_RCV | LED_LAN_TX);
-		currentleds |= led_get_net_activity();
-	}
-
-	/* avoid to calculate diskio-stats at same irq  as netio-stats */
-	if (led_diskio && (NORMALIZED_COUNT(count) & 7) == 0)
-	{
-		currentleds &= ~LED_DISK_IO;
-		currentleds |= led_get_diskio_activity();
-	}
+	if (led_lanrxtx)  currentleds |= led_get_net_activity();
+	if (led_diskio)   currentleds |= led_get_diskio_activity();
 
 	/* blink all LEDs twice a second if we got an Oops (HPMC) */
-	if (oops_in_progress) {
+	if (oops_in_progress) 
 		currentleds = (count_HZ<=(HZ/2)) ? 0 : 0xff;
-	}
-	
-	/* update the LCD/LEDs */
-	if (currentleds != lastleds) {
-	    led_func_ptr(currentleds);
-	    lastleds = currentleds;
-	}
-}
 
-/* main led tasklet struct (scheduled from time.c) */
-DECLARE_TASKLET_DISABLED(led_tasklet, led_tasklet_func, 0);
+	if (currentleds != lastleds)
+	{
+		led_func_ptr(currentleds);	/* Update the LCD/LEDs */
+		lastleds = currentleds;
+	}
 
+	queue_delayed_work(led_wq, &led_task, LED_UPDATE_INTERVAL);
+}
 
 /*
    ** led_halt()
@@ -519,9 +505,13 @@ static int led_halt(struct notifier_bloc
 	default:		return NOTIFY_DONE;
 	}
 	
-	/* completely stop the LED/LCD tasklet */
-	tasklet_disable(&led_tasklet);
-
+	/* Cancel the work item and delete the queue */
+	if (led_wq) {
+		if (cancel_delayed_work(&led_task) == 0) 
+			flush_workqueue(led_wq);
+		destroy_workqueue(led_wq);
+	}
+ 
 	if (lcd_info.model == DISPLAY_MODEL_LCD)
 		lcd_print(txt);
 	else
@@ -586,9 +576,6 @@ int __init register_led_driver(int model
 	initialized++;
 	register_reboot_notifier(&led_notifier);
 
-	/* start the led tasklet for the first time */
-	tasklet_enable(&led_tasklet);
-	
 	return 0;
 }
 
@@ -623,7 +610,7 @@ void __init register_led_regions(void)
    ** lcd_print()
    ** 
    ** Displays the given string on the LCD-Display of newer machines.
-   ** lcd_print() disables the timer-based led tasklet during its 
+   ** lcd_print() disables the timer-based led work task during its 
    ** execution and enables it afterwards again.
    **
  */
@@ -634,12 +621,14 @@ int lcd_print( char *str )
 	if (!led_func_ptr || lcd_info.model != DISPLAY_MODEL_LCD)
 	    return 0;
 	
-	/* temporarily disable the led tasklet */
-	tasklet_disable(&led_tasklet);
-
+	/* temporarily disable the led work task */
+	if (led_wq) {
+		if (cancel_delayed_work(&led_task) == 0) 
+			flush_workqueue(led_wq);
+	}
 	/* copy display string to buffer for procfs */
 	strlcpy(lcd_text, str, sizeof(lcd_text));
-	
+
 	/* Set LCD Cursor to 1st character */
 	gsc_writeb(lcd_info.reset_cmd1, LCD_CMD_REG);
 	udelay(lcd_info.min_cmd_delay);
@@ -653,8 +642,10 @@ int lcd_print( char *str )
 	    udelay(lcd_info.min_cmd_delay);
 	}
 	
-	/* re-enable the led tasklet */
-	tasklet_enable(&led_tasklet);
+	/* re-queue the work */
+	if (led_wq) {
+		queue_work(led_wq, &led_task);
+	}
 
 	return lcd_info.lcd_width;
 }
Index: include/asm-parisc/led.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/led.h,v
retrieving revision 1.3
diff -u -p -r1.3 led.h
--- include/asm-parisc/led.h	30 Dec 2004 08:07:48 -0000	1.3
+++ include/asm-parisc/led.h	27 Mar 2005 08:33:00 -0000
@@ -23,9 +23,6 @@
 
 #define LED_CMD_REG_NONE 0		/* NULL == no addr for the cmd register */
 
-/* led tasklet struct */
-extern struct tasklet_struct led_tasklet;
