From: akpm@linux-foundation.org
Subject: [patch 1/1] parisc, exec: remove redundant set_fs(USER_DS)
Date: Tue, 15 Nov 2011 14:57:13 -0800
Message-ID: <201111152257.pAFMvDOL018292@wpaz9.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ASCII
Cc: deller@gmx.de, jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
	akpm@linux-foundation.org, minipli@googlemail.com
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Mathias Krause <minipli@googlemail.com>
Subject: parisc, exec: remove redundant set_fs(USER_DS)

The address limit is already set in flush_old_exec() so those calls to
set_fs(USER_DS) are redundant.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/parisc/include/asm/processor.h |    2 --
 arch/parisc/kernel/process.c        |    1 -
 2 files changed, 3 deletions(-)

diff -puN arch/parisc/include/asm/processor.h~parisc-exec-remove-redundant-set_fsuser_ds arch/parisc/include/asm/processor.h
--- a/arch/parisc/include/asm/processor.h~parisc-exec-remove-redundant-set_fsuser_ds
+++ a/arch/parisc/include/asm/processor.h
@@ -196,7 +196,6 @@ typedef unsigned int elf_caddr_t;
 	/* offset pc for priv. level */			\
 	pc |= 3;					\
 							\
-	set_fs(USER_DS);				\
 	regs->iasq[0] = spaceid;			\
 	regs->iasq[1] = spaceid;			\
 	regs->iaoq[0] = pc;				\
@@ -299,7 +298,6 @@ on downward growing arches, it looks lik
 	elf_addr_t pc = (elf_addr_t)new_pc | 3;		\
 	elf_caddr_t *argv = (elf_caddr_t *)bprm->exec + 1;	\
 							\
-	set_fs(USER_DS);				\
 	regs->iasq[0] = spaceid;			\
 	regs->iasq[1] = spaceid;			\
 	regs->iaoq[0] = pc;				\
diff -puN arch/parisc/kernel/process.c~parisc-exec-remove-redundant-set_fsuser_ds arch/parisc/kernel/process.c
--- a/arch/parisc/kernel/process.c~parisc-exec-remove-redundant-set_fsuser_ds
+++ a/arch/parisc/kernel/process.c
@@ -192,7 +192,6 @@ void flush_thread(void)
 	/* Only needs to handle fpu stuff or perf monitors.
 	** REVISIT: several arches implement a "lazy fpu state".
 	*/
-	set_fs(USER_DS);
 }
 
 void release_thread(struct task_struct *dead_task)
_
