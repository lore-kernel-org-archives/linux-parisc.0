From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [RFC] Fix compat_sys_timer_create kernel security
	hole.
Date: Mon, 1 Aug 2005 20:15:09 -0400
Message-ID: <20050802001505.GA9703@systemhalted.org>
References: <20050801151506.GW9703@systemhalted.org>
	<20050801164250.GX9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050801164250.GX9703@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 01, 2005 at 12:42:54PM -0400, Carlos O'Donell wrote:
> parisc,
> 
> Another crash. Remember in the compat case that the source and destination
> addresses may have sr's both set to zero since you are copying into a 
> temporary kernel structure.
> 
> Backtrace:
>  [<0000000010325ef4>] copy_to_user+0x34/0x40
>  [<00000000101711dc>] sys_timer_create+0x294/0x8c8
>  [<00000000101836f4>] compat_sys_timer_create+0x74/0xa8
>  [<0000000010107f8c>] syscall_exit+0x0/0x14

Found my own bug. I tested this code but at the time the kernel address
dereference worked and it didn't crash. Oddly enough the timer tests
passed in glibc.

When you run the full testsuite in nptl it catches this bug. The value
of created_timer_id is a userspace address and requires a copy into the
kernel and a copy back out.

Could someone else review this patch for any thing else I might have
forgotten?

---

When using set_fs(KERNEL_DS) all the variables crossing the boundary 
must be kernel addresses. Any user addresses would be treated as
kernel addresses and dereferences would cause an HPMC. This was the 
case here. The value of created_timer_id must be read into the kernel
and later copied back out, the same for timer_event_spec.

2005-08-01  Carlos O'Donell <carlos@systemhalted.org>

	* kernel/compat_signal.c (compat_copy_sigevent_to_user): New.
	* kernel/compat.c (compat_sys_timer_create): Also copy
	created_timer_id into kernel and use that.
	* include/linux/compat_signal.h: Add prototypes.
	
Signed-of-by: Carlos O'Donell <carlos@systemhalted.org>

Index: kernel/compat_signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/compat_signal.c,v
retrieving revision 1.7
diff -u -p -r1.7 compat_signal.c
--- kernel/compat_signal.c	3 Nov 2004 22:07:38 -0000	1.7
+++ kernel/compat_signal.c	2 Aug 2005 00:05:44 -0000
@@ -242,3 +242,39 @@ int compat_copy_sigevent_from_user(sigev
 }
 #endif
 
+#ifndef HAVE_ARCH_COPY_SIGEVENT_TO_USER
+int compat_copy_sigevent_to_user(compat_sigevent_t __user *to, sigevent_t *from)
+{
+	int err;
+	u32 scratch;
+	
+	/* copy sigval_t sigev_value 
+	 	int_t sival_int		(same)
+	 	uptr_t sival_ptr	(32 vs 64)*/
+	err = __put_user(from->sigev_value.sival_int, 
+	    		 &to->sigev_value.sival_int);
+	scratch = (u32 __force)from->sigev_value.sival_ptr & 0xffffffffUL;
+	err |= __put_user((compat_uptr_t)scratch, &to->sigev_value.sival_ptr);
+	
+	/* copy int_t sigev_signo 	(same)*/
+	err |= __put_user(from->sigev_signo, &to->sigev_signo);
+	
+	/* copy int_t sigev_notify	(same)*/
+	err |= __put_user(from->sigev_notify, &to->sigev_notify);
+
+	/* never copy _sigev_un padding */
+
+	/* copy int_t _tid 		(same),
+	   good_sigevent() uses this value of */
+	err |= __put_user(from->sigev_notify_thread_id, &to->sigev_notify_thread_id);
+	
+	/* XXX: Do not copy these, they aren't used by
+	   anyone. We would need to distinguish the uses of the union.
+	   copy _sigev_thread
+	  	uptr_t _function	(32 vs 64)
+	  	uptr_t _attribute	(32 vs 64)*/
+	
+	return err;
+}
+#endif
+
Index: kernel/compat.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/compat.c,v
retrieving revision 1.27
diff -u -p -r1.27 compat.c
--- kernel/compat.c	22 Apr 2005 00:26:08 -0000	1.27
+++ kernel/compat.c	2 Aug 2005 00:05:46 -0000
@@ -663,17 +663,35 @@ long compat_sys_timer_create(clockid_t w
 			     compat_timer_t __user * created_timer_id)
 {
 	sigevent_t kevent;
+	timer_t ktimer;
 	mm_segment_t old_fs = get_fs();
 	long ret;
 
+	/* sigevent_t needs handling for 32-bit to 64-bit compat */
 	if (timer_event_spec != NULL)
 		if (compat_copy_sigevent_from_user(&kevent, timer_event_spec) != 0)
 			return -EFAULT;
+	
+	/* Timer ID is assumed to be a non-struct simple value */
+	if (created_timer_id != NULL)
+		if (__get_user(ktimer, created_timer_id) != 0)
+		  	return -EFAULT;
 
 	set_fs(KERNEL_DS);
-	ret = sys_timer_create(which_clock, timer_event_spec ? (sigevent_t __user *)&kevent : NULL, created_timer_id);
+	ret = sys_timer_create(which_clock, 
+	    			timer_event_spec ? (sigevent_t __user *)&kevent : NULL, 
+	    			created_timer_id ? (timer_t __user *)&ktimer : NULL);
 	set_fs(old_fs);
+	
+	/* Copy back the results to userspace */
+	if (timer_event_spec != NULL)
+	  	if (compat_copy_sigevent_to_user(timer_event_spec, &kevent) != 0)
+			return -EFAULT;
 
+	if (created_timer_id != NULL)
+	  	if (__put_user(ktimer, created_timer_id) != 0)
+		  	return -EFAULT;
+	
 	return ret;
 }
 
Index: include/linux/compat_siginfo.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat_siginfo.h,v
retrieving revision 1.7
diff -u -p -r1.7 compat_siginfo.h
--- include/linux/compat_siginfo.h	18 Mar 2005 14:38:12 -0000	1.7
+++ include/linux/compat_siginfo.h	2 Aug 2005 00:05:46 -0000
@@ -175,6 +175,7 @@ extern int compat_copy_siginfo_to_user(c
 extern int compat_copy_siginfo_from_user(struct siginfo *to, compat_siginfo_t __user *from);
 
 extern int compat_copy_sigevent_from_user(struct sigevent *to, compat_sigevent_t __user *from);
+extern int compat_copy_sigevent_to_user(compat_sigevent_t __user *to, struct sigevent *from);
 
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_GENERIC_COMPAT_SIGINFO_H */


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
