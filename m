Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F6DE4843
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Jan 2004 06:17:26 -0700 (MST)
Message-ID: <40014D46.8030205@tiscali.be>
Date: Sun, 11 Jan 2004 13:19:02 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] cvs confuse me: please help!
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

As usual I do a 'cvs -z3 update linux-2.6'.

Head of linux-2.6/Makefile:
VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 1
EXTRAVERSION =-rc2-pa0

# *DOCUMENTATION*
# To see a list of typical targets execute "make help"
# More info can be located in ./README
# Comments in this file are targeted only to the developer, do not
# expect to learn how to build the kernel reading this file.

To build my own merge with 2.6.1 I grab linux-2.6.1-rc22.tar.bz2 from ftp.kernel.org and do a diff between src to obtain a patch 
file. Just scaning this patch file I read this:
[snip]
diff -NaurX dontdiff linux-2.6.1-rc2/drivers/scsi/sym53c8xx_2/sym_misc.c linux-2.6.1-rc2-pa0/drivers/scsi/sym53c8xx_2/sym_misc.c
--- linux-2.6.1-rc2/drivers/scsi/sym53c8xx_2/sym_misc.c 2004-01-06 06:10:10.000000000 +0100
+++ linux-2.6.1-rc2-pa0/drivers/scsi/sym53c8xx_2/sym_misc.c     2003-12-14 21:57:09.000000000 +0100
@@ -315,7 +315,7 @@
          */
         inq_byte56 = tp->inq_byte56;
         if (inq_version >= 4 && inq_len > 56)
-               tp->inq_byte56 = inq_data[56];
+               inq_byte56 = inq_data[56];
  #if 0
  printf("XXXXXX [%d] inq_version=%x inq_byte7=%x inq_byte56=%x XXXXX\n",
         inq_len, inq_version, inq_byte7, inq_byte56);
[snip]

To be sure it's relevant, I check with viewcvs and read the Matthew's patch:
===================================================================
RCS file: /var/lib/cvs/linux-2.6/drivers/scsi/sym53c8xx_2/sym_misc.c,v
retrieving revision 1.3
retrieving revision 1.3.4.1
diff -u -r1.3 -r1.3.4.1
--- linux-2.6/drivers/scsi/sym53c8xx_2/sym_misc.c	2003/12/14 15:26:41	1.3
+++ linux-2.6/drivers/scsi/sym53c8xx_2/sym_misc.c	2004/01/07 21:09:15	1.3.4.1
@@ -315,7 +315,7 @@
  	 */
  	inq_byte56 = tp->inq_byte56;
  	if (inq_version >= 4 && inq_len > 56)
-		inq_byte56 = inq_data[56];
+		tp->inq_byte56 = inq_data[56];
  #if 0
  printf("XXXXXX [%d] inq_version=%x inq_byte7=%x inq_byte56=%x XXXXX\n",
  	inq_len, inq_version, inq_byte7, inq_byte56);
=========><=========

I so remove my tree linux-2.6 and redo cvs co linux-2.6 but when I check 'sym_misc.c', I always got:
[snip]
     313         /*
     314          *  Get CLOCKING capability.
     315          */
     316         inq_byte56 = tp->inq_byte56;
     317         if (inq_version >= 4 && inq_len > 56)
     318                 inq_byte56 = inq_data[56];
     319 #if 0
     320 printf("XXXXXX [%d] inq_version=%x inq_byte7=%x inq_byte56=%x XXXXX\n",
     321         inq_len, inq_version, inq_byte7, inq_byte56);
     322 #endif
[snip]

What do I wrong?

Thanks in advance for help and advise,
	Joel
