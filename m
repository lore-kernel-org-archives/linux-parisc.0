From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [hppa patch] Fix register definitions for hppa
Date: Fri, 3 Aug 2007 17:06:46 +0000
Message-ID: <20070803170646.GB32611__40936.2188111574$1416624426$gmane$org@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: gdb-patches@sources.redhat.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Should be self-explanatory. We came across this while debugging
TLS-enabled thread debugging on hppa-linux. GDB was not reading 
cr27 (hppa's thread register), so thread-debugging failed quite 
miserably :(

If there are no comments, I shall commit in a couple of days.

thanks,
randolph

2007-08-03  Randolph Chung  <tausq@debian.org>

	* hppa-tdep.c (hppa32_cannot_fetch_register)
	(hppa64_cannot_fetch_register): New functions.
	(hppa_gdbarch_init): Set cannot_fetch_register appropriately.
	* hppa-tdep.h (hppa_regnum): Add HPPA_CR26_REGNUM.

Index: hppa-tdep.c
===================================================================
RCS file: /cvs/src/src/gdb/hppa-tdep.c,v
retrieving revision 1.234
diff -u -p -r1.234 hppa-tdep.c
--- hppa-tdep.c	15 Jun 2007 22:44:55 -0000	1.234
+++ hppa-tdep.c	13 Jul 2007 16:26:29 -0000
@@ -2676,6 +2676,16 @@ hppa32_cannot_store_register (int regnum
 }
 
 static int
+hppa32_cannot_fetch_register (int regnum)
+{
+  /* cr26 and cr27 are readable (but not writable) from userspace.  */
+  if (regnum == HPPA_CR26_REGNUM || regnum == HPPA_CR27_REGNUM)
+    return 0;
+  else
+    return hppa32_cannot_store_register (regnum);
+}
+
+static int
 hppa64_cannot_store_register (int regnum)
 {
   return (regnum == 0
@@ -2684,6 +2694,16 @@ hppa64_cannot_store_register (int regnum
           || (regnum > HPPA_IPSW_REGNUM && regnum < HPPA64_FP4_REGNUM));
 }
 
+static int
+hppa64_cannot_fetch_register (int regnum)
+{
+  /* cr26 and cr27 are readable (but not writable) from userspace.  */
+  if (regnum == HPPA_CR26_REGNUM || regnum == HPPA_CR27_REGNUM)
+    return 0;
+  else
+    return hppa64_cannot_store_register (regnum);
+}
+
 static CORE_ADDR
 hppa_smash_text_address (CORE_ADDR addr)
 {
@@ -3076,7 +3096,7 @@ hppa_gdbarch_init (struct gdbarch_info i
 	set_gdbarch_cannot_store_register (gdbarch,
 					   hppa32_cannot_store_register);
 	set_gdbarch_cannot_fetch_register (gdbarch,
-					   hppa32_cannot_store_register);
+					   hppa32_cannot_fetch_register);
         break;
       case 8:
         set_gdbarch_num_regs (gdbarch, hppa64_num_regs);
@@ -3087,7 +3107,7 @@ hppa_gdbarch_init (struct gdbarch_info i
 	set_gdbarch_cannot_store_register (gdbarch,
 					   hppa64_cannot_store_register);
 	set_gdbarch_cannot_fetch_register (gdbarch,
-					   hppa64_cannot_store_register);
+					   hppa64_cannot_fetch_register);
         break;
       default:
         internal_error (__FILE__, __LINE__, _("Unsupported address size: %d"),
Index: hppa-tdep.h
===================================================================
RCS file: /cvs/src/src/gdb/hppa-tdep.h,v
retrieving revision 1.30
diff -u -p -r1.30 hppa-tdep.h
--- hppa-tdep.h	15 Jun 2007 22:44:55 -0000	1.30
+++ hppa-tdep.h	13 Jul 2007 16:26:29 -0000
@@ -59,6 +59,7 @@ enum hppa_regnum
   HPPA_PID3_REGNUM = 56,	/* Protection ID */
   HPPA_CCR_REGNUM = 54,		/* Coprocessor Configuration Register */
   HPPA_TR0_REGNUM = 57,		/* Temporary Registers (cr24 -> cr31) */
+  HPPA_CR26_REGNUM = 59,
   HPPA_CR27_REGNUM = 60,	/* Base register for thread-local storage, cr27 */
   HPPA_FP0_REGNUM = 64,		/* First floating-point.  */
   HPPA_FP4_REGNUM = 72,
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
