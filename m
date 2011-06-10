From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH] parisc, exec: remove redundant set_fs(USER_DS)
Date: Fri, 10 Jun 2011 15:10:16 +0200
Message-ID: <1307711416-14119-1-git-send-email-minipli@googlemail.com>
References: <BANLkTinv1teZEHMK0qymaVdcxPOErpqSyg@mail.gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathias Krause <minipli@googlemail.com>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTinv1teZEHMK0qymaVdcxPOErpqSyg@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The address limit is already set in flush_old_exec() so those calls to
set_fs(USER_DS) are redundant.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/processor.h |    2 --
 arch/parisc/kernel/process.c        |    1 -
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 9ce66e9..7213ec9 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -196,7 +196,6 @@ typedef unsigned int elf_caddr_t;
 	/* offset pc for priv. level */			\
 	pc |= 3;					\
 							\
-	set_fs(USER_DS);				\
 	regs->iasq[0] = spaceid;			\
 	regs->iasq[1] = spaceid;			\
 	regs->iaoq[0] = pc;				\
@@ -299,7 +298,6 @@ on downward growing arches, it looks like this:
 	elf_addr_t pc = (elf_addr_t)new_pc | 3;		\
 	elf_caddr_t *argv = (elf_caddr_t *)bprm->exec + 1;	\
 							\
-	set_fs(USER_DS);				\
 	regs->iasq[0] = spaceid;			\
 	regs->iasq[1] = spaceid;			\
 	regs->iaoq[0] = pc;				\
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 4b4b918..62c60b8 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -192,7 +192,6 @@ void flush_thread(void)
 	/* Only needs to handle fpu stuff or perf monitors.
 	** REVISIT: several arches implement a "lazy fpu state".
 	*/
-	set_fs(USER_DS);
 }
 
 void release_thread(struct task_struct *dead_task)
-- 
1.5.6.5
