Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dh64.b180 (b180.mmjgroup.com [192.34.35.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F1514829
	for <parisc-linux@parisc-linux.org>; Fri,  6 Dec 2002 06:52:49 -0700 (MST)
Date: Fri, 6 Dec 2002 06:52:43 -0700
From: lamont@hp.com
To: parisc-linux@parisc-linux.org
Message-ID: <20021206135243.GA20175@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] towards unattended reboot
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

Q: Given a 2.4.19 kernel, how do you get it to automatically reboot on crash?

A: see below.  The first one breaks the loop on dumping the stack.  The
   second part resets the machine in parisc_terminate().

thoughts?
lamont

diff -ur x/kernel-source-2.4.19-hppa/arch/parisc/kernel/traps.c kernel-source-2.4.19-hppa/arch/parisc/kernel/traps.c
--- x/kernel-source-2.4.19-hppa/arch/parisc/kernel/traps.c	2002-10-19 16:25:59.000000000 -0600
+++ kernel-source-2.4.19-hppa/arch/parisc/kernel/traps.c	2002-12-06 00:07:40.000000000 -0700
@@ -148,6 +148,11 @@
 void show_stack(struct pt_regs *regs)
 {
 #if 1
+	static int tried_stack=0;
+	if (tried_stack)
+		return;
+	tried_stack++;
+
 	/* If regs->sr[7] == 0, we are on a kernel stack */
 	if (regs->sr[7] == 0) {
 
@@ -462,6 +467,12 @@
 	 * system will shut down immediately right here. */
 	pdc_soft_power_button(0);
 	
+	{
+		static int tried_once=0;
+		if (!tried_once++)
+			__raw_writel(5,0xfffe0030);
+	}
+	
 	for(;;)
 	    ;
 }
