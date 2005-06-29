From: Sven Schnelle <svens@gmx.de>
Subject: [parisc-linux] netpoll support for lasi_82596
Date: Wed, 29 Jun 2005 07:59:26 +0200
Message-ID: <878y0t66v5.fsf@deprecated.intranet.astaro.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1153608949=="
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

--===============1153608949==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Hi,

i'm working on kgdb for linux-2.6, and added netpoll support to the
lasi_82596 driver. Maybe we can add this patch?

=2D--------------------------------------------------------------
Index: lasi_82596.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.6/drivers/net/lasi_82596.c,v
retrieving revision 1.15
diff -u -r1.15 lasi_82596.c
=2D-- lasi_82596.c	29 Nov 2004 19:56:12 -0000	1.15
+++ lasi_82596.c	29 Jun 2005 05:25:40 -0000
@@ -415,6 +415,9 @@
 static int ticks_limit =3D 100;
 static int max_cmd_backlog =3D TX_RING_SIZE-1;
=20
+#if CONFIG_NET_POLL_CONTROLLER
+static void i596_poll_controller(struct net_device *dev);
+#endif
=20
 static inline void CA(struct net_device *dev)
 {
@@ -1209,7 +1212,9 @@
 	dev->set_multicast_list =3D set_multicast_list;
 	dev->tx_timeout =3D i596_tx_timeout;
 	dev->watchdog_timeo =3D TX_TIMEOUT;
=2D
+#ifdef CONFIG_NET_POLL_CONTROLLER
+	dev->poll_controller =3D i596_poll_controller;
+#endif
 	dev->priv =3D (void *)(dev->mem_start);
=20
 	lp =3D dev->priv;
@@ -1242,6 +1247,14 @@
 	return 0;
 }
=20
+#ifdef CONFIG_NET_POLL_CONTROLLER
+static void i596_poll_controller(struct net_device *dev)
+{
+    disable_irq(dev->irq);
+    i596_interrupt(dev->irq, dev, NULL);
+    enable_irq(dev->irq);
+}
+#endif
=20
 static irqreturn_t i596_interrupt(int irq, void *dev_id, struct pt_regs *r=
egs)
 {
=2D------------------------------------------------------------------------=
-------

Thanks,

Sven.
=2D-=20
We've seen the restless children at the head of the columns
Come to purify the future with the arrogance of youth

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCwji/86MdxiXaIbERAtk9AKCAjvaThLR6id5Tjrbjgl8UBaXr3gCghG91
eYMWxvLgx9OlYcH9rzqyktY=
=hKRA
-----END PGP SIGNATURE-----
--=-=-=--

--===============1153608949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1153608949==--
