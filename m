From: Richard Hirst <rhirst@levanta.com>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Mon, 1 Aug 2005 15:53:10 +0100
Message-ID: <20050801145310.GJ5500@levanta.com>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
	<20050731090005.GD5500@levanta.com>
	<20050731193229.GE5500@levanta.com>
	<20050731193821.GI21753@roadwarrior.mcmartin.ca>
	<20050731200144.GF5500@levanta.com>
	<20050731202338.GK21753@roadwarrior.mcmartin.ca>
	<20050731202709.GL21753@roadwarrior.mcmartin.ca>
	<20050801134844.GI5500@levanta.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="wxDdMuZNg1r63Hyj"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050801134844.GI5500@levanta.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The attached patch fixes 'Found devices' order to display parents before
children.  It's still not ideal, as the children are not reported in
numerical order but I don't see a clean way to fix that.

I included the patch to remove the check_dev() call from match_by_id()
too; that still seems like the right thing to do to me.

My C360 now reports:

Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
2. Dino PCI Bridge at 0xf2000000 [8/0] { 13, 0x3, 0x680, 0x0000a },  additional 
3. Raven U/L2 Dino RS-232 at 0xf2003000 [8/0/63] { 10, 0x0, 0x006, 0x0008c }
4. Raven+ w SE FWSCSI Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x056, 0x00081 }, 
5. Raven+ w SE FWSCSI Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x056, 0x00}
6. Raven+ w SE FWSCSI Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x056, 0x0008}
7. Raven+ w SE FWSCSI Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x056,  
8. Raven+ w SE FWSCSI Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x056, 0x000}
9. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x056, 0}
10. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x056, }
11. U2-IOA BC GSC+ Port at 0xf203f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
12. Raven U/L2 Dino PS/2 Port at 0xf2001000 [8/1] { 10, 0x0, 0x006, 0x00096 }
13. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
14. U2-IOA BC GSC+ Port at 0xf103f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
15. Cujo PCI Bridge at 0xf1000000 [10/0] { 13, 0x1, 0x682, 0x0000a },  addition 
16. Dino RS-232 at 0xf1003000 [10/3] { 10, 0x0, 0x007, 0x0008c }
17. Raven W 360 (9000/780) at 0xfffa0000 [32] { 0, 0x0, 0x5c6, 0x00004 }
18. Memory at 0xfffb1000 [49] { 1, 0x0, 0x097, 0x00009 }


Richard


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ddd

Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/drivers.c,v
retrieving revision 1.25
diff -u -r1.25 drivers.c
--- arch/parisc/kernel/drivers.c	26 Jul 2005 23:55:47 -0000	1.25
+++ arch/parisc/kernel/drivers.c	1 Aug 2005 14:45:26 -0000
@@ -59,19 +59,11 @@
 static int descend_children(struct device * dev, void * data)
 {
 	struct recurse_struct * recurse_data = (struct recurse_struct *)data;
-	int ret;
 
-	/*
-	 * First, descend down the tree.
-	 */
-	ret = device_for_each_child(dev, recurse_data, descend_children);
-	if (ret)
-		return ret;
-
-	/*
-	 * Now, iterate over the children and call the function.
-	 */
-	return device_for_each_child(dev, recurse_data->obj, recurse_data->fn);
+	if (recurse_data->fn(dev, recurse_data->obj))
+		return 1;
+	else
+		return device_for_each_child(dev, recurse_data, descend_children);
 }
 
 /**
@@ -80,7 +72,8 @@
  *	@data:	Data to pass to the called function.
  *
  *	This performs a depth-first traversal of the tree, calling the
- *	function passed for each node.
+ *	function passed for each node.  It calls the function for parents
+ *	before children.
  */
 
 static int for_each_padev(int (*fn)(struct device *, void *), void * data)
@@ -89,7 +82,7 @@
 		.obj	= data,
 		.fn	= fn,
 	};
-	return descend_children(&root, &recurse_data);
+	return device_for_each_child(&root, &recurse_data, descend_children);
 }
 
 /**
@@ -448,11 +441,9 @@
 	struct parisc_device * pdev = to_parisc_device(dev);
 	struct match_id_data * d = data;
 
-	if (check_dev(pdev)) {
-		if (pdev->hw_path == d->id) {
-			d->dev = pdev;
-			return 1;
-		}
+	if (pdev->hw_path == d->id) {
+		d->dev = pdev;
+		return 1;
 	}
 	return 0;
 }

--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--wxDdMuZNg1r63Hyj--
