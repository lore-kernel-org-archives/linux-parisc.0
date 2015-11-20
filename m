From: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/9] parisc: Drop definition of start_thread_som for HP-UX SOM binaries
Date: Fri, 20 Nov 2015 22:38:35 +0100
Message-ID: <1448055522-11594-3-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The definition of start_thread_som was planned to be used to execute
HP-UX SOM binaries. Since HP-UX compatibility was dropped with kernel 4.0
there is no need to carry it further.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/processor.h | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 54adb60..7e759ec 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -192,33 +192,6 @@ void show_trace(struct task_struct *task, unsigned long *stack);
  */
 typedef unsigned int elf_caddr_t;
 
-#define start_thread_som(regs, new_pc, new_sp) do {	\
-	unsigned long *sp = (unsigned long *)new_sp;	\
-	__u32 spaceid = (__u32)current->mm->context;	\
-	unsigned long pc = (unsigned long)new_pc;	\
-	/* offset pc for priv. level */			\
-	pc |= 3;					\
-							\
-	regs->iasq[0] = spaceid;			\
-	regs->iasq[1] = spaceid;			\
-	regs->iaoq[0] = pc;				\
-	regs->iaoq[1] = pc + 4;                         \
-	regs->sr[2] = LINUX_GATEWAY_SPACE;              \
-	regs->sr[3] = 0xffff;				\
-	regs->sr[4] = spaceid;				\
-	regs->sr[5] = spaceid;				\
-	regs->sr[6] = spaceid;				\
-	regs->sr[7] = spaceid;				\
-	regs->gr[ 0] = USER_PSW;                        \
-	regs->gr[30] = ((new_sp)+63)&~63;		\
-	regs->gr[31] = pc;				\
-							\
-	get_user(regs->gr[26],&sp[0]);			\
-	get_user(regs->gr[25],&sp[-1]); 		\
-	get_user(regs->gr[24],&sp[-2]); 		\
-	get_user(regs->gr[23],&sp[-3]); 		\
-} while(0)
