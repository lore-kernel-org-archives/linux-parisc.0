Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA21875
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 07:03:12 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 30 May 2000 13:03:37 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA03474
	for <parisc-linux@thepuffingroup.com>; Tue, 30 May 2000 23:03:27 +1000
Date: Tue, 30 May 2000 23:03:27 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
Subject: [parisc-linux] Finding bogus asm comment chars.
Message-ID: <Pine.LNX.4.21.0005302257120.15777-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

The following hack might be useful to anyone trying to find `;' chars
buried away in C asm statements.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: app.c
===================================================================
RCS file: /home/cvs/parisc/binutils-2.10/gas/app.c,v
retrieving revision 1.1.1.1
diff -u -p -r1.1.1.1 app.c
--- app.c	2000/05/18 00:37:23	1.1.1.1
+++ app.c	2000/05/30 12:34:34
@@ -34,6 +34,9 @@
 #endif
 #endif
 
+/* We changed the hppa comment char.  Help find C asm that needs fixing.  */
+int found_comment = 0;
+
 #ifdef TC_M68K
 /* Whether we are scrubbing in m68k MRI mode.  This is different from
    flag_m68k_mri, because the two flags will be affected by the .mri
@@ -1161,7 +1164,7 @@ do_scrub_chars (get, tostart, tolen)
 	      && state != 1
 	      && state != 10)
 	    goto de_fault;
-	  /* Fall through.  */
+	  goto dont_count_this_comment;
 	case LEX_IS_COMMENT_START:
 #if defined TC_ARM && defined OBJ_ELF
 	  /* On the ARM, `@' is the comment character.
@@ -1172,6 +1175,8 @@ do_scrub_chars (get, tostart, tolen)
 	  if ((symver_state != NULL) && (*symver_state == 0))
 	    goto de_fault;
 #endif
+	  found_comment = 1;
+	dont_count_this_comment:
 	  do
 	    {
 	      ch = GET ();
Index: read.c
===================================================================
RCS file: /home/cvs/parisc/binutils-2.10/gas/read.c,v
retrieving revision 1.1.1.1
diff -u -p -r1.1.1.1 read.c
--- read.c	2000/05/18 00:37:23	1.1.1.1
+++ read.c	2000/05/30 12:35:03
@@ -1102,6 +1102,11 @@ read_a_source_file (name)
   md_cleanup();
 #endif
   input_scrub_close ();		/* Close the input file */
+  {
+    extern int found_comment;
+    if (found_comment)
+      as_warn ("comments be here");
+  }
 }
 
 /* For most MRI pseudo-ops, the line actually ends at the first
