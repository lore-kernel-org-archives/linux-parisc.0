Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id AFF49482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Aug 2001 10:46:53 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7D45FB00C; Fri, 10 Aug 2001 17:47:51 +0100 (BST)
Date: Fri, 10 Aug 2001 17:47:51 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010810174751.G23676@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ldd under 2.4.7 kernel
List-ID: <linux-parisc.vger.kernel.org>

ldd doesn't work under a 2.4.7 kernel; Willy is working on the proper
fix, but I thought it useful to post my work-around, as I'm about to take
two weeks holiday.

Richard


Index: fs/binfmt_elf.c
===================================================================
RCS file: /home/cvs/parisc/linux/fs/binfmt_elf.c,v
retrieving revision 1.20
diff -u -r1.20 binfmt_elf.c
--- binfmt_elf.c	2001/08/01 15:26:52	1.20
+++ binfmt_elf.c	2001/08/10 16:41:56
@@ -9,6 +9,8 @@
  * Copyright 1993, 1994: Eric Youngdale (ericy@cais.com).
  */
 
+#define RGH_FIX
+
 #include <linux/module.h>
 
 #include <linux/fs.h>
@@ -153,6 +155,10 @@
 	 */
 	ARCH_DLINFO;
 #endif
+#ifdef RGH_FIX
+	if (exec)
+#endif
+	{
 	NEW_AUX_ENT(AT_PHDR, load_addr + exec->e_phoff);
 	NEW_AUX_ENT(AT_PHENT, sizeof (struct elf_phdr));
 	NEW_AUX_ENT(AT_PHNUM, exec->e_phnum);
@@ -163,6 +169,7 @@
 	NEW_AUX_ENT(AT_EUID, current->euid);
 	NEW_AUX_ENT(AT_GID, current->gid);
 	NEW_AUX_ENT(AT_EGID, current->egid);
+	}
 	NEW_AUX_ENT(AT_HWCAP, ELF_HWCAP);
 	NEW_AUX_ENT(AT_PAGESZ, ELF_EXEC_PAGESIZE);
 	NEW_AUX_ENT(AT_CLKTCK, CLOCKS_PER_SEC);
@@ -714,8 +721,14 @@
 
 	compute_creds(bprm);
 	current->flags &= ~PF_FORKNOEXEC;
+#ifdef RGH_FIX
+	create_elf_tables(bprm, (interpreter_type == INTERPRETER_ELF ? &elf_ex : NULL),
+			(interpreter_type == INTERPRETER_AOUT),
+			load_addr, interp_load_addr);
+#else
 	create_elf_tables(bprm, &elf_ex, (interpreter_type == INTERPRETER_AOUT),
 			load_addr, interp_load_addr);
+#endif
 	/* N.B. passed_fileno might not be initialized? */
 	if (interpreter_type == INTERPRETER_AOUT)
 		current->mm->arg_start += strlen(passed_fileno) + 1;
