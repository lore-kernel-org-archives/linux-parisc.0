From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] preliminary strace patch
Date: Sun, 12 Aug 2007 23:25:07 +0200
Message-ID: <200708122325.07259.deller__988.725611432706$1416624427$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

I noticed, that strace was pretty much useless/broken, if you use shared memory/ipc calls or the stat64() syscall.

Example:
root@c3000:~# strace df -h / 
[....]
write(1, "Filesystem            Size  Used"..., 55Filesystem            Size  Used Avail Use% Mounted on
) = 55
upeek: ptrace(PTRACE_PEEKUSER,29538,4294967292,0): Input/output error

Below is a patch against strace-4.5.15 source package from sourceforge.
Maybe it's useful to some people here, although it's not cleaned up/correct at all yet.
Feedback/corrections (esp. for the new syscalls >= 295) are welcome, because I only focused on statfs64()/fstatfs64() at this moment.

Helge

--- ./linux/hppa/syscallent.h.org	2006-10-16 03:17:52.000000000 +0200
+++ ./linux/hppa/syscallent.h	2007-08-12 22:47:26.000000000 +0200
@@ -64,7 +64,7 @@
 	{ 4,	TN,	sys_socketpair,		"socketpair"		}, /* 56 */
 	{ 2,	0,	sys_setpgid,		"setpgid"		}, /* 57 */
 	{ 4,	TN,	sys_send,		"send"			}, /* 58 */
-	{ 1,	0,	sys_uname,		"newuname"			}, /* 59 */
+	{ 1,	0,	sys_uname,		"newuname"		}, /* 59 */
 	{ 1,	0,	sys_umask,		"umask"			}, /* 60 */
 	{ 1,	TF,	sys_chroot,		"chroot"		}, /* 61 */
 	{ 2,	0,	sys_ustat,		"ustat"			}, /* 62 */
@@ -222,7 +222,7 @@
 	{ 5,	0,	printargs,		"get_thread_area"	}, /* 214 */
 	{ 2,	0,	sys_io_setup,		"io_setup"		}, /* 215 */
 	{ 1,	0,	sys_io_destroy,		"io_destroy"		}, /* 216 */
-	{ 5,	0,	sys_io_getevents,		"io_getevents"		}, /* 217 */
+	{ 5,	0,	sys_io_getevents,	"io_getevents"		}, /* 217 */
 	{ 3,	0,	sys_io_submit,		"io_submit"		}, /* 218 */
 	{ 4,	0,	sys_io_cancel,		"io_cancel"		}, /* 219 */
 	{ 5,	0,	printargs,		"alloc_hugepages"	}, /* 220 */
@@ -233,11 +233,11 @@
 	{ 4,	TD,	sys_epoll_ctl,		"epoll_ctl"		}, /* 225 */
 	{ 4,	TD,	sys_epoll_wait,		"epoll_wait"		}, /* 226 */
 	{ 5,	0,	printargs,		"remap_file_pages"	}, /* 227 */
-       { 5,    TI,     sys_semtimedop,         "semtimedop"            }, /* 228 */
+	{ 5,    TI,     sys_semtimedop,         "semtimedop"		}, /* 228 */
 	{ 5,	0,	printargs,		"mq_open"		}, /* 229 */
 	{ 5,	0,	printargs,		"mq_unlink"		}, /* 230 */
 	{ 5,	0,	printargs,		"mq_timedsend"		}, /* 231 */
-	{ 5,	0,	printargs,		"mq_timedreceive"		}, /* 232 */
+	{ 5,	0,	printargs,		"mq_timedreceive"	}, /* 232 */
 	{ 5,	0,	printargs,		"mq_notify"		}, /* 233 */
 	{ 5,	0,	printargs,		"mq_getsetattr"		}, /* 234 */
 	{ 4,	0,	printargs,		"waitid"		}, /* 235 */
@@ -300,3 +300,13 @@
 	{ 4,	TD,	printargs,		"sync_file_range"	}, /* 292 */
 	{ 4,	TD,	printargs,		"tee"			}, /* 293 */
 	{ 4,	TD,	printargs,		"vmsplice"		}, /* 294 */
+	{ 4,	0,	printargs,		"move_pages"		}, /* 295 */
+	{ 4,	0,	printargs,		"getcpu"		}, /* 296 */
+	{ 4,	TD,	printargs,		"epoll_pwait"		}, /* 297 */
+	{ 3,	TF,	sys_statfs64,		"statfs64"		}, /* 298 */
+	{ 3,	TD,	sys_fstatfs64,		"fstatfs64"		}, /* 299 */
+	{ 5,	TP,	printargs,		"kexec_load"		}, /* 300 */
+	{ 5,	0,	printargs,		"utimensat"		}, /* 301 */
+	{ 5,	TD,	printargs,		"signalfd"		}, /* 302 */
+	{ 5,	TD,	printargs,		"timerfd"		}, /* 303 */
+	{ 5,	TD,	printargs,		"eventfd"		}, /* 304 */
--- ./ipc.c.org	2007-01-15 21:25:52.000000000 +0100
+++ ./ipc.c	2007-08-12 22:46:43.000000000 +0200
@@ -387,7 +387,7 @@
 		}
 		if (syserror(tcp))
 			return 0;
-#ifdef LINUX
+#if 0 && defined LINUX
 		if (umove(tcp, tcp->u_arg[2], &raddr) < 0)
 			return RVAL_NONE;
 		tcp->u_rval = raddr;

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
