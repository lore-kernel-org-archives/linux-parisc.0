Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4967485E
	for <parisc-linux@parisc-linux.org>; Sun, 23 Feb 2003 13:48:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18n33C-00039o-00
	for parisc-linux@parisc-linux.org; Sun, 23 Feb 2003 20:48:42 +0000
Date: Sun, 23 Feb 2003 20:48:42 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030223204842.E2938@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] second sr0 patch
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

forgot to cc p-l on this one.  sorry.

----- Forwarded message from Matthew Wilcox <willy@wil.cx> -----

Index: gas/ChangeLog
===================================================================
RCS file: /cvs/src/src/gas/ChangeLog,v
retrieving revision 1.1677
diff -u -p -r1.1677 ChangeLog
--- gas/ChangeLog	21 Feb 2003 19:05:01 -0000	1.1677
+++ gas/ChangeLog	23 Feb 2003 19:21:05 -0000
@@ -1,3 +1,8 @@
+2003-02-23  Matthew Wilcox  <willy@debian.org>
+
+	* config/tc-hppa.c: Do not accept sr0 as a valid space register when
+	  constructing an instruction with a 2-bit s field.
+
 2003-02-21  Nick Clifton  <nickc@redhat.com>
 
 	* NEWS: Mention availability of test generator program.
Index: gas/config/tc-hppa.c
===================================================================
RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
retrieving revision 1.102
diff -u -p -r1.102 tc-hppa.c
--- gas/config/tc-hppa.c	23 Jan 2003 12:51:04 -0000	1.102
+++ gas/config/tc-hppa.c	23 Feb 2003 19:21:09 -0000
@@ -1794,7 +1794,7 @@ pa_ip (str)
 	      if (!pa_parse_number (&s, 0))
 		break;
 	      num = pa_number;
-	      CHECK_FIELD (num, 3, 0, 1);
+	      CHECK_FIELD (num, 3, 1, 1);
 	      INSERT_FIELD_AND_CONTINUE (opcode, num, 14);
 
 	    /* Handle a 3 bit space identifier at 18.  */

----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
