Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA02099
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 06:43:03 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA03040;
	Wed, 17 Jan 2001 00:46:40 +1100
Date: Wed, 17 Jan 2001 00:46:40 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: binutils@sourceware.cygnus.com
cc: parisc-linux@puffin.external.hp.com
Message-ID: <Pine.LNX.4.21.0101170042311.4272-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Support hand-crafted .PARISC.unwind entries
List-ID: <linux-parisc.vger.kernel.org>

This one is useful for _init and _fini and like functions that are spliced
together from pieces.  The assembler can't create sensible unwind info for
such functions;  This little hack allows a hand-crafted solution.

gas/ChangeLog
	* config/tc-hppa.c (tc_gen_reloc): Use SEGREL32 instead of DIR32
	relocs for .PARISC.unwind section.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: gas/config/tc-hppa.c
===================================================================
RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
retrieving revision 1.77
diff -u -p -r1.77 tc-hppa.c
--- tc-hppa.c	2001/01/16 13:06:14	1.77
+++ tc-hppa.c	2001/01/16 13:39:00
@@ -4047,14 +4047,6 @@ tc_gen_reloc (section, fixp)
 
       code = *codes[0];
 
-      reloc->sym_ptr_ptr = (asymbol **) xmalloc (sizeof (asymbol *));
-      *reloc->sym_ptr_ptr = symbol_get_bfdsym (fixp->fx_addsy);
-      reloc->howto = bfd_reloc_type_lookup (stdoutput,
-					    (bfd_reloc_code_real_type) code);
-      reloc->address = fixp->fx_frag->fr_address + fixp->fx_where;
-
-      assert (reloc->howto && (unsigned int) code == reloc->howto->type);
-
       /* Now, do any processing that is dependent on the relocation type.  */
       switch (code)
 	{
@@ -4088,10 +4080,24 @@ tc_gen_reloc (section, fixp)
 	  break;
 #endif
 
+	case R_PARISC_DIR32:
+	  /* Facilitate hand-crafted unwind info.  */
+	  if (strcmp (section->name, UNWIND_SECTION_NAME) == 0)
+	    code = R_PARISC_SEGREL32;
+	  /* Fall thru */
+
 	default:
 	  reloc->addend = fixp->fx_offset;
 	  break;
 	}
+
+      reloc->sym_ptr_ptr = (asymbol **) xmalloc (sizeof (asymbol *));
+      *reloc->sym_ptr_ptr = symbol_get_bfdsym (fixp->fx_addsy);
+      reloc->howto = bfd_reloc_type_lookup (stdoutput,
+					    (bfd_reloc_code_real_type) code);
+      reloc->address = fixp->fx_frag->fr_address + fixp->fx_where;
+
+      assert (reloc->howto && (unsigned int) code == reloc->howto->type);
       break;
     }
 #else /* OBJ_SOM */
