Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA00364
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Oct 2000 09:04:31 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Oct 2000 15:05:25 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA02741;
	Tue, 3 Oct 2000 02:05:14 +1100
Date: Tue, 3 Oct 2000 02:05:14 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0010030154470.20499-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] libmilli.a
List-ID: <linux-parisc.vger.kernel.org>

Here's how to make ld always link in a special library, even when
someone is messing around with linker scripts and so forth.  I've been
playing with this today, and after fixing some gcc and linker c++ probs
now can pass all the binutils testsuite (some of which used to fail due to
not finding $$dynamic)

For my testing, I just moved $$dynamic from libgcc.a into libmilli.a, but
we should move more functions I guess.

Comments?

Index: ld/emultempl/hppaelf.em
===================================================================
RCS file: /home/cvs/parisc/binutils/ld/emultempl/hppaelf.em,v
retrieving revision 1.10
diff -u -p -r1.10 hppaelf.em
--- hppaelf.em	2000/09/27 09:13:09	1.10
+++ hppaelf.em	2000/10/02 05:33:54
@@ -71,6 +71,16 @@ hppaelf_create_output_section_statements
   ldlang_add_file (stub_file);
 }
 
+/* Adds millicode library to the list of input files.  */
+
+static void
+hppaelf_after_parse ()
+{
+  lang_add_input_file ("milli",
+		       lang_input_file_is_l_enum,
+		       NULL);
+}
+
 /* Walk all the lang statements splicing out any padding statements from
    the list.  */
 
@@ -401,3 +411,4 @@ PARSE_AND_LIST_ARGS_CASES='
 #
 LDEMUL_FINISH=hppaelf_finish
 LDEMUL_CREATE_OUTPUT_SECTION_STATEMENTS=hppaelf_create_output_section_statements
+LDEMUL_AFTER_PARSE=hppaelf_after_parse
