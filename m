Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2A794A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Mar 2001 22:17:43 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel1.hp.com (Postfix) with ESMTP id 804C2B74
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 00:17:43 -0500 (EST)
Received: from chrysl (chrysl.fc.hp.com [15.1.54.200])
	by ldl.fc.hp.com (Postfix) with ESMTP id 385E35A992
	for <parisc-linux@parisc-linux.org>; Wed, 21 Mar 2001 22:17:43 -0700 (MST)
Received: from willy by chrysl with local (Exim 3.12 #1 (Debian))
	id 14fxTj-00036B-00
	for <parisc-linux@parisc-linux.org>; Wed, 21 Mar 2001 22:17:43 -0700
To: parisc-linux@parisc-linux.org
Message-Id: <E14fxTj-00036B-00@chrysl>
From: Matthew Wilcox <willy@ldl.fc.hp.com>
Date: Wed, 21 Mar 2001 22:17:43 -0700
Subject: [parisc-linux] Keyboard cleanup
List-ID: <linux-parisc.vger.kernel.org>

we're getting a big pile of warnings:

hp_keyb.c:282: warning: (near initialization for `high_keys')

and it seems to be because the array we're initialising is of size 0
(128 - SC_LIM).  the following patch seems to DTRT, but i would appreciate
someone who has a (non-HIL) keyboard testing it and confirming it works.

Index: drivers/char/hp_keyb.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/char/hp_keyb.c,v
retrieving revision 1.3
diff -u -p -r1.3 hp_keyb.c
--- hp_keyb.c	2000/11/16 20:37:43	1.3
+++ hp_keyb.c	2001/03/22 05:10:35
@@ -246,7 +246,7 @@ unsigned char hp_ps2kbd_sysrq_xlate[128]
  * they needed not before. It does not matter that there are duplicates, as
  * long as no duplication occurs for any single keyboard.
  */
-#define SC_LIM 128
+#define SC_LIM 59
 
 #define FOCUS_PF1 85           /* actual code! */
 #define FOCUS_PF2 89
