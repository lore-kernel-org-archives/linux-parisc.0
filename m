Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65206482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 05:20:20 -0600 (MDT)
Received: Received: [from squeak.local (async191-ade-isp-7.nas.one.net.au [203.101.92.192])
	by mail-ob03.one.net.au  with SMTP id f4HBK3W13238
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 21:20:04 +1000 (EST)]
From: amodra@one.net.au
Date: Thu, 17 May 2001 20:54:40 +0930
To: binutila@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010517205439.C14368@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Really hide millicode syms
List-ID: <linux-parisc.vger.kernel.org>

A change to elf32_hppa_hide_symbol meant that clobber_millicode_symbols
wasn't doing its job to prevent millicode from being exported from
shared libs.  Among other things, this resulted in stubs trying to
load from .plt - 1, which bombs with an unaligned access.

	* elf32-hppa.c (clobber_millicode_symbols): Temporarily set
	ELF_LINK_FORCED_LOCAL to suit 2001-04-30 change.
	(hppa_build_one_stub): Add an assert to check plt.offset.

-- 
Alan Modra

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.32
diff -u -p -r1.32 elf32-hppa.c
--- elf32-hppa.c	2001/04/30 16:13:26	1.32
+++ elf32-hppa.c	2001/05/17 11:02:14
@@ -938,6 +938,7 @@ hppa_build_one_stub (gen_entry, in_arg)
 
     case hppa_stub_import:
     case hppa_stub_import_shared:
+      BFD_ASSERT (stub_entry->h->elf.plt.offset < (bfd_vma) -2);
       sym_value = (stub_entry->h->elf.plt.offset
 		   + hplink->splt->output_offset
 		   + hplink->splt->output_section->vma
@@ -2147,7 +2148,13 @@ clobber_millicode_symbols (h, info)
   /* Note!  We only want to remove these from the dynamic symbol
      table.  Therefore we do not set ELF_LINK_FORCED_LOCAL.  */
   if (h->type == STT_PARISC_MILLI)
-    elf32_hppa_hide_symbol (info, h);
+    {
+      unsigned short oldflags = h->elf_link_hash_flags;
+      h->elf_link_hash_flags |= ELF_LINK_FORCED_LOCAL;
+      elf32_hppa_hide_symbol (info, h);
+      h->elf_link_hash_flags &= ~ELF_LINK_FORCED_LOCAL;
+      h->elf_link_hash_flags |= oldflags & ELF_LINK_FORCED_LOCAL;
+    }
   return true;
 }
 
