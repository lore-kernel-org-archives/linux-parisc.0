Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08A16482E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Nov 2002 00:38:31 -0700 (MST)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 602322B100
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Nov 2002 00:38:26 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 23 Nov 2002 00:38:26 -0700
Message-Id: <1038037106.14815.4.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] [PATCH] highmem_io for the sym53c8xx_2 driver??
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

Hello parisc-linux hackers,

I traced my boot problem with cvs head for the linux-2.4 tree down to
the following patch:

Index: drivers/scsi/sym53c8xx_2/sym53c8xx.h
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/sym53c8xx_2/sym53c8xx.h,v
retrieving revision 1.4
diff -u -p -r1.4 sym53c8xx.h
--- drivers/scsi/sym53c8xx_2/sym53c8xx.h	13 Nov 2002 15:15:44 -0000	1.4
+++ drivers/scsi/sym53c8xx_2/sym53c8xx.h	23 Nov 2002 07:32:10 -0000
@@ -119,8 +119,7 @@ int sym53c8xx_release(struct Scsi_Host *
 	this_id:		7,					\
 	sg_tablesize:		0,					\
 	cmd_per_lun:		0,					\
-	use_clustering:		DISABLE_CLUSTERING,			\
-	highmem_io:		1}
+	use_clustering:		DISABLE_CLUSTERING}
 
 #endif /* defined(HOSTS_C) || defined(MODULE) */ 
 
Index: drivers/scsi/sym53c8xx_2/sym_glue.c
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/sym53c8xx_2/sym_glue.c,v
retrieving revision 1.6
diff -u -p -r1.6 sym_glue.c
--- drivers/scsi/sym53c8xx_2/sym_glue.c	16 Nov 2002 06:10:46 -0000	1.6
+++ drivers/scsi/sym53c8xx_2/sym_glue.c	23 Nov 2002 07:32:11 -0000
@@ -2154,7 +2154,6 @@ sym_attach (Scsi_Host_Template *tpnt, in
 	instance->max_cmd_len	= 16;
 #endif
 	instance->select_queue_depths = sym53c8xx_select_queue_depths;
-	instance->highmem_io	= 1;
 
 	SYM_UNLOCK_HCB(np, flags);
 



I am not sure what the highmem_io flag does, but when it is enabled it
causes my C200 to HPMC.

Thoughts?

Thanks,

- Ryan
