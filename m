Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9AEE482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 09:20:40 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id IAA03842
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 08:20:30 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gBIGKOJ02593;
	Wed, 18 Dec 2002 10:20:25 -0600
Message-Id: <200212181620.gBIGKOJ02593@localhost.localdomain>
To: parisc-linux@lists.parisc-linux.org
Cc: James.Bottomley@SteelEye.com
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-17170343740"
Date: Wed, 18 Dec 2002 10:20:24 -0600
From: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] 2.5 fix for user level page fault problems
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

This is a multipart MIME message.

--==_Exmh_-17170343740
Content-Type: text/plain; charset=us-ascii

It seems that going from 2.4 to 2.5 there was an over zealous removal of the 
check signals return path.  The problem is that if a user application takes a 
page fault, that can result in a signal being posted (specifically SEGV for 
illegal memory access).  If we never check the signals, the instruction is 
retried and re-faults ad infinitum (well actually, it seems to terminate with 
an unaligned instruction trap in this case after a few hundred faults).

The attached path makes signal posting on page fault work again

James


--==_Exmh_-17170343740
Content-Type: text/plain ; name="tmp.diff"; charset=us-ascii
Content-Description: tmp.diff
Content-Disposition: attachment; filename="tmp.diff"

===== entry.S 1.8 vs edited =====
--- 1.8/arch/parisc/kernel/entry.S	Sun Nov 24 17:36:53 2002
+++ edited/entry.S	Mon Dec 16 22:09:59 2002
@@ -944,11 +944,11 @@
 	ldo		-16(%r30),%r29	/* Reference param save area */
 #endif
 
-	ldil		L%intr_restore, %r2
+	ldil		L%intr_check_sig, %r2
 	copy		%r25, %r16	/* save pt_regs */
 
 	b		handle_interruption
-	ldo		R%intr_restore(%r2), %r2
+	ldo		R%intr_check_sig(%r2), %r2
 
 
 	/*

--==_Exmh_-17170343740--
