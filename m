From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 15/23] [PARISC] Add is_compat_task() helper
Date: Sun, 25 Jun 2006 19:34:43 -0400
Message-ID: <11512784931469-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

... And convert signal.c and ptrace.c to use it instead of open
coded equivalents.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/ptrace.c |    8 ++++----
 arch/parisc/kernel/signal.c |   20 ++++++++++----------
 include/asm-parisc/compat.h |   11 +++++++++++
 3 files changed, 25 insertions(+), 14 deletions(-)

d504011f391cc883c080decc1ba70d70b8a4a6ba
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 413292f..3f28de9 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -91,7 +91,7 @@ #endif
 		int copied;
 
 #ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+		if (__is_compat_task(child)) {
 			unsigned int tmp;
 
 			addr &= 0xffffffffL;
@@ -123,7 +123,7 @@ #endif
 	case PTRACE_POKEDATA:
 		ret = 0;
 #ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+		if (__is_compat_task(child)) {
 			unsigned int tmp = (unsigned int)data;
 			DBG("sys_ptrace(POKE%s, %d, %lx, %lx)\n",
 				request == PTRACE_POKETEXT ? "TEXT" : "DATA",
@@ -146,7 +146,7 @@ #endif
 	case PTRACE_PEEKUSR: {
 		ret = -EIO;
 #ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+		if (__is_compat_task(child)) {
 			unsigned int tmp;
 
 			if (addr & (sizeof(int)-1))
@@ -205,7 +205,7 @@ #endif
 			goto out_tsk;
 		}
 #ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+		if (__is_compat_task(child)) {
 			if (addr & (sizeof(int)-1))
 				goto out_tsk;
 			if ((addr = translate_usr_offset(addr)) < 0)
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index cc38edf..bb83880 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -76,7 +76,7 @@ sys_rt_sigsuspend(sigset_t __user *unews
 #ifdef __LP64__
 	compat_sigset_t newset32;
 
-	if(personality(current->personality) == PER_LINUX32){
+	if (is_compat_task()) {
 		/* XXX: Don't preclude handling different sized sigset_t's.  */
 		if (sigsetsize != sizeof(compat_sigset_t))
 			return -EINVAL;
@@ -153,7 +153,7 @@ #ifdef __LP64__
 	compat_sigset_t compat_set;
 	struct compat_rt_sigframe __user * compat_frame;
 	
-	if(personality(current->personality) == PER_LINUX32)
+	if (is_compat_task())
 		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
 #endif
 
@@ -166,7 +166,7 @@ #endif
 #ifdef __LP64__
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
-	if(personality(current->personality) == PER_LINUX32){
+	if (is_compat_task()) {
 		DBG(2,"sys_rt_sigreturn: ELF32 process.\n");
 		if (__copy_from_user(&compat_set, &compat_frame->uc.uc_sigmask, sizeof(compat_set)))
 			goto give_sigsegv;
@@ -186,7 +186,7 @@ #endif
 
 	/* Good thing we saved the old gr[30], eh? */
 #ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32){
+	if (is_compat_task()) {
 		DBG(1,"sys_rt_sigreturn: compat_frame->uc.uc_mcontext 0x%p\n",
 				&compat_frame->uc.uc_mcontext);
 // FIXME: Load upper half from register file
@@ -315,7 +315,7 @@ #ifdef __LP64__
 
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
-	if(personality(current->personality) == PER_LINUX32) {
+	if (is_compat_task()) {
 		DBG(1,"setup_rt_frame: frame->info = 0x%p\n", &compat_frame->info);
 		err |= copy_siginfo_to_user32(&compat_frame->info, info);
 		DBG(1,"SETUP_RT_FRAME: 1\n");
@@ -392,7 +392,7 @@ #endif
 	haddr = A(ka->sa.sa_handler);
 	/* The sa_handler may be a pointer to a function descriptor */
 #ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32) {
+	if (is_compat_task()) {
 #endif
 		if (haddr & PA_PLABEL_FDESC) {
 			Elf32_Fdesc fdesc;
@@ -427,19 +427,19 @@ #endif
 	 */
 	sigframe_size = PARISC_RT_SIGFRAME_SIZE;
 #ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32)
+	if (is_compat_task())
 		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
 #endif
 	if (in_syscall) {
 		regs->gr[31] = haddr;
 #ifdef __LP64__
-		if(personality(current->personality) == PER_LINUX)
+		if (personality(current->personality) == PER_LINUX)
 			sigframe_size |= 1;
 #endif
 	} else {
 		unsigned long psw = USER_PSW;
 #ifdef __LP64__
-		if(personality(current->personality) == PER_LINUX)
+		if (personality(current->personality) == PER_LINUX)
 			psw |= PSW_W;
 #endif
 
@@ -464,7 +464,7 @@ #endif
 	regs->gr[26] = sig;               /* signal number */
 	
 #ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32){
+	if (is_compat_task()) {
 		regs->gr[25] = A(&compat_frame->info); /* siginfo pointer */
 		regs->gr[24] = A(&compat_frame->uc);   /* ucontext pointer */
 	} else
diff --git a/include/asm-parisc/compat.h b/include/asm-parisc/compat.h
index 289624d..71b4eee 100644
--- a/include/asm-parisc/compat.h
+++ b/include/asm-parisc/compat.h
@@ -5,6 +5,7 @@ #define _ASM_PARISC_COMPAT_H
  */
 #include <linux/types.h>
 #include <linux/sched.h>
+#include <linux/personality.h>
 
 #define COMPAT_USER_HZ 100
 
@@ -149,4 +150,14 @@ static __inline__ void __user *compat_al
 	return (void __user *)regs->gr[30];
 }
 
+static inline int __is_compat_task(struct task_struct *t)
+{
+	return personality(t->personality) == PER_LINUX32;
+}
+
+static inline int is_compat_task(void)
+{
+	return __is_compat_task(current);
+}
+
 #endif /* _ASM_PARISC_COMPAT_H */
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
