From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] [PATCH] space register 0 changes for hppa
Date: Sun, 23 Feb 2003 18:58:47 +0000
Message-ID: <20030223185847.C2938__26265.1971345351$1416622233$gmane$org@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: binutils@sources.redhat.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi.  I believe I should still have a copyright assignment on file.

Index: opcodes/ChangeLog
===================================================================
RCS file: /cvs/src/src/opcodes/ChangeLog,v
retrieving revision 1.547
diff -u -p -r1.547 ChangeLog
--- opcodes/ChangeLog	12 Feb 2003 22:33:59 -0000	1.547
+++ opcodes/ChangeLog	23 Feb 2003 18:54:00 -0000
@@ -1,3 +1,9 @@
+2003-02-23  Matthew Wilcox  <willy@debian.org>
+
+	* hppa-dis.c: Do not emit a space register if the space register
+	field is 2 bits and the value is 0 as this is implicit addressing,
+	not use of space register 0.
+
 2003-02-12  Dave Brolley  <brolley@redhat.com>
 
 	* fr30-desc.c: Regenerate.
Index: opcodes/hppa-dis.c
===================================================================
RCS file: /cvs/src/src/opcodes/hppa-dis.c,v
retrieving revision 1.41
diff -u -p -r1.41 hppa-dis.c
--- opcodes/hppa-dis.c	31 Dec 2001 23:44:08 -0000	1.41
+++ opcodes/hppa-dis.c	23 Feb 2003 18:54:00 -0000
@@ -541,8 +541,11 @@ print_insn_hppa (memaddr, info)
 		  fput_const (extract_5_load (insn), info);
 		  break;
 		case 's':
-		  (*info->fprintf_func) (info->stream,
-					 "sr%d", GET_FIELD (insn, 16, 17));
+		  {
+		    int space = GET_FIELD (insn, 16, 17);
+		    if (space != 0)
+		      (*info->fprintf_func) (info->stream, "sr%d", space);
+		  }
 		  break;
 
 		case 'S':

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
