From: Richard Hirst <rhirst@levanta.com>
Subject: Re: [parisc-linux] 2.6.13-rc3-pa0 booted to login prompt on B180
Date: Wed, 27 Jul 2005 22:25:06 +0100
Message-ID: <20050727212506.GJ5500@levanta.com>
References: <20050726225246.GE5500@levanta.com>
	<20050727203951.GI5500@levanta.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="4SFOXa2GPu3tIq4H"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050727203951.GI5500@levanta.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 27, 2005 at 09:39:51PM +0100, Richard Hirst wrote:
> On Tue, Jul 26, 2005 at 11:52:46PM +0100, Richard Hirst wrote:
> > Patch attached; it boots to a login prompt but
> > 
> > a) keyboard is dead
> > b) serial port is dead
> 
> Those problems are caused by the gsc.c part of the patch, which is

Patch attached, which I think is the correct fix.  There are many
next_device() functions in the tree; we needed one that used
knode_parent, not knode_driver.

Still looks to me like drivers/parisc/sba_iommu.c needs this fix
too, but I've not actually tried it.

Richard


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="gsc.patch"

Index: drivers/parisc/gsc.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/gsc.c,v
retrieving revision 1.22
diff -d -u -r1.22 gsc.c
--- drivers/parisc/gsc.c	27 Jul 2005 00:31:04 -0000	1.22
+++ drivers/parisc/gsc.c	27 Jul 2005 21:18:04 -0000
@@ -183,10 +183,15 @@
 	*irqp = irq;
 }
 
+static struct device* next_device(struct klist_iter *i)
+{
+	struct klist_node * n = klist_next(i);
+	return n ? container_of(n, struct device, knode_parent) : NULL;
+}
+
 void gsc_fixup_irqs(struct parisc_device *parent, void *ctrl,
 			void (*choose_irq)(struct parisc_device *, void *))
 {
-	extern struct device *next_device(struct klist_iter *i);
 	struct device *dev;
 	struct klist_iter i;
 

--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--4SFOXa2GPu3tIq4H--
