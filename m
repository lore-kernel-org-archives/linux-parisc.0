Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43A05482A
	for <parisc-linux@parisc-linux.org>; Sat,  9 Feb 2002 13:58:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Zea2-0007Kf-00
	for parisc-linux@parisc-linux.org; Sat, 09 Feb 2002 20:58:42 +0000
Date: Sat, 9 Feb 2002 20:58:42 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020209205842.B1173@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] touching several drivers
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hey, I've jut produced ftp.parisc-linux.org/patches/random-cleanups.diff
It fixes a number of things that have been bugging me on the C360 for
a while.

I touch:

 arch/parisc/kernel/drivers.c  |   59 ++++++++++++++++++++----------------------
 drivers/gsc/dino.c            |   26 ++++++++----------
 drivers/gsc/gsc.c             |    8 -----
 drivers/gsc/serial.c          |   18 ++++--------
 drivers/parport/parport_gsc.c |   16 -----------
 drivers/scsi/lasi700.c        |    8 -----
 drivers/sound/harmony.c       |    4 --

so if anyone wants to object, now's a good time to do it.  If anyone has
the urge, testing it on other machines would be worthwhile.  I've been
careful to consider other machines, but thinking is no substitute for
actually trying the code, and I touched some interesting parts of
device discovery.

Changelog:

 * Stop checking hversion_rev in match_device.  All drivers specify
   HVERSION_REV_ANY_ID anyway.
 * Don't print a warning if a driver declines to claim a device.  That's
   allowed.
 * Revert get_node_path to its previous form.  I found another bug in
   doing the inventory and adding another hack would have been silly.
 * Neaten up walk_native_bus a little, I have moral objections to the
   previous code.
 * Fix a bug in fixup_child_irqs.  If the device had no children, it
   would assign irqs to siblings instead, which led to the bogus serial
   port being detected on Cujo.
 * A few more Dino -> Cujo changes.  Print a little more information when
   we get a stuck interrupt.
 * Make the GSC serial driver return silently for Cujo's serial port (if
   it's unassigned).  Improve the error message and make it not dependent
   on any CONFIG options.
 * Clean up a comment and remove the A180's serial port from the
   serial1_tbl.

 * Call request_mem_region for each successful device/driver claim.
 * Make gsc_common_irqsetup a little more sensible about what regions
   it claims.
 * Delete request/release regions from lasi700.c, parport_gsc.c, harmony.c

-- 
Revolutions do not require corporate support.
