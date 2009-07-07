From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [git] parisc: Changes to ref refs/heads/tracehook
Date: Tue, 7 Jul 2009 03:16:14 -0400
Message-ID: <20090707071613.GC3826@bombadil.infradead.org>
References: <200907070645.n676jfRv021773@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200907070645.n676jfRv021773@hera.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 07, 2009 at 06:45:41AM +0000, Kyle McMartin wrote:
> New commits:
> commit 8dcd3644bb70c18f5194c936232b2b703998ceeb
> Author: Kyle McMartin <kyle@shortfin.cabal.ca>
> Date:   Tue Jul 7 02:43:20 2009 -0400
> 
>     parisc: ptrace {GET,SET}REGS and compat
>     
>     Not for public consumption, testing with gdb seems to work, but strace
>     using GETREGS seems broken.
>     
>     Not-signed-off-under-any-condition-by: Kyle McMartin <kyle@mcmartin.ca>

If anyone wants to play with this, I converted a few of the ptrace calls
in strace to use GET|SET_REGS. They seem to be working ok despite my
comment above, which was just me being a muppet.

In my limited testing, it seems to work as expected...

diff -Nur strace-4.5.18/process.c strace-4.5.18.getregs/process.c
--- strace-4.5.18/process.c	2008-07-17 22:16:47.000000000 -0400
+++ strace-4.5.18.getregs/process.c	2009-07-07 03:02:00.000000000 -0400
@@ -726,8 +726,12 @@
 		return -1;
 	return 0;
 #elif defined(HPPA)
-	if (ptrace(PTRACE_POKEUSER, tcp->pid, (char*)(PT_GR20), new)<0)
-	    	return -1;
+	unsigned long regs[80];
+	if (ptrace(13, tcp->pid, (char*)&regs, 0) < 0)
+		return -1;
+	regs[20] = new;
+	if (ptrace(14, tcp->pid, (char*)&regs, 0) < 0)
+		return -1;
 	return 0;
 #elif defined(SH)
        if (ptrace(PTRACE_POKEUSER, tcp->pid, (char*)(4*(REG_REG0+3)), new)<0)
diff -Nur strace-4.5.18/syscall.c strace-4.5.18.getregs/syscall.c
--- strace-4.5.18/syscall.c	2008-08-24 23:16:26.000000000 -0400
+++ strace-4.5.18.getregs/syscall.c	2009-07-07 03:09:49.000000000 -0400
@@ -1862,9 +1862,14 @@
 		return -1;
 #else /* !SPARC64 */
 #ifdef HPPA
-	r28 = error ? -error : rval;
-	if (ptrace(PTRACE_POKEUSER, tcp->pid, (char*)(PT_GR28), r28) < 0)
-		return -1;
+	{
+		unsigned long regs[80];
+		if (ptrace(13, tcp->pid, (char *)&regs, 0) < 0)
+			return -1;
+		regs[28] = error ? -error : rval;
+		if (ptrace(14, tcp->pid, (char*)&regs, 0) < 0)
+			return -1;
+	}
 #else
 #ifdef SH
 	r0 = error ? -error : rval;
@@ -2094,15 +2099,20 @@
 	}
 #elif defined (HPPA)
 	{
-		int i;
+		int i, ret;
+		unsigned long regs[80];
+#define PTRACE_GETREGS	13
 
+		ret = ptrace(PTRACE_GETREGS, pid, NULL, (long)&regs);
+		if (ret < 0)
+			return -1;
+		
 		if (tcp->scno >= 0 && tcp->scno < nsyscalls && sysent[tcp->scno].nargs != -1)
 			tcp->u_nargs = sysent[tcp->scno].nargs;
 		else
-     	        	tcp->u_nargs = MAX_ARGS;
+     	        	tcp->u_nargs = 6;
 		for (i = 0; i < tcp->u_nargs; i++) {
-			if (upeek(pid, PT_GR26-4*i, &tcp->u_arg[i]) < 0)
-				return -1;
+			tcp->u_arg[i] = regs[26-i];	/* %r26 = %arg0, %r25 = %arg1... */
 		}
 	}
 #elif defined(ARM)
diff -Nur strace-4.5.18/util.c strace-4.5.18.getregs/util.c
--- strace-4.5.18/util.c	2009-05-06 11:38:56.000000000 -0400
+++ strace-4.5.18.getregs/util.c	2009-07-07 03:09:02.000000000 -0400
@@ -1900,6 +1900,7 @@
 	long pc;
 #elif defined(HPPA)
 	long iaoq;
+	unsigned long regs[80];
 #elif defined(SH)
        long pc;
 #endif /* architecture */
@@ -2053,8 +2054,9 @@
 		return 0;
 	}
 #elif defined(HPPA)
-	if (upeek(tcp->pid, PT_IAOQ0, &iaoq) < 0)
+	if (ptrace(13, tcp->pid, (char*)&regs, 0) < 0)
 		return -1;
+	iaoq = regs[40];
 	iaoq &= ~0x03;
 	if (iaoq != tcp->baddr && iaoq != tcp->baddr + 4) {
 		/* The breakpoint has not been reached yet.  */
@@ -2064,12 +2066,14 @@
 		return 0;
 	}
 	iaoq = tcp->baddr | 3;
+	regs[40] = iaoq;
+	regs[41] = iaoq;
 	/* We should be pointing at a 'ldi -1000,r1' in glibc, so it is
 	 * safe to set both IAOQ0 and IAOQ1 to that so the PSW N bit
 	 * has no significant effect.
 	 */
-	ptrace(PTRACE_POKEUSER, tcp->pid, (void *)PT_IAOQ0, iaoq);
-	ptrace(PTRACE_POKEUSER, tcp->pid, (void *)PT_IAOQ1, iaoq);
+	if (ptrace(14, tcp->pid, (char*)&regs, 0) < 0)
+		return -1;
 #elif defined(SH)
        if (upeek(tcp->pid, 4*REG_PC, &pc) < 0)
                return -1;
