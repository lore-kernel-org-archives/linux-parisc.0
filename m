Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (host194.steeleye.com [216.33.1.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 144AA482A
	for <parisc-linux@parisc-linux.org>; Fri, 28 Dec 2001 20:10:10 -0700 (MST)
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id fBT3A2x03575;
	Fri, 28 Dec 2001 21:10:03 -0600
Message-Id: <200112290310.fBT3A2x03575@localhost.localdomain>
To: Helge Deller <helge.deller@sap.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	parisc-linux@parisc-linux.org
In-Reply-To: Message from Helge Deller <helge.deller@sap.com>
   of "Fri, 28 Dec 2001 11:23:37 +0100." <E16JuAr-0001w8-00@linuxlab.wdf.sap-ag.de>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_4174171510"
Date: Fri, 28 Dec 2001 21:10:02 -0600
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [parisc-linux] Re: rmmod lasi700 hangs the machine
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

This is a multipart MIME message.

--==_Exmh_4174171510
Content-Type: text/plain; charset=us-ascii

After applying the kernel down_interruptible fix, the attached should be the 
final piece of the puzzle.  With it applied (and the previous disable_irq 
patch discarded), I can insert and remove the module to my heart's content.

James


--==_Exmh_4174171510
Content-Type: text/plain ; name="tmp.diff"; charset=us-ascii
Content-Description: tmp.diff
Content-Disposition: attachment; filename="tmp.diff"

Index: drivers/scsi/lasi700.c
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/lasi700.c,v
retrieving revision 1.5
diff -u -r1.5 lasi700.c
--- drivers/scsi/lasi700.c	2001/12/26 22:41:16	1.5
+++ drivers/scsi/lasi700.c	2001/12/29 03:07:09
@@ -197,6 +197,7 @@
 	kfree(hostdata);
 	free_irq(host->irq, host);
 	release_mem_region(host->base, 64);
+	unregister_parisc_driver(&lasi700_driver);
 	return 1;
 }
 

--==_Exmh_4174171510--
