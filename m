Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA01567
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 05:58:37 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA01443;
	Wed, 17 Jan 2001 00:02:07 +1100
Date: Wed, 17 Jan 2001 00:02:07 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: binutils@sourceware.cygnus.com
cc: parisc-linux@puffin.external.hp.com
Message-ID: <Pine.LNX.4.21.0101162353310.4272-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Build hppa unwind info for more than .text
List-ID: <linux-parisc.vger.kernel.org>

We were missing lots of unwind info, especially when using
-ffunction-sections, which confuses gdb.

gas/ChangeLog
	* config/tc-hppa.c (pa_build_unwind_subspace): Build unwind
	depending on section flags, not just for .text.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: gas/config/tc-hppa.c
===================================================================
RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
retrieving revision 1.76
diff -u -p -r1.76 tc-hppa.c
--- tc-hppa.c	2001/01/14 07:03:49	1.76
+++ tc-hppa.c	2001/01/16 12:23:05
@@ -6053,7 +6053,9 @@ pa_build_unwind_subspace (call_info)
   int reloc;
   char c, *p;
 
-  if (now_seg != text_section)
+  if ((bfd_get_section_flags (stdoutput, now_seg)
+       & (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
+      != (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
     return;
 
   reloc = R_PARISC_SEGREL32;
