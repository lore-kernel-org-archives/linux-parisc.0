Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8554482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Mar 2001 03:15:17 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 26AF2B007; Wed, 28 Mar 2001 11:15:23 +0100 (BST)
Date: Wed, 28 Mar 2001 11:15:23 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Keith Owens <kaos@ocs.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010328111523.I30046@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Patch for modutils 2.4.4, support SEGREL32 relocs on hppa/hppa64
List-ID: <linux-parisc.vger.kernel.org>

Hi Keith,
  A small fix for modutils on hppa...

Richard


diff -ur modutils-2.4.4/ChangeLog modutils/ChangeLog
--- modutils-2.4.4/ChangeLog	Mon Mar 26 10:29:56 2001
+++ modutils/ChangeLog	Wed Mar 28 10:57:07 2001
@@ -1,3 +1,6 @@
+
+	* Support for SEGREL32 relocs on hppa/hppa64.  Richard Hirst
+
 2001-03-26  Keith Owens  <kaos@ocs.com.au>
 
 	modutils 2.4.4
diff -ur modutils-2.4.4/obj/obj_hppa.c modutils/obj/obj_hppa.c
--- modutils-2.4.4/obj/obj_hppa.c	Sun Mar 25 12:13:48 2001
+++ modutils/obj/obj_hppa.c	Wed Mar 28 00:36:11 2001
@@ -529,6 +529,10 @@
     /* Easy. */
     break;
 
+  case R_PARISC_SEGREL32:
+    v -= f->baseaddr;
+    break;
+
   case R_PARISC_DPREL21L:
   case R_PARISC_DPREL14R:
     v -= dp;
@@ -566,9 +570,10 @@
     case R_PARISC_DIR32:
     case R_PARISC_PLABEL32:
     case R_PARISC_PCREL17F:
+    case R_PARISC_SEGREL32:
       fsel = e_fsel;
       break;
-	
+
     case R_PARISC_DPREL21L:
     case R_PARISC_DIR21L:
       fsel = e_lrsel;
@@ -602,6 +607,7 @@
     {
     case R_PARISC_DIR32:
     case R_PARISC_PLABEL32:
+    case R_PARISC_SEGREL32:
       r_format = 32;
       break;
 
diff -ur modutils-2.4.4/obj/obj_hppa64.c modutils/obj/obj_hppa64.c
--- modutils-2.4.4/obj/obj_hppa64.c	Fri Jan  5 01:45:19 2001
+++ modutils/obj/obj_hppa64.c	Wed Mar 28 10:48:59 2001
@@ -361,6 +361,7 @@
 		need_stub = TRUE;
 		break;
 	    case R_PARISC_DIR64:
+	    case R_PARISC_SEGREL32:
 		break;
 	    case R_PARISC_FPTR64:
 		/* This is a simple OPD entry (only created for local symbols,
@@ -595,6 +596,11 @@
 	{
 	    loc[0] = v >> 32;
 	    loc[1] = v;
+	}
+	break;
+    case R_PARISC_SEGREL32:
+	{
+	    loc[0] = v - f->baseaddr;
 	}
 	break;
     case R_PARISC_FPTR64:
