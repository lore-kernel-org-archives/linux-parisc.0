From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Thu, 24 Mar 2005 21:00:05 +0000
Message-ID: <200503242100.06699.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<1111694714.5519.28.camel@mulgrave>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1437315856=="
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1111694714.5519.28.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1437315856==
Content-Type: multipart/signed; boundary="nextPart2757519.HmDgPxnUXr";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2757519.HmDgPxnUXr
Content-Type: multipart/mixed;
  boundary="Boundary-01=_VpyQC8/c3N8Bsfx"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_VpyQC8/c3N8Bsfx
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Thanks for your feedback.

I wish the kernel driver development book clearly marked what was deprecate=
d=20
these days </whinge>

I believe the attached patch fixes the points you noted, with the exception=
 of=20
not yet using cancel_rearming_delayed_workqueue().  =20

The second patch I submitted still applies okay after this one. (offset -2=
=20
lines thanks to the removal of the duplicated strlcpy).

Thanks,

David

--Boundary-01=_VpyQC8/c3N8Bsfx
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="led_lcd_patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="led_lcd_patch"

diff -urpN oldtree/arch/parisc/kernel/time.c newtree/arch/parisc/kernel/tim=
e.c
=2D-- oldtree/arch/parisc/kernel/time.c	2004-10-21 19:58:24.000000000 +0100
+++ newtree/arch/parisc/kernel/time.c	2005-03-24 20:31:59.000000000 +0000
@@ -89,14 +89,6 @@ irqreturn_t timer_interrupt(int irq, voi
 		}
 	}
    =20
=2D#ifdef CONFIG_CHASSIS_LCD_LED
=2D	/* Only schedule the led tasklet on cpu 0, and only if it
=2D	 * is enabled.
=2D	 */
=2D	if (cpu =3D=3D 0 && !atomic_read(&led_tasklet.count))
=2D		tasklet_schedule(&led_tasklet);
=2D#endif
=2D
 	/* check soft power switch status */
 	if (cpu =3D=3D 0 && !atomic_read(&power_tasklet.count))
 		tasklet_schedule(&power_tasklet);
diff -urpN oldtree/drivers/parisc/led.c newtree/drivers/parisc/led.c
=2D-- oldtree/drivers/parisc/led.c	2005-03-18 13:17:10.000000000 +0000
+++ newtree/drivers/parisc/led.c	2005-03-24 20:32:49.000000000 +0000
@@ -18,6 +18,9 @@
  * Changes:
  *      - Audit copy_from_user in led_proc_write.
  *                                Daniele Bellucci <bellucda@tiscali.it>
+ *	- Switch from using a tasklet to a work queue, so the led_LCD_driver
+ *	  	can sleep.
+ *	  			  David Pye <dmp@davidmpye.dyndns.org>
  */
=20
 #include <linux/config.h>
@@ -37,6 +40,7 @@
 #include <linux/proc_fs.h>
 #include <linux/ctype.h>
 #include <linux/blkdev.h>
+#include <linux/workqueue.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/hardware.h>
@@ -46,9 +50,9 @@
 #include <asm/uaccess.h>
=20
 /* The control of the LEDs and LCDs on PARISC-machines have to be done=20
=2D   completely in software. The necessary calculations are done in a task=
let
=2D   which is scheduled at every timer interrupt and since the calculation=
s=20
=2D   may consume relatively much CPU-time some of the calculations can be=
=20
+   completely in software. The necessary calculations are done in a work q=
ueue
+   task which is scheduled regularly, and since the calculations may consu=
me a=20
+   relatively large amount of CPU time, some of the calculations can be=20
    turned off with the following variables (controlled via procfs) */
=20
 static int led_type =3D -1;
@@ -58,13 +62,16 @@ static int led_lanrxtx =3D 1;
 static char lcd_text[32];
 static char lcd_text_default[32];
=20
+static struct workqueue_struct *led_wq;
+static void led_work_func(void *);
+static DECLARE_WORK(led_task, led_work_func, NULL);
+
 #if 0
 #define DPRINTK(x)	printk x
 #else
 #define DPRINTK(x)
 #endif
=20
=2D
 struct lcd_block {
 	unsigned char command;	/* stores the command byte      */
 	unsigned char on;	/* value for turning LED on     */
@@ -115,12 +122,24 @@ lcd_info __attribute__((aligned(8))) =3D
 #define LCD_DATA_REG	lcd_info.lcd_data_reg_addr	=20
 #define LED_DATA_REG	lcd_info.lcd_cmd_reg_addr	/* LASI & ASP only */
=20
+#define LED_HASLCD 1
+#define LED_NOLCD  0
+
+/* The workqueue must be created at init-time */
+static int start_task(void)=20
+{=09
+	/* Create the work queue and queue the LED task */
+	led_wq =3D create_singlethread_workqueue("led_wq");=09
+	queue_work(led_wq, &led_task);
+
+	return 0;
+}
+
+device_initcall(start_task);
=20
 /* ptr to LCD/LED-specific function */
 static void (*led_func_ptr) (unsigned char);
=20
=2D#define LED_HASLCD 1
=2D#define LED_NOLCD  0
 #ifdef CONFIG_PROC_FS
 static int led_proc_read(char *page, char **start, off_t off, int count,=20
 	int *eof, void *data)
@@ -285,53 +304,37 @@ static void led_LASI_driver(unsigned cha
 /*
    **=20
    ** led_LCD_driver()
=2D   **=20
=2D   ** The logic of the LCD driver is, that we write at every scheduled c=
all
=2D   ** only to one of LCD_CMD_REG _or_ LCD_DATA_REG - registers.
=2D   ** That way we don't need to let this tasklet busywait for min_cmd_de=
lay
=2D   ** milliseconds.
=2D   **
=2D   ** TODO: check the value of "min_cmd_delay" against the value of HZ.
    **  =20
  */
 static void led_LCD_driver(unsigned char leds)
 {
=2D	static int last_index;	/* 0:heartbeat, 1:disk, 2:lan_in, 3:lan_out */
=2D	static int last_was_cmd;/* 0: CMD was written last, 1: DATA was last */
=2D	struct lcd_block *block_ptr;
=2D	int value;
=2D
=2D	switch (last_index) {
=2D	    case 0:	block_ptr =3D &lcd_info.heartbeat;
=2D			value =3D leds & LED_HEARTBEAT;
=2D			break;
=2D	    case 1:	block_ptr =3D &lcd_info.disk_io;
=2D			value =3D leds & LED_DISK_IO;
=2D			break;				=09
=2D	    case 2:	block_ptr =3D &lcd_info.lan_rcv;
=2D			value =3D leds & LED_LAN_RCV;
=2D			break;				=09
=2D	    case 3:	block_ptr =3D &lcd_info.lan_tx;
=2D			value =3D leds & LED_LAN_TX;
=2D			break;
=2D	    default:	/* should never happen: */
=2D			return;
=2D	}
+	static int lastleds, i;
+	static unsigned char mask[4] =3D { LED_HEARTBEAT, LED_DISK_IO,
+		LED_LAN_RCV, LED_LAN_TX };
+=09
+	static struct lcd_block * blockp[4] =3D {
+		&lcd_info.heartbeat,
+		&lcd_info.disk_io,
+		&lcd_info.lan_rcv,
+		&lcd_info.lan_tx
+	};
=20
=2D	if (last_was_cmd) {
=2D	    /* write the value to the LCD data port */
=2D    	    gsc_writeb( value ? block_ptr->on : block_ptr->off, LCD_DATA_RE=
G );
=2D	} else {
=2D	    /* write the command-byte to the LCD command register */
=2D    	    gsc_writeb( block_ptr->command, LCD_CMD_REG );
=2D	}   =20
=2D=09
=2D	/* now update the vars for the next interrupt iteration */=20
=2D	if (++last_was_cmd =3D=3D 2) { /* switch between cmd & data */
=2D	    last_was_cmd =3D 0;
=2D	    if (++last_index =3D=3D 4)=20
=2D		last_index =3D 0;	 /* switch back to heartbeat index */
+	/* Convert min_cmd_delay to milliseconds */
+	unsigned int msec_cmd_delay =3D 1 + (lcd_info.min_cmd_delay / 1000);
+=09
+	for (i=3D0; i<4; ++i)=20
+	{
+		if ((leds & mask[i]) !=3D (lastleds & mask[i]))=20
+		{
+			gsc_writeb( blockp[i]->command, LCD_CMD_REG );
+			msleep(msec_cmd_delay);
+		=09
+			gsc_writeb( leds & mask[i] ? blockp[i]->on :=20
+					blockp[i]->off, LCD_DATA_REG );
+			msleep(msec_cmd_delay);
+		}
 	}
+	lastleds =3D leds;
 }
=20
=20
@@ -355,7 +358,7 @@ static __inline__ int led_get_net_activi
=20
 	rx_total =3D tx_total =3D 0;
 =09
=2D	/* we are running as tasklet, so locking dev_base=20
+	/* we are running as a workqueue task, so locking dev_base=20
 	 * for reading should be OK */
 	read_lock(&dev_base_lock);
 	for (dev =3D dev_base; dev; dev =3D dev->next) {
@@ -417,10 +420,9 @@ static __inline__ int led_get_diskio_act
=20
=20
 /*
=2D   ** led_tasklet_func()
+   ** led_work_func()
    **=20
=2D   ** is scheduled at every timer interrupt from time.c and
=2D   ** updates the chassis LCD/LED=20
+   ** is scheduled every 5 milliseconds and updates the chassis LCD/LED=20
=20
     TODO:
     - display load average (older machines like 715/64 have 4 "free" LED's=
 for that)
@@ -431,66 +433,104 @@ static __inline__ int led_get_diskio_act
 #define HEARTBEAT_2ND_RANGE_START (HZ*22/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_L=
EN)
=20
=2D#define NORMALIZED_COUNT(count) (count/(HZ/100))
+#define LED_MINIMUM_ON_TIME (HZ*10/100)
=20
=2Dstatic void led_tasklet_func(unsigned long unused)
+#define LED_UPDATE_INTERVAL (1 + (HZ*4/1000))
+
+static void led_work_func (void *unused)
 {
 	static unsigned char lastleds;
=2D	unsigned char currentleds; /* stores current value of the LEDs */
=2D	static unsigned long count; /* static incremented value, not wrapped */
 	static unsigned long count_HZ; /* counter in range 0..HZ */
=20
+	static unsigned long diskio_on_jiffies;
+	static unsigned long lantx_on_jiffies;
+	static unsigned long lanrcv_on_jiffies;
+
+	unsigned char currentleds =3D 0; /* stores current value of the LEDs */
+=09
 	/* exit if not initialized */
 	if (!led_func_ptr)
 	    return;
=20
=2D	/* increment the local counters */
=2D	++count;
=2D	if (++count_HZ =3D=3D HZ)
+	/* increment the local counter */
+	count_HZ +=3D LED_UPDATE_INTERVAL;
+	if (count_HZ >=3D HZ)
 	    count_HZ =3D 0;
=20
=2D	currentleds =3D lastleds;
=2D
 	if (led_heartbeat)
 	{
 		/* flash heartbeat-LED like a real heart (2 x short then a long delay) */
 		if (count_HZ<HEARTBEAT_LEN ||=20
 		    (count_HZ>=3DHEARTBEAT_2ND_RANGE_START && count_HZ<HEARTBEAT_2ND_RAN=
GE_END))=20
 		    currentleds |=3D LED_HEARTBEAT;
=2D		else
=2D		    currentleds &=3D ~LED_HEARTBEAT;
 	}
=20
=2D	/* look for network activity and flash LEDs respectively */
=2D	if (led_lanrxtx && ((NORMALIZED_COUNT(count)+(8/2)) & 7) =3D=3D 0)
+	/* If the leds are on, but should be turned off, make sure they have been=
 on for
+	 * the minimum time, to prevent 'flutter'=20
+	 */
+
+	/* look for network activity and flash LEDs accordingly */
+	if (led_lanrxtx)
 	{
=2D		currentleds &=3D ~(LED_LAN_RCV | LED_LAN_TX);
=2D		currentleds |=3D led_get_net_activity();
+		unsigned char new_lan_leds =3D led_get_net_activity();
+=09
+		/* TX LED */
+		if (new_lan_leds & LED_LAN_TX)=20
+		{
+			currentleds |=3D LED_LAN_TX;
+			lantx_on_jiffies =3D jiffies;
+		}
+		else if (lastleds & LED_LAN_TX && time_before(jiffies, lantx_on_jiffies =
+ LED_MINIMUM_ON_TIME))
+		{
+			currentleds |=3D LED_LAN_TX;
+		}
+	=09
+		/* RCV LED */
+
+		if (new_lan_leds & LED_LAN_RCV)=20
+		{
+			currentleds |=3D LED_LAN_RCV;
+			lanrcv_on_jiffies =3D jiffies;
+		}
+		else if (lastleds & LED_LAN_RCV && time_before(jiffies, lanrcv_on_jiffie=
s + LED_MINIMUM_ON_TIME))=20
+		{
+			currentleds |=3D LED_LAN_RCV;
+		}
 	}
=20
=2D	/* avoid to calculate diskio-stats at same irq  as netio-stats */
=2D	if (led_diskio && (NORMALIZED_COUNT(count) & 7) =3D=3D 0)
+	/* Calculate disk IO */
+	if (led_diskio)
 	{
=2D		currentleds &=3D ~LED_DISK_IO;
=2D		currentleds |=3D led_get_diskio_activity();
+		unsigned char new_io_led =3D led_get_diskio_activity();
+	=09
+		if (new_io_led & LED_DISK_IO)=20
+		{
+			currentleds |=3D LED_DISK_IO;
+			diskio_on_jiffies =3D jiffies;
+		}
+		else if (lastleds & LED_DISK_IO && time_before(jiffies, diskio_on_jiffie=
s + LED_MINIMUM_ON_TIME))=20
+		{
+			currentleds |=3D LED_DISK_IO;
+		}
 	}
=20
 	/* blink all LEDs twice a second if we got an Oops (HPMC) */
=2D	if (oops_in_progress) {
+	if (oops_in_progress)=20
+	{
 		currentleds =3D (count_HZ<=3D(HZ/2)) ? 0 : 0xff;
 	}
 =09
 	/* update the LCD/LEDs */
=2D	if (currentleds !=3D lastleds) {
=2D	    led_func_ptr(currentleds);
=2D	    lastleds =3D currentleds;
+	if (currentleds !=3D lastleds)
+	{
+		led_func_ptr(currentleds);
+		lastleds =3D currentleds;
 	}
+=09
+	/* Requeue ourself to run in 5 jiffies */=09
+	queue_delayed_work(led_wq, &led_task, LED_UPDATE_INTERVAL);
 }
=20
=2D/* main led tasklet struct (scheduled from time.c) */
=2DDECLARE_TASKLET_DISABLED(led_tasklet, led_tasklet_func, 0);
=2D
=2D
 /*
    ** led_halt()
    **=20
@@ -519,9 +559,13 @@ static int led_halt(struct notifier_bloc
 	default:		return NOTIFY_DONE;
 	}
 =09
=2D	/* completely stop the LED/LCD tasklet */
=2D	tasklet_disable(&led_tasklet);
=2D
+	/* Cancel the work item and delete the queue */
+	if (led_wq) {
+		if (cancel_delayed_work(&led_task) =3D=3D 0)=20
+			flush_workqueue(led_wq);
+		destroy_workqueue(led_wq);
+	}
+=20
 	if (lcd_info.model =3D=3D DISPLAY_MODEL_LCD)
 		lcd_print(txt);
 	else
@@ -586,9 +630,6 @@ int __init register_led_driver(int model
 	initialized++;
 	register_reboot_notifier(&led_notifier);
=20
=2D	/* start the led tasklet for the first time */
=2D	tasklet_enable(&led_tasklet);
=2D=09
 	return 0;
 }
=20
@@ -623,7 +664,7 @@ void __init register_led_regions(void)
    ** lcd_print()
    **=20
    ** Displays the given string on the LCD-Display of newer machines.
=2D   ** lcd_print() disables the timer-based led tasklet during its=20
+   ** lcd_print() disables the timer-based led work task during its=20
    ** execution and enables it afterwards again.
    **
  */
@@ -634,12 +675,14 @@ int lcd_print( char *str )
 	if (!led_func_ptr || lcd_info.model !=3D DISPLAY_MODEL_LCD)
 	    return 0;
 =09
=2D	/* temporarily disable the led tasklet */
=2D	tasklet_disable(&led_tasklet);
=2D
+	/* temporarily disable the led work task */
+	if (led_wq) {
+		if (cancel_delayed_work(&led_task) =3D=3D 0)=20
+			flush_workqueue(led_wq);
+	}
 	/* copy display string to buffer for procfs */
 	strlcpy(lcd_text, str, sizeof(lcd_text));
=2D=09
+
 	/* Set LCD Cursor to 1st character */
 	gsc_writeb(lcd_info.reset_cmd1, LCD_CMD_REG);
 	udelay(lcd_info.min_cmd_delay);
@@ -653,8 +696,10 @@ int lcd_print( char *str )
 	    udelay(lcd_info.min_cmd_delay);
 	}
 =09
=2D	/* re-enable the led tasklet */
=2D	tasklet_enable(&led_tasklet);
+	/* re-queue the work */
+	if (led_wq) {
+		queue_work(led_wq, &led_task);
+	}
=20
 	return lcd_info.lcd_width;
 }
diff -urpN oldtree/include/asm-parisc/led.h newtree/include/asm-parisc/led.h
=2D-- oldtree/include/asm-parisc/led.h	2004-12-30 08:07:48.000000000 +0000
+++ newtree/include/asm-parisc/led.h	2005-03-24 20:31:59.000000000 +0000
@@ -23,9 +23,6 @@
=20
 #define LED_CMD_REG_NONE 0		/* NULL =3D=3D no addr for the cmd register */
=20
=2D/* led tasklet struct */
=2Dextern struct tasklet_struct led_tasklet;
=2D
 /* register_led_driver() */
 int __init register_led_driver(int model, unsigned long cmd_reg, unsigned =
long data_reg);
=20

--Boundary-01=_VpyQC8/c3N8Bsfx--

--nextPart2757519.HmDgPxnUXr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCQypWOIrGtzS07WgRAi4iAKCkQ8p7WtyNegf2wBxVIsC+FnN+aACgsNMY
xwy1Pdqj+ZtPYTdb+JK1puw=
=gUUU
-----END PGP SIGNATURE-----

--nextPart2757519.HmDgPxnUXr--

--===============1437315856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1437315856==--
