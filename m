Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DA424877
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 14:36:37 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id 6560C138C
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 16:36:36 -0400 (EDT)
Received: from chrysl (chrysl.fc.hp.com [15.1.54.200])
	by ldl.fc.hp.com (Postfix) with ESMTP id 4BE2E5A979
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 14:36:30 -0600 (MDT)
Received: from willy by chrysl with local (Exim 3.12 #1 (Debian))
	id 159YQI-00030c-00
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 14:36:30 -0600
To: parisc-linux@parisc-linux.org
Message-Id: <E159YQI-00030c-00@chrysl>
From: Matthew Wilcox <willy@ldl.fc.hp.com>
Date: Mon, 11 Jun 2001 14:36:30 -0600
Subject: [parisc-linux] Fix msgctl
List-ID: <linux-parisc.vger.kernel.org>

The switch statement fails to match any cases when IPC_64 is set,
so we must clear it.  This fixes the problem fakeroot was having,
as it could allocate new sysv msg queues, but never free them,
and we're limited to 16 queues.

Index: Makefile
===================================================================
RCS file: /home/cvs/parisc/linux/Makefile,v
retrieving revision 1.50
diff -u -p -r1.50 Makefile
--- Makefile	2001/06/12 01:21:38	1.50
+++ Makefile	2001/06/12 02:33:52
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 0
-EXTRAVERSION = -pa17
+EXTRAVERSION = -pa18
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
Index: arch/parisc/kernel/sys_parisc32.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/sys_parisc32.c,v
retrieving revision 1.16
diff -u -p -r1.16 sys_parisc32.c
--- sys_parisc32.c	2001/06/08 13:58:08	1.16
+++ sys_parisc32.c	2001/06/12 02:33:53
@@ -2681,7 +2681,7 @@ asmlinkage long sys32_msgctl (int msqid,
 {
 	int err = -EINVAL;
 
-	switch (cmd) {
+	switch (cmd &~ IPC_64) {
 
 	case IPC_INFO:
 	case MSG_INFO:
