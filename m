Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8J16XI03967;
	Thu, 18 Sep 2003 21:06:33 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Cc: parisc-linux-cvs@lists.parisc-linux.org
In-Reply-To: <20030919010356.148684940A4@palinux.hppa>
References: <20030919010356.148684940A4@palinux.hppa>
Content-Type: text/plain
Date: 18 Sep 2003 20:06:32 -0500
Message-Id: <1063933596.2083.9.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
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

On Thu, 2003-09-18 at 20:03, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	03/09/18 19:03:56
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: module.c signal.c 
> 	include/asm-parisc: elf.h 
> 
> Log message:
> Clean up signal handling code:
> 
> - remove the less than helpful comments (and replace them with
> meaningful ones
> - get rid of the HACK macros
> - Unify the PLABEL function descriptor handling with modules.c

===== arch/parisc/kernel/module.c 1.8 vs edited =====
--- 1.8/arch/parisc/kernel/module.c	Wed Sep 10 00:44:18 2003
+++ edited/arch/parisc/kernel/module.c	Thu Sep 18 16:01:11 2003
@@ -73,10 +73,7 @@
 	Elf32_Addr addr;
 };
 
-struct fdesc_entry {
-	Elf32_Addr addr;
-	Elf32_Addr gp;
-};
+#define Elf_Fdesc	Elf32_Fdesc
 
 struct stub_entry {
 	Elf32_Word insns[2]; /* each stub entry has two insns */
@@ -86,11 +83,7 @@
 	Elf64_Addr addr;
 };
 
-struct fdesc_entry {
-	Elf64_Addr dummy[2];
-	Elf64_Addr addr;
-	Elf64_Addr gp;
-};
+#define Elf_Fdesc	Elf64_Fdesc
 
 struct stub_entry {
 	Elf64_Word insns[4]; /* each stub entry has four insns */
@@ -276,7 +269,7 @@
 
 	me->core_size = ALIGN(me->core_size, 16);
 	me->arch.fdesc_offset = me->core_size;
-	me->core_size += fdescs * sizeof(struct fdesc_entry);
+	me->core_size += fdescs * sizeof(Elf_Fdesc);
 
 	me->core_size = ALIGN(me->core_size, 16);
 	me->arch.stub_offset = me->core_size;
@@ -322,7 +315,7 @@
 #ifdef __LP64__
 static Elf_Addr get_fdesc(struct module *me, unsigned long value)
 {
-	struct fdesc_entry *fdesc = me->module_core + me->arch.fdesc_offset;
+	Elf_Fdesc *fdesc = me->module_core + me->arch.fdesc_offset;
 
 	if (!value) {
 		printk(KERN_ERR "%s: zero OPD requested!\n", me->name);
@@ -664,7 +657,7 @@
 				*loc64 = get_fdesc(me, val+addend);
 				DEBUGP("FDESC for %s at %p points to %lx\n",
 				       strtab + sym->st_name, *loc64,
-				       ((struct fdesc_entry *)*loc64)->addr);
+				       ((Elf_Fdesc *)*loc64)->addr);
 			} else {
 				/* if the symbol is not local to this
 				 * module then val+addend is a pointer
@@ -696,10 +689,10 @@
 	Elf_Sym *newptr, *oldptr;
 	Elf_Shdr *symhdr = NULL;
 #ifdef DEBUG
-	struct fdesc_entry *entry;
+	Elf_Fdesc *entry;
 	u32 *addr;
 
-	entry = (struct fdesc_entry *)me->init;
+	entry = (Elf_Fdesc *)me->init;
 	printk("FINALIZE, ->init FPTR is %p, GP %lx ADDR %lx\n", entry,
 	       entry->gp, entry->addr);
 	addr = (u32 *)entry->addr;
===== arch/parisc/kernel/signal.c 1.13 vs edited =====
--- 1.13/arch/parisc/kernel/signal.c	Wed Sep 10 00:44:19 2003
+++ edited/arch/parisc/kernel/signal.c	Thu Sep 18 17:49:36 2003
@@ -25,6 +25,7 @@
 #include <linux/unistd.h>
 #include <linux/stddef.h>
 #include <linux/compat.h>
+#include <linux/elf.h>
 #include <asm/ucontext.h>
 #include <asm/rt_sigframe.h>
 #include <asm/uaccess.h>
@@ -41,8 +42,11 @@
 
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
-/* Use this to get at 32-bit user passed pointers. 
- *    See sys_sparc32.c for description about these. */
+/* gcc will complain if a pointer is cast to an integer of different
+ * size.  If you really need to do this (and we do for an ELF32 user
+ * application in an ELF64 kernel) then you have to do a cast to an
+ * integer of the same size first.  The A() macro accomplishes
+ * this. */
 #define A(__x)	((unsigned long)(__x))
 
 int do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall);
@@ -271,7 +275,8 @@
 	       sigset_t *set, struct pt_regs *regs, int in_syscall)
 {
 	struct rt_sigframe *frame;
-	unsigned long rp, usp, haddr;
+	unsigned long rp, usp;
+	Elf32_Addr haddr;
 	struct siginfo si;
 	int err = 0;
 
@@ -308,64 +313,50 @@
 	}
 #endif
 
-#undef CACHE_FLUSHING_IS_NOT_BROKEN
-#ifdef CACHE_FLUSHING_IS_NOT_BROKEN
+	flush_user_dcache_range((unsigned long) &frame->tramp[0],
+			   (unsigned long) &frame->tramp[4]);
 	flush_user_icache_range((unsigned long) &frame->tramp[0],
 			   (unsigned long) &frame->tramp[4]);
-#else
-	/* It should *always* be cache line-aligned, but the compiler
-	sometimes screws up. */
-	asm volatile("fdc 0(%%sr3,%0)\n\t"
-		     "fdc %1(%%sr3,%0)\n\t"
-		     "sync\n\t"
-		     "fic 0(%%sr3,%0)\n\t"
-		     "fic %1(%%sr3,%0)\n\t"
-		     "sync\n\t"
-		      : : "r" (frame->tramp), "r" (L1_CACHE_BYTES));
-#endif
 
 	rp = (unsigned long) frame->tramp;
 
 	if (err)
 		goto give_sigsegv;
 
-/* Much more has to happen with signals than this -- but it'll at least */
-/* provide a pointer to some places which definitely need a look. */
-#define HACK u32
-
-	haddr = (HACK)A(ka->sa.sa_handler);
-	/* ARGH!  Fucking brain damage.  You don't want to know. */
-	if (haddr & 2) {
-		HACK *plabel;
-		HACK ltp;
-
-		plabel = (HACK *) (haddr & ~3);
-		err |= __get_user(haddr, plabel);
-		err |= __get_user(ltp, plabel + 1);
+	haddr = A(ka->sa.sa_handler);
+	/* The sa_handler may be a pointer to a function descriptor */
+	if (haddr & PA_PLABEL_FDESC) {
+		Elf32_Fdesc fdesc;
+		Elf32_Fdesc *ufdesc = (Elf32_Fdesc *)A(haddr & ~3);
+
+		err = __copy_from_user(&fdesc, ufdesc, sizeof(fdesc));
+
 		if (err)
 			goto give_sigsegv;
-		regs->gr[19] = ltp;
+
+		haddr = fdesc.addr;
+		regs->gr[19] = fdesc.gp;
 	}
 
 	/* The syscall return path will create IAOQ values from r31.
 	 */
 	if (in_syscall)
-		regs->gr[31] = (HACK) haddr;
+		regs->gr[31] = haddr;
 	else {
 		regs->gr[0] = USER_PSW;
-		regs->iaoq[0] = (HACK) haddr | 3;
+		regs->iaoq[0] = haddr | 3;
 		regs->iaoq[1] = regs->iaoq[0] + 4;
 	}
 
 	regs->gr[2]  = rp;                /* userland return pointer */
 	regs->gr[26] = sig;               /* signal number */
-	regs->gr[25] = (HACK)A(&frame->info); /* siginfo pointer */
-	regs->gr[24] = (HACK)A(&frame->uc);   /* ucontext pointer */
+	regs->gr[25] = A(&frame->info); /* siginfo pointer */
+	regs->gr[24] = A(&frame->uc);   /* ucontext pointer */
 	DBG(("making sigreturn frame: %#lx + %#x = %#lx\n",
 	       regs->gr[30], PARISC_RT_SIGFRAME_SIZE,
 	       regs->gr[30] + PARISC_RT_SIGFRAME_SIZE));
 	/* Raise the user stack pointer to make a proper call frame. */
-	regs->gr[30] = ((HACK)A(frame) + PARISC_RT_SIGFRAME_SIZE);
+	regs->gr[30] = (A(frame) + PARISC_RT_SIGFRAME_SIZE);
 
 	DBG(("SIG deliver (%s:%d): frame=0x%p sp=%#lx iaoq=%#lx/%#lx rp=%#lx\n",
 	       current->comm, current->pid, frame, regs->gr[30],
===== include/asm-parisc/elf.h 1.8 vs edited =====
--- 1.8/include/asm-parisc/elf.h	Wed Sep 10 00:44:23 2003
+++ edited/include/asm-parisc/elf.h	Thu Sep 18 16:07:25 2003
@@ -144,6 +144,30 @@
 #define R_PARISC_LTOFF_TP16DF	231	/* 16 bits LT-TP-rel. address.  */
 #define R_PARISC_HIRESERVE	255
 
+#define PA_PLABEL_FDESC		0x02	/* bit set if PLABEL points to
+					 * a function descriptor, not
+					 * an address */
+
+/* The following are PA function descriptors 
+ *
+ * addr:	the absolute address of the function
+ * gp:		either the data pointer (r27) for non-PIC code or the
+ *		the PLT pointer (r19) for PIC code */
+
+/* Format for the Elf32 Function descriptor */
+typedef struct elf32_fdesc {
+	__u32	addr;
+	__u32	gp;
+} Elf32_Fdesc;
+
+/* Format for the Elf64 Function descriptor */
+typedef struct elf64_fdesc {
+	__u64	dummy[2]; /* FIXME: nothing uses these, why waste
+			   * the space */
+	__u64	addr;
+	__u64	gp;
+} Elf64_Fdesc;
+
 /* Legal values for p_type field of Elf32_Phdr/Elf64_Phdr.  */
 
 #define PT_HP_TLS		(PT_LOOS + 0x0)
