From: David Pye <dmp@davidmpye.dyndns.org>
Subject: [parisc-linux] Another minor LCD patch
Date: Mon, 28 Mar 2005 19:25:46 +0000
Message-ID: <200503282025.49081.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1760184859=="
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

--===============1760184859==
Content-Type: multipart/signed; boundary="nextPart2111924.luNmiN4xfp";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2111924.luNmiN4xfp
Content-Type: multipart/mixed;
  boundary="Boundary-01=_6oFSCo7w00TO0gK"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_6oFSCo7w00TO0gK
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Please find another small patch for lcd.c (against 2.6.12-rc1-pa6).

This fixes two things:

1) Ensure the work queue item is submitted to the workqueue by trying to=20
submit it in register_led_driver.  If register_led_driver is called by lasi=
=2Ec=20
etc *after* the device_initcall has created the workqueue (and submitted th=
e=20
workqueue task for the first time), the work can disappear from the queue i=
f=20
led_func_ptr is null when it is first run, as it doesn't resubmit itself if=
=20
this is the case.   I cannot see any way that queue_work can end up being=20
called twice, but even if it is, the second will quietly fail if the work=20
item is already in the queue.

2) Move the initial lcd_print to the device_initcall'ed function. This make=
s=20
it appear a fraction later in the boot process, thereby avoiding it being=20
trampled by any early-boot chassis codes (INI CC01 on my j5000).

Cheers,

David

--Boundary-01=_6oFSCo7w00TO0gK
Content-Type: text/x-diff;
  charset="us-ascii";
  name="lcd_patch_reloaded"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lcd_patch_reloaded"

diff -urpN linux-2.6.12-rc1-pa6/drivers/parisc/led.c newtree/drivers/parisc=
/led.c
=2D-- linux-2.6.12-rc1-pa6/drivers/parisc/led.c	2005-03-28 07:50:20.0000000=
00 +0100
+++ newtree/drivers/parisc/led.c	2005-03-28 18:38:29.000000000 +0100
@@ -130,6 +130,9 @@ lcd_info __attribute__((aligned(8))) =3D
 /* The workqueue must be created at init-time */
 static int start_task(void)=20
 {=09
+	/* Display the default text now */
+	if (led_type =3D=3D LED_HASLCD) lcd_print( lcd_text_default );
+
 	/* Create the work queue and queue the LED task */
 	led_wq =3D create_singlethread_workqueue("led_wq");=09
 	queue_work(led_wq, &led_task);
@@ -548,7 +551,6 @@ int __init register_led_driver(int model
 		printk(KERN_INFO "LCD display at %lx,%lx registered\n",=20
 			LCD_CMD_REG , LCD_DATA_REG);
 		led_func_ptr =3D led_LCD_driver;
=2D		lcd_print( lcd_text_default );
 		led_type =3D LED_HASLCD;
 		break;
=20
@@ -578,6 +580,11 @@ int __init register_led_driver(int model
 	initialized++;
 	register_reboot_notifier(&led_notifier);
=20
+	/* Ensure the work is queued */
+	if (led_wq) {
+		queue_work(led_wq, &led_task);
+	}
+
 	return 0;
 }
=20

--Boundary-01=_6oFSCo7w00TO0gK--

--nextPart2111924.luNmiN4xfp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCSFo9OIrGtzS07WgRAm5tAKCUSIA/jHmSU98WJ6WvbuhJRqLcVQCfbpFU
r/f/XxDp4o+nTz2T8/PRASU=
=iRyT
-----END PGP SIGNATURE-----

--nextPart2111924.luNmiN4xfp--

--===============1760184859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1760184859==--
