From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sun, 27 Mar 2005 17:55:53 +0000
Message-ID: <200503271855.56304.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<20050327085330.GA17602@colo.lackof.org>
	<200503271038.42434.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0277697241=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503271038.42434.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0277697241==
Content-Type: multipart/signed; boundary="nextPart6546651.uK6JBH8hjW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart6546651.uK6JBH8hjW
Content-Type: multipart/mixed;
  boundary="Boundary-01=_qOvRCVfijlnTHcA"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_qOvRCVfijlnTHcA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Right, I've actually found and fixed what was the cause of the missing=20
heartbeats.  Although led minimum ontime 'fixes' it, it's actually a bandai=
d=20
for the real problem.

Could I ask you to have a glance at this patch? It's based on your previous=
=20
one, and only has a very minor change to the way count_HZ is incremented - =
ie=20
increment by the actual jiffies past, not the number we asked to be=20
rescheduled in.

On my system, the heart now beats regularly under IO/LAN traffic!

Cheers,

David

--Boundary-01=_qOvRCVfijlnTHcA
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="led_lcd_patch5"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="led_lcd_patch5"

diff -urpN oldtree/arch/parisc/kernel/time.c newtree/arch/parisc/kernel/tim=
e.c
=2D-- oldtree/arch/parisc/kernel/time.c	2004-10-21 19:58:24.000000000 +0100
+++ newtree/arch/parisc/kernel/time.c	2005-03-27 18:30:29.000000000 +0100
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
+++ newtree/drivers/parisc/led.c	2005-03-27 18:31:33.000000000 +0100
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
@@ -46,25 +50,30 @@
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
=2Dstatic int led_heartbeat =3D 1;
=2Dstatic int led_diskio =3D 1;
=2Dstatic int led_lanrxtx =3D 1;
+static unsigned char lastleds;	/* LED state from most recent update */
+static unsigned int led_heartbeat =3D 1;
+static unsigned int led_diskio =3D 1;
+static unsigned int led_lanrxtx =3D 1;
 static char lcd_text[32];
 static char lcd_text_default[32];
=20
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
=20
=2D
 struct lcd_block {
 	unsigned char command;	/* stores the command byte      */
 	unsigned char on;	/* value for turning LED on     */
@@ -115,12 +124,24 @@ lcd_info __attribute__((aligned(8))) =3D
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
@@ -285,52 +306,35 @@ static void led_LASI_driver(unsigned cha
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
+	static int i;
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
 }
=20
@@ -355,7 +359,7 @@ static __inline__ int led_get_net_activi
=20
 	rx_total =3D tx_total =3D 0;
 =09
=2D	/* we are running as tasklet, so locking dev_base=20
+	/* we are running as a workqueue task, so locking dev_base=20
 	 * for reading should be OK */
 	read_lock(&dev_base_lock);
 	for (dev =3D dev_base; dev; dev =3D dev->next) {
@@ -402,7 +406,7 @@ static __inline__ int led_get_diskio_act
 	static unsigned long last_pgpgin, last_pgpgout;
 	struct page_state pgstat;
 	int changed;
=2D=09
+
 	get_full_page_state(&pgstat); /* get no of sectors in & out */
=20
 	/* Just use a very simple calculation here. Do not care about overflow,
@@ -410,86 +414,70 @@ static __inline__ int led_get_diskio_act
 	changed =3D (pgstat.pgpgin !=3D last_pgpgin) || (pgstat.pgpgout !=3D last=
_pgpgout);
 	last_pgpgin  =3D pgstat.pgpgin;
 	last_pgpgout =3D pgstat.pgpgout;
=2D=09
+
 	return (changed ? LED_DISK_IO : 0);
 }
=20
=20
=20
 /*
=2D   ** led_tasklet_func()
+   ** led_work_func()
    **=20
=2D   ** is scheduled at every timer interrupt from time.c and
=2D   ** updates the chassis LCD/LED=20
+   ** manages when and which chassis LCD/LED gets updated
=20
     TODO:
     - display load average (older machines like 715/64 have 4 "free" LED's=
 for that)
     - optimizations
  */
=20
=2D#define HEARTBEAT_LEN (HZ*6/100)
=2D#define HEARTBEAT_2ND_RANGE_START (HZ*22/100)
+#define HEARTBEAT_LEN (HZ*10/100)
+#define HEARTBEAT_2ND_RANGE_START (HZ*28/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_L=
EN)
=20
=2D#define NORMALIZED_COUNT(count) (count/(HZ/100))
+#define LED_UPDATE_INTERVAL (1 + (HZ*19/1000))
=20
=2Dstatic void led_tasklet_func(unsigned long unused)
+static void led_work_func (void *unused)
 {
=2D	static unsigned char lastleds;
=2D	unsigned char currentleds; /* stores current value of the LEDs */
=2D	static unsigned long count; /* static incremented value, not wrapped */
+	static unsigned long last_jiffies =3D 0;
 	static unsigned long count_HZ; /* counter in range 0..HZ */
+	unsigned char currentleds =3D 0; /* stores current value of the LEDs */
=20
 	/* exit if not initialized */
 	if (!led_func_ptr)
 	    return;
=20
=2D	/* increment the local counters */
=2D	++count;
=2D	if (++count_HZ =3D=3D HZ)
+	/* increment the local counter */
+	count_HZ +=3D jiffies - last_jiffies;
+	if (count_HZ >=3D HZ)
 	    count_HZ =3D 0;
=2D
=2D	currentleds =3D lastleds;
+	last_jiffies =3D jiffies;
=20
 	if (led_heartbeat)
 	{
=2D		/* flash heartbeat-LED like a real heart (2 x short then a long delay)=
 */
=2D		if (count_HZ<HEARTBEAT_LEN ||=20
=2D		    (count_HZ>=3DHEARTBEAT_2ND_RANGE_START && count_HZ<HEARTBEAT_2ND_R=
ANGE_END))=20
=2D		    currentleds |=3D LED_HEARTBEAT;
=2D		else
=2D		    currentleds &=3D ~LED_HEARTBEAT;
=2D	}
=2D
=2D	/* look for network activity and flash LEDs respectively */
=2D	if (led_lanrxtx && ((NORMALIZED_COUNT(count)+(8/2)) & 7) =3D=3D 0)
=2D	{
=2D		currentleds &=3D ~(LED_LAN_RCV | LED_LAN_TX);
=2D		currentleds |=3D led_get_net_activity();
+		/* flash heartbeat-LED like a real heart
+		 * (2 x short then a long delay)
+		 */
+		if (count_HZ < HEARTBEAT_LEN ||=20
+				(count_HZ >=3D HEARTBEAT_2ND_RANGE_START &&
+				count_HZ < HEARTBEAT_2ND_RANGE_END))=20
+			currentleds |=3D LED_HEARTBEAT;
 	}
=20
=2D	/* avoid to calculate diskio-stats at same irq  as netio-stats */
=2D	if (led_diskio && (NORMALIZED_COUNT(count) & 7) =3D=3D 0)
=2D	{
=2D		currentleds &=3D ~LED_DISK_IO;
=2D		currentleds |=3D led_get_diskio_activity();
=2D	}
+	if (led_lanrxtx)  currentleds |=3D led_get_net_activity();
+	if (led_diskio)   currentleds |=3D led_get_diskio_activity();
=20
 	/* blink all LEDs twice a second if we got an Oops (HPMC) */
=2D	if (oops_in_progress) {
+	if (oops_in_progress)=20
 		currentleds =3D (count_HZ<=3D(HZ/2)) ? 0 : 0xff;
=2D	}
=2D=09
=2D	/* update the LCD/LEDs */
=2D	if (currentleds !=3D lastleds) {
=2D	    led_func_ptr(currentleds);
=2D	    lastleds =3D currentleds;
=2D	}
=2D}
=20
=2D/* main led tasklet struct (scheduled from time.c) */
=2DDECLARE_TASKLET_DISABLED(led_tasklet, led_tasklet_func, 0);
+	if (currentleds !=3D lastleds)
+	{
+		led_func_ptr(currentleds);	/* Update the LCD/LEDs */
+		lastleds =3D currentleds;
+	}
=20
+	queue_delayed_work(led_wq, &led_task, LED_UPDATE_INTERVAL);
+}
=20
 /*
    ** led_halt()
@@ -519,9 +507,13 @@ static int led_halt(struct notifier_bloc
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
@@ -586,9 +578,6 @@ int __init register_led_driver(int model
 	initialized++;
 	register_reboot_notifier(&led_notifier);
=20
=2D	/* start the led tasklet for the first time */
=2D	tasklet_enable(&led_tasklet);
=2D=09
 	return 0;
 }
=20
@@ -623,7 +612,7 @@ void __init register_led_regions(void)
    ** lcd_print()
    **=20
    ** Displays the given string on the LCD-Display of newer machines.
=2D   ** lcd_print() disables the timer-based led tasklet during its=20
+   ** lcd_print() disables the timer-based led work task during its=20
    ** execution and enables it afterwards again.
    **
  */
@@ -634,12 +623,14 @@ int lcd_print( char *str )
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
@@ -653,8 +644,10 @@ int lcd_print( char *str )
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
+++ newtree/include/asm-parisc/led.h	2005-03-27 18:30:29.000000000 +0100
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

--Boundary-01=_qOvRCVfijlnTHcA--

--nextPart6546651.uK6JBH8hjW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRvOsOIrGtzS07WgRAsRJAJ9f6B7UTuXp6fAQP5T1vD01bW6+0gCgqIoB
pcU+rWR32UFjVOWAlczsEYk=
=6TDn
-----END PGP SIGNATURE-----

--nextPart6546651.uK6JBH8hjW--

--===============0277697241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0277697241==--
