Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020707064247.2263C4870@dsl2.external.hp.com>
Date: Sun,  7 Jul 2002 00:42:47 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] show_stack() rewrite
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

Based on questions from Carlos, I've rewritten (but not tested)
the show_stack() function that dumps stack and registers.
Since, I'd really like to focus on sba_iommu, tg3, and eventually
cpqfc, could someone else review and/or test this?

Basically, I've ditched all the non-functional Interrupt Stack support
that was confusing most of us. Sorry, jsm, I don't know how to make
the interrupt stack work though I agree it's a good feature.

diff is also available from
	ftp://ftp.parisc-linux.org/patches/diff.show_stack

thanks,
grant

Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/traps.c,v
retrieving revision 1.63
diff -u -p -r1.63 traps.c
--- arch/parisc/kernel/traps.c	2002/04/13 22:12:27	1.63
+++ arch/parisc/kernel/traps.c	2002/07/07 06:29:09
@@ -146,56 +146,17 @@ static void dump_stack(unsigned long fro
 
 void show_stack(struct pt_regs *regs)
 {
-#if 1
 	/* If regs->sr[7] == 0, we are on a kernel stack */
 	if (regs->sr[7] == 0) {
-
 		unsigned long sp = regs->gr[30];
-		unsigned long cr30;
-		unsigned long cr31;
-		unsigned long stack_start;
-		struct pt_regs *int_regs;
-
-		cr30 = mfctl(30);
-		cr31 = mfctl(31);
-		stack_start = sp & ~(ISTACK_SIZE - 1);
-		if (stack_start == cr31) {
-		    /*
-		     * We are on the interrupt stack, get the stack
-		     * pointer from the first pt_regs structure on
-		     * the interrupt stack, so we can dump the task
-		     * stack first.
-		     */
-
-		    int_regs = (struct pt_regs *)cr31;
-		    sp = int_regs->gr[30];
-		    stack_start = sp & ~(INIT_TASK_SIZE - 1);
-		    if (stack_start != cr30) {
-			printk(KERN_CRIT "WARNING! Interrupt-Stack pointer and cr30 do not correspond!\n");
-			printk(KERN_CRIT "Dumping virtual address stack instead\n");
-			dump_stack((unsigned long)__va(stack_start), (unsigned long)__va(sp), 0);
-		    } else {
-			dump_stack(stack_start, sp, 0);
-		    };
-
-		    printk("\n\n" KERN_DEBUG "Registers at Interrupt:\n");
-		    show_regs(int_regs);
+		unsigned long stack_start = sp & ~(INIT_TASK_SIZE - 1);
 
-		    /* Now dump the interrupt stack */
+		printk("\n\n" KERN_DEBUG "Kernel Stack:\n");
+		dump_stack((unsigned long)__va(stack_start), (unsigned long)__va(sp), 0);
 
-		    sp = regs->gr[30];
-		    stack_start = sp & ~(ISTACK_SIZE - 1);
-		    dump_stack(stack_start,sp,1);
-		}
-		else
-		{
-		    /* Stack Dump! */
-		    printk(KERN_CRIT "WARNING! Stack pointer and cr30 do not correspond!\n");
-		    printk(KERN_CRIT "Dumping virtual address stack instead\n");
-		    dump_stack((unsigned long)__va(stack_start), (unsigned long)__va(sp), 0);
-		}
+		printk("\n\n" KERN_DEBUG "Kernel Registers:\n");
+		show_regs(regs);
 	}
-#endif
 }
 
 
