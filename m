Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (host194.steeleye.com [216.33.1.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91BD5482D
	for <parisc-linux@parisc-linux.org>; Thu, 27 Dec 2001 13:23:10 -0700 (MST)
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id fBRKN4g21408;
	Thu, 27 Dec 2001 14:23:04 -0600
Message-Id: <200112272023.fBRKN4g21408@localhost.localdomain>
To: Helge Deller <helge.deller@sap.com>
Cc: James.Bottomley@hansenpartnership.com,
	parisc-linux@parisc-linux.org
In-Reply-To: Message from Helge Deller <helge.deller@sap.com>
   of "Thu, 27 Dec 2001 17:12:08 +0100." <E16Jd8a-0000J5-00@linuxlab.wdf.sap-ag.de>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-7787221390"
Date: Thu, 27 Dec 2001 14:23:03 -0600
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

--==_Exmh_-7787221390
Content-Type: text/plain; charset=us-ascii

As Grant says, its hard to debug this type of thing.  However, I do have a 
theory:  The free_irq() call in parisc doesn't do an irq shutdown (which 
disables the irq).  This looks like an omission, since I thought the 
behaviours of the arch irq.c's were all converging.  It is possible that an 
unhandled interrupt would cause the type of problem you describe

A simple test of the theory is to try the attached patch and see if that fixes 
the problem.  If that doesn't work, I'll try to reproduce (although this will 
take a while since I'll have to construct an NFS boot environment).

James




--==_Exmh_-7787221390
Content-Type: text/plain ; name="tmp.diff"; charset=us-ascii
Content-Description: tmp.diff
Content-Disposition: attachment; filename="tmp.diff"

Index: drivers/scsi/lasi700.c
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/lasi700.c,v
retrieving revision 1.5
diff -u -r1.5 lasi700.c
--- drivers/scsi/lasi700.c	2001/12/26 22:41:16	1.5
+++ drivers/scsi/lasi700.c	2001/12/27 20:20:59
@@ -195,6 +195,7 @@
 
 	NCR_700_release(host);
 	kfree(hostdata);
+	disable_irq(host->irq);
 	free_irq(host->irq, host);
 	release_mem_region(host->base, 64);
 	return 1;

--==_Exmh_-7787221390--
