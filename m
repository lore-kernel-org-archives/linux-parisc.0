From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] compat fixes and a signal si_code bug fix.
Date: Mon, 27 Sep 2004 00:12:22 -0400
Message-ID: <20040927041221.GM27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
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

With the addition of all the extra syscalls we didn't have before
(thanks Matthew), I've been experimenting with an update of
kernel-header, and a glibc rebuild to use the syscalls. A couple of
issues have come forward but they can be fixed, and infact some things
are fixed in the following patch.

---

Fixed a big bug in the compat signal routines, we were copying the
kernel SI_CODE bits down into userspace and this would mean any
program reading si_code's would be confused by the weird code. Given
that siginfo has always been broken, we just continue to make it better :)

---

We need compat for a number of functions in 64-bit compiles:

The following already had compat but are now connected:

	compat_sys_timer_settime
	compat_sys_timer_gettime
	compat_sys_clock_gettime
	compat_sys_clock_getres
	compat_sys_clock_nanosleep

(Truthfully the glibc testsuite shows them failing right now
 after I connected them. Need to fix this now).

The following don't have compat and were just added by this patch:

	compat_sys_timer_create
	compat_sys_waitid

The following function is required for the waitid syscall since it reads
a sigevent from userspace and that requries type conversion.

	compat_copy_sigevent_from_user

---
 include/asm-generic/siginfo.h  |    6 +
 include/linux/compat_siginfo.h |    8 +
 kernel/compat.c                |   49 +++++++++--
 kernel/compat_signal.c         |   42 ++++++++-
 4 files changed, 95 insertions(+), 10 deletions(-)

Index: include/asm-generic/siginfo.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-generic/siginfo.h,v
retrieving revision 1.6
diff -u -p -r1.6 siginfo.h
--- include/asm-generic/siginfo.h	13 Sep 2004 15:24:02 -0000	1.6
+++ include/asm-generic/siginfo.h	27 Sep 2004 03:57:47 -0000
@@ -242,9 +242,13 @@ typedef struct siginfo {
 #define SIGEV_THREAD	2	/* deliver via thread creation */
 #define SIGEV_THREAD_ID 4	/* deliver to thread */
 
+#ifndef __ARCH_SIGEV_PREAMBLE_SIZE
+#define __ARCH_SIGEV_PREAMBLE_SIZE (sizeof(int) * 2 + sizeof(sigval_t))
+#endif
+
 #define SIGEV_MAX_SIZE	64
 #ifndef SIGEV_PAD_SIZE
-#define SIGEV_PAD_SIZE	((SIGEV_MAX_SIZE/sizeof(int)) - 3)
+#define SIGEV_PAD_SIZE	((SIGEV_MAX_SIZE - __ARCH_SIGEV_PREAMBLE_SIZE)/sizeof(int))
 #endif
 
 #ifndef HAVE_ARCH_SIGEVENT_T
Index: include/linux/compat_siginfo.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat_siginfo.h,v
retrieving revision 1.5
diff -u -p -r1.5 compat_siginfo.h
--- include/linux/compat_siginfo.h	12 May 2004 23:57:13 -0000	1.5
+++ include/linux/compat_siginfo.h	27 Sep 2004 03:57:47 -0000
@@ -130,9 +130,13 @@ typedef struct compat_siginfo {
  * However, everything is written out here so as to not get lost.
  */
 
+#ifndef __ARCH_SIGEV_COMPAT_PREAMBLE_SIZE
+#define __ARCH_SIGEV_COMPAT_PREAMBLE_SIZE (sizeof(compat_int_t) * 2 + sizeof(compat_sigval_t))
+#endif
+
 #define SIGEV_COMPAT_MAX_SIZE	64
 #ifndef SIGEV_COMPAT_PAD_SIZE
-#define SIGEV_COMPAT_PAD_SIZE	((SIGEV_COMPAT_MAX_SIZE/sizeof(int)) - 3)
+#define SIGEV_COMPAT_PAD_SIZE	((SIGEV_COMPAT_MAX_SIZE - __ARCH_SIGEV_COMPAT_PREAMBLE_SIZE)/sizeof(compat_int_t))
 #endif
 
 #ifndef HAVE_ARCH_COMPAT_SIGEVENT_T
@@ -172,6 +176,8 @@ static inline void compat_copy_siginfo(s
 
 extern int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, struct siginfo *from);
 extern int compat_copy_siginfo_from_user(struct siginfo *to, compat_siginfo_t __user *from);
+
+extern int compat_copy_sigevent_from_user(struct sigevent *to, compat_sigevent_t __user *from);
 
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_GENERIC_COMPAT_SIGINFO_H */
Index: kernel/compat.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/compat.c,v
retrieving revision 1.12
diff -u -p -r1.12 compat.c
--- kernel/compat.c	13 Sep 2004 15:24:20 -0000	1.12
+++ kernel/compat.c	27 Sep 2004 03:57:47 -0000
@@ -13,6 +13,7 @@
 
 #include <linux/linkage.h>
 #include <linux/compat.h>
+#include <linux/compat_siginfo.h>
 #include <linux/errno.h>
 #include <linux/time.h>
 #include <linux/signal.h>
@@ -518,7 +519,7 @@ static int put_compat_itimerspec(struct 
 	return 0;
 } 
 
-long compat_timer_settime(timer_t timer_id, int flags, 
+long compat_sys_timer_settime(timer_t timer_id, int flags, 
 			  struct compat_itimerspec __user *new, 
 			  struct compat_itimerspec __user *old)
 { 
@@ -541,7 +542,7 @@ long compat_timer_settime(timer_t timer_
 	return err;
 } 
 
-long compat_timer_gettime(timer_t timer_id,
+long compat_sys_timer_gettime(timer_t timer_id,
 		struct compat_itimerspec __user *setting)
 { 
 	long err;
@@ -558,7 +559,7 @@ long compat_timer_gettime(timer_t timer_
 	return err;
 } 
 
-long compat_clock_settime(clockid_t which_clock,
+long compat_sys_clock_settime(clockid_t which_clock,
 		struct compat_timespec __user *tp)
 {
 	long err;
@@ -575,7 +576,7 @@ long compat_clock_settime(clockid_t whic
 	return err;
 } 
 
-long compat_clock_gettime(clockid_t which_clock,
+long compat_sys_clock_gettime(clockid_t which_clock,
 		struct compat_timespec __user *tp)
 {
 	long err;
@@ -592,7 +593,7 @@ long compat_clock_gettime(clockid_t whic
 	return err;
 } 
 
-long compat_clock_getres(clockid_t which_clock,
+long compat_sys_clock_getres(clockid_t which_clock,
 		struct compat_timespec __user *tp)
 {
 	long err;
@@ -609,7 +610,7 @@ long compat_clock_getres(clockid_t which
 	return err;
 } 
 
-long compat_clock_nanosleep(clockid_t which_clock, int flags,
+long compat_sys_clock_nanosleep(clockid_t which_clock, int flags,
 			    struct compat_timespec __user *rqtp,
 			    struct compat_timespec __user *rmtp)
 {
@@ -634,6 +635,20 @@ long compat_clock_nanosleep(clockid_t wh
 
 /* timer_create is architecture specific because it needs sigevent conversion */
 
+long compat_sys_timer_create(clockid_t which_clock,
+			     compat_sigevent_t __user *timer_event_spec,
+			     compat_timer_t __user * created_timer_id)
+{
+	sigevent_t kevent;
+
+	if (timer_event_spec != NULL)
+		if (compat_copy_sigevent_from_user(&kevent, timer_event_spec) != 0)
+			return -EFAULT;
+
+	return sys_timer_create(which_clock, &kevent, created_timer_id);
+}
+
+
 long compat_get_bitmap(unsigned long *mask, compat_ulong_t __user *umask,
 		       unsigned long bitmap_size)
 {
@@ -714,3 +729,25 @@ long compat_put_bitmap(compat_ulong_t __
 
 	return 0;
 }
+
+asmlinkage int compat_sys_waitid(int which, pid_t pid,
+				 compat_siginfo_t __user *infop, int options)
+{
+  	long ret;
+	siginfo_t ksiginfo;
+	
+	memset(&ksiginfo, 0, sizeof(ksiginfo));
+	ret = sys_waitid(which, pid, &ksiginfo, options);
+
+	if (ret < 0 || ksiginfo.si_signo == 0)
+	  return ret;
+
+	ksiginfo.si_code |= __SI_CHLD;
+	
+	if (compat_copy_siginfo_to_user(infop, &ksiginfo) != 0)
+	  return -EFAULT;
+
+	return 0;
+}
+
+
Index: kernel/compat_signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/compat_signal.c,v
retrieving revision 1.4
diff -u -p -r1.4 compat_signal.c
--- kernel/compat_signal.c	30 Apr 2004 20:07:02 -0000	1.4
+++ kernel/compat_signal.c	27 Sep 2004 03:57:47 -0000
@@ -29,7 +29,6 @@
 #include <asm/siginfo.h>
 
 #ifndef HAVE_ARCH_COMPAT_COPY_SIGINFO_TO_USER
-
 int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, siginfo_t *from)
 {
 	int err;
@@ -52,7 +51,8 @@ int compat_copy_siginfo_to_user(compat_s
         /* Always copy si_signo, si_errno, and si_code */
 	compat_from.si_signo = (compat_int_t)(from->si_signo);
 	compat_from.si_errno = (compat_int_t)(from->si_errno);
-	compat_from.si_code = (compat_int_t)(from->si_code);
+	/* si_code is only a (short) value, remove kernel bits. */
+	compat_from.si_code = (compat_int_t)(from->si_code & 0xffffUL);
         
 	err = __put_user(compat_from.si_signo, &to->si_signo);
 	err |= __put_user(compat_from.si_errno, &to->si_errno);
@@ -129,7 +129,9 @@ int compat_copy_siginfo_to_user(compat_s
 	}
 	return err;
 }
+#endif
 
+#ifndef HAVE_ARCH_COPY_SIGINFO_FROM_USER
 int compat_copy_siginfo_from_user(siginfo_t *to, compat_siginfo_t __user *from)
 {
 	int err;
@@ -202,5 +204,41 @@ int compat_copy_siginfo_from_user(siginf
 	}
 	return err;
 }
+#endif
 
+#ifndef HAVE_ARCH_COPY_SIGEVENT_FROM_USER
+int compat_copy_sigevent_from_user(sigevent_t *to, compat_sigevent_t __user *from)
+{
+	int err;
+	u64 scratch;
+	
+	/* copy sigval_t sigev_value 
+	 	int_t sival_int		(same)
+	 	uptr_t sival_ptr	(32 vs 64)*/
+	err = __get_user(to->sigev_value.sival_int, 
+	    		 &from->sigev_value.sival_int);
+	err |= __get_user(scratch, &from->sigev_value.sival_int);
+	to->sigev_value.sival_ptr = (u64 *)scratch;
+	
+	/* copy int_t sigev_signo 	(same)*/
+	err |= __get_user(to->sigev_signo, &from->sigev_signo);
+	
+	/* copy int_t sigev_notify	(same)*/
+	err |= __get_user(to->sigev_notify, &from->sigev_notify);
+
+	/* never copy _sigev_un padding */
+
+	/* copy int_t _tid 		(same),
+	   good_sigevent() uses this value of */
+	err |= __get_user(to->sigev_notify_thread_id, &from->sigev_notify_thread_id);
+	
+	/* XXX: Do not copy these, they aren't used by
+	   anyone. We would need to distinguish the uses of the union.
+	   copy _sigev_thread
+	  	uptr_t _function	(32 vs 64)
+	  	uptr_t _attribute	(32 vs 64)*/
+	
+	return err;
+}
 #endif
+
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
