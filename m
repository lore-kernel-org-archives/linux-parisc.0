Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA19073
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Sep 2000 09:24:51 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 6 Sep 2000 15:25:05 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA07553;
	Thu, 7 Sep 2000 02:24:42 +1100
Date: Thu, 7 Sep 2000 02:24:42 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: binutils@sourceware.cygnus.com
cc: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0009070151400.22521-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] elf32.em place_orphan segfault
List-ID: <linux-parisc.vger.kernel.org>

While fiddling with the new "ld --unique" option, I managed to crash the
linker.  You have to try fairly hard, but using a custom link script with
a .text output section that doesn't match the first input .text section
does the trick.  Without --unique you'd need to try even harder with
unusual section flags to get the crash.

Anyway, this patch fixes the problem, and improves link times too.

ld/ChangeLog
	* emultempl/elf32.em (gld${EMULATION_NAME}_place_orphan): Don't
	try shuffling sections when the orphan happens to be the place
	holder.  Keep count of unique section names generated so we speed
	the search for a new name.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: emultempl/elf32.em
===================================================================
RCS file: /cvs/src/src/ld/emultempl/elf32.em,v
retrieving revision 1.32
diff -u -p -r1.32 elf32.em
--- elf32.em	2000/09/05 03:05:19	1.32
+++ elf32.em	2000/09/06 14:50:13
@@ -1008,6 +1008,7 @@ gld${EMULATION_NAME}_place_orphan (file,
   static struct orphan_save hold_bss;
   static struct orphan_save hold_rel;
   static struct orphan_save hold_interp;
+  static int count = 1;
   struct orphan_save *place;
   lang_statement_list_type *old = NULL;
   lang_statement_list_type add;
@@ -1092,7 +1093,9 @@ gld${EMULATION_NAME}_place_orphan (file,
      loadable or allocateable characteristics.  */
   outsecname = secname;
   if (bfd_get_section_by_name (output_bfd, outsecname) != NULL)
-    outsecname = bfd_get_unique_section_name (output_bfd, outsecname, NULL);
+    outsecname = bfd_get_unique_section_name (output_bfd,
+					      outsecname,
+					      &count);
 
   if (place != NULL)
     {
@@ -1154,7 +1157,9 @@ gld${EMULATION_NAME}_place_orphan (file,
       stat_ptr = old;
 
       snew = os->bfd_section;
-      if (place->os->bfd_section != NULL || place->section != NULL)
+      if (place->section != NULL
+	  || (place->os->bfd_section != NULL
+	      && place->os->bfd_section != snew))
 	{
 	  /* Shuffle the section to make the output file look neater.  */
 	  if (place->section == NULL)
