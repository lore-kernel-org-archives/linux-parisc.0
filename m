Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38276486E
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 06:07:54 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18nIKn-0002ik-00; Mon, 24 Feb 2003 13:07:53 +0000
Date: Mon, 24 Feb 2003 13:07:53 +0000
From: Matthew Wilcox <willy@debian.org>
To: binutils@sources.redhat.com, parisc-linux@parisc-linux.org
Message-ID: <20030224130753.H2938@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] Implement fcnv in objdump
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

2003-02-24  Matthew Wilcox  <willy@debian.org>

	* hppa-dis.c (print_insn_hppa): Implement fcnv instruction modifiers.

Index: opcodes/hppa-dis.c
===================================================================
RCS file: /cvs/src/src/opcodes/hppa-dis.c,v
retrieving revision 1.41
diff -u -p -r1.41 hppa-dis.c
--- opcodes/hppa-dis.c	31 Dec 2001 23:44:08 -0000	1.41
+++ opcodes/hppa-dis.c	24 Feb 2003 12:59:06 -0000
@@ -123,6 +123,8 @@ static const char *const short_bytes_com
   "", ",b,m", ",e", ",e,m"
 };
 static const char *const float_format_names[] = {",sgl", ",dbl", "", ",quad"};
+static const char *const fcnv_fixed_names[] = {",w", ",dw", "", ",qw"};
+static const char *const fcnv_ufixed_names[] = {",uw", ",udw", "", ",uqw"};
 static const char *const float_comp_names[] =
 {
   ",false?", ",false", ",?", ",!<=>", ",=", ",=t", ",?=", ",!<>",
@@ -397,7 +399,7 @@ print_insn_hppa (memaddr, info)
 #endif
 	  (*info->fprintf_func) (info->stream, "%s", opcode->name);
 
-	  if (!strchr ("cfCY?-+nHNZFIuv", opcode->args[0]))
+	  if (!strchr ("cfCY?-+nHNZFIuv{", opcode->args[0]))
 	    (*info->fprintf_func) (info->stream, " ");
 	  for (s = opcode->args; *s != '\0'; ++s)
 	    {
@@ -1131,11 +1136,33 @@ print_insn_hppa (memaddr, info)
 		    break;
 		  }
 
-		/* ?!? FIXME */
 		case '_':
+		  break; /* Dealt with by '{' */
+
 		case '{':
-		  fputs_filtered ("Disassembler botch.\n", info);
-		  break;
+		  {
+		    int sub = GET_FIELD (insn, 14, 16);
+		    int df = GET_FIELD (insn, 17, 18);
+		    int sf = GET_FIELD (insn, 19, 20);
+		    const char * const * source = float_format_names;
+		    const char * const * dest = float_format_names;
+		    char *t = "";
+		    if (sub == 4)
+		      {
+			fputs_filtered (",UND ", info);
+			break;
+		      }
+		    if ((sub & 3) == 3)
+		      t = ",t";
+		    if ((sub & 3) == 1)
+		      source = (sub & 4) ? fcnv_ufixed_names : fcnv_fixed_names;
+		    if (sub & 2)
+		      dest = (sub & 4) ? fcnv_ufixed_names : fcnv_fixed_names;
+
+		    (*info->fprintf_func) (info->stream, "%s%s%s ",
+					   t, source[sf], dest[df]);
+		    break;
+		  }
 
 		case 'm':
 		  {

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
