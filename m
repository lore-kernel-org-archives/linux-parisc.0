Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA26934
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 06:51:41 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 23 Jan 2001 13:55:34 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C4BF3B005; Tue, 23 Jan 2001 13:45:45 +0000 (GMT)
Date: Tue, 23 Jan 2001 13:45:45 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Message-ID: <20010123134545.W3571@linuxcare.com>
References: <20001221160006.W2554@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001221160006.W2554@linuxcare.com>; from rhirst@linuxcare.com on Thu, Dec 21, 2000 at 04:00:06PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 21, 2000 at 04:00:06PM +0000, Richard Hirst wrote:
> Hi,
>   I tried calling ptrace() from a 32 bit app on a 64 bit kernel, and
> the kernel crashed.  sys_ptrace needs a 32 bit wrapper, but that is
> a seperate issue (I think).
> 
> It died at sys_ptrace+0x28, where it tried to use ret1.
> (ret1 = 00000000000517a1):

So, I still havn't fixed this, because I added a syscall wrapper for
sys_ptrace() and that masked the problem.  The wrapper didn't try to
use the incoming r29, and it initialised r29 before calling sys_ptrace().

64 bit functions expect r29 to point to a parameter save area.  I've
made changes in my tree to increase FRAME_SIZE from 64 to 128 bytes on
64 bit, and initialise r29 on syscall entry.  I havn't committed it yet.
I was just going to increase to 80 bytes - 64 bytes save area plus
16 for rp and sp - but Willy thought there was a requirement for the
stack to be 64 byte aligned.
Presumably r29 needs initialising on every call from entry.S and syscall.S
to C code, but I'm not over confident about that, so I thought I'd let
others see my diff so far.  Comments?

Richard


Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/syscall.S,v
retrieving revision 1.49
diff -u -r1.49 syscall.S
--- syscall.S	2001/01/20 04:44:04	1.49
+++ syscall.S	2001/01/23 13:03:29
@@ -23,7 +23,13 @@
 	.level		1.1
 #endif
 	.text
-	
+
+#ifdef __LP64__
+#define FRAME_SIZE	128
+#else
+#define FRAME_SIZE	64
+#endif
+
 	.import syscall_exit,code
 	.import syscall_exit_rfi,code
 	.export linux_gateway_page
@@ -94,11 +100,12 @@
 	STREG	%r27, TASK_PT_SAR(%r1)
 
 	loadgp
-
-	ldo	TASK_SZ_ALGN+64(%r1),%r30	/* set up kernel stack */
 
-#ifndef __LP64__
-	/* no need to save these on stack because in wide mode the first 8
+	ldo	TASK_SZ_ALGN+FRAME_SIZE(%r1),%r30	/* set up kernel stack */
+#ifdef __LP64__
+	ldo	-16(%r30),%r29			/* Reference param save area */
+#else
+	/* no need to save these on stack in wide mode because the first 8
 	 * args are passed in registers */
 	stw     %r22, -52(%r30)                 /* 5th argument */
 	stw     %r21, -56(%r30)                 /* 6th argument */
@@ -170,7 +177,7 @@
 	 * C bit set, a non-straced syscall entry results in C and D clear
 	 * in the saved PSW.
 	 */
-	ldo     -TASK_SZ_ALGN-64(%r30),%r1      /* get task ptr */
+	ldo     -TASK_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	ssm	0,%r2
 	STREG	%r2,TASK_PT_PSW(%r1)		/* Lower 8 bits only!! */
 	STREG	%r1,TASK_PT_CR30(%r1)
@@ -224,7 +231,7 @@
 	LDIL_FIXUP(%r1)
 	ldo     R%sys_call_table(%r1), %r19
 
-	ldo     -TASK_SZ_ALGN-64(%r30),%r1      /* get task ptr */
+	ldo     -TASK_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	LDREG   TASK_PT_GR20(%r1), %r20
 	LDREG   TASK_PT_GR26(%r1), %r26		/* Restore the users args */
 	LDREG   TASK_PT_GR25(%r1), %r25
@@ -260,10 +267,10 @@
 	makes a direct call to syscall_trace. */
 	
 tracesys_exit:
-	ldo     -TASK_SZ_ALGN-64(%r30),%r1      /* get task ptr */
+	ldo     -TASK_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	bl	syscall_trace, %r2
 	STREG   %r28,TASK_PT_GR28(%r1)          /* save return value now */
-	ldo     -TASK_SZ_ALGN-64(%r30),%r1      /* get task ptr */
+	ldo     -TASK_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	LDREG   TASK_PT_GR28(%r1), %r28		/* Restore return val. */
 
 	ldil	L%syscall_exit,%r1
@@ -278,7 +285,7 @@
 	ldo	R%tracesys_sigexit(%r2),%r2
 
 tracesys_sigexit:
-	ldo     -TASK_SZ_ALGN-64(%r30),%r1      /* get task ptr */
+	ldo     -TASK_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	bl	syscall_trace, %r2
 	nop
 
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.58
diff -u -r1.58 entry.S
--- entry.S	2001/01/13 09:51:57	1.58
+++ entry.S	2001/01/23 13:03:36
@@ -48,7 +48,7 @@
 #include <asm/signal.h>
 
 #ifdef __LP64__
-#define FRAME_SIZE	64
+#define FRAME_SIZE	128
 #else
 #define FRAME_SIZE	64
 #endif
@@ -1787,7 +1787,7 @@
 
 	/* Set the return value for the child */
 child_return:
-	LDREG	TASK_PT_GR19-TASK_SZ_ALGN-128(%r30),%r2
+	LDREG	TASK_PT_GR19-TASK_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30),%r2
 	b	wrapper_exit
 	copy	%r0,%r28
 
