Return-Path: <carlos@baldric.uwo.ca>
Date: Fri, 30 Apr 2004 16:13:18 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040430201317.GS12850@baldric.uwo.ca>
References: <20040430200704.ECCA44945C8@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040430200704.ECCA44945C8@palinux.hppa>
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Please review. Generic changes required for
	siginfo_t compat on 64-bit arches.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Apr 30, 2004 at 02:07:04PM -0600, Carlos O'Donell wrote:
> ----------------------------------------
> Linux Kernel - siginfo_t compat changes
> ----------------------------------------
> 
> The Linuxthreads implementation of posix-threads uses
> rt_sigqueueinfo. This is broken for 64-bit kernels running
> 32-bit userspace. It requires that kernel check for a compat
> task and properly copy the siginfo_t out of userspace.
> 
> This change adds the requires compat checks in generic
> places, and uses the previously implemented is_compat_task
> macro to remove this code when there is no possibility of a
> compat task.
> 
> ----------------------------------------
> include/linux/compat_siginfo.h
> 
> Cleanup and make more consistent with compat_* types.
> Make __ARCH_SI_UID_T the correct compat type.
> 
> kernel/compat_signal.c
> 
> (compat_copy_siginfo_to_user)
> 
> Always copy the first three words, the kernel uses
> these and we might need them later. Only copy the
> _sifields._pad when the structure is from userspace.
> 
> (compat_copy_siginfo_from_user)
> 
> A brand new function that is going to be used by
> ptrace_getsiginfo and sys_rt_sigqueueinfo, since both
> functions read siginfo_t from userspace. This function
> copies up a siginfo_t to the proper kernel size.
> 
> kernel/signal.c
> 
> (copy_siginfo_from_user)
> 
> If the task is compat use the compat version e.g.
> compat_copy_siginfo_from_user, else fall back to
> using copy_from_user.
> 
> (copy_siginfo_to_user)
> 
> Move the compat check to the start of the function, that way
> we don't duplicate the access check.
> 
> (sys_rt_sigqueueinfo)
> 
> Call copy_siginfo_from_user to load a siginfo_t from
> userspace.
> 
> kernel/ptrace.c
> 
> (ptrace_getsiginfo)
> 
> Call copy_siginfo_from_user to load a siginfo_t from
> userspace.

The log message says it all. We have working posix-timers with 64-bit
kernels, by virtue of a working rt_sigqueueinfo. I wonder if this fixes
more things on 64-bit boxes.

Index: include/linux/compat_siginfo.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat_siginfo.h,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -p -r1.3 -r1.4
--- a/include/linux/compat_siginfo.h	3 Feb 2004 21:51:13 -0000	1.3
+++ b/include/linux/compat_siginfo.h	30 Apr 2004 20:07:02 -0000	1.4
@@ -33,12 +33,13 @@ typedef union compat_sigval {
  * struct siginfo that is before the union.
  */
 #ifndef __ARCH_SI_COMPAT_PREAMBLE_SIZE
-#define __ARCH_SI_COMPAT_PREAMBLE_SIZE	(3 * sizeof(int))
+#define __ARCH_SI_COMPAT_PREAMBLE_SIZE	(3 * sizeof(compat_int_t))
 #endif
 
 #define SI_COMPAT_MAX_SIZE	128
 #ifndef SI_COMPAT_PAD_SIZE
-#define SI_COMPAT_PAD_SIZE	((SI_COMPAT_MAX_SIZE - __ARCH_SI_COMPAT_PREAMBLE_SIZE) / sizeof(int))
+#define SI_COMPAT_PAD_SIZE \
+  ((SI_COMPAT_MAX_SIZE - __ARCH_SI_COMPAT_PREAMBLE_SIZE) / sizeof(compat_int_t))
 #endif
 
 /* 32-bit view of si.uid_t */
@@ -72,7 +73,7 @@ typedef struct compat_siginfo {
 		struct {
 			compat_timer_t _tid;	/* timer id */
 			compat_int_t _overrun;		/* overrun count */
-			char _pad[sizeof( __ARCH_SI_UID_T) - sizeof(int)];
+			char _pad[sizeof(__ARCH_SI_COMPAT_UID_T) - sizeof(compat_int_t)];
 			compat_sigval_t _sigval;	/* same as below */
 			compat_int_t _sys_private;       /* not to be passed to user */
 		} _timer;
@@ -164,6 +165,7 @@ static inline void compat_copy_siginfo(s
 #endif /* !HAVE_ARCH_COMPAT_COPY_SIGINFO */
 
 extern int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, struct siginfo *from);
+extern int compat_copy_siginfo_from_user(struct siginfo *to, compat_siginfo_t __user *from);
 
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_GENERIC_COMPAT_SIGINFO_H */
Index: kernel/compat_signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/compat_signal.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -p -r1.3 -r1.4
--- a/kernel/compat_signal.c	26 Apr 2004 04:46:48 -0000	1.3
+++ b/kernel/compat_signal.c	30 Apr 2004 20:07:02 -0000	1.4
@@ -48,17 +48,25 @@ int compat_copy_siginfo_to_user(compat_s
 
 	/* Convert structure, don't leak anything in the copy */
 	memset(&compat_from,'\0',sizeof(compat_siginfo_t));
+
+        /* Always copy si_signo, si_errno, and si_code */
 	compat_from.si_signo = (compat_int_t)(from->si_signo);
 	compat_from.si_errno = (compat_int_t)(from->si_errno);
 	compat_from.si_code = (compat_int_t)(from->si_code);
-	
-	if (from->si_code < 0)
-		return __copy_to_user(to, &compat_from, sizeof(compat_siginfo_t))
-			? -EFAULT : 0;
-	
+        
 	err = __put_user(compat_from.si_signo, &to->si_signo);
 	err |= __put_user(compat_from.si_errno, &to->si_errno);
 	err |= __put_user(compat_from.si_code, &to->si_code);
+
+        /* siginfo_t came from userspace, so it is the right
+         * size, no need for conversion
+         */        
+	if (from->si_code < 0) {
+		return __copy_to_user(&to->_sifields._pad, 
+                                      &from->_sifields._pad, 
+                                      SI_COMPAT_PAD_SIZE)
+			? -EFAULT : 0;
+        }
 	
 	switch (from->si_code & __SI_MASK) {
 	case __SI_KILL:
@@ -117,6 +125,79 @@ int compat_copy_siginfo_to_user(compat_s
 		compat_from.si_uid = (__ARCH_SI_COMPAT_UID_T)(from->si_uid);
 		err |= __put_user(compat_from.si_pid, &to->si_pid);
 		err |= __put_user(compat_from.si_uid, &to->si_uid);
+		break;
+	}
+	return err;
+}
+
+int compat_copy_siginfo_from_user(siginfo_t *to, compat_siginfo_t __user *from)
+{
+	int err;
+        u64 scratch;
+
+	if (!access_ok (VERIFY_READ, from, sizeof(compat_siginfo_t)))
+		return -EFAULT;
+	
+	/*
+	 * If you change compat_siginfo_t structure *or* siginfo_t, 
+	 * please be sure this code is fixed accordingly.
+	 */
+
+        /* Always copy si_signo, si_errno, and si_code */
+	err = __get_user(to->si_signo, &from->si_signo);
+	err |= __get_user(to->si_errno, &from->si_errno);
+	err |= __get_user(to->si_code, &from->si_code);
+        
+        /* siginfo_t came from userspace, so it is the right
+         * size, no need for conversion
+         */        
+	if (to->si_code < 0) {
+		return __copy_from_user(&to->_sifields._pad, 
+                                        &from->_sifields._pad, 
+                                        SI_COMPAT_PAD_SIZE)
+			? -EFAULT : 0;
+        }
+	
+	switch (to->si_code & __SI_MASK) {
+	case __SI_KILL:
+		err |= __get_user(to->si_pid, &from->si_pid);
+		err |= __get_user(to->si_uid, &from->si_uid);
+		break;
+	case __SI_TIMER:
+		err |= __get_user(to->si_tid, &from->si_tid);
+		err |= __get_user(to->si_overrun, &from->si_overrun);
+		err |= __get_user(scratch, &from->si_ptr);
+                to->si_ptr = (u64*)scratch;                
+		break;
+	case __SI_POLL:
+		err |= __get_user(to->si_band, &from->si_band);
+		err |= __get_user(to->si_fd, &from->si_fd);
+		break;
+	case __SI_FAULT:
+		err |= __get_user(scratch, &from->si_addr);
+                to->si_addr = (u64*)scratch;
+#ifdef __ARCH_SI_COMPAT_TRAPNO
+		err |= __get_user(to->si_trapno, &from->si_trapno);
+#endif
+		break;
+	case __SI_CHLD:
+		err |= __get_user(to->si_pid, &from->si_pid);
+		err |= __get_user(to->si_uid, &from->si_uid);
+		err |= __get_user(to->si_status, &from->si_status);
+		err |= __get_user(to->si_utime, &from->si_utime);
+		err |= __get_user(to->si_stime, &from->si_stime);
+		break;
+	case __SI_RT: /* This is not generated by the kernel as of now. */
+	case __SI_MESGQ: /* But this is */
+		err |= __get_user(to->si_pid, &from->si_pid);
+		err |= __get_user(to->si_uid, &from->si_uid);
+		err |= __get_user(to->si_int, &from->si_int);
+		err |= __get_user(scratch, &from->si_ptr);
+                to->si_ptr = (u64*)scratch;
+		break;
+	default: /* this is just in case for now ... */
+		err |= __get_user(to->si_pid, &from->si_pid);
+		err |= __get_user(to->si_uid, &from->si_uid);
 		break;
 	}
 	return err;
Index: kernel/ptrace.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/ptrace.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -p -r1.4 -r1.5
--- a/kernel/ptrace.c	30 Mar 2004 12:42:47 -0000	1.4
+++ b/kernel/ptrace.c	30 Apr 2004 20:07:02 -0000	1.5
@@ -290,7 +290,7 @@ static int ptrace_setsiginfo(struct task
 {
 	if (child->last_siginfo == NULL)
 		return -EINVAL;
-	if (copy_from_user(child->last_siginfo, data, sizeof (siginfo_t)) != 0)
+	if (copy_siginfo_from_user(child->last_siginfo, data) != 0)
 		return -EFAULT;
 	return 0;
 }
Index: kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/signal.c,v
retrieving revision 1.18
retrieving revision 1.19
diff -u -p -r1.18 -r1.19
--- a/kernel/signal.c	28 Apr 2004 19:13:08 -0000	1.18
+++ b/kernel/signal.c	30 Apr 2004 20:07:02 -0000	1.19
@@ -2018,11 +2018,28 @@ sys_rt_sigpending(sigset_t __user *set, 
 	return do_sigpending(set, sigsetsize);
 }
 
+#ifndef HAVE_ARCH_COPY_SIGINFO_FROM_USER
+
+int copy_siginfo_from_user(siginfo_t *to, siginfo_t __user *from)
+{
+        if(is_compat_task(current))
+                return compat_copy_siginfo_from_user(to,(compat_siginfo_t __user *)from);
+  
+        return copy_from_user(&to, from, sizeof(siginfo_t));
+}
+
+#endif
+
 #ifndef HAVE_ARCH_COPY_SIGINFO_TO_USER
 
 int copy_siginfo_to_user(siginfo_t __user *to, siginfo_t *from)
 {
 	int err;
+	
+	/* Use compat_siginfo_t with 32-bit signals */
+	if(is_compat_task(current)){
+		return compat_copy_siginfo_to_user((compat_siginfo_t __user *)to,from);
+	}
 
 	if (!access_ok (VERIFY_WRITE, to, sizeof(siginfo_t)))
 		return -EFAULT;
@@ -2030,11 +2047,6 @@ int copy_siginfo_to_user(siginfo_t __use
 		return __copy_to_user(to, from, sizeof(siginfo_t))
 			? -EFAULT : 0;
 	
-	/* Use compat_siginfo_t with 32-bit signals */
-	if(is_compat_task(current)){
-		return compat_copy_siginfo_to_user((compat_siginfo_t __user *)to,from);
-	}
-	
 	/*
 	 * If you change siginfo_t structure, please be sure
 	 * this code is fixed accordingly.
@@ -2271,7 +2283,7 @@ sys_rt_sigqueueinfo(int pid, int sig, si
 {
 	siginfo_t info;
 
-	if (copy_from_user(&info, uinfo, sizeof(siginfo_t)))
+	if (copy_siginfo_from_user(&info, uinfo))
 		return -EFAULT;
 
 	/* Not even root can pretend to send signals from the kernel.
