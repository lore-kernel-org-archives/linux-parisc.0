Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (unknown [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 903D9482A
	for <parisc-linux@parisc-linux.org>; Sat, 12 Jul 2003 11:15:49 -0600 (MDT)
Received: from fuzzy-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h6CHFgI07593
	for <parisc-linux@parisc-linux.org>; Sat, 12 Jul 2003 13:15:42 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: parisc-linux@parisc-linux.org
Content-Type: multipart/mixed; boundary="=-Rs/BluSNFJbI4v6u+UK/"
Date: 12 Jul 2003 12:15:41 -0500
Message-Id: <1058030142.2314.23.camel@fuzzy>
Mime-Version: 1.0
Subject: [parisc-linux] [PATCH] fix arbitrary limits on stack size
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

--=-Rs/BluSNFJbI4v6u+UK/
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

One of the problems with the PA linux implementation is the upward
growing stack.  On most architectures, the virtual process space is
divided into


| unmapped | exec and heap |  mappings and stack |
                   TASK_UNMAPPED_BASE        TASK_SIZE


The mappings grow up from the start and the stack grows down from the
end of the area. If they ever meet, the process segfaults.

On palinux, we have an upward growing stack, so we have to size the
stack so when it reaches its ulimit, it hits the top of the area.  This
means that large stack limits cut into the mappable area (and also that
we have to impose a hard limit of 1GB on the stack size otherwise the
user could remove the ability to map processes entirely by setting the
stack limit too high).

The proposal to fix this is to start the stack growing upwards from
TASK_UNMAPPED_BASE and have the mappings grow downwards from TASK_SIZE. 
This should allow us to behave in exactly the same manner as x86 and not
have an arbitrary limit on the stack size.

The attached patch (against 2.5.70-pa1) does this, if you'd like to
comment on it or try it out.

James



--=-Rs/BluSNFJbI4v6u+UK/
Content-Disposition: inline; filename=tmp.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; NAME=tmp.diff; CHARSET=ISO-8859-1

=3D=3D=3D=3D=3D arch/parisc/kernel/sys_parisc.c 1.8 vs edited =3D=3D=3D=3D=
=3D
--- 1.8/arch/parisc/kernel/sys_parisc.c	Mon Mar 17 19:15:27 2003
+++ edited/arch/parisc/kernel/sys_parisc.c	Sat Jul 12 10:51:09 2003
@@ -26,22 +26,59 @@
 	return error;
 }
=20
+/* Routine to find unshared mappings.  If we cannot satisfy the
+ * address and length exactly, we start at the top of memory and check
+ * down.  Since the vm_area_struct is designed for a forward search,
+ * not a backward one, we cache the address of the lowest assigned
+ * mapping in current->mm->free_area_cache.
+ */
 static unsigned long get_unshared_area(unsigned long addr, unsigned long l=
en)
 {
 	struct vm_area_struct *vma;
+	struct vm_area_struct *prev_vma;
=20
-	if (!addr)
-		addr =3D TASK_UNMAPPED_BASE;
-	addr =3D PAGE_ALIGN(addr);
+	if (len > TASK_FREE_AREA_CACHE)
+		return -ENOMEM;
=20
-	for (vma =3D find_vma(current->mm, addr); ; vma =3D vma->vm_next) {
-		/* At this point:  (!vma || addr < vma->vm_end). */
-		if (TASK_SIZE - len < addr)
-			return -ENOMEM;
-		if (!vma || addr + len <=3D vma->vm_start)
+	/* quick check to see if we can satisfy the fixed address */
+	if (addr && (addr &=3D PAGE_MASK), TASK_SIZE - len <=3D addr) {
+		vma =3D find_vma_prev(current->mm, addr, &prev_vma);
+		if ((!vma || addr + len <=3D vma->vm_start)
+		    && (!prev_vma || addr >=3D prev_vma->vm_end)) {
+			printk("FIXED AREA MAP AT %lx-%lx\n",
+			       addr, addr+len);
 			return addr;
-		addr =3D vma->vm_end;
+		}
+	}
+
+	/* start from the lowest cached address */
+	addr =3D (current->mm->free_area_cache - len) & PAGE_MASK;
+=09
+	for(;;) {
+		if (addr < TASK_UNMAPPED_BASE)
+			goto err;
+
+		vma =3D find_vma_prev(current->mm, addr, &prev_vma);
+		=09
+
+		/* At this point:  (!vma || addr < vma->vm_end). */
+		if ((!vma || addr + len <=3D vma->vm_start)
+		    && (!prev_vma || addr >=3D prev_vma->vm_end))
+				goto found;
+
+		/* OK, go backwards one mapping and try again */
+		if(vma)
+			addr =3D (vma->vm_start - len) & PAGE_MASK;
+		else
+			addr =3D (prev_vma->vm_start - len) & PAGE_MASK;
+
 	}
+ found:
+	current->mm->free_area_cache =3D addr;
+	return addr;
+ err:
+	printk("RETURNING -ENOMEM\n");
+	return -ENOMEM;
 }
=20
 #define DCACHE_ALIGN(addr) (((addr) + (SHMLBA - 1)) &~ (SHMLBA - 1))
@@ -49,26 +86,50 @@
 static unsigned long get_shared_area(struct inode *inode, unsigned long ad=
dr,
 		unsigned long len, unsigned long pgoff)
 {
-	struct vm_area_struct *vma, *first_vma;
+	struct vm_area_struct *vma, *first_vma, *prev_vma;
 	int offset;
=20
 	first_vma =3D list_entry(inode->i_mapping->i_mmap_shared.next, struct vm_=
area_struct, shared);
 	offset =3D (first_vma->vm_start + ((pgoff - first_vma->vm_pgoff) << PAGE_=
SHIFT)) & (SHMLBA - 1);
=20
-	if (!addr)
-		addr =3D TASK_UNMAPPED_BASE;
+	if (addr && (addr =3D DCACHE_ALIGN(addr - offset) + offset),
+	    TASK_SIZE - len <=3D addr) {
+		vma =3D find_vma_prev(current->mm, addr, &prev_vma);
+		if ((!vma || addr + len <=3D vma->vm_start)
+		    && (!prev_vma || addr >=3D prev_vma->vm_end)) {
+			printk("SHARED FIXED AREA MAP AT %lx-%lx\n",
+			       addr, addr+len);
+			return addr;
+		}
+	}
+
+	addr =3D (current->mm->free_area_cache - len) & PAGE_MASK;
 	addr =3D DCACHE_ALIGN(addr - offset) + offset;
=20
-	for (vma =3D find_vma(current->mm, addr); ; vma =3D vma->vm_next) {
+	for(;;) {
+		if (addr < TASK_UNMAPPED_BASE)
+			goto err;
+
+		vma =3D find_vma_prev(current->mm, addr, &prev_vma);
+
 		/* At this point:  (!vma || addr < vma->vm_end). */
-		if (TASK_SIZE - len < addr)
-			return -ENOMEM;
-		if (!vma || addr + len <=3D vma->vm_start)
-			return addr;
-		addr =3D DCACHE_ALIGN(vma->vm_end - offset) + offset;
-		if (addr < vma->vm_end) /* handle wraparound */
-			return -ENOMEM;
+		if ((!vma || addr + len <=3D vma->vm_start)
+		    && (!prev_vma || addr >=3D prev_vma->vm_end))
+			goto found;
+
+		if(vma)
+			addr =3D (vma->vm_start - len) & PAGE_MASK;
+		else
+			addr =3D (prev_vma->vm_start - len) & PAGE_MASK;
+
+		addr =3D DCACHE_ALIGN(addr - offset) + offset;
 	}
+ found:
+	printk("SHARED RETURNING ADDR %lx\n", addr);
+	return addr;
+ err:
+	printk("SHARED RETURNING -ENOMEM\n");
+	return -ENOMEM;
 }
=20
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr=
,
=3D=3D=3D=3D=3D fs/binfmt_aout.c 1.16 vs edited =3D=3D=3D=3D=3D
--- 1.16/fs/binfmt_aout.c	Sat Feb 15 21:30:17 2003
+++ edited/fs/binfmt_aout.c	Fri Jul 11 18:17:28 2003
@@ -308,7 +308,7 @@
 		(current->mm->start_data =3D N_DATADDR(ex));
 	current->mm->brk =3D ex.a_bss +
 		(current->mm->start_brk =3D N_BSSADDR(ex));
-	current->mm->free_area_cache =3D TASK_UNMAPPED_BASE;
+	current->mm->free_area_cache =3D TASK_FREE_AREA_CACHE;
=20
 	current->mm->rss =3D 0;
 	current->mm->mmap =3D NULL;
=3D=3D=3D=3D=3D fs/binfmt_elf.c 1.49 vs edited =3D=3D=3D=3D=3D
--- 1.49/fs/binfmt_elf.c	Wed Jul  2 11:08:30 2003
+++ edited/fs/binfmt_elf.c	Fri Jul 11 18:17:15 2003
@@ -635,7 +635,7 @@
 	/* Do this so that we can load the interpreter, if need be.  We will
 	   change some of these later */
 	current->mm->rss =3D 0;
-	current->mm->free_area_cache =3D TASK_UNMAPPED_BASE;
+	current->mm->free_area_cache =3D TASK_FREE_AREA_CACHE;
 	retval =3D setup_arg_pages(bprm);
 	if (retval < 0) {
 		send_sig(SIGKILL, current, 0);
=3D=3D=3D=3D=3D fs/exec.c 1.92 vs edited =3D=3D=3D=3D=3D
--- 1.92/fs/exec.c	Thu Jul 10 10:56:33 2003
+++ edited/fs/exec.c	Fri Jul 11 20:30:50 2003
@@ -375,11 +375,8 @@
 	/* Adjust bprm->p to point to the end of the strings. */
 	bprm->p =3D PAGE_SIZE * i - offset;
=20
-	/* Limit stack size to 1GB */
-	stack_base =3D current->rlim[RLIMIT_STACK].rlim_max;
-	if (stack_base > (1 << 30))
-		stack_base =3D 1 << 30;
-	stack_base =3D PAGE_ALIGN(STACK_TOP - stack_base);
+
+	stack_base =3D PAGE_ALIGN(TASK_UNMAPPED_BASE);
=20
 	mm->arg_start =3D stack_base;
 	arg_size =3D i << PAGE_SHIFT;
=3D=3D=3D=3D=3D include/asm-parisc/processor.h 1.11 vs edited =3D=3D=3D=3D=
=3D
--- 1.11/include/asm-parisc/processor.h	Mon Jun 23 10:25:25 2003
+++ edited/include/asm-parisc/processor.h	Sat Jul 12 11:00:45 2003
@@ -41,6 +41,13 @@
 #define TASK_UNMAPPED_BASE      (current->thread.map_base)
 #define DEFAULT_MAP_BASE        (0x40000000UL)
=20
+/* This defines the start of the cached area for the downward growing
+ * maps.  NOTE: The elf interpreter seems to insist on having a fixed
+ * mapping address just above the text for its data and other
+ * allocations, so space must be left for that between this and the
+ * end of usable memory (TASK_SIZE) */
+#define TASK_FREE_AREA_CACHE	(TASK_SIZE-0x800000)
+
 #ifndef __ASSEMBLY__
=20
 /*
=3D=3D=3D=3D=3D include/linux/mm.h 1.124 vs edited =3D=3D=3D=3D=3D
--- 1.124/include/linux/mm.h	Sun Jul  6 15:23:51 2003
+++ edited/include/linux/mm.h	Sat Jul 12 11:11:39 2003
@@ -30,6 +30,14 @@
 #define MM_VM_SIZE(mm)	TASK_SIZE
 #endif
=20
+/* This defines the value current->mm->free_area_cache will be set to
+ * for every new process.  If you define your own
+ * arch_get_unmapped_area() you may override this in
+ * asm/processor.h */
+#ifndef TASK_FREE_AREA_CACHE
+#define TASK_FREE_AREA_CACHE	TASK_UNMAPPED_BASE
+#endif
+
 /*
  * Linux kernel virtual memory manager primitives.
  * The idea being to have a "virtual" mm in the same way
=3D=3D=3D=3D=3D kernel/fork.c 1.130 vs edited =3D=3D=3D=3D=3D
--- 1.130/kernel/fork.c	Sat Jul  5 01:52:49 2003
+++ edited/kernel/fork.c	Fri Jul 11 18:16:41 2003
@@ -262,7 +262,7 @@
 	mm->locked_vm =3D 0;
 	mm->mmap =3D NULL;
 	mm->mmap_cache =3D NULL;
-	mm->free_area_cache =3D TASK_UNMAPPED_BASE;
+	mm->free_area_cache =3D TASK_FREE_AREA_CACHE;
 	mm->map_count =3D 0;
 	mm->rss =3D 0;
 	mm->cpu_vm_mask =3D 0;
@@ -376,7 +376,7 @@
 	mm->page_table_lock =3D SPIN_LOCK_UNLOCKED;
 	mm->ioctx_list_lock =3D RW_LOCK_UNLOCKED;
 	mm->default_kioctx =3D (struct kioctx)INIT_KIOCTX(mm->default_kioctx, *mm=
);
-	mm->free_area_cache =3D TASK_UNMAPPED_BASE;
+	mm->free_area_cache =3D TASK_FREE_AREA_CACHE;
=20
 	if (likely(!mm_alloc_pgd(mm))) {
 		mm->def_flags =3D 0;

--=-Rs/BluSNFJbI4v6u+UK/--
