Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id A100E484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 23:39:30 -0700 (MST)
Date: Fri, 6 Feb 2004 22:40:01 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb
Message-ID: <20040207064001.GU959@tausq.org>
References: <20040206191631.GQ959@tausq.org>
	<40218AE20000180F@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40218AE20000180F@ocpmta2.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> And because 2.4 64bits runing fine on this system (b2k) and the pb should
> be located very early at the begining of the kernel start, I had the idea
> to compare head64.S and vmlinux.lds.S and find back this 2.5 patch and try
> to revert it. But I very don't undurstand what happen in head64 to hope to
> help more efficiently :( (sorry) 

Perhaps the problem is this....

in head64.S, we used to have:
        /* And the stack pointer too */
        load32          PA(init_task_union+TASK_SZ_ALGN),%sp
        [...]
        /* Save the rfi target address */
        std             %r11,  TASK_PT_GR11-TASK_SZ_ALGN(%sp)

Since the pt_regs struct used to be part of the init_task_union, we do a
store against the PA of init_task_union, and all is well.

In the new code, init_task_union is a thread_info, and in order to
store into the pt_regs we have to first dereference thread_info.task and
then store into the resulting task pointer....

        /* And the stack pointer too */
        load32          PA(init_thread_union+THREAD_SZ_ALGN),%sp
        [...]
        /* Save the rfi target address */
        ldo             -THREAD_SZ_ALGN(%sp), %r1
        ldd             TI_TASK(%r1), %r1
        std             %r11,  TASK_PT_GR11(%r1)

so now we are storing into a VA of init_thread_union.task .... oops!

So, can you try this patch?

Index: arch/parisc/kernel/head64.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head64.S,v
retrieving revision 1.3
diff -u -p -r1.3 head64.S
--- arch/parisc/kernel/head64.S	17 Jan 2004 15:00:32 -0000	1.3
+++ arch/parisc/kernel/head64.S	7 Feb 2004 06:37:57 -0000
@@ -165,9 +165,9 @@ common_stext:
 #endif /* CONFIG_SMP */
 
 	/* Save the rfi target address */
-	ldo		-THREAD_SZ_ALGN(%sp), %r1
-	ldd		TI_TASK(%r1), %r1
-	std		%r11,  TASK_PT_GR11(%r1)
+	ldd		TI_TASK-THREAD_SZ_ALGN(%sp), %r10
+	tophys_r1	%r10
+	std		%r11,  TASK_PT_GR11(%r10)
 
 #ifndef CONFIG_PDC_NARROW
 	/* Switch to wide mode; Superdome doesn't support narrow PDC
@@ -197,9 +197,9 @@ common_stext:
 
 stext_pdc_ret:
 	/* restore rfi target address*/
-	ldo		-THREAD_SZ_ALGN(%sp), %r1
-	ldd		TI_TASK(%r1), %r1
-	ldd		TASK_PT_GR11(%r1), %r11
+	ldd		TI_TASK-THREAD_SZ_ALGN(%sp), %r10
+	tophys_r1	%r10
+	ldd		TASK_PT_GR11(%r10), %r11
 
 	/* PARANOID: clear user scratch/user space SR's */
 	mtsp	%r0,%sr0

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
