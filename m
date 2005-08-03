From: Richard Hirst <rhirst@levanta.com>
Subject: [parisc-linux] SMP kernel hangs on C360, resolved
Date: Wed, 3 Aug 2005 20:49:31 +0100
Message-ID: <20050803194931.GZ5500@levanta.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Q0rSlbzrZN6k9QnT"
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


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Turns out this is down to bugs in drivers/input/serio/gscps2.c.
Looking at gscps2_probe(), there are two locks involved; one in
struct gscps2port and one in struct serio.  The probe function
initialises the one in struct gscps2port and then calls gscps2_reset()
which enables the device such that it can start generating interrupts,
then adds the port to the list of ports the int handler looks at,
then calls serio_register_port() which initialises the lock in
struct serio.  gscps2_interrupt() calls serio_interrupt(), so
if an interrupt is raised before serio_register_port() is called,
the code will hang trying to claim the serio lock which has not yet
been initialised.  Another issue is that gscps2_reset() resets the
device _and_ enables the port.  I think enabling the port should
only happen once something calls open().

The attached patch addresses these issues.  Before applying the
patch I could provoke the hang easily after adding an mdelay() to
the middle of the probe function and then banging on the keyboard
and mouse during boot.

Richard



--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dd

Index: drivers/input/serio/gscps2.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/serio/gscps2.c,v
retrieving revision 1.16
diff -u -r1.16 gscps2.c
--- drivers/input/serio/gscps2.c	18 Mar 2005 13:16:54 -0000	1.16
+++ drivers/input/serio/gscps2.c	3 Aug 2005 19:22:35 -0000
@@ -211,9 +211,6 @@
 	writeb(0xff, addr+GSC_RESET);
 	gscps2_flush(ps2port);
 	spin_unlock_irqrestore(&ps2port->lock, flags);
-
-	/* enable it */
-	gscps2_enable(ps2port, ENABLE);
 }
 
 static LIST_HEAD(ps2port_list);
@@ -307,6 +304,9 @@
 
 	gscps2_reset(ps2port);
 
+	/* enable it */
+	gscps2_enable(ps2port, ENABLE);
+
 	gscps2_interrupt(0, NULL, NULL);
 
 	return 0;
@@ -370,8 +370,6 @@
 	serio->port_data	= ps2port;
 	serio->dev.parent	= &dev->dev;
 
-	list_add_tail(&ps2port->node, &ps2port_list);
-
 	ret = -EBUSY;
 	if (request_irq(dev->irq, gscps2_interrupt, SA_SHIRQ, ps2port->port->name, ps2port))
 		goto fail_miserably;
@@ -396,13 +394,14 @@
 
 	serio_register_port(ps2port->port);
 
+	list_add_tail(&ps2port->node, &ps2port_list);
+
 	return 0;
 
 fail:
 	free_irq(dev->irq, ps2port);
 
 fail_miserably:
-	list_del(&ps2port->node);
 	iounmap(ps2port->addr);
 	release_mem_region(dev->hpa, GSC_STATUS + 4);
 

--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Q0rSlbzrZN6k9QnT--
