Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16EF0482A
	for <parisc-linux@parisc-linux.org>; Sun, 21 Oct 2001 11:52:39 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id tszeiaaa for parisc-linux@parisc-linux.org; Sun, 21 Oct 2001 10:47:54 -0700
Date: Sun, 21 Oct 2001 10:52:27 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011021105227.H537@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] small patch for cpu_idle?
List-ID: <linux-parisc.vger.kernel.org>

It appears to me that our cpu_idle is not quite right... what do you
guys think about this:

Index: process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.38
diff -u -r1.38 process.c
--- process.c   2001/10/09 19:43:35     1.38
+++ process.c   2001/10/21 17:46:53
@@ -67,8 +67,8 @@
        current->counter = -100;
 
        while (1) {
-               while (!current->need_resched) {
-               }
+               while (!current->need_resched) 
+                       continue;
                schedule();
                check_pgt_cache();
        }

otherwise when cpu_idle gets called we might get stuck in an inf loop
(which happens, for example, when fsck requires manual intervention on
startup).

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
