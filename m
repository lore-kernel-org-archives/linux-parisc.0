Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32F114829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jun 2003 21:37:50 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h5S3bmI27029
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jun 2003 23:37:49 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed; boundary="=-mFDCIPy6JwGD91p7aSFq"
Date: 27 Jun 2003 22:37:48 -0500
Message-Id: <1056771469.1825.210.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Fix for local symbols appearing in CONFIG_KALLSYMS traces
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

--=-mFDCIPy6JwGD91p7aSFq
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

One of the problems with KALLSYMS on parisc is that our toolchain
generates lots of local symbols with names like .LNNN and .LCNNN which
are multiply defined and thus spoil symbolic backtraces.

I suspect the true fix is probably to force the parisc binutils to give
them empty names when it emits elf object, but until binutils does this,
the attached patch eliminates them from the kernel object and from
loaded objects.

The patch is fairly awful, particularly the messing with the contents of
a pointer to a constant area in module_finalize, but it does eliminate
the problem.

Would this be OK to people until binutils sorts out the problem for us?

James


--=-mFDCIPy6JwGD91p7aSFq
Content-Disposition: inline; filename=tmp1.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=tmp1.diff; charset=ISO-8859-1

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher=
.
# This patch includes the following deltas:
#	           ChangeSet	1.1466  -> 1.1467=20
#	arch/parisc/Makefile	1.20    -> 1.21  =20
#	arch/parisc/kernel/module.c	1.5     -> 1.6   =20
#	               (new)	        -> 1.1     arch/parisc/nm=20
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 03/06/27	jejb@raven.il.steeleye.com	1.1467
# Fix parisc local symbol problem with CONFIG_KALLSYMS
# --------------------------------------------
#
diff -Nru a/arch/parisc/Makefile b/arch/parisc/Makefile
--- a/arch/parisc/Makefile	Fri Jun 27 22:29:20 2003
+++ b/arch/parisc/Makefile	Fri Jun 27 22:29:20 2003
@@ -16,7 +16,7 @@
 # Modified for PA-RISC Linux by Paul Lahaie, Alex deVries,=20
 # Mike Shaver, Helge Deller and Martin K. Petersen
 #
-
+NM		=3D sh arch/parisc/nm
 ifdef CONFIG_PARISC64
 CROSS_COMPILE	:=3D hppa64-linux-
 UTS_MACHINE	:=3D parisc64
diff -Nru a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
--- a/arch/parisc/kernel/module.c	Fri Jun 27 22:29:20 2003
+++ b/arch/parisc/kernel/module.c	Fri Jun 27 22:29:20 2003
@@ -671,6 +671,11 @@
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
 {
+	int i;
+	unsigned long nsyms;
+	const char *strtab =3D NULL;
+	Elf_Sym *newptr, *oldptr;
+	Elf_Shdr *symhdr =3D NULL;
 #ifdef DEBUG
 	struct fdesc_entry *entry;
 	u32 *addr;
@@ -690,7 +695,49 @@
 	       me->arch.got_count, me->arch.got_max,
 	       me->arch.fdesc_count, me->arch.fdesc_max);
 #endif
-	=09
+
+	/* haven't filled in me->symtab yet, so have to find it
+	 * ourselves */
+	for (i =3D 1; i < hdr->e_shnum; i++) {
+		if(sechdrs[i].sh_type =3D=3D SHT_SYMTAB
+		   && (sechdrs[i].sh_type & SHF_ALLOC)) {
+			int strindex =3D sechdrs[i].sh_link;
+			/* FIXME: AWFUL HACK
+			 * The cast is to drop the const from
+			 * the sechdrs pointer */
+			symhdr =3D (Elf_Shdr *)&sechdrs[i];
+			strtab =3D (char *)sechdrs[strindex].sh_addr;
+			break;
+		}
+	}
+
+	printk("module %s: strtab %p, symhdr %p\n",
+	       me->name, strtab, symhdr);
+=09
+	/* no symbol table */
+	if(symhdr =3D=3D NULL)
+		return 0;
+
+	oldptr =3D (void *)symhdr->sh_addr;
+	newptr =3D oldptr + 1;	/* we start counting at 1 */
+	nsyms =3D symhdr->sh_size / sizeof(Elf_Sym);
+	printk("OLD num_symtab %lu\n", nsyms);
+
+	for (i =3D 1; i < nsyms; i++) {
+		oldptr++;	/* note, count starts at 1 so preincrement */
+		if(strncmp(strtab + oldptr->st_name,
+			      ".L", 2) =3D=3D 0)
+			continue;
+
+		if(newptr !=3D oldptr)
+			*newptr++ =3D *oldptr;
+		else
+			newptr++;
+
+	}
+	nsyms =3D newptr - (Elf_Sym *)symhdr->sh_addr;
+	printk("NEW num_symtab %lu\n", nsyms);
+	symhdr->sh_size =3D nsyms * sizeof(Elf_Sym);
 	return 0;
 }
=20
diff -Nru a/arch/parisc/nm b/arch/parisc/nm
--- /dev/null	Wed Dec 31 16:00:00 1969
+++ b/arch/parisc/nm	Fri Jun 27 22:29:20 2003
@@ -0,0 +1,6 @@
+#!/bin/sh
+##
+# Hack to have an nm which removes the local symbols.  We also rely
+# on this nm being hidden out of the ordinarily executable path
+##
+${CROSS_COMPILE}nm $* | grep -v '.LC*[0-9]*$'

--=-mFDCIPy6JwGD91p7aSFq--
