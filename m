From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: simplify sys_clone()
Date: Fri, 13 Feb 2009 23:58:29 +0100
Message-ID: <4995FB15.6060008@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

No need to test clone_flags here and set parent_tidptr and child_tidptr
accordingly. The same check will be done in do_fork() and copy_process() anyway.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index b80e02a..ad585fd 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -231,8 +231,8 @@ sys_clone(unsigned long clone_flags, unsigned long usp,
 	   
 	   However, these last 3 args are only examined
 	   if the proper flags are set. */
-	int __user *child_tidptr;
-	int __user *parent_tidptr;
+	int __user *parent_tidptr = (int __user *)regs->gr[24];
+	int __user *child_tidptr  = (int __user *)regs->gr[22];
 
 	/* usp must be word aligned.  This also prevents users from
 	 * passing in the value 1 (which is the signal for a special
@@ -243,16 +243,6 @@ sys_clone(unsigned long clone_flags, unsigned long usp,
 	if (usp == 0)
 	  usp = regs->gr[30];
 
-	if (clone_flags & CLONE_PARENT_SETTID)
-	  parent_tidptr = (int __user *)regs->gr[24];
-	else
-	  parent_tidptr = NULL;
-	
-	if (clone_flags & (CLONE_CHILD_SETTID | CLONE_CHILD_CLEARTID))
-	  child_tidptr = (int __user *)regs->gr[22];
-	else
-	  child_tidptr = NULL;
