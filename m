Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78D516135
	for <parisc-linux@parisc-linux.org>; Wed,  5 Dec 2001 10:58:59 -0700 (MST)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA24666
	for <parisc-linux@parisc-linux.org>; Wed, 5 Dec 2001 10:58:57 -0700
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m16BgJt-000OuYC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Wed, 5 Dec 2001 10:58:57 -0700 (MST)
Message-Id: <m16BgJt-000OuYC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
To: parisc-linux@parisc-linux.org
Date: Wed, 05 Dec 2001 10:58:57 -0700
Subject: [parisc-linux] itimer/ntpdate 64-bit patch
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

The appended patch adds syscall wrappters to fix interval timers on
wide kernels.  This fixes ntpdate, the silent scp status bar, and
maybe (untested) FTP.  Unfortunately 'init' started failing
intermittently.  Sometimes when I boot into init state 1 it works.

The symptom is an infinite loop type 15 fault in init which is
really in ld.so.1.  The last function called is _dl_important_hwcaps.
The interupt instruction doesn't match any in ld.so.1 near the
apparent fault location so that's a mystery.

If I boot with init=/sbin/sash that works and if I exec /sbin/init
from there it works too.

I can't see any obvious connection between a couple of syscall wrappers
and this problem -- maybe someone else will...

	-P

Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/syscall.S,v
retrieving revision 1.73
diff -u -r1.73 syscall.S
--- arch/parisc/kernel/syscall.S	2001/11/30 23:17:25	1.73
+++ arch/parisc/kernel/syscall.S	2001/12/05 17:46:41
@@ -465,8 +465,8 @@
 	ENTRY_SAME(syslog)
 	/* even though manpage says struct timeval contains longs, ours has
 	 * time_t and suseconds_t -- both of which are safe wide/narrow */
-	ENTRY_SAME(setitimer)
-	ENTRY_SAME(getitimer)	/* 105 */
+	ENTRY_DIFF(setitimer)
+	ENTRY_DIFF(getitimer)	/* 105 */
 	ENTRY_SAME(capget)
 	ENTRY_SAME(capset)
 	ENTRY_DIFF(pread)
Index: arch/parisc/kernel/sys_parisc32.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/sys_parisc32.c,v
retrieving revision 1.25
diff -u -r1.25 sys_parisc32.c
--- arch/parisc/kernel/sys_parisc32.c	2001/11/30 23:17:25	1.25
+++ arch/parisc/kernel/sys_parisc32.c	2001/12/05 17:46:42
@@ -668,6 +668,64 @@
     return do_sys_settimeofday(tv ? &ktv : NULL, tz ? &ktz : NULL);
 }
 
+struct	itimerval32 {
+	struct	timeval32 it_interval;	/* timer interval */
+	struct	timeval32 it_value;	/* current value */
+};
+
+asmlinkage long sys32_getitimer(int which, struct itimerval32 *ov32)
+{
+	int error = -EFAULT;
+	struct itimerval get_buffer;
+	extern int do_getitimer(int which, struct itimerval *value);
+
+	if (ov32) {
+		error = do_getitimer(which, &get_buffer);
+		if (!error) {
+			struct itimerval32 gb32;
+			gb32.it_interval.tv_sec = get_buffer.it_interval.tv_sec;
+			gb32.it_interval.tv_usec = get_buffer.it_interval.tv_usec;
+			gb32.it_value.tv_sec = get_buffer.it_value.tv_sec;
+			gb32.it_value.tv_usec = get_buffer.it_value.tv_usec;
+			if (copy_to_user(ov32, &gb32, sizeof(gb32)))
+				error = -EFAULT; 
+		}
+	}
+	return error;
+}
+
+asmlinkage long sys32_setitimer(int which, struct itimerval32 *v32,
+			      struct itimerval32 *ov32)
+{
+	struct itimerval set_buffer, get_buffer;
+	struct itimerval32 sb32, gb32;
+	extern int do_setitimer(int which, struct itimerval *value, struct itimerval *ov32);
+	int error;
+
+	if (v32) {
+		if(copy_from_user(&sb32, v32, sizeof(sb32)))
+			return -EFAULT;
+
+		set_buffer.it_interval.tv_sec = sb32.it_interval.tv_sec;
+		set_buffer.it_interval.tv_usec = sb32.it_interval.tv_usec;
+		set_buffer.it_value.tv_sec = sb32.it_value.tv_sec;
+		set_buffer.it_value.tv_usec = sb32.it_value.tv_usec;
+	} else
+		memset((char *) &set_buffer, 0, sizeof(set_buffer));
+
+	error = do_setitimer(which, &set_buffer, ov32 ? &get_buffer : 0);
+	if (error || !ov32)
+		return error;
+
+	gb32.it_interval.tv_sec = get_buffer.it_interval.tv_sec;
+	gb32.it_interval.tv_usec = get_buffer.it_interval.tv_usec;
+	gb32.it_value.tv_sec = get_buffer.it_value.tv_sec;
+	gb32.it_value.tv_usec = get_buffer.it_value.tv_usec;
+	if (copy_to_user(ov32, &gb32, sizeof(gb32)))
+		return -EFAULT; 
+	return 0;
+}
+
 struct rusage32 {
         struct timeval32 ru_utime;
         struct timeval32 ru_stime;
@@ -923,7 +981,7 @@
 #define ROUND_UP(x,a)	((__typeof__(x))(((unsigned long)(x) + ((a) - 1)) & ~((a) - 1)))
 #define NAME_OFFSET(de) ((int) ((de)->d_name - (char *) (de)))
 static int
-filldir32 (void *__buf, const char *name, int namlen, off_t offset, ino_t ino,
+filldir32 (void *__buf, const char *name, int namlen, loff_t offset, ino_t ino,
 	   unsigned int d_type)
 {
 	struct linux32_dirent * dirent;
@@ -983,7 +1041,7 @@
 }
 
 static int
-fillonedir32 (void * __buf, const char * name, int namlen, off_t offset, ino_t ino,
+fillonedir32 (void * __buf, const char * name, int namlen, loff_t offset, ino_t ino,
 	      unsigned int d_type)
 {
 	struct readdir32_callback * buf = (struct readdir32_callback *) __buf;
