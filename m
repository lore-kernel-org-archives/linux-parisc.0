Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA21367
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Sep 2000 15:07:34 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39B2BD9D.61337522@uswest.net>
Date: Sun, 03 Sep 2000 15:07:41 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------03E6B5D605078BCA90A54D06"
Subject: [parisc-linux] PATCH: memory patch
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------03E6B5D605078BCA90A54D06
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello everyone,

I have a small patch that allows the parsic-linux kernel see all
the all the memory the PDC recognizes.   This patch works fine
for me, and if no one has any objections, (ie.  Does this need to
be present for some models?) ... I'll commit it.

Thanks,

Ryan



--------------03E6B5D605078BCA90A54D06
Content-Type: text/plain; charset=us-ascii;
 name="mem.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mem.patch"

Index: setup.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/kernel/setup.c,v
retrieving revision 1.33
diff -u -p -r1.33 setup.c
--- setup.c	2000/08/25 15:07:19	1.33
+++ setup.c	2000/09/03 20:36:39
@@ -282,8 +282,7 @@ void __init start_parisc(unsigned arg0, 
 	mtctl(ccr, 10);
 
 	mem_start = __pa(memory_start);
-#define MAX_MEM (128*1024*1024)
-	mem_max = (PAGE0->imm_max_mem > MAX_MEM ? MAX_MEM : PAGE0->imm_max_mem);
+	mem_max = PAGE0->imm_max_mem;
 
 	collect_cpuinfo(); // get all cpu & system-information for later use.
 	printk("CPU(s): %d x %s at %d.%06d MHz\n", 

--------------03E6B5D605078BCA90A54D06--
