Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from paer.debian.org (paer.external.hp.com [192.25.206.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78F5B482A
	for <parisc-linux@parisc-linux.org>; Tue, 19 Jun 2001 14:20:19 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Message-Id: <E15CRyx-0001ng-00@paer.debian.org>
From: Matthew Wilcox <willy@paer.debian.org>
Date: Tue, 19 Jun 2001 14:20:15 -0600
Subject: [parisc-linux] (no subject)
List-ID: <linux-parisc.vger.kernel.org>

I've been trying to port guile today which includes qthreads.
The qthreads hppa support contains the following code:

            bl          $$dyncall,%mrp  ; call $$dyncall (millicode function)
            copy        %mrp,%rp        ; remember the return-pointer

our assembler doesn't recognise %mrp atm, but i guess HPUX's does.  How
does the following patch look?

--- binutils-2.11.90.0.7/gas/config/tc-hppa.c.orig	Wed Mar 28 10:58:26 2001
+++ binutils-2.11.90.0.7/gas/config/tc-hppa.c	Tue Jun 19 14:09:08 2001
@@ -954,6 +954,11 @@
   {"%isr",   20},
   {"%itmr",  16},
   {"%iva",   14},
+#if TARGET_ARCH_SIZE == 64
+  {"%mrp",    2},
+#else
+  {"%mrp",   31},
+#endif
   {"%pcoq",  18},
   {"%pcsq",  17},
   {"%pidr1",  8},
