Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6018D4881
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Aug 2003 13:24:49 -0600 (MDT)
Date: Sun, 17 Aug 2003 12:29:24 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030817192923.GO21328@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [RFC] change corefile OSABI to ELFOSABI_LINUX
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

Hi all,

Currently, on hppa-linux, gcc produces objects with the OSABI field set
to Linux. AFAIK, we are the only Linux architecture that does this,
everyone else uses ELFOSABI_NONE (i.e. "System V")

The Linux kernel, however, produces corefiles with OSABI=NONE (actually
it doesn't set it explicitly, so it defaults to 0, which is the SYSV
definition). The Debian gdb package has a patch in bfd that works around
this inconsistency.

Should we make the two consistent? Here's a patch that sets OSABI to
Linux for corefile generation. We will still need the bfd code for
backward compatibility, but moving forward it'll be good for things to
be more consistent :)

comments?
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/


Index: fs/binfmt_elf.c
===================================================================
RCS file: /var/cvs/linux-2.6/fs/binfmt_elf.c,v
retrieving revision 1.2
diff -u -p -r1.2 binfmt_elf.c
--- fs/binfmt_elf.c	29 Jul 2003 17:25:49 -0000	1.2
+++ fs/binfmt_elf.c	17 Aug 2003 19:19:16 -0000
@@ -1023,6 +1023,7 @@ static inline void fill_elf_header(struc
 	elf->e_ident[EI_CLASS] = ELF_CLASS;
 	elf->e_ident[EI_DATA] = ELF_DATA;
 	elf->e_ident[EI_VERSION] = EV_CURRENT;
+	elf->e_ident[EI_OSABI] = ELF_OSABI;
 	memset(elf->e_ident+EI_PAD, 0, EI_NIDENT-EI_PAD);
 
 	elf->e_type = ET_CORE;
Index: include/asm-parisc/elf.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/elf.h,v
retrieving revision 1.1
diff -u -p -r1.1 elf.h
--- include/asm-parisc/elf.h	29 Jul 2003 17:02:03 -0000	1.1
+++ include/asm-parisc/elf.h	17 Aug 2003 19:19:17 -0000
@@ -283,6 +283,7 @@ struct pt_regs;	/* forward declaration..
  */
 #define ELF_DATA	ELFDATA2MSB
 #define ELF_ARCH	EM_PARISC
+#define ELF_OSABI 	ELFOSABI_LINUX
 
 /* %r23 is set by ld.so to a pointer to a function which might be 
    registered using atexit.  This provides a mean for the dynamic
Index: include/linux/elf.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/elf.h,v
retrieving revision 1.1
diff -u -p -r1.1 elf.h
--- include/linux/elf.h	29 Jul 2003 17:02:11 -0000	1.1
+++ include/linux/elf.h	17 Aug 2003 19:19:19 -0000
@@ -360,7 +360,8 @@ typedef struct elf64_shdr {
 #define	EI_CLASS	4
 #define	EI_DATA		5
 #define	EI_VERSION	6
-#define	EI_PAD		7
+#define	EI_OSABI	7
+#define	EI_PAD		8
 
 #define	ELFMAG0		0x7f		/* EI_MAG */
 #define	ELFMAG1		'E'
@@ -381,6 +382,13 @@ typedef struct elf64_shdr {
 #define EV_NONE		0		/* e_version, EI_VERSION */
 #define EV_CURRENT	1
 #define EV_NUM		2
+
+#define ELFOSABI_NONE	0
+#define ELFOSABI_LINUX	3
+
+#ifndef ELF_OSABI
+#define ELF_OSABI ELFOSABI_NONE
+#endif
 
 /* Notes used in ET_CORE */
 #define NT_PRSTATUS	1
