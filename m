Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 518F9484B
	for <parisc-linux@parisc-linux.org>; Mon,  8 Oct 2001 18:49:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ql5P-00025V-00
	for parisc-linux@parisc-linux.org; Tue, 09 Oct 2001 01:49:31 +0100
Date: Tue, 9 Oct 2001 01:49:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011009014931.C25819@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] SMP now working again
List-ID: <linux-parisc.vger.kernel.org>

With the change I committed as 2.4.9-pa45, CONFIG_SMP works again.
For those with machines with discontiguous CPU numbers (eg an L2k with
only two processors), this further patch is required.  I think this is
masking a real bug which may cause problems at a later date, so I'm not
committing this workaround to CVS yet -- I'd rather find the real bug.

I've only tested on an L2k with 2 CPUs, so other testing would be
welcomed.  Thanks to jsm & grant for helping me with this.

Index: arch/parisc/kernel/processor.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/processor.c,v
retrieving revision 1.3
diff -u -p -r1.3 processor.c
--- processor.c	2001/10/06 08:00:03	1.3
+++ processor.c	2001/10/09 00:27:02
@@ -125,9 +125,9 @@ static int __init processor_probe(struct
 		txn_addr = dev->hpa;	/* for legacy PDC */
 
 		/* logical CPU ID and update global counter */
-		cpuid = boot_cpu_data.cpu_count;
 	}
 
+	cpuid = boot_cpu_data.cpu_count;
 	p = &cpu_data[cpuid];
 	boot_cpu_data.cpu_count++;

I also enabled EARLY_BOOTUP_DEBUG with the following patch to figure
out what was going on.
 
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.28
diff -u -p -r1.28 pdc_cons.c
--- pdc_cons.c	2001/06/20 14:16:10	1.28
+++ pdc_cons.c	2001/10/09 00:27:02
@@ -12,7 +12,7 @@
 
 /* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
  * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
-#undef EARLY_BOOTUP_DEBUG
+#define EARLY_BOOTUP_DEBUG
 
 
 #include <linux/config.h>

-- 
Revolutions do not require corporate support.
