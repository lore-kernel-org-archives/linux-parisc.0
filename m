Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CFA2.dip.t-dialin.net [217.81.207.162])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17B1A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 15:03:57 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id XAA03423
	for parisc-linux@lists.parisc-linux.org; Thu, 28 Jun 2001 23:03:46 +0200
Date: Thu, 28 Jun 2001 23:03:46 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010628230346.A2361@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ioremap with 32bit kernel on 64bit machines
List-ID: <linux-parisc.vger.kernel.org>

Hi,

we do have a problem with ioremap on 64bit machines with a 32bit kernel.
While ldaw and friends translate the 32bit address to an appropriate
64bit address our dtlb miss handler doesn't.

ldaw translation:

0x00000000 - 0xefffffff  ->   0x00000000 00000000 - 0x00000000 efffffff
0xf0000000 - 0xf0ffffff  ->   0xf0000000 00000000 - 0xf0000000 00ffffff
0xf1000000 - 0xffffffff  ->   0xffffffff f1000000 - 0xffffffff ffffffff

the second range is PDC address space, don't know whether we need it.
I've added code in dtlb_miss_20 and nadtlb_miss_20 to do following
mapping:

0x00000000 - 0xefffffff  ->   0x00000000 00000000 - 0x00000000 efffffff
0xf0000000 - 0xffffffff  ->   0xffffffff f0000000 - 0xffffffff ffffffff

This way we get at least io address space right. The changes are below
and I guess they could be improved. With this changes I'm able to ioremap
the framebuffer on my C200 and after changes to zalon and sym53x8xx the
system works as before. Comments ?

Thomas.

Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.85
diff -u -r1.85 entry.S
--- arch/parisc/kernel/entry.S	2001/06/12 16:09:52	1.85
+++ arch/parisc/kernel/entry.S	2001/06/27 23:05:40
@@ -1251,7 +1251,10 @@
 	/* Get rid of prot bits and convert to page addr for idtlbt */
 
 	depdi		0,63,12,pte
-	extrd,u		pte,56,25,pte
+	extrd,u         pte,35,4,t0
+	cmpiclr,<>      15,t0,r0
+	depdi           -1,31,32,pte
+	extrd,u		pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir
@@ -1324,7 +1327,10 @@
 	/* Get rid of prot bits and convert to page addr for idtlbt */
 
 	depdi		0,63,12,pte
-	extrd,u		pte,56,25,pte
+	extrd,u         pte,35,4,t0
+	cmpiclr,<>      15,t0,r0
+	depdi           -1,31,32,pte
+	extrd,u		pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
