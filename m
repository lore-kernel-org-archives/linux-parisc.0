From: David Pye <dmp@davidmpye.dyndns.org>
Subject: [parisc-linux] J5000 LCD patch
Date: Wed, 23 Mar 2005 18:55:07 +0000
Message-ID: <200503231855.10502.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0624646901=="
To: parisc-linux@lists.parisc-linux.org
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

--===============0624646901==
Content-Type: multipart/signed; boundary="nextPart3786758.bIPpWUM2s4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3786758.bIPpWUM2s4
Content-Type: multipart/mixed;
  boundary="Boundary-01=_LubQCGHwsJYT4NX"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_LubQCGHwsJYT4NX
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I've been working on my own LCD patch for the J5000 and other LCD front=20
panel-equipped machines.=20

My idea is slightly different to some of the other solutions that have been=
=20
submitted recently.  Rather than come up with a complex method of writing a=
=20
different register each time the tasklet is triggered (which still does not=
=20
guarantee that you are waiting the correct min_cmd_delay), I decided to=20
remove the tasklet, and use a dedicated work queue to drive this.  The=20
primary advantage is that work queue tasks can sleep, whereas tasklets=20
cannot. So, it now sleeps the correct amount of time per LCD writes.   I do=
=20
not see this affecting LED based machines, but for LCD based machines, it=20
should now give you working heartbeats, and more responsive HDD/network=20
symbols also.

It can DEFINITELY be improved further, primarily by increasing the delay=20
between rescheduling the work queue item, so reducing CPU util.  I'll submi=
t=20
a later patch for that pending feedback on this one, which is of course ver=
y=20
welcome!

Thanks,

David

--Boundary-01=_LubQCGHwsJYT4NX
Content-Type: text/x-diff;
  charset="us-ascii";
  name="lcdpatch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lcdpatch"

diff -urN vanillabuilt/arch/parisc/kernel/time.c lcdtree/arch/parisc/kernel=
/time.c
=2D-- vanillabuilt/arch/parisc/kernel/time.c	2005-03-22 20:07:26.000000000 =
+0000
+++ lcdtree/arch/parisc/kernel/time.c	2005-03-23 18:29:49.000000000 +0000
@@ -88,14 +88,6 @@
 			write_sequnlock(&xtime_lock);
 		}
 	}
=2D   =20
=2D#ifdef CONFIG_CHASSIS_LCD_LED
=2D	/* Only schedule the led tasklet on cpu 0, and only if it
=2D	 * is enabled.
=2D	 */
=2D	if (cpu =3D=3D 0 && !atomic_read(&led_tasklet.count))
=2D		tasklet_schedule(&led_tasklet);
=2D#endif
=20
 	/* check soft power switch status */
 	if (cpu =3D=3D 0 && !atomic_read(&power_tasklet.count))
diff -urN vanillabuilt/drivers/parisc/led.c lcdtree/drivers/parisc/led.c
=2D-- vanillabuilt/drivers/parisc/led.c	2005-03-22 20:08:25.000000000 +0000
+++ lcdtree/drivers/parisc/led.c	2005-03-23 18:27:40.000000000 +0000
@@ -37,6 +37,7 @@
 #include <linux/proc_fs.h>
 #include <linux/ctype.h>
 #include <linux/blkdev.h>
+#include <linux/workqueue.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/hardware.h>
@@ -46,10 +47,10 @@
 #include <asm/uaccess.h>
=20
 /* The control of the LEDs and LCDs on PARISC-machines have to be done=20
=2D   completely in software. The necessary calculations are done in a task=
let
=2D   which is scheduled at every timer interrupt and since the calculation=
s=20
=2D   may consume relatively much CPU-time some of the calculations can be=
=20
=2D   turned off with the following variables (controlled via procfs) */
+   completely in software. The necessary calculations are done in a work q=
ueue
+   item which is scheduled at every timer interrupt and since the calculat=
ions=20
+   may consume a relatively large amount of CPU-time, some of the calculat=
ions=20
+   can be turned off with the following variables (controlled via procfs) =
*/
=20
 static int led_type =3D -1;
 static int led_heartbeat =3D 1;
@@ -58,6 +59,14 @@
 static char lcd_text[32];
 static char lcd_text_default[32];
=20
+
+static int led_wq_created =3D 0;
+static struct workqueue_struct *led_wq;
+static struct work_struct led_task;
+static void led_work_func(void *);
+static DECLARE_WORK(led_task, led_work_func, NULL);
+
+
 #if 0
 #define DPRINTK(x)	printk x
 #else
@@ -109,13 +118,20 @@
 	.reset_cmd2 =3D		0xc0,
 };
=20
+/* The workqueue must be created at init-time */
+static void start_task(void) {
+	led_wq =3D create_singlethread_workqueue("led_wq");=09
+	queue_work(led_wq, &led_task);
+	led_wq_created =3D 1;
+}
+
+__initcall(start_task);
=20
 /* direct access to some of the lcd_info variables */
 #define LCD_CMD_REG	lcd_info.lcd_cmd_reg_addr	=20
 #define LCD_DATA_REG	lcd_info.lcd_data_reg_addr	=20
 #define LED_DATA_REG	lcd_info.lcd_cmd_reg_addr	/* LASI & ASP only */
=20
=2D
 /* ptr to LCD/LED-specific function */
 static void (*led_func_ptr) (unsigned char);
=20
@@ -285,56 +301,40 @@
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
=2D
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
+	static int lastleds;
+	static unsigned char mask[4] =3D { LED_HEARTBEAT, LED_DISK_IO,
+		LED_LAN_RCV, LED_LAN_TX };
+=09
+	static struct lcd_block * blockp[4] =3D {
+		&lcd_info.heartbeat,
+		&lcd_info.disk_io,
+		&lcd_info.lan_rcv,
+		&lcd_info.lan_tx
+	};
+=09
+	int i;
+	unsigned long wait_jiffies =3D (lcd_info.min_cmd_delay / 1000000) * HZ;
+	for (i=3D0; i<4; ++i) {
+		if ((leds & mask[i]) !=3D (lastleds & mask[i])) {
+			gsc_writeb( blockp[i]->command, LCD_CMD_REG );
+		=09
+			set_current_state(TASK_UNINTERRUPTIBLE);	=09
+			schedule_timeout(wait_jiffies);=09
+
+			gsc_writeb( leds & mask[i] ? blockp[i]->on :=20
+					blockp[i]->off, LCD_DATA_REG );
+		=09
+			set_current_state(TASK_UNINTERRUPTIBLE);	=09
+			schedule_timeout(wait_jiffies);=09
+		}
 	}
+	lastleds =3D leds;
 }
=20
=2D
 /*
    **=20
    ** led_get_net_activity()
@@ -355,7 +355,7 @@
=20
 	rx_total =3D tx_total =3D 0;
 =09
=2D	/* we are running as tasklet, so locking dev_base=20
+	/* we are running as a work queue item, so locking dev_base=20
 	 * for reading should be OK */
 	read_lock(&dev_base_lock);
 	for (dev =3D dev_base; dev; dev =3D dev->next) {
@@ -417,7 +417,7 @@
=20
=20
 /*
=2D   ** led_tasklet_func()
+   ** led_work_func()
    **=20
    ** is scheduled at every timer interrupt from time.c and
    ** updates the chassis LCD/LED=20
@@ -433,10 +433,11 @@
=20
 #define NORMALIZED_COUNT(count) (count/(HZ/100))
=20
=2Dstatic void led_tasklet_func(unsigned long unused)
+static void led_work_func(void *unused)
 {
 	static unsigned char lastleds;
 	unsigned char currentleds; /* stores current value of the LEDs */
+=09
 	static unsigned long count; /* static incremented value, not wrapped */
 	static unsigned long count_HZ; /* counter in range 0..HZ */
=20
@@ -485,11 +486,11 @@
 	    led_func_ptr(currentleds);
 	    lastleds =3D currentleds;
 	}
+=09
+	/* Requeue ourself to run next jiffy */=09
+	queue_delayed_work(led_wq, &led_task, 1);
 }
=20
=2D/* main led tasklet struct (scheduled from time.c) */
=2DDECLARE_TASKLET_DISABLED(led_tasklet, led_tasklet_func, 0);
=2D
=20
 /*
    ** led_halt()
@@ -519,8 +520,14 @@
 	default:		return NOTIFY_DONE;
 	}
 =09
=2D	/* completely stop the LED/LCD tasklet */
=2D	tasklet_disable(&led_tasklet);
+	/* completely stop the LED/LCD task */
+
+	if (led_wq_created) {
+		if (cancel_delayed_work(&led_task) =3D=3D 0)=20
+			flush_workqueue(led_wq);
+=09
+		destroy_workqueue(led_wq);
+	}
=20
 	if (lcd_info.model =3D=3D DISPLAY_MODEL_LCD)
 		lcd_print(txt);
@@ -587,9 +594,6 @@
 	initialized++;
 	register_reboot_notifier(&led_notifier);
=20
=2D	/* start the led tasklet for the first time */
=2D	tasklet_enable(&led_tasklet);
=2D=09
 	return 0;
 }
=20
@@ -624,7 +628,7 @@
    ** lcd_print()
    **=20
    ** Displays the given string on the LCD-Display of newer machines.
=2D   ** lcd_print() disables the timer-based led tasklet during its=20
+   ** lcd_print() disables the workqueue-based led task during its=20
    ** execution and enables it afterwards again.
    **
  */
@@ -635,9 +639,11 @@
 	if (!led_func_ptr || lcd_info.model !=3D DISPLAY_MODEL_LCD)
 	    return 0;
 =09
=2D	/* temporarily disable the led tasklet */
=2D	tasklet_disable(&led_tasklet);
=2D
+	/* temporarily disable the led task */
+	if (led_wq_created) {
+		if (cancel_delayed_work(&led_task) =3D=3D 0)=20
+			flush_workqueue(led_wq);
+	}
 	/* copy display string to buffer for procfs */
 	strlcpy(lcd_text, str, sizeof(lcd_text));
 =09
@@ -654,8 +660,10 @@
 	    udelay(lcd_info.min_cmd_delay);
 	}
 =09
=2D	/* re-enable the led tasklet */
=2D	tasklet_enable(&led_tasklet);
+	if (led_wq_created) {
+		/* re-enable the led task */
+		queue_work(led_wq, &led_task);
+	}
=20
 	return lcd_info.lcd_width;
 }
diff -urN vanillabuilt/include/asm/led.h lcdtree/include/asm/led.h
=2D-- vanillabuilt/include/asm/led.h	2005-03-22 20:09:08.000000000 +0000
+++ lcdtree/include/asm/led.h	2005-03-23 18:27:47.000000000 +0000
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
diff -urN vanillabuilt/include/asm-parisc/led.h lcdtree/include/asm-parisc/=
led.h
=2D-- vanillabuilt/include/asm-parisc/led.h	2005-03-22 20:09:08.000000000 +=
0000
+++ lcdtree/include/asm-parisc/led.h	2005-03-23 18:27:47.000000000 +0000
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

--Boundary-01=_LubQCGHwsJYT4NX--

--nextPart3786758.bIPpWUM2s4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCQbuOOIrGtzS07WgRAjQPAJwPOF3TKJC685FTp+/Axw+wI3M2qgCgtBGH
OHeig23Ebp9zL7XJvt/ksZ4=
=NIn2
-----END PGP SIGNATURE-----

--nextPart3786758.bIPpWUM2s4--

--===============0624646901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0624646901==--
