Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.48.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D6094829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 19:31:36 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.36 #1 (Debian))
	id 18RkHh-0002Nl-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 21:31:37 -0500
Date: Thu, 26 Dec 2002 21:31:37 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021227023137.GD8363@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Why do we relax e_ident[EI_OSABI] in gdb?
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

parisc-linux,

Anyone have some ideas why we have this patch in gdb, and thus relax the 
EI_OSABI check?

--- gdb-5.2.cvs20020401/bfd/elf64-hppa.c~	Sun Mar 31 19:09:41 2002
+++ gdb-5.2.cvs20020401/bfd/elf64-hppa.c	Sat Apr 20 09:35:54 2002
@@ -372,7 +372,8 @@
   i_ehdrp = elf_elfheader (abfd);
   if (strcmp (bfd_get_target (abfd), "elf64-hppa-linux") == 0)
     {
-      if (i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_LINUX)
+      if (i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_LINUX &&
+          i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_NONE)
 	return false;
     }
   else
--- gdb-5.2.cvs20020401/bfd/elf32-hppa.c~	Sun Mar 31 19:09:41 2002
+++ gdb-5.2.cvs20020401/bfd/elf32-hppa.c	Sat Apr 20 09:35:54 2002
@@ -1038,7 +1038,8 @@
   i_ehdrp = elf_elfheader (abfd);
   if (strcmp (bfd_get_target (abfd), "elf32-hppa-linux") == 0)
     {
-      if (i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_LINUX)
+      if (i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_LINUX &&
+          i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_NONE)
 	return false;
     }
   else
===

c.
