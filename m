From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] linux signal race fixes, patches against hppa tree,
	please test.
Date: Fri, 27 Aug 2004 14:26:26 -0400
Message-ID: <20040827182626.GH25975@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
 James Bottomley <James.Bottomley@steeleye.com>,
 Matthew Wilcox <willy@debian.org>,
 Randolph Chung <tausq@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


jda,

This is more important for you, approximately 48 hours ago, Linus
commited a fix for a signal handling race.

http://linux.bkbits.net:8080/linux-2.6/cset@1.1846.1.48?nav=index.html|ChangeSet@-2d

That is the changeset, and included is a patch against our CVS head 
that fixes the race condition.

It could force a thread not to restart or crash, or do all sorts of
things. It may be the bug you are seeing.

Please test it out and see if it makes the builds more stable. It could
be the reason for random sigsegvs with expect/tcl.

The patch fixes our arch code so we *never* have a k_sigaction that
wasn't copied without a lock held.

The new code passes around a pointer to an arch allocated k_sigaction
and copies it with the lock held so it can't be changed between 'check'
and 'delivery.'

c.

Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
retrieving revision 1.17
diff -u -p -r1.17 signal.c
--- arch/parisc/kernel/signal.c	31 Mar 2004 07:03:13 -0000	1.17
+++ arch/parisc/kernel/signal.c	27 Aug 2004 18:17:53 -0000
@@ -494,11 +494,9 @@ give_sigsegv:
  */	
 
 static long
-handle_signal(unsigned long sig, siginfo_t *info, sigset_t *oldset,
-	      struct pt_regs *regs, int in_syscall)
+handle_signal(unsigned long sig, siginfo_t *info, struct k_sigaction *ka,
+		sigset_t *oldset, struct pt_regs *regs, int in_syscall)
 {
-	struct k_sigaction *ka = &current->sighand->action[sig-1];
-
 	DBG(1,"handle_signal: sig=%ld, ka=%p, info=%p, oldset=%p, regs=%p\n",
 	       sig, ka, info, oldset, regs);
 	
@@ -506,9 +504,6 @@ handle_signal(unsigned long sig, siginfo
 	if (!setup_rt_frame(sig, ka, info, oldset, regs, in_syscall))
 		return 0;
 
-	if (ka->sa.sa_flags & SA_ONESHOT)
-		ka->sa.sa_handler = SIG_DFL;
-
 	if (!(ka->sa.sa_flags & SA_NODEFER)) {
 		spin_lock_irq(&current->sighand->siglock);
 		sigorsets(&current->blocked,&current->blocked,&ka->sa.sa_mask);
@@ -535,7 +530,7 @@ asmlinkage int
 do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall)
 {
 	siginfo_t info;
-	struct k_sigaction *ka;
+	struct k_sigaction ka;
 	int signr;
 
 	DBG(1,"\ndo_signal: oldset=0x%p, regs=0x%p, sr7 %#lx, in_syscall=%d\n",
@@ -553,10 +548,15 @@ do_signal(sigset_t *oldset, struct pt_re
 		oldset->sig[0], oldset->sig[1]);
 
 
-	signr = get_signal_to_deliver(&info, regs, NULL);
-	DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
+	/* May need to force signal if handle_signal failed to deliver */
+	while (1) {
+	  
+		signr = get_signal_to_deliver(&info, &ka, regs, NULL);
+		DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
 	
-	if (signr > 0) {
+		if (signr <= 0)
+		  break;
+		
 		/* Restart a system call if necessary. */
 		if (in_syscall) {
 			/* Check the return code */
@@ -569,8 +569,7 @@ do_signal(sigset_t *oldset, struct pt_re
 				break;
 
 			case -ERESTARTSYS:
-				ka = &current->sighand->action[signr-1];
-				if (!(ka->sa.sa_flags & SA_RESTART)) {
+				if (!(ka.sa.sa_flags & SA_RESTART)) {
 					DBG(1,"ERESTARTSYS: putting -EINTR\n");
 					regs->gr[28] = -EINTR;
 					break;
@@ -578,8 +577,7 @@ do_signal(sigset_t *oldset, struct pt_re
 			/* fallthrough */
 			case -ERESTARTNOINTR:
 				/* A syscall is just a branch, so all
-                                   we have to do is fiddle the return
-                                   pointer. */
+				   we have to do is fiddle the return pointer. */
 				regs->gr[31] -= 8; /* delayed branching */
 				/* Preserve original r28. */
 				regs->gr[28] = regs->orig_r28;
@@ -589,12 +587,13 @@ do_signal(sigset_t *oldset, struct pt_re
 		/* Whee!  Actually deliver the signal.  If the
 		   delivery failed, we need to continue to iterate in
 		   this loop so we can deliver the SIGSEGV... */
-		if (handle_signal(signr, &info, oldset, regs, in_syscall)) {
+		if (handle_signal(signr, &info, &ka, oldset, regs, in_syscall)) {
 			DBG(1,KERN_DEBUG "do_signal: Exit (success), regs->gr[28] = %ld\n",
 				regs->gr[28]);
 			return 1;
 		}
 	}
+	/* end of while(1) looping forever if we can't force a signal */
 
 	/* Did we come from a system call? */
 	if (in_syscall) {
Index: kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/signal.c,v
retrieving revision 1.22
diff -u -p -r1.22 signal.c
--- kernel/signal.c	20 Jul 2004 22:07:41 -0000	1.22
+++ kernel/signal.c	27 Aug 2004 18:17:53 -0000
@@ -1725,7 +1725,8 @@ static inline int handle_group_stop(void
 	return 1;
 }
 
-int get_signal_to_deliver(siginfo_t *info, struct pt_regs *regs, void *cookie)
+int get_signal_to_deliver(siginfo_t *info, struct k_sigaction *return_ka, 
+		struct pt_regs *regs, void *cookie)
 {
 	sigset_t *mask = &current->blocked;
 	int signr = 0;
@@ -1794,8 +1795,15 @@ relock:
 		ka = &current->sighand->action[signr-1];
 		if (ka->sa.sa_handler == SIG_IGN) /* Do nothing.  */
 			continue;
-		if (ka->sa.sa_handler != SIG_DFL) /* Run the handler.  */
+		if (ka->sa.sa_handler != SIG_DFL) {
+			/* Run the handler.  */
+			*return_ka = *ka;
+		  
+			if (ka->sa.sa_flags & SA_ONESHOT)
+			  ka->sa.sa_handler = SIG_DFL;
+			
 			break; /* will return non-zero "signr" value */
+		}
 
 		/*
 		 * Now we are doing the default action for this signal.
Index: include/linux/signal.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/signal.h,v
retrieving revision 1.5
diff -u -p -r1.5 signal.h
--- include/linux/signal.h	20 Jul 2004 22:07:35 -0000	1.5
+++ include/linux/signal.h	27 Aug 2004 18:17:53 -0000
@@ -217,7 +217,8 @@ extern int sigprocmask(int, sigset_t *, 
 
 #ifndef HAVE_ARCH_GET_SIGNAL_TO_DELIVER
 struct pt_regs;
-extern int get_signal_to_deliver(siginfo_t *info, struct pt_regs *regs, void *cookie);
+extern int get_signal_to_deliver(siginfo_t *info, struct k_sigaction *return_ka, 
+		struct pt_regs *regs, void *cookie);
 #endif
 
 int copy_siginfo_from_user(siginfo_t *to, siginfo_t __user *from);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
