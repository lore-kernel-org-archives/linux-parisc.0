From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fs/binfmt_som: Drop kernel support for HP-UX SOM binaries
Date: Tue, 17 Feb 2015 16:11:00 +0100
Message-ID: <20150217151100.GA3188@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-fsdevel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The parisc arch has been the only user of HP-UX SOM binaries.

Support for HP-UX executables was never finished and since we now drop support
for the HP-UX compat layer anyway, it does not makes sense to keep the
BINFMT_SOM support.

Cc: linux-fsdevel@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index c055d56..270c481 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -149,13 +149,6 @@ config BINFMT_EM86
 	  later load the module when you want to use a Linux/Intel binary. The
 	  module will be called binfmt_em86. If unsure, say Y.
 
-config BINFMT_SOM
-	tristate "Kernel support for SOM binaries"
-	depends on PARISC && HPUX
-	help
-	  SOM is a binary executable format inherited from HP/UX.  Say
-	  Y here to be able to load and execute SOM binaries directly.
-
 config BINFMT_MISC
 	tristate "Kernel support for MISC binaries"
 	---help---
diff --git a/fs/Makefile b/fs/Makefile
index bedff48..b7e0cfe 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -37,7 +37,6 @@ obj-$(CONFIG_BINFMT_SCRIPT)	+= binfmt_script.o
 obj-$(CONFIG_BINFMT_ELF)	+= binfmt_elf.o
 obj-$(CONFIG_COMPAT_BINFMT_ELF)	+= compat_binfmt_elf.o
 obj-$(CONFIG_BINFMT_ELF_FDPIC)	+= binfmt_elf_fdpic.o
-obj-$(CONFIG_BINFMT_SOM)	+= binfmt_som.o
 obj-$(CONFIG_BINFMT_FLAT)	+= binfmt_flat.o
 
 obj-$(CONFIG_FS_MBCACHE)	+= mbcache.o
diff --git a/fs/binfmt_som.c b/fs/binfmt_som.c
deleted file mode 100644
index 4e00ed6..0000000
--- a/fs/binfmt_som.c
+++ /dev/null
@@ -1,299 +0,0 @@
-/*
- * linux/fs/binfmt_som.c
- *
- * These are the functions used to load SOM format executables as used
- * by HP-UX.  
- *
- * Copyright 1999 Matthew Wilcox <willy@bofh.ai>
- * based on binfmt_elf which is
- * Copyright 1993, 1994: Eric Youngdale (ericy@cais.com).
- */
-
-#include <linux/module.h>
-
-#include <linux/fs.h>
-#include <linux/stat.h>
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/mman.h>
-#include <linux/errno.h>
-#include <linux/signal.h>
-#include <linux/binfmts.h>
-#include <linux/som.h>
-#include <linux/string.h>
-#include <linux/file.h>
-#include <linux/fcntl.h>
-#include <linux/ptrace.h>
-#include <linux/slab.h>
-#include <linux/shm.h>
-#include <linux/personality.h>
-#include <linux/init.h>
-
-#include <asm/uaccess.h>
-#include <asm/pgtable.h>
-
-
-#include <linux/elf.h>
-
-static int load_som_binary(struct linux_binprm * bprm);
-static int load_som_library(struct file *);
-
-/*
- * If we don't support core dumping, then supply a NULL so we
- * don't even try.
- */
-#if 0
-static int som_core_dump(struct coredump_params *cprm);
-#else
-#define som_core_dump	NULL
-#endif
-
-#define SOM_PAGESTART(_v) ((_v) & ~(unsigned long)(SOM_PAGESIZE-1))
-#define SOM_PAGEOFFSET(_v) ((_v) & (SOM_PAGESIZE-1))
-#define SOM_PAGEALIGN(_v) (((_v) + SOM_PAGESIZE - 1) & ~(SOM_PAGESIZE - 1))
-
-static struct linux_binfmt som_format = {
-	.module		= THIS_MODULE,
-	.load_binary	= load_som_binary,
-	.load_shlib	= load_som_library,
-	.core_dump	= som_core_dump,
-	.min_coredump	= SOM_PAGESIZE
-};
-
-/*
- * create_som_tables() parses the env- and arg-strings in new user
- * memory and creates the pointer tables from them, and puts their
- * addresses on the "stack", returning the new stack pointer value.
- */
-static void create_som_tables(struct linux_binprm *bprm)
-{
-	char **argv, **envp;
-	int argc = bprm->argc;
-	int envc = bprm->envc;
-	unsigned long p;
-	unsigned long *sp;
-
-	/* Word-align the stack pointer */
-	sp = (unsigned long *)((bprm->p + 3) & ~3);
-
-	envp = (char **) sp;
-	sp += envc + 1;
-	argv = (char **) sp;
-	sp += argc + 1;
-
-	__put_user((unsigned long) envp,++sp);
-	__put_user((unsigned long) argv,++sp);
-
-	__put_user(argc, ++sp);
-
-	bprm->p = (unsigned long) sp;
-
-	p = current->mm->arg_start;
-	while (argc-- > 0) {
-		__put_user((char *)p,argv++);
-		p += strlen_user((char *)p);
-	}
-	__put_user(NULL, argv);
-	current->mm->arg_end = current->mm->env_start = p;
-	while (envc-- > 0) {
-		__put_user((char *)p,envp++);
-		p += strlen_user((char *)p);
-	}
-	__put_user(NULL, envp);
-	current->mm->env_end = p;
-}
-
-static int check_som_header(struct som_hdr *som_ex)
-{
-	int *buf = (int *)som_ex;
-	int i, ck;
-
-	if (som_ex->system_id != SOM_SID_PARISC_1_0 &&
-	    som_ex->system_id != SOM_SID_PARISC_1_1 &&
-	    som_ex->system_id != SOM_SID_PARISC_2_0)
-		return -ENOEXEC;
-
-	if (som_ex->a_magic != SOM_EXEC_NONSHARE &&
-	    som_ex->a_magic != SOM_EXEC_SHARE &&
-	    som_ex->a_magic != SOM_EXEC_DEMAND)
-		return -ENOEXEC;
-
-	if (som_ex->version_id != SOM_ID_OLD &&
-	    som_ex->version_id != SOM_ID_NEW)
-		return -ENOEXEC;
-
-	ck = 0;
-	for (i=0; i<32; i++)
-		ck ^= buf[i];
-	if (ck != 0)
-		return -ENOEXEC;
-
-	return 0;
-}
-
-static int map_som_binary(struct file *file,
-		const struct som_exec_auxhdr *hpuxhdr)
-{
-	unsigned long code_start, code_size, data_start, data_size;
-	unsigned long bss_start, som_brk;
-	int retval;
-	int prot = PROT_READ | PROT_EXEC;
-	int flags = MAP_FIXED|MAP_PRIVATE|MAP_DENYWRITE|MAP_EXECUTABLE;
-
-	mm_segment_t old_fs = get_fs();
-	set_fs(get_ds());
-
-	code_start = SOM_PAGESTART(hpuxhdr->exec_tmem);
-	code_size = SOM_PAGEALIGN(hpuxhdr->exec_tsize);
-	current->mm->start_code = code_start;
-	current->mm->end_code = code_start + code_size;
-	retval = vm_mmap(file, code_start, code_size, prot,
-			flags, SOM_PAGESTART(hpuxhdr->exec_tfile));
-	if (retval < 0 && retval > -1024)
-		goto out;
-
-	data_start = SOM_PAGESTART(hpuxhdr->exec_dmem);
-	data_size = SOM_PAGEALIGN(hpuxhdr->exec_dsize);
-	current->mm->start_data = data_start;
-	current->mm->end_data = bss_start = data_start + data_size;
-	retval = vm_mmap(file, data_start, data_size,
-			prot | PROT_WRITE, flags,
-			SOM_PAGESTART(hpuxhdr->exec_dfile));
-	if (retval < 0 && retval > -1024)
-		goto out;
-
-	som_brk = bss_start + SOM_PAGEALIGN(hpuxhdr->exec_bsize);
-	current->mm->start_brk = current->mm->brk = som_brk;
-	retval = vm_mmap(NULL, bss_start, som_brk - bss_start,
-			prot | PROT_WRITE, MAP_FIXED | MAP_PRIVATE, 0);
-	if (retval > 0 || retval < -1024)
-		retval = 0;
-out:
-	set_fs(old_fs);
-	return retval;
-}
-
-
-/*
- * These are the functions used to load SOM executables and shared
- * libraries.  There is no binary dependent code anywhere else.
- */
-
-static int
-load_som_binary(struct linux_binprm * bprm)
-{
-	int retval;
-	unsigned int size;
-	unsigned long som_entry;
-	struct som_hdr *som_ex;
-	struct som_exec_auxhdr *hpuxhdr;
-	struct pt_regs *regs = current_pt_regs();
-
-	/* Get the exec-header */
-	som_ex = (struct som_hdr *) bprm->buf;
-
-	retval = check_som_header(som_ex);
-	if (retval != 0)
-		goto out;
-
-	/* Now read in the auxiliary header information */
-
-	retval = -ENOMEM;
-	size = som_ex->aux_header_size;
-	if (size > SOM_PAGESIZE)
-		goto out;
-	hpuxhdr = kmalloc(size, GFP_KERNEL);
-	if (!hpuxhdr)
-		goto out;
-
-	retval = kernel_read(bprm->file, som_ex->aux_header_location,
-			(char *) hpuxhdr, size);
-	if (retval != size) {
-		if (retval >= 0)
-			retval = -EIO;
-		goto out_free;
-	}
-
-	/* Flush all traces of the currently running executable */
-	retval = flush_old_exec(bprm);
-	if (retval)
-		goto out_free;
-
-	/* OK, This is the point of no return */
-	current->personality = PER_HPUX;
-	setup_new_exec(bprm);
-
-	/* Set the task size for HP-UX processes such that
-	 * the gateway page is outside the address space.
-	 * This can be fixed later, but for now, this is much
-	 * easier.
-	 */
-
-	current->thread.task_size = 0xc0000000;
-
-	/* Set map base to allow enough room for hp-ux heap growth */
-
-	current->thread.map_base = 0x80000000;
-
-	retval = map_som_binary(bprm->file, hpuxhdr);
-	if (retval < 0)
-		goto out_free;
-
-	som_entry = hpuxhdr->exec_entry;
-	kfree(hpuxhdr);
-
-	set_binfmt(&som_format);
-	install_exec_creds(bprm);
-	setup_arg_pages(bprm, STACK_TOP, EXSTACK_DEFAULT);
-
-	create_som_tables(bprm);
-
-	current->mm->start_stack = bprm->p;
-
-#if 0
-	printk("(start_brk) %08lx\n" , (unsigned long) current->mm->start_brk);
-	printk("(end_code) %08lx\n" , (unsigned long) current->mm->end_code);
-	printk("(start_code) %08lx\n" , (unsigned long) current->mm->start_code);
-	printk("(end_data) %08lx\n" , (unsigned long) current->mm->end_data);
-	printk("(start_stack) %08lx\n" , (unsigned long) current->mm->start_stack);
-	printk("(brk) %08lx\n" , (unsigned long) current->mm->brk);
-#endif
-
-	map_hpux_gateway_page(current,current->mm);
-
-	start_thread_som(regs, som_entry, bprm->p);
-	return 0;
-
-	/* error cleanup */
-out_free:
-	kfree(hpuxhdr);
-out:
-	return retval;
-}
-
-static int load_som_library(struct file *f)
-{
-/* No lib support in SOM yet.  gizza chance.. */
-	return -ENOEXEC;
-}
-	/* Install the SOM loader.
-	 * N.B. We *rely* on the table being the right size with the
-	 * right number of free slots...
-	 */
-
-static int __init init_som_binfmt(void)
-{
-	register_binfmt(&som_format);
-	return 0;
-}
-
-static void __exit exit_som_binfmt(void)
-{
-	/* Remove the SOM loader. */
-	unregister_binfmt(&som_format);
-}
-
-core_initcall(init_som_binfmt);
-module_exit(exit_som_binfmt);
-
-MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/som.h b/include/uapi/linux/som.h
deleted file mode 100644
index 166594e..0000000
--- a/include/uapi/linux/som.h
+++ /dev/null
@@ -1,154 +0,0 @@
-#ifndef _LINUX_SOM_H
-#define _LINUX_SOM_H
-
-/* File format definition for SOM executables / shared libraries */
-
-/* we need struct timespec */
-#include <linux/time.h>
-
-#define SOM_PAGESIZE 4096
-
-/* this is the SOM header */
-struct som_hdr {
-	short		system_id;		/* magic number - system */
-	short		a_magic;		/* magic number - file type */
-	unsigned int	version_id;		/* versiod ID: YYMMDDHH */
-	struct timespec	file_time;		/* system clock */
-	unsigned int	entry_space;		/* space for entry point */
-	unsigned int	entry_subspace;		/* subspace for entry point */
-	unsigned int	entry_offset;		/* offset of entry point */
-	unsigned int	aux_header_location;	/* auxiliary header location */
-	unsigned int	aux_header_size;	/* auxiliary header size */
-	unsigned int	som_length;		/* length of entire SOM */
-	unsigned int	presumed_dp;		/* compiler's DP value */
-	unsigned int	space_location;		/* space dictionary location */
-	unsigned int	space_total;		/* number of space entries */
-	unsigned int	subspace_location;	/* subspace entries location */
-	unsigned int	subspace_total;		/* number of subspace entries */
-	unsigned int	loader_fixup_location;	/* MPE/iX loader fixup */
-	unsigned int	loader_fixup_total;	/* number of fixup records */
-	unsigned int	space_strings_location;	/* (sub)space names */
-	unsigned int	space_strings_size;	/* size of strings area */
-	unsigned int	init_array_location;	/* reserved */
-	unsigned int	init_array_total;	/* reserved */
-	unsigned int	compiler_location;	/* module dictionary */
-	unsigned int	compiler_total;		/* number of modules */
-	unsigned int	symbol_location;	/* symbol dictionary */
-	unsigned int	symbol_total;		/* number of symbols */
-	unsigned int	fixup_request_location;	/* fixup requests */
-	unsigned int	fixup_request_total;	/* number of fixup requests */
-	unsigned int	symbol_strings_location;/* module & symbol names area */
-	unsigned int	symbol_strings_size;	/* size of strings area */
-	unsigned int	unloadable_sp_location;	/* unloadable spaces location */
-	unsigned int	unloadable_sp_size;	/* size of data */
-	unsigned int	checksum;
-};
-
-/* values for system_id */
-
-#define SOM_SID_PARISC_1_0	0x020b
-#define SOM_SID_PARISC_1_1	0x0210
-#define SOM_SID_PARISC_2_0	0x0214
-
-/* values for a_magic */
-
-#define SOM_LIB_EXEC		0x0104
-#define SOM_RELOCATABLE		0x0106
-#define SOM_EXEC_NONSHARE	0x0107
-#define SOM_EXEC_SHARE		0x0108
-#define SOM_EXEC_DEMAND		0x010B
-#define SOM_LIB_DYN		0x010D
-#define SOM_LIB_SHARE		0x010E
-#define SOM_LIB_RELOC		0x0619
-
-/* values for version_id.  Decimal not hex, yes.  Grr. */
-
-#define SOM_ID_OLD		85082112
-#define SOM_ID_NEW		87102412
-
-struct aux_id {
-	unsigned int	mandatory :1;	/* the linker must understand this */
-	unsigned int	copy	  :1;	/* Must be copied by the linker */
-	unsigned int	append	  :1;	/* Must be merged by the linker */
-	unsigned int	ignore	  :1;	/* Discard section if unknown */
-	unsigned int	reserved  :12;
-	unsigned int	type	  :16;	/* Header type */
-	unsigned int	length;		/* length of _following_ data */
-};
-
-/* The Exec Auxiliary Header.  Called The HP-UX Header within HP apparently. */
-struct som_exec_auxhdr {
-	struct aux_id	som_auxhdr;
-	int		exec_tsize;	/* Text size in bytes */
-	int		exec_tmem;	/* Address to load text at */
-	int		exec_tfile;	/* Location of text in file */
-	int		exec_dsize;	/* Data size in bytes */
-	int		exec_dmem;	/* Address to load data at */
-	int		exec_dfile;	/* Location of data in file */
-	int		exec_bsize;	/* Uninitialised data (bss) */
-	int		exec_entry;	/* Address to start executing */
-	int		exec_flags;	/* loader flags */
-	int		exec_bfill;	/* initialisation value for bss */
-};
-
-/* Oh, the things people do to avoid casts.  Shame it'll break with gcc's
- * new aliasing rules really.
- */
-union name_pt {
-	char *		n_name;
-	unsigned int	n_strx;
-};
-
-/* The Space Dictionary */
-struct space_dictionary_record {
-	union name_pt	name;			/* index to subspace name */
-	unsigned int	is_loadable	:1;	/* loadable */
-	unsigned int	is_defined	:1;	/* defined within file */
-	unsigned int	is_private	:1;	/* not sharable */
-	unsigned int	has_intermediate_code :1; /* contains intermediate code */
-	unsigned int	is_tspecific	:1;	/* thread specific */
-	unsigned int	reserved	:11;	/* for future expansion */
-	unsigned int	sort_key	:8;	/* for linker */
-	unsigned int	reserved2	:8;	/* for future expansion */
-
-	int		space_number;		/* index */
-	int		subspace_index;		/* index into subspace dict */
-	unsigned int	subspace_quantity;	/* number of subspaces */
-	int		loader_fix_index;	/* for loader */
-	unsigned int	loader_fix_quantity;	/* for loader */
-	int		init_pointer_index;	/* data pointer array index */
-	unsigned int	init_pointer_quantity;	/* number of data pointers */
-};
-
-/* The Subspace Dictionary */
-struct subspace_dictionary_record {
-	int		space_index;
-	unsigned int	access_control_bits :7;
-	unsigned int	memory_resident	:1;
-	unsigned int	dup_common	:1;
-	unsigned int	is_common	:1;
-	unsigned int	quadrant	:2;
-	unsigned int	initially_frozen :1;
-	unsigned int	is_first	:1;
-	unsigned int	code_only	:1;
-	unsigned int	sort_key	:8;
-	unsigned int	replicate_init	:1;
-	unsigned int	continuation	:1;
-	unsigned int	is_tspecific	:1;
-	unsigned int	is_comdat	:1;
-	unsigned int	reserved	:4;
-
-	int		file_loc_init_value;
-	unsigned int	initialization_length;
-	unsigned int	subspace_start;
-	unsigned int	subspace_length;
-
-	unsigned int	reserved2	:5;
-	unsigned int	alignment	:27;
-
-	union name_pt	name;
-	int		fixup_request_index;
-	unsigned int	fixup_request_quantity;
-};
