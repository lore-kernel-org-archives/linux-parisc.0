From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sat, 26 Mar 2005 15:14:41 +0000
Message-ID: <200503261514.43287.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<200503252150.28207.dmp@davidmpye.dyndns.org>
	<20050326071349.GB28972@colo.lackof.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1161987071=="
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050326071349.GB28972@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1161987071==
Content-Type: multipart/signed; boundary="nextPart2274873.1cVMcrt4Vo";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2274873.1cVMcrt4Vo
Content-Type: multipart/mixed;
  boundary="Boundary-01=_ixXRC6Q9HbROECu"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_ixXRC6Q9HbROECu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 26 March 2005 07:13, Grant Grundler wrote:

> Sorry, I wasn't clear. I meant check if LED/LCD status needs to change
> every 10ms. The msleep would still let us bang out 8 register writes,
> one per HZ. Ie make the "lets see if activity is different now" check
> less frequent so LED/LCD is either on or off long enough to be visible.
>
> 100ms seems a bit longer than I would like. But if that works, go for it.

I did try reducing it to 50, and found that it caused heartbeat to become=20
irregular under heavy load.

> > > There is a reason for this, though there may be a better way of doing
> > > it.
> > >
> > > If you remove it, and set the update interval to 10mS, what tends to
> > > happen is that because each time you flip a symbol on the lcd you have
> > > to wait 2 jiffies (once before cmd reg, once before writing data reg),
> > > and sometimes more, because the kernel may put you to sleep a bit
> > > longer than the time you asked for,  is that the heartbeat starts
> > > skipping beats when the io/lan leds are changing on/off all the time.
>
> My point was
> 1) don't update LED/LCD state again until the previous update has
> completed. ie all the register writes have been sent.

Yep, we don't do that.

> 2) we shouldn't touch Heartbeat register for LCD unless heartbeat needs to
> be updated.

It already does that too.

> I'm still really not clear why there is "flutter".  THe only reasonable
> case I can think of is flutter is an artifact of the CPU busy doing "real"
> work and not servicing the LED/LCD wq. i.e. the stress test to excercise
> networking/disk activity is causing the CPU to work on lots of other tasks
> and it's taking more than a few jiffies to get back to the LED/LCD wq.

Yeah, it's a little mysterious. What I think is happening is that when we a=
sk=20
to msleep between the writes, because we're not busy-waiting, we might be p=
ut=20
to sleep for far longer than we asked for.  Ditto again, for when we ask to=
=20
be requeued - we ask to run every 10mS but we might end up waiting for far=
=20
longer than that.  That's about the best explanation I've come up with so=20
far.  By ensuring that we do not update the io/net symbols more often than=
=20
necessary, we can save ourselves some of these sleeps, so giving the kernel=
=20
less opportunity to put us to sleep!

> > Having spent the evening trying that, I've found that the 100mS minimum
> > 'flutter stop' interval patch gives the most consistent heartbeat of the
> > ideas that I've tried. The solution I suggested above causes the
> > heartbeat to become uneven when LAN/DISK IO is present still.
>
> Yeah, 100ms is well within someone noticing that LED/LCD activity isn't
> sync'd with LEDs on NIC or Disk. But I'm ok with that. If they got the re=
al
> LED, the display panel can be ignored.

Very true.

> > If the 100mS minimum LED illumination bothers people who have 'real' LE=
Ds
> > as opposed to LCD indicators, we can make it LCD only, of course.
>
> Sure. throw another patch out there! You can enumerate them...this is #3 =
or
> #4...

Attached! The only real change now is that the minimum on-time is now LCD=20
only, so hopefully this gets us the best of both worlds. LED people won't=20
notice anything different, and the LCD should now be nicely responsive.

Cheers,

David

> thanks,
> grant

=2D-=20
=2D----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCS d- s-: a-- C++ UL++++ P L+++ E--- W++ N+ o+ K- w---
O M V- PS+ PE+ Y+ PGP t 5- X+ R- tv+ b+ DI++ D+
G+ e++ h--- r++ y++
=2D-----END GEEK CODE BLOCK------

--Boundary-01=_ixXRC6Q9HbROECu
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="lcd_patch4"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lcd_patch4"

diff -urpN linux-2.6.12-rc1-pa2/arch/parisc/kernel/time.c patched/arch/pari=
sc/kernel/time.c
=2D-- linux-2.6.12-rc1-pa2/arch/parisc/kernel/time.c	2004-10-21 19:58:24.00=
0000000 +0100
+++ patched/arch/parisc/kernel/time.c	2005-03-26 14:30:39.000000000 +0000
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
diff -urpN linux-2.6.12-rc1-pa2/drivers/parisc/led.c patched/drivers/parisc=
/led.c
=2D-- linux-2.6.12-rc1-pa2/drivers/parisc/led.c	2005-03-18 13:17:10.0000000=
00 +0000
+++ patched/drivers/parisc/led.c	2005-03-26 14:42:35.000000000 +0000
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
@@ -431,66 +433,106 @@ static __inline__ int led_get_diskio_act
 #define HEARTBEAT_2ND_RANGE_START (HZ*22/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_L=
EN)
=20
=2D#define NORMALIZED_COUNT(count) (count/(HZ/100))
+#define LCD_LED_MINIMUM_ON_TIME (HZ*10/100)
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
+	/* look for network activity and flash LEDs accordingly */
+	if (led_lanrxtx)
 	{
=2D		currentleds &=3D ~(LED_LAN_RCV | LED_LAN_TX);
=2D		currentleds |=3D led_get_net_activity();
+		unsigned char new_lan_leds =3D led_get_net_activity();
+		/* For LCD based systems, enforce a 'minimum on time' to prevent flutter=
ing. */
+		if (led_type =3D=3D LED_HASLCD) {
+			/* TX LED */
+			if (new_lan_leds & LED_LAN_TX)=20
+			{
+				currentleds |=3D LED_LAN_TX;
+				lantx_on_jiffies =3D jiffies;
+			}
+			else if (lastleds & LED_LAN_TX && time_before(jiffies, lantx_on_jiffies=
 + LCD_LED_MINIMUM_ON_TIME))
+			{
+				currentleds |=3D LED_LAN_TX;
+			}
+		=09
+			/* RCV LED */
+
+			if (new_lan_leds & LED_LAN_RCV)=20
+			{
+				currentleds |=3D LED_LAN_RCV;
+				lanrcv_on_jiffies =3D jiffies;
+			}
+			else if (lastleds & LED_LAN_RCV && time_before(jiffies, lanrcv_on_jiffi=
es + LCD_LED_MINIMUM_ON_TIME))=20
+			{
+				currentleds |=3D LED_LAN_RCV;
+			}
+		}
+		else currentleds |=3D new_lan_leds;
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
+		/* For LCD based systems, enforce a 'minimum on time' to prevent flutter=
ing. */
+		if (led_type =3D=3D LED_HASLCD) {
+			if (new_io_led & LED_DISK_IO)=20
+			{
+				currentleds |=3D LED_DISK_IO;
+					diskio_on_jiffies =3D jiffies;
+			}
+			else if (lastleds & LED_DISK_IO && time_before(jiffies, diskio_on_jiffi=
es + LCD_LED_MINIMUM_ON_TIME))=20
+			{
+				currentleds |=3D LED_DISK_IO;
+			}
+		}
+		else currentleds |=3D new_io_led;
 	}
=20
 	/* blink all LEDs twice a second if we got an Oops (HPMC) */
=2D	if (oops_in_progress) {
+	if (oops_in_progress)=20
+	{
 		currentleds =3D (count_HZ<=3D(HZ/2)) ? 0 : 0xff;
 	}
 =09
=2D	/* update the LCD/LEDs */
=2D	if (currentleds !=3D lastleds) {
=2D	    led_func_ptr(currentleds);
=2D	    lastleds =3D currentleds;
+	/* Update the LCD/LEDs if they've changed */
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
@@ -519,9 +561,13 @@ static int led_halt(struct notifier_bloc
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
@@ -586,9 +632,6 @@ int __init register_led_driver(int model
 	initialized++;
 	register_reboot_notifier(&led_notifier);
=20
=2D	/* start the led tasklet for the first time */
=2D	tasklet_enable(&led_tasklet);
=2D=09
 	return 0;
 }
=20
@@ -623,7 +666,7 @@ void __init register_led_regions(void)
    ** lcd_print()
    **=20
    ** Displays the given string on the LCD-Display of newer machines.
=2D   ** lcd_print() disables the timer-based led tasklet during its=20
+   ** lcd_print() disables the timer-based led work task during its=20
    ** execution and enables it afterwards again.
    **
  */
@@ -634,12 +677,14 @@ int lcd_print( char *str )
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
@@ -653,8 +698,10 @@ int lcd_print( char *str )
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
diff -urpN linux-2.6.12-rc1-pa2/include/asm-parisc/led.h patched/include/as=
m-parisc/led.h
=2D-- linux-2.6.12-rc1-pa2/include/asm-parisc/led.h	2004-12-30 08:07:48.000=
000000 +0000
+++ patched/include/asm-parisc/led.h	2005-03-26 14:30:39.000000000 +0000
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

--Boundary-01=_ixXRC6Q9HbROECu--

--nextPart2274873.1cVMcrt4Vo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRXxjOIrGtzS07WgRAlw2AJ4/t6mMUm4mPmrJOOTrsuT2c7uSOwCgsqQ8
Z2R8auSBaP8z26MZEeQNQug=
=pLUb
-----END PGP SIGNATURE-----

--nextPart2274873.1cVMcrt4Vo--

--===============1161987071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1161987071==--
