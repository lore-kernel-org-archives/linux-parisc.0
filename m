From: David Pye <dmp@davidmpye.dyndns.org>
Subject: [parisc-linux] A second LCD patch
Date: Thu, 24 Mar 2005 20:01:00 +0000
Message-ID: <200503242001.02146.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1316938420=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503241848.57598.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1316938420==
Content-Type: multipart/signed; boundary="nextPart1198597.JtQ49KAioZ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1198597.JtQ49KAioZ
Content-Type: multipart/mixed;
  boundary="Boundary-01=_8xxQCgXBgUckZ+S"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_8xxQCgXBgUckZ+S
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Attached is another patch to the LED LCD code, which prints the initial=20
'default lcd text' to the display slightly later than previously.

This avoids it being overwritten by the chassis code which is displayed on =
my=20
J5000 shortly after kernel init (INI CC01). The device_init function create=
d=20
for the workqueue is an ideal place to do the initial lcd_print now, afaics.

My previous patch needs to be applied first, then this one.

Thanks,

David

--Boundary-01=_8xxQCgXBgUckZ+S
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="led_lcd_patch2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="led_lcd_patch2"

diff -urpN oldtree/drivers/parisc/led.c newtree/drivers/parisc/led.c
=2D-- oldtree/drivers/parisc/led.c	2005-03-24 19:17:25.000000000 +0000
+++ newtree/drivers/parisc/led.c	2005-03-24 19:19:07.000000000 +0000
@@ -128,6 +128,10 @@ lcd_info __attribute__((aligned(8))) =3D
 /* The workqueue must be created at init-time */
 static int start_task(void)=20
 {=09
+	/* Print the display text to the lcd if present now. This avoids it
+	 * being overwritten with any boot-time chassis codes */
+	if (led_type =3D=3D LED_HASLCD) lcd_print( lcd_text_default );
+
 	/* Create the work queue and queue the LED task */
 	led_wq =3D create_singlethread_workqueue("led_wq");=09
 	queue_work(led_wq, &led_task);
@@ -602,7 +606,6 @@ int __init register_led_driver(int model
 		printk(KERN_INFO "LCD display at %lx,%lx registered\n",=20
 			LCD_CMD_REG , LCD_DATA_REG);
 		led_func_ptr =3D led_LCD_driver;
=2D		lcd_print( lcd_text_default );
 		led_type =3D LED_HASLCD;
 		break;
=20

--Boundary-01=_8xxQCgXBgUckZ+S--

--nextPart1198597.JtQ49KAioZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCQxx+OIrGtzS07WgRAh8JAKC8aJZEOLsTx9F5+6rcP/7wKHq6igCgjRPO
3j4jWNFgMBl3zGkS8OVb478=
=U3Hd
-----END PGP SIGNATURE-----

--nextPart1198597.JtQ49KAioZ--

--===============1316938420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1316938420==--
