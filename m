Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id E917C482A
	for <parisc-linux@parisc-linux.org>; Wed,  3 Oct 2001 00:09:29 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.4d3e3a24) with ESMTP id cysxhaaa for parisc-linux@parisc-linux.org; Tue, 2 Oct 2001 23:04:53 -0700
Date: Tue, 2 Oct 2001 23:09:22 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011002230922.B12252@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [patch] kernel-mode unaligned handler
List-ID: <linux-parisc.vger.kernel.org>

With some nudging and help from willy I looked into enabling kernel-mode
unaligned access handling.... the attached patch seems to work; if it
doesn't look wrong to anybody i'll check it in... :)

tested on a c3k running a 64-bit kernel... for kernel space I tried
"nmap -O localhost" and that works ok now.

Comments appreciated,
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^


Index: unaligned.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.7
diff -u -r1.7 unaligned.c
--- unaligned.c	2001/07/14 21:17:02	1.7
+++ unaligned.c	2001/10/03 06:00:11
@@ -129,8 +129,10 @@
 		regs->isr, regs->ior, toreg, len);
 
 	__asm__ __volatile__  (
+"       mfsp %%sr1, %%r20\n"
+"       mtsp %6, %%sr1\n"
 "	copy %%r0, %0\n"
-"0:	ldbs,ma	1(%%sr3, %4), %%r19\n"
+"0:	ldbs,ma	1(%%sr1,%4), %%r19\n"
 "	addi -1, %5, %5\n"
 "	cmpib,>= 0, %5, 2f\n"
 "	or %%r19, %0, %0\n"
@@ -143,8 +145,7 @@
 #endif
 	
 "1:	ldi	10, %1\n"
-"2:\n"
-
+"2:     mtsp %%r20, %%sr1\n"
 "	.section __ex_table,\"a\"\n"
 #ifdef __LP64__
 	".dword 0b, (1b-0b)\n"
@@ -153,8 +154,8 @@
 #endif
 	".previous\n" 
 	: "=r" (val), "=r" (ret)
-	: "0" (val), "1" (ret), "r" (saddr), "r" (len)
-	: "r19" );
+	: "0" (val), "1" (ret), "r" (saddr), "r" (len), "r" (regs->isr)
+	: "r19", "r20" );
 
 	DPRINTF("val = 0x" RFMT "\n", val);
 
@@ -184,12 +185,14 @@
 
 
 	__asm__ __volatile__ (
+"       mfsp %%sr1, %%r20\n"		/* save sr1 */
+"       mtsp %5, %%sr1\n"
 #ifdef __LP64__
 "0:	extrd,u %2, 7, 8, %%r19\n"
 #else
 "0:	extrw,u %2, 7, 8, %%r19\n"
 #endif
-"1:	stb,ma %%r19, 1(%%sr3, %3)\n"
+"1:	stb,ma %%r19, 1(%%sr1, %3)\n"
 "	addi -1, %4, %4\n"
 "	cmpib,>= 0, %4, 3f\n"
 	
@@ -203,7 +206,7 @@
 "	nop\n"
 
 "2:	ldi 11, %0\n"
-"3:\n"
+"3:     mtsp %%r20, %%sr1\n"
 "	.section __ex_table,\"a\"\n"
 #ifdef __LP64__
 	".dword 1b, (2b-1b)\n"
@@ -212,8 +215,8 @@
 #endif
 	".previous\n" 
 	: "=r" (ret)
-	: "0" (ret), "r" (val), "r" (regs->ior), "r" (len)
-	: "r19" );
+	: "0" (ret), "r" (val), "r" (regs->ior), "r" (len), "r" (regs->isr)
+	: "r19", "r20" );
 
 	return ret;
 }
@@ -233,7 +236,6 @@
 	 */
 	if (!user_mode(regs))
 	{
-#if 0 /* TODO: do we want to handle this? */
 		const struct exception_table_entry *fix;
 
 		/* see if the offending code have its own
@@ -257,25 +259,26 @@
 
 			return;
 		}
-#endif
-		die_if_kernel("Unaligned data reference", regs, 28);
 	}
 
 	/* log a message with pacing */
-	if (unaligned_count > 5 && jiffies - last_time > 5*HZ)
+	if (user_mode(regs))
 	{
-		unaligned_count = 0;
-		last_time = jiffies;
-	}
-	if (++unaligned_count < 5)
-	{
-		char buf[256];
-		sprintf(buf, "%s(%d): unaligned access to 0x" RFMT " at ip=0x" RFMT "\n",
-			current->comm, current->pid, regs->ior, regs->iaoq[0]);
-		printk(KERN_WARNING "%s", buf);
+		if (unaligned_count > 5 && jiffies - last_time > 5*HZ)
+		{
+			unaligned_count = 0;
+			last_time = jiffies;
+		}
+		if (++unaligned_count < 5)
+		{
+			char buf[256];
+			sprintf(buf, "%s(%d): unaligned access to 0x" RFMT " at ip=0x" RFMT "\n",
+				current->comm, current->pid, regs->ior, regs->iaoq[0]);
+			printk(KERN_WARNING "%s", buf);
 #ifdef DEBUG_UNALIGNED
-		show_regs(regs);
-#endif	
+			show_regs(regs);
+#endif		
+		}
 	}
 
 	/* TODO: make this cleaner... */
@@ -363,7 +366,9 @@
 
 	if (ret)
 	{
-		printk(KERN_CRIT "Unaligned handler failed, ret = %d ", ret);
+		printk(KERN_CRIT "Unaligned handler failed, ret = %d\n", ret);
+		die_if_kernel("Unaligned data reference", regs, 28);
+
 		/* couldn't handle it ... */
 		si.si_signo = SIGBUS;
 		si.si_errno = 0;
