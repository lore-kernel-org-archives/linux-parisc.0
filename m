From: "Carlos O'Donell" <carlos@skynet.ca>
Subject: [parisc-linux] Signal fixes for 2.6? Willing testers? :)
Date: Thu, 26 Aug 2004 01:43:26 -0400
Message-ID: <20040826054326.GB31656@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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


pa,

Who wants to stress test this? :)
Don't blame me if your box dies...

We could be losing signals if handle_signal fails under
heavy load. Full gcc 'make check' testsuite runs are
probably the best trigger.

c.

Index: signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
retrieving revision 1.17
diff -u -p -r1.17 signal.c
--- signal.c	31 Mar 2004 07:03:13 -0000	1.17
+++ signal.c	26 Aug 2004 02:58:59 -0000
@@ -553,10 +553,15 @@ do_signal(sigset_t *oldset, struct pt_re
 		oldset->sig[0], oldset->sig[1]);
 
 
-	signr = get_signal_to_deliver(&info, regs, NULL);
-	DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
+	/* May need to force signal if handle_signal failed to deliver */
+	while (1) {
+	  
+		signr = get_signal_to_deliver(&info, regs, NULL);
+		DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
 	
-	if (signr > 0) {
+		if (signr <= 0)
+		  break;
+		
 		/* Restart a system call if necessary. */
 		if (in_syscall) {
 			/* Check the return code */
@@ -578,8 +583,7 @@ do_signal(sigset_t *oldset, struct pt_re
 			/* fallthrough */
 			case -ERESTARTNOINTR:
 				/* A syscall is just a branch, so all
-                                   we have to do is fiddle the return
-                                   pointer. */
+				   we have to do is fiddle the return pointer. */
 				regs->gr[31] -= 8; /* delayed branching */
 				/* Preserve original r28. */
 				regs->gr[28] = regs->orig_r28;
@@ -595,6 +599,7 @@ do_signal(sigset_t *oldset, struct pt_re
 			return 1;
 		}
 	}
+	/* end of while(1) looping forever if we can't force a signal */
 
 	/* Did we come from a system call? */
 	if (in_syscall) {
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
