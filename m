From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [RFC] [PATCH] reorganize syscall table
Date: Mon, 28 May 2007 16:52:10 +0200
Message-ID: <200705281652.11079.deller__19667.2594560825$1416624375$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

Hi all,

this patch is modelled after the include/asm-x86_64/unistd.h file.
Basically, the idea is that the compiler can itself find the number of available Linux system calls.
Additionally, this change allows one to modify syscall number and respective function called at the same place.
Third, this change may enable me to further enhance the compile/runtime checking for invalid syscalls and to replace generating the syscall table in C instead of assembly with patches which would follow.

I've tried to do the modifications very carefully (e.g. avoid copy&past, instead use search/replace), and the kernel boots for me into a shell without problems.

Question: What do you think ? Is the patch generally OK ?

Helge

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index d3b7917..c92eee6 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -52,6 +52,19 @@
 
 #define align(x,y) (((x)+FRAME_SIZE+(y)-1) - (((x)+(y)-1)%(y)))
 
+/* calculate __NR_Linux_syscalls */
+#define __NO_STUBS 1
+#undef __SYSCALL_SAME
+#undef _ASM_PARISC_UNISTD_H_
+#define __SYSCALL_SAME(nr,sym) [nr] = 1,
+#define __SYSCALL_DIFF(nr,sym) [nr] = 1,
+#define __SYSCALL_UHOH(nr,sym) [nr] = 1,
+#define __SYSCALL_OURS(nr,sym) [nr] = 1,
+#define __SYSCALL_COMP(nr,sym) [nr] = 1,
+static char syscalls[] = {
+#include <asm/unistd.h>
+};
+
 int main(void)
 {
 	DEFINE(TASK_THREAD_INFO, offsetof(struct task_struct, stack));
@@ -294,6 +307,8 @@ int main(void)
 	DEFINE(ASM_PAGE_SIZE_DIV64, PAGE_SIZE/64);
 	DEFINE(ASM_PAGE_SIZE_DIV128, PAGE_SIZE/128);
 	BLANK();
+	DEFINE(__NR_Linux_syscalls, sizeof(syscalls)-1);
+	BLANK();
 	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
 	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
 	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 4603032..8b0559c 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -198,7 +198,7 @@ linux_gateway_entry:
 	ldil	L%sys_call_table, %r1
 	ldo     R%sys_call_table(%r1), %r19
 #endif	
-	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
+	comiclr,>> __NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 	
 	LDREGX  %r20(%r19), %r19
@@ -309,7 +309,7 @@ tracesys_next:	
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 
-	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
+	comiclr,>> __NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 
 	LDREGX  %r20(%r19), %r19
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 627f3c2..c3b58f4 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -31,385 +31,37 @@
  */
 
 #if defined(CONFIG_64BIT) && !defined(SYSCALL_TABLE_64BIT)
-/* Use ENTRY_SAME for 32-bit syscalls which are the same on wide and
- * narrow palinux.  Use ENTRY_DIFF for those where a 32-bit specific
- * implementation is required on wide palinux.  Use ENTRY_COMP where
+/* Use __SYSCALL_SAME for 32-bit syscalls which are the same on wide and
+ * narrow palinux.  Use __SYSCALL_DIFF for those where a 32-bit specific
+ * implementation is required on wide palinux.  Use __SYSCALL_COMP where
  * the compatability layer has a useful 32-bit implementation.
  */
-#define ENTRY_SAME(_name_) .dword sys_##_name_
-#define ENTRY_DIFF(_name_) .dword sys32_##_name_
-#define ENTRY_UHOH(_name_) .dword sys32_##unimplemented
-#define ENTRY_OURS(_name_) .dword parisc_##_name_
-#define ENTRY_COMP(_name_) .dword compat_sys_##_name_
+#define __SYSCALL_SAME(nr,_name_) .dword sys_##_name_
+#define __SYSCALL_DIFF(nr,_name_) .dword sys32_##_name_
+#define __SYSCALL_UHOH(nr,_name_) .dword sys32_##unimplemented
+#define __SYSCALL_OURS(nr,_name_) .dword parisc_##_name_
+#define __SYSCALL_COMP(nr,_name_) .dword compat_sys_##_name_
 #elif defined(CONFIG_64BIT) && defined(SYSCALL_TABLE_64BIT)
-#define ENTRY_SAME(_name_) .dword sys_##_name_
-#define ENTRY_DIFF(_name_) .dword sys_##_name_
-#define ENTRY_UHOH(_name_) .dword sys_##_name_
-#define ENTRY_OURS(_name_) .dword sys_##_name_
-#define ENTRY_COMP(_name_) .dword sys_##_name_
+#define __SYSCALL_SAME(nr,_name_) .dword sys_##_name_
+#define __SYSCALL_DIFF(nr,_name_) .dword sys_##_name_
+#define __SYSCALL_UHOH(nr,_name_) .dword sys_##_name_
+#define __SYSCALL_OURS(nr,_name_) .dword sys_##_name_
+#define __SYSCALL_COMP(nr,_name_) .dword sys_##_name_
 #else
-#define ENTRY_SAME(_name_) .word sys_##_name_
-#define ENTRY_DIFF(_name_) .word sys_##_name_
-#define ENTRY_UHOH(_name_) .word sys_##_name_
-#define ENTRY_OURS(_name_) .word parisc_##_name_
-#define ENTRY_COMP(_name_) .word sys_##_name_
+#define __SYSCALL_SAME(nr,_name_) .word sys_##_name_
+#define __SYSCALL_DIFF(nr,_name_) .word sys_##_name_
+#define __SYSCALL_UHOH(nr,_name_) .word sys_##_name_
+#define __SYSCALL_OURS(nr,_name_) .word parisc_##_name_
+#define __SYSCALL_COMP(nr,_name_) .word sys_##_name_
 #endif
 
-	ENTRY_SAME(restart_syscall)	/* 0 */
-	ENTRY_SAME(exit)
-	ENTRY_SAME(fork_wrapper)
-	ENTRY_SAME(read)
-	ENTRY_SAME(write)
-	ENTRY_SAME(open)		/* 5 */
-	ENTRY_SAME(close)
-	ENTRY_SAME(waitpid)
-	ENTRY_SAME(creat)
-	ENTRY_SAME(link)
-	ENTRY_SAME(unlink)		/* 10 */
-	ENTRY_DIFF(execve_wrapper)
-	ENTRY_SAME(chdir)
-	/* See comments in kernel/time.c!!! Maybe we don't need this? */
-	ENTRY_COMP(time)
-	ENTRY_SAME(mknod)
-	ENTRY_SAME(chmod)		/* 15 */
-	ENTRY_SAME(lchown)
-	ENTRY_SAME(socket)
-	/* struct stat is MAYBE identical wide and narrow ?? */
-	ENTRY_COMP(newstat)
-	ENTRY_DIFF(lseek)
-	ENTRY_SAME(getpid)		/* 20 */
-	/* the 'void * data' parameter may need re-packing in wide */
-	ENTRY_COMP(mount)
-	/* concerned about struct sockaddr in wide/narrow */
-	/* ---> I think sockaddr is OK unless the compiler packs the struct */
-	/*      differently to align the char array */
-	ENTRY_SAME(bind)
-	ENTRY_SAME(setuid)
-	ENTRY_SAME(getuid)
-	ENTRY_COMP(stime)		/* 25 */
-	ENTRY_SAME(ptrace)
-	ENTRY_SAME(alarm)
-	/* see stat comment */
-	ENTRY_COMP(newfstat)
-	ENTRY_SAME(pause)
-	/* struct utimbuf uses time_t which might vary */
-	ENTRY_COMP(utime)		/* 30 */
-	/* struct sockaddr... */
-	ENTRY_SAME(connect)
-	ENTRY_SAME(listen)
-	ENTRY_SAME(access)
-	ENTRY_SAME(nice)
-	/* struct sockaddr... */
-	ENTRY_SAME(accept)		/* 35 */
-	ENTRY_SAME(sync)
-	ENTRY_SAME(kill)
-	ENTRY_SAME(rename)
-	ENTRY_SAME(mkdir)
-	ENTRY_SAME(rmdir)		/* 40 */
-	ENTRY_SAME(dup)
-	ENTRY_SAME(pipe)
-	ENTRY_COMP(times)
-	/* struct sockaddr... */
-	ENTRY_SAME(getsockname)
-	/* it seems possible brk() could return a >4G pointer... */
-	ENTRY_SAME(brk)			/* 45 */
-	ENTRY_SAME(setgid)
-	ENTRY_SAME(getgid)
-	ENTRY_SAME(signal)
-	ENTRY_SAME(geteuid)
-	ENTRY_SAME(getegid)		/* 50 */
-	ENTRY_SAME(acct)
-	ENTRY_SAME(umount)
-	/* struct sockaddr... */
-	ENTRY_SAME(getpeername)
-	ENTRY_COMP(ioctl)
-	ENTRY_COMP(fcntl)		/* 55 */
-	ENTRY_SAME(socketpair)
-	ENTRY_SAME(setpgid)
-	ENTRY_SAME(send)
-	ENTRY_OURS(newuname)
-	ENTRY_SAME(umask)		/* 60 */
-	ENTRY_SAME(chroot)
-	ENTRY_SAME(ustat)
-	ENTRY_SAME(dup2)
-	ENTRY_SAME(getppid)
-	ENTRY_SAME(getpgrp)		/* 65 */
-	ENTRY_SAME(setsid)
-	ENTRY_SAME(pivot_root)
-	/* I don't like this */
-	ENTRY_UHOH(sgetmask)
-	ENTRY_UHOH(ssetmask)
-	ENTRY_SAME(setreuid)		/* 70 */
-	ENTRY_SAME(setregid)
-	ENTRY_SAME(mincore)
-	ENTRY_COMP(sigpending)
-	ENTRY_SAME(sethostname)
-	/* Following 3 have linux-common-code structs containing longs -( */
-	ENTRY_COMP(setrlimit)		/* 75 */
-	ENTRY_COMP(getrlimit)
-	ENTRY_COMP(getrusage)
-	/* struct timeval and timezone are maybe?? consistent wide and narrow */
-	ENTRY_DIFF(gettimeofday)
-	ENTRY_DIFF(settimeofday)
-	ENTRY_SAME(getgroups)		/* 80 */
-	ENTRY_SAME(setgroups)
-	/* struct socketaddr... */
-	ENTRY_SAME(sendto)
-	ENTRY_SAME(symlink)
-	/* see stat comment */
-	ENTRY_COMP(newlstat)
-	ENTRY_SAME(readlink)		/* 85 */
-	ENTRY_SAME(ni_syscall)	/* was uselib */
-	ENTRY_SAME(swapon)
-	ENTRY_SAME(reboot)
-	ENTRY_SAME(mmap2)
-	ENTRY_SAME(mmap)		/* 90 */
-	ENTRY_SAME(munmap)
-	ENTRY_SAME(truncate)
-	ENTRY_SAME(ftruncate)
-	ENTRY_SAME(fchmod)
-	ENTRY_SAME(fchown)		/* 95 */
-	ENTRY_SAME(getpriority)
-	ENTRY_SAME(setpriority)
-	ENTRY_SAME(recv)
-	ENTRY_COMP(statfs)
-	ENTRY_COMP(fstatfs)		/* 100 */
-	ENTRY_SAME(stat64)
-	ENTRY_SAME(ni_syscall)	/* was socketcall */
-	ENTRY_SAME(syslog)
-	/* even though manpage says struct timeval contains longs, ours has
-	 * time_t and suseconds_t -- both of which are safe wide/narrow */
-	ENTRY_COMP(setitimer)
-	ENTRY_COMP(getitimer)		/* 105 */
-	ENTRY_SAME(capget)
-	ENTRY_SAME(capset)
-	ENTRY_OURS(pread64)
-	ENTRY_OURS(pwrite64)
-	ENTRY_SAME(getcwd)		/* 110 */
-	ENTRY_SAME(vhangup)
-	ENTRY_SAME(fstat64)
-	ENTRY_SAME(vfork_wrapper)
-	/* struct rusage contains longs... */
-	ENTRY_COMP(wait4)
-	ENTRY_SAME(swapoff)		/* 115 */
-	ENTRY_COMP(sysinfo)
-	ENTRY_SAME(shutdown)
-	ENTRY_SAME(fsync)
-	ENTRY_SAME(madvise)
-	ENTRY_SAME(clone_wrapper)	/* 120 */
-	ENTRY_SAME(setdomainname)
-	ENTRY_DIFF(sendfile)
-	/* struct sockaddr... */
-	ENTRY_SAME(recvfrom)
-	/* struct timex contains longs */
-	ENTRY_COMP(adjtimex)
-	ENTRY_SAME(mprotect)		/* 125 */
-	/* old_sigset_t forced to 32 bits.  Beware glibc sigset_t */
-	ENTRY_COMP(sigprocmask)
-	ENTRY_SAME(ni_syscall)	/* create_module */
-	ENTRY_SAME(init_module)
-	ENTRY_SAME(delete_module)
-	ENTRY_SAME(ni_syscall)		/* 130: get_kernel_syms */
-	/* time_t inside struct dqblk */
-	ENTRY_SAME(quotactl)
-	ENTRY_SAME(getpgid)
-	ENTRY_SAME(fchdir)
-	ENTRY_SAME(bdflush)
-	ENTRY_SAME(sysfs)		/* 135 */
-	ENTRY_OURS(personality)
-	ENTRY_SAME(ni_syscall)	/* for afs_syscall */
-	ENTRY_SAME(setfsuid)
-	ENTRY_SAME(setfsgid)
-	/* I think this might work */
-	ENTRY_SAME(llseek)		/* 140 */
-	/* struct linux_dirent has longs, like 'unsigned long d_ino' which
-	 * almost definitely should be 'ino_t d_ino' but it's too late now */
-	ENTRY_DIFF(getdents)
-	/* it is POSSIBLE that select will be OK because even though fd_set
-	 * contains longs, the macros and sizes are clever. */
-	ENTRY_COMP(select)
-	ENTRY_SAME(flock)
-	ENTRY_SAME(msync)
-	/* struct iovec contains pointers */
-	ENTRY_COMP(readv)		/* 145 */
-	ENTRY_COMP(writev)
-	ENTRY_SAME(getsid)
-	ENTRY_SAME(fdatasync)
-	/* struct __sysctl_args is a mess */
-	ENTRY_DIFF(sysctl)
-	ENTRY_SAME(mlock)		/* 150 */
-	ENTRY_SAME(munlock)
-	ENTRY_SAME(mlockall)
-	ENTRY_SAME(munlockall)
-	/* struct sched_param is ok for now */
-	ENTRY_SAME(sched_setparam)
-	ENTRY_SAME(sched_getparam)	/* 155 */
-	ENTRY_SAME(sched_setscheduler)
-	ENTRY_SAME(sched_getscheduler)
-	ENTRY_SAME(sched_yield)
-	ENTRY_SAME(sched_get_priority_max)
-	ENTRY_SAME(sched_get_priority_min)	/* 160 */
-	/* These 2 would've worked if someone had defined struct timespec
-	 * carefully, like timeval for example (which is about the same).
-	 * Unfortunately it contains a long :-( */
-	ENTRY_DIFF(sched_rr_get_interval)
-	ENTRY_COMP(nanosleep)
-	ENTRY_SAME(mremap)
-	ENTRY_SAME(setresuid)
-	ENTRY_SAME(getresuid)		/* 165 */
-	ENTRY_DIFF(sigaltstack_wrapper)
-	ENTRY_SAME(ni_syscall)		/* query_module */
-	ENTRY_SAME(poll)
-	/* structs contain pointers and an in_addr... */
-	ENTRY_COMP(nfsservctl)
-	ENTRY_SAME(setresgid)		/* 170 */
-	ENTRY_SAME(getresgid)
-	ENTRY_SAME(prctl)
-	/* signals need a careful review */
-	ENTRY_SAME(rt_sigreturn_wrapper)
-	ENTRY_DIFF(rt_sigaction)
-	ENTRY_DIFF(rt_sigprocmask)	/* 175 */
-	ENTRY_DIFF(rt_sigpending)
-	ENTRY_COMP(rt_sigtimedwait)
-	/* even though the struct siginfo_t is different, it appears like
-	 * all the paths use values which should be same wide and narrow.
-	 * Also the struct is padded to 128 bytes which means we don't have
-	 * to worry about faulting trying to copy in a larger 64-bit
-	 * struct from a 32-bit user-space app.
-	 */
-	ENTRY_COMP(rt_sigqueueinfo)
-	ENTRY_COMP(rt_sigsuspend)
-	ENTRY_SAME(chown)		/* 180 */
-	/* setsockopt() used by iptables: SO_SET_REPLACE/SO_SET_ADD_COUNTERS */
-	ENTRY_COMP(setsockopt)
-	ENTRY_COMP(getsockopt)
-	ENTRY_COMP(sendmsg)
-	ENTRY_COMP(recvmsg)
-	ENTRY_SAME(semop)		/* 185 */
-	ENTRY_SAME(semget)
-	ENTRY_DIFF(semctl)
-	ENTRY_DIFF(msgsnd)
-	ENTRY_DIFF(msgrcv)
-	ENTRY_SAME(msgget)		/* 190 */
-	ENTRY_SAME(msgctl)
-	ENTRY_SAME(shmat)
-	ENTRY_SAME(shmdt)
-	ENTRY_SAME(shmget)
-	ENTRY_SAME(shmctl)		/* 195 */
-	ENTRY_SAME(ni_syscall)		/* streams1 */
-	ENTRY_SAME(ni_syscall)		/* streams2 */
-	ENTRY_SAME(lstat64)
-	ENTRY_OURS(truncate64)
-	ENTRY_OURS(ftruncate64)		/* 200 */
-	ENTRY_SAME(getdents64)
-	ENTRY_COMP(fcntl64)
-	ENTRY_SAME(ni_syscall)	/* attrctl -- dead */
-	ENTRY_SAME(ni_syscall)	/* acl_get -- dead */
-	ENTRY_SAME(ni_syscall)		/* 205 (acl_set -- dead) */
-	ENTRY_SAME(gettid)
-	ENTRY_OURS(readahead)
-	ENTRY_SAME(tkill)
-	ENTRY_SAME(sendfile64)
-	ENTRY_COMP(futex)		/* 210 */
-	ENTRY_COMP(sched_setaffinity)
-	ENTRY_COMP(sched_getaffinity)
-	ENTRY_SAME(ni_syscall)	/* set_thread_area */
-	ENTRY_SAME(ni_syscall)	/* get_thread_area */
-	ENTRY_SAME(io_setup)		/* 215 */
-	ENTRY_SAME(io_destroy)
-	ENTRY_SAME(io_getevents)
-	ENTRY_SAME(io_submit)
-	ENTRY_SAME(io_cancel)
-	ENTRY_SAME(alloc_hugepages)	/* 220 */
-	ENTRY_SAME(free_hugepages)
-	ENTRY_SAME(exit_group)
-	ENTRY_DIFF(lookup_dcookie)
-	ENTRY_SAME(epoll_create)
-	ENTRY_SAME(epoll_ctl)		/* 225 */
-	ENTRY_SAME(epoll_wait)
- 	ENTRY_SAME(remap_file_pages)
-	ENTRY_SAME(semtimedop)
-	ENTRY_SAME(mq_open)
-	ENTRY_SAME(mq_unlink)		/* 230 */
-	ENTRY_SAME(mq_timedsend)
-	ENTRY_SAME(mq_timedreceive)
-	ENTRY_SAME(mq_notify)
-	ENTRY_SAME(mq_getsetattr)
-	ENTRY_COMP(waitid)		/* 235 */
-	ENTRY_OURS(fadvise64_64)
-	ENTRY_SAME(set_tid_address)
-	ENTRY_SAME(setxattr)
-	ENTRY_SAME(lsetxattr)
-	ENTRY_SAME(fsetxattr)		/* 240 */
-	ENTRY_SAME(getxattr)
-	ENTRY_SAME(lgetxattr)
-	ENTRY_SAME(fgetxattr)
-	ENTRY_SAME(listxattr)
-	ENTRY_SAME(llistxattr)		/* 245 */
-	ENTRY_SAME(flistxattr)
-	ENTRY_SAME(removexattr)
-	ENTRY_SAME(lremovexattr)
-	ENTRY_SAME(fremovexattr)
-	ENTRY_COMP(timer_create)	/* 250 */
-	ENTRY_COMP(timer_settime)
-	ENTRY_COMP(timer_gettime)
-	ENTRY_SAME(timer_getoverrun)
-	ENTRY_SAME(timer_delete)
-	ENTRY_COMP(clock_settime)	/* 255 */
-	ENTRY_COMP(clock_gettime)
-	ENTRY_COMP(clock_getres)
-	ENTRY_COMP(clock_nanosleep)
-	ENTRY_SAME(tgkill)
-	ENTRY_COMP(mbind)		/* 260 */
-	ENTRY_COMP(get_mempolicy)
-	ENTRY_COMP(set_mempolicy)
-	ENTRY_SAME(ni_syscall)	/* 263: reserved for vserver */
-	ENTRY_SAME(add_key)
-	ENTRY_SAME(request_key)		/* 265 */
-	ENTRY_SAME(keyctl)
-	ENTRY_SAME(ioprio_set)
-	ENTRY_SAME(ioprio_get)
-	ENTRY_SAME(inotify_init)
-	ENTRY_SAME(inotify_add_watch)	/* 270 */
-	ENTRY_SAME(inotify_rm_watch)
-	ENTRY_SAME(migrate_pages)
-	ENTRY_COMP(pselect6)
-	ENTRY_COMP(ppoll)
-	ENTRY_COMP(openat)		/* 275 */
-	ENTRY_SAME(mkdirat)
-	ENTRY_SAME(mknodat)
-	ENTRY_SAME(fchownat)
-	ENTRY_COMP(futimesat)
-	ENTRY_SAME(fstatat64)		/* 280 */
-	ENTRY_SAME(unlinkat)
-	ENTRY_SAME(renameat)
-	ENTRY_SAME(linkat)
-	ENTRY_SAME(symlinkat)
-	ENTRY_SAME(readlinkat)		/* 285 */
-	ENTRY_SAME(fchmodat)
-	ENTRY_SAME(faccessat)
-	ENTRY_SAME(unshare)
-	ENTRY_COMP(set_robust_list)
-	ENTRY_COMP(get_robust_list)	/* 290 */
-	ENTRY_SAME(splice)
-	ENTRY_OURS(sync_file_range)
-	ENTRY_SAME(tee)
-	ENTRY_COMP(vmsplice)
-	ENTRY_COMP(move_pages)		/* 295 */
-	ENTRY_SAME(getcpu)
-	ENTRY_SAME(epoll_pwait)
-	ENTRY_COMP(statfs64)
-	ENTRY_COMP(fstatfs64)
-	ENTRY_COMP(kexec_load)		/* 300 */
-	ENTRY_COMP(utimensat)
-	ENTRY_COMP(signalfd)
-	ENTRY_COMP(timerfd)
-	ENTRY_SAME(eventfd)
+/* include syscall table */
+#undef _ASM_PARISC_UNISTD_H_
+#include <asm/unistd.h>
 
-	/* Nothing yet */
 
-#undef ENTRY_SAME
-#undef ENTRY_DIFF
-#undef ENTRY_UHOH
-#undef ENTRY_COMP
-#undef ENTRY_OURS
+#undef __SYSCALL_SAME
+#undef __SYSCALL_DIFF
+#undef __SYSCALL_UHOH
+#undef __SYSCALL_COMP
+#undef __SYSCALL_OURS
diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index f74099b..a64862e 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -5,6 +5,7 @@
  * This file contains the system call numbers.
  */
 
+
 /*
  *   HP-UX system calls get their native numbers for binary compatibility.
  */
@@ -489,322 +490,676 @@
  * from the kernel at startup, which seems a sane strategy.
  */
 
+#ifndef __SYSCALL_SAME
+#define __SYSCALL_SAME(a,b)
+#define __SYSCALL_DIFF(a,b)
+#define __SYSCALL_UHOH(a,b)
+#define __SYSCALL_OURS(a,b)
+#define __SYSCALL_COMP(a,b)
+#endif
+
+
 #define __NR_Linux                0
-#define __NR_restart_syscall      (__NR_Linux + 0)
-#define __NR_exit                 (__NR_Linux + 1)
-#define __NR_fork                 (__NR_Linux + 2)
-#define __NR_read                 (__NR_Linux + 3)
-#define __NR_write                (__NR_Linux + 4)
-#define __NR_open                 (__NR_Linux + 5)
-#define __NR_close                (__NR_Linux + 6)
-#define __NR_waitpid              (__NR_Linux + 7)
-#define __NR_creat                (__NR_Linux + 8)
-#define __NR_link                 (__NR_Linux + 9)
-#define __NR_unlink              (__NR_Linux + 10)
-#define __NR_execve              (__NR_Linux + 11)
-#define __NR_chdir               (__NR_Linux + 12)
-#define __NR_time                (__NR_Linux + 13)
-#define __NR_mknod               (__NR_Linux + 14)
-#define __NR_chmod               (__NR_Linux + 15)
-#define __NR_lchown              (__NR_Linux + 16)
-#define __NR_socket              (__NR_Linux + 17)
-#define __NR_stat                (__NR_Linux + 18)
-#define __NR_lseek               (__NR_Linux + 19)
-#define __NR_getpid              (__NR_Linux + 20)
-#define __NR_mount               (__NR_Linux + 21)
-#define __NR_bind                (__NR_Linux + 22)
-#define __NR_setuid              (__NR_Linux + 23)
-#define __NR_getuid              (__NR_Linux + 24)
-#define __NR_stime               (__NR_Linux + 25)
-#define __NR_ptrace              (__NR_Linux + 26)
-#define __NR_alarm               (__NR_Linux + 27)
-#define __NR_fstat               (__NR_Linux + 28)
-#define __NR_pause               (__NR_Linux + 29)
-#define __NR_utime               (__NR_Linux + 30)
-#define __NR_connect             (__NR_Linux + 31)
-#define __NR_listen              (__NR_Linux + 32)
-#define __NR_access              (__NR_Linux + 33)
-#define __NR_nice                (__NR_Linux + 34)
-#define __NR_accept              (__NR_Linux + 35)
-#define __NR_sync                (__NR_Linux + 36)
-#define __NR_kill                (__NR_Linux + 37)
-#define __NR_rename              (__NR_Linux + 38)
-#define __NR_mkdir               (__NR_Linux + 39)
-#define __NR_rmdir               (__NR_Linux + 40)
-#define __NR_dup                 (__NR_Linux + 41)
-#define __NR_pipe                (__NR_Linux + 42)
-#define __NR_times               (__NR_Linux + 43)
-#define __NR_getsockname         (__NR_Linux + 44)
-#define __NR_brk                 (__NR_Linux + 45)
-#define __NR_setgid              (__NR_Linux + 46)
-#define __NR_getgid              (__NR_Linux + 47)
-#define __NR_signal              (__NR_Linux + 48)
-#define __NR_geteuid             (__NR_Linux + 49)
-#define __NR_getegid             (__NR_Linux + 50)
-#define __NR_acct                (__NR_Linux + 51)
-#define __NR_umount2             (__NR_Linux + 52)
-#define __NR_getpeername         (__NR_Linux + 53)
-#define __NR_ioctl               (__NR_Linux + 54)
-#define __NR_fcntl               (__NR_Linux + 55)
-#define __NR_socketpair          (__NR_Linux + 56)
-#define __NR_setpgid             (__NR_Linux + 57)
-#define __NR_send                (__NR_Linux + 58)
-#define __NR_uname               (__NR_Linux + 59)
-#define __NR_umask               (__NR_Linux + 60)
-#define __NR_chroot              (__NR_Linux + 61)
-#define __NR_ustat               (__NR_Linux + 62)
-#define __NR_dup2                (__NR_Linux + 63)
-#define __NR_getppid             (__NR_Linux + 64)
-#define __NR_getpgrp             (__NR_Linux + 65)
-#define __NR_setsid              (__NR_Linux + 66)
-#define __NR_pivot_root          (__NR_Linux + 67)
-#define __NR_sgetmask            (__NR_Linux + 68)
-#define __NR_ssetmask            (__NR_Linux + 69)
-#define __NR_setreuid            (__NR_Linux + 70)
-#define __NR_setregid            (__NR_Linux + 71)
-#define __NR_mincore             (__NR_Linux + 72)
-#define __NR_sigpending          (__NR_Linux + 73)
-#define __NR_sethostname         (__NR_Linux + 74)
-#define __NR_setrlimit           (__NR_Linux + 75)
-#define __NR_getrlimit           (__NR_Linux + 76)
-#define __NR_getrusage           (__NR_Linux + 77)
-#define __NR_gettimeofday        (__NR_Linux + 78)
-#define __NR_settimeofday        (__NR_Linux + 79)
-#define __NR_getgroups           (__NR_Linux + 80)
-#define __NR_setgroups           (__NR_Linux + 81)
-#define __NR_sendto              (__NR_Linux + 82)
-#define __NR_symlink             (__NR_Linux + 83)
-#define __NR_lstat               (__NR_Linux + 84)
-#define __NR_readlink            (__NR_Linux + 85)
-#define __NR_uselib              (__NR_Linux + 86)
-#define __NR_swapon              (__NR_Linux + 87)
-#define __NR_reboot              (__NR_Linux + 88)
-#define __NR_mmap2             (__NR_Linux + 89)
-#define __NR_mmap                (__NR_Linux + 90)
-#define __NR_munmap              (__NR_Linux + 91)
-#define __NR_truncate            (__NR_Linux + 92)
-#define __NR_ftruncate           (__NR_Linux + 93)
-#define __NR_fchmod              (__NR_Linux + 94)
-#define __NR_fchown              (__NR_Linux + 95)
-#define __NR_getpriority         (__NR_Linux + 96)
-#define __NR_setpriority         (__NR_Linux + 97)
-#define __NR_recv                (__NR_Linux + 98)
-#define __NR_statfs              (__NR_Linux + 99)
-#define __NR_fstatfs            (__NR_Linux + 100)
-#define __NR_stat64           (__NR_Linux + 101)
-/* #define __NR_socketcall         (__NR_Linux + 102) */
-#define __NR_syslog             (__NR_Linux + 103)
-#define __NR_setitimer          (__NR_Linux + 104)
-#define __NR_getitimer          (__NR_Linux + 105)
-#define __NR_capget             (__NR_Linux + 106)
-#define __NR_capset             (__NR_Linux + 107)
-#define __NR_pread64            (__NR_Linux + 108)
-#define __NR_pwrite64           (__NR_Linux + 109)
-#define __NR_getcwd             (__NR_Linux + 110)
-#define __NR_vhangup            (__NR_Linux + 111)
-#define __NR_fstat64            (__NR_Linux + 112)
-#define __NR_vfork              (__NR_Linux + 113)
-#define __NR_wait4              (__NR_Linux + 114)
-#define __NR_swapoff            (__NR_Linux + 115)
-#define __NR_sysinfo            (__NR_Linux + 116)
-#define __NR_shutdown           (__NR_Linux + 117)
-#define __NR_fsync              (__NR_Linux + 118)
-#define __NR_madvise            (__NR_Linux + 119)
-#define __NR_clone              (__NR_Linux + 120)
-#define __NR_setdomainname      (__NR_Linux + 121)
-#define __NR_sendfile           (__NR_Linux + 122)
-#define __NR_recvfrom           (__NR_Linux + 123)
-#define __NR_adjtimex           (__NR_Linux + 124)
-#define __NR_mprotect           (__NR_Linux + 125)
-#define __NR_sigprocmask        (__NR_Linux + 126)
-#define __NR_create_module      (__NR_Linux + 127)
-#define __NR_init_module        (__NR_Linux + 128)
-#define __NR_delete_module      (__NR_Linux + 129)
-#define __NR_get_kernel_syms    (__NR_Linux + 130)
-#define __NR_quotactl           (__NR_Linux + 131)
-#define __NR_getpgid            (__NR_Linux + 132)
-#define __NR_fchdir             (__NR_Linux + 133)
-#define __NR_bdflush            (__NR_Linux + 134)
-#define __NR_sysfs              (__NR_Linux + 135)
-#define __NR_personality        (__NR_Linux + 136)
-#define __NR_afs_syscall        (__NR_Linux + 137) /* Syscall for Andrew File System */
-#define __NR_setfsuid           (__NR_Linux + 138)
-#define __NR_setfsgid           (__NR_Linux + 139)
-#define __NR__llseek            (__NR_Linux + 140)
-#define __NR_getdents           (__NR_Linux + 141)
-#define __NR__newselect         (__NR_Linux + 142)
-#define __NR_flock              (__NR_Linux + 143)
-#define __NR_msync              (__NR_Linux + 144)
-#define __NR_readv              (__NR_Linux + 145)
-#define __NR_writev             (__NR_Linux + 146)
-#define __NR_getsid             (__NR_Linux + 147)
-#define __NR_fdatasync          (__NR_Linux + 148)
-#define __NR__sysctl            (__NR_Linux + 149)
-#define __NR_mlock              (__NR_Linux + 150)
-#define __NR_munlock            (__NR_Linux + 151)
-#define __NR_mlockall           (__NR_Linux + 152)
-#define __NR_munlockall         (__NR_Linux + 153)
-#define __NR_sched_setparam             (__NR_Linux + 154)
-#define __NR_sched_getparam             (__NR_Linux + 155)
-#define __NR_sched_setscheduler         (__NR_Linux + 156)
-#define __NR_sched_getscheduler         (__NR_Linux + 157)
-#define __NR_sched_yield                (__NR_Linux + 158)
-#define __NR_sched_get_priority_max     (__NR_Linux + 159)
-#define __NR_sched_get_priority_min     (__NR_Linux + 160)
-#define __NR_sched_rr_get_interval      (__NR_Linux + 161)
-#define __NR_nanosleep          (__NR_Linux + 162)
-#define __NR_mremap             (__NR_Linux + 163)
-#define __NR_setresuid          (__NR_Linux + 164)
-#define __NR_getresuid          (__NR_Linux + 165)
-#define __NR_sigaltstack        (__NR_Linux + 166)
-#define __NR_query_module       (__NR_Linux + 167)
-#define __NR_poll               (__NR_Linux + 168)
-#define __NR_nfsservctl         (__NR_Linux + 169)
-#define __NR_setresgid          (__NR_Linux + 170)
-#define __NR_getresgid          (__NR_Linux + 171)
-#define __NR_prctl              (__NR_Linux + 172)
-#define __NR_rt_sigreturn       (__NR_Linux + 173)
-#define __NR_rt_sigaction       (__NR_Linux + 174)
-#define __NR_rt_sigprocmask     (__NR_Linux + 175)
-#define __NR_rt_sigpending      (__NR_Linux + 176)
-#define __NR_rt_sigtimedwait    (__NR_Linux + 177)
-#define __NR_rt_sigqueueinfo    (__NR_Linux + 178)
-#define __NR_rt_sigsuspend      (__NR_Linux + 179)
-#define __NR_chown              (__NR_Linux + 180)
-#define __NR_setsockopt         (__NR_Linux + 181)
-#define __NR_getsockopt         (__NR_Linux + 182)
-#define __NR_sendmsg            (__NR_Linux + 183)
-#define __NR_recvmsg            (__NR_Linux + 184)
-#define __NR_semop              (__NR_Linux + 185)
-#define __NR_semget             (__NR_Linux + 186)
-#define __NR_semctl             (__NR_Linux + 187)
-#define __NR_msgsnd             (__NR_Linux + 188)
-#define __NR_msgrcv             (__NR_Linux + 189)
-#define __NR_msgget             (__NR_Linux + 190)
-#define __NR_msgctl             (__NR_Linux + 191)
-#define __NR_shmat              (__NR_Linux + 192)
-#define __NR_shmdt              (__NR_Linux + 193)
-#define __NR_shmget             (__NR_Linux + 194)
-#define __NR_shmctl             (__NR_Linux + 195)
-
-#define __NR_getpmsg		(__NR_Linux + 196) /* Somebody *wants* streams? */
-#define __NR_putpmsg		(__NR_Linux + 197)
-
-#define __NR_lstat64            (__NR_Linux + 198)
-#define __NR_truncate64         (__NR_Linux + 199)
-#define __NR_ftruncate64        (__NR_Linux + 200)
-#define __NR_getdents64         (__NR_Linux + 201)
-#define __NR_fcntl64            (__NR_Linux + 202)
-#define __NR_attrctl            (__NR_Linux + 203)
-#define __NR_acl_get            (__NR_Linux + 204)
-#define __NR_acl_set            (__NR_Linux + 205)
-#define __NR_gettid             (__NR_Linux + 206)
-#define __NR_readahead          (__NR_Linux + 207)
-#define __NR_tkill              (__NR_Linux + 208)
-#define __NR_sendfile64         (__NR_Linux + 209)
-#define __NR_futex              (__NR_Linux + 210)
-#define __NR_sched_setaffinity  (__NR_Linux + 211)
-#define __NR_sched_getaffinity  (__NR_Linux + 212)
-#define __NR_set_thread_area    (__NR_Linux + 213)
-#define __NR_get_thread_area    (__NR_Linux + 214)
-#define __NR_io_setup           (__NR_Linux + 215)
-#define __NR_io_destroy         (__NR_Linux + 216)
-#define __NR_io_getevents       (__NR_Linux + 217)
-#define __NR_io_submit          (__NR_Linux + 218)
-#define __NR_io_cancel          (__NR_Linux + 219)
-#define __NR_alloc_hugepages    (__NR_Linux + 220)
-#define __NR_free_hugepages     (__NR_Linux + 221)
-#define __NR_exit_group         (__NR_Linux + 222)
-#define __NR_lookup_dcookie     (__NR_Linux + 223)
-#define __NR_epoll_create       (__NR_Linux + 224)
-#define __NR_epoll_ctl          (__NR_Linux + 225)
-#define __NR_epoll_wait         (__NR_Linux + 226)
-#define __NR_remap_file_pages   (__NR_Linux + 227)
-#define __NR_semtimedop         (__NR_Linux + 228)
-#define __NR_mq_open            (__NR_Linux + 229)
-#define __NR_mq_unlink          (__NR_Linux + 230)
-#define __NR_mq_timedsend       (__NR_Linux + 231)
-#define __NR_mq_timedreceive    (__NR_Linux + 232)
-#define __NR_mq_notify          (__NR_Linux + 233)
-#define __NR_mq_getsetattr      (__NR_Linux + 234)
-#define __NR_waitid		(__NR_Linux + 235)
-#define __NR_fadvise64_64	(__NR_Linux + 236)
-#define __NR_set_tid_address	(__NR_Linux + 237)
-#define __NR_setxattr		(__NR_Linux + 238)
-#define __NR_lsetxattr		(__NR_Linux + 239)
-#define __NR_fsetxattr		(__NR_Linux + 240)
-#define __NR_getxattr		(__NR_Linux + 241)
-#define __NR_lgetxattr		(__NR_Linux + 242)
-#define __NR_fgetxattr		(__NR_Linux + 243)
-#define __NR_listxattr		(__NR_Linux + 244)
-#define __NR_llistxattr		(__NR_Linux + 245)
-#define __NR_flistxattr		(__NR_Linux + 246)
-#define __NR_removexattr	(__NR_Linux + 247)
-#define __NR_lremovexattr	(__NR_Linux + 248)
-#define __NR_fremovexattr	(__NR_Linux + 249)
-#define __NR_timer_create	(__NR_Linux + 250)
-#define __NR_timer_settime	(__NR_Linux + 251)
-#define __NR_timer_gettime	(__NR_Linux + 252)
-#define __NR_timer_getoverrun	(__NR_Linux + 253)
-#define __NR_timer_delete	(__NR_Linux + 254)
-#define __NR_clock_settime	(__NR_Linux + 255)
-#define __NR_clock_gettime	(__NR_Linux + 256)
-#define __NR_clock_getres	(__NR_Linux + 257)
-#define __NR_clock_nanosleep	(__NR_Linux + 258)
-#define __NR_tgkill		(__NR_Linux + 259)
-#define __NR_mbind		(__NR_Linux + 260)
-#define __NR_get_mempolicy	(__NR_Linux + 261)
-#define __NR_set_mempolicy	(__NR_Linux + 262)
-#define __NR_vserver		(__NR_Linux + 263)
-#define __NR_add_key		(__NR_Linux + 264)
-#define __NR_request_key	(__NR_Linux + 265)
-#define __NR_keyctl		(__NR_Linux + 266)
-#define __NR_ioprio_set		(__NR_Linux + 267)
-#define __NR_ioprio_get		(__NR_Linux + 268)
-#define __NR_inotify_init	(__NR_Linux + 269)
-#define __NR_inotify_add_watch	(__NR_Linux + 270)
-#define __NR_inotify_rm_watch	(__NR_Linux + 271)
-#define __NR_migrate_pages	(__NR_Linux + 272)
-#define __NR_pselect6		(__NR_Linux + 273)
-#define __NR_ppoll		(__NR_Linux + 274)
-#define __NR_openat		(__NR_Linux + 275)
-#define __NR_mkdirat		(__NR_Linux + 276)
-#define __NR_mknodat		(__NR_Linux + 277)
-#define __NR_fchownat		(__NR_Linux + 278)
-#define __NR_futimesat		(__NR_Linux + 279)
-#define __NR_fstatat64		(__NR_Linux + 280)
-#define __NR_unlinkat		(__NR_Linux + 281)
-#define __NR_renameat		(__NR_Linux + 282)
-#define __NR_linkat		(__NR_Linux + 283)
-#define __NR_symlinkat		(__NR_Linux + 284)
-#define __NR_readlinkat		(__NR_Linux + 285)
-#define __NR_fchmodat		(__NR_Linux + 286)
-#define __NR_faccessat		(__NR_Linux + 287)
-#define __NR_unshare		(__NR_Linux + 288)
-#define __NR_set_robust_list	(__NR_Linux + 289)
-#define __NR_get_robust_list	(__NR_Linux + 290)
-#define __NR_splice		(__NR_Linux + 291)
-#define __NR_sync_file_range	(__NR_Linux + 292)
-#define __NR_tee		(__NR_Linux + 293)
-#define __NR_vmsplice		(__NR_Linux + 294)
-#define __NR_move_pages		(__NR_Linux + 295)
-#define __NR_getcpu		(__NR_Linux + 296)
-#define __NR_epoll_pwait	(__NR_Linux + 297)
-#define __NR_statfs64		(__NR_Linux + 298)
-#define __NR_fstatfs64		(__NR_Linux + 299)
-#define __NR_kexec_load		(__NR_Linux + 300)
-#define __NR_utimensat		(__NR_Linux + 301)
-#define __NR_signalfd		(__NR_Linux + 302)
-#define __NR_timerfd		(__NR_Linux + 303)
-#define __NR_eventfd		(__NR_Linux + 304)
 
-#define __NR_Linux_syscalls	(__NR_eventfd + 1)
+#define __NR_restart_syscall		(__NR_Linux + 0)
+__SYSCALL_SAME(__NR_restart_syscall, restart_syscall)
+#define __NR_exit			(__NR_Linux + 1)
+__SYSCALL_SAME(__NR_exit, exit)
+#define __NR_fork			(__NR_Linux + 2)
+__SYSCALL_SAME(__NR_fork, fork_wrapper)
+#define __NR_read			(__NR_Linux + 3)
+__SYSCALL_SAME(__NR_read, read)
+#define __NR_write			(__NR_Linux + 4)
+__SYSCALL_SAME(__NR_write, write)
+#define __NR_open			(__NR_Linux + 5)
+__SYSCALL_SAME(__NR_open, open)
+#define __NR_close			(__NR_Linux + 6)
+__SYSCALL_SAME(__NR_close, close)
+#define __NR_waitpid			(__NR_Linux + 7)
+__SYSCALL_SAME(__NR_waitpid, waitpid)
+
+#define __NR_creat			(__NR_Linux + 8)
+__SYSCALL_SAME(__NR_creat, creat)
+#define __NR_link			(__NR_Linux + 9)
+__SYSCALL_SAME(__NR_link, link)
+#define __NR_unlink			(__NR_Linux + 10)
+__SYSCALL_SAME(__NR_unlink, unlink)
+#define __NR_execve			(__NR_Linux + 11)
+__SYSCALL_DIFF(__NR_execve, execve_wrapper)
+#define __NR_chdir			(__NR_Linux + 12)
+__SYSCALL_SAME(__NR_chdir, chdir)
+#define __NR_time			(__NR_Linux + 13)	/* See comments in kernel/time.c!!! Maybe we don't need this? */
+__SYSCALL_COMP(__NR_time, time)
+#define __NR_mknod			(__NR_Linux + 14)
+__SYSCALL_SAME(__NR_mknod, mknod)
+#define __NR_chmod			(__NR_Linux + 15)
+__SYSCALL_SAME(__NR_chmod, chmod)
+
+#define __NR_lchown			(__NR_Linux + 16)
+__SYSCALL_SAME(__NR_lchown, lchown)
+#define __NR_socket			(__NR_Linux + 17)
+__SYSCALL_SAME(__NR_socket, socket)
+#define __NR_stat			(__NR_Linux + 18)	/* struct stat is MAYBE identical wide and narrow ?? */
+__SYSCALL_COMP(__NR_stat, newstat)
+#define __NR_lseek			(__NR_Linux + 19)
+__SYSCALL_DIFF(__NR_lseek, lseek)
+#define __NR_getpid			(__NR_Linux + 20)
+__SYSCALL_SAME(__NR_getpid, getpid)
+#define __NR_mount			(__NR_Linux + 21)	/* the 'void * data' parameter may need re-packing in wide */
+__SYSCALL_COMP(__NR_mount, mount)
+#define __NR_bind			(__NR_Linux + 22)
+__SYSCALL_SAME(__NR_bind, bind)
+#define __NR_setuid			(__NR_Linux + 23)
+__SYSCALL_SAME(__NR_setuid, setuid)
+
+#define __NR_getuid			(__NR_Linux + 24)
+__SYSCALL_SAME(__NR_getuid, getuid)
+#define __NR_stime			(__NR_Linux + 25)
+__SYSCALL_COMP(__NR_stime, stime)
+#define __NR_ptrace			(__NR_Linux + 26)
+__SYSCALL_SAME(__NR_ptrace, ptrace)
+#define __NR_alarm			(__NR_Linux + 27)
+__SYSCALL_SAME(__NR_alarm, alarm)
+#define __NR_fstat			(__NR_Linux + 28)
+__SYSCALL_COMP(__NR_fstat, newfstat)
+#define __NR_pause			(__NR_Linux + 29)
+__SYSCALL_SAME(__NR_pause, pause)
+#define __NR_utime			(__NR_Linux + 30)
+__SYSCALL_COMP(__NR_utime, utime)				/* struct utimbuf uses time_t which might vary */
+#define __NR_connect			(__NR_Linux + 31)
+__SYSCALL_SAME(__NR_connect, connect)
+
+#define __NR_listen			(__NR_Linux + 32)
+__SYSCALL_SAME(__NR_listen, listen)
+#define __NR_access			(__NR_Linux + 33)
+__SYSCALL_SAME(__NR_access, access)
+#define __NR_nice			(__NR_Linux + 34)
+__SYSCALL_SAME(__NR_nice, nice)
+#define __NR_accept			(__NR_Linux + 35)
+__SYSCALL_SAME(__NR_accept, accept)
+#define __NR_sync			(__NR_Linux + 36)
+__SYSCALL_SAME(__NR_sync, sync)
+#define __NR_kill			(__NR_Linux + 37)
+__SYSCALL_SAME(__NR_kill, kill)
+#define __NR_rename			(__NR_Linux + 38)
+__SYSCALL_SAME(__NR_rename, rename)
+#define __NR_mkdir			(__NR_Linux + 39)
+__SYSCALL_SAME(__NR_mkdir, mkdir)
+
+#define __NR_rmdir			(__NR_Linux + 40)
+__SYSCALL_SAME(__NR_rmdir, rmdir)
+#define __NR_dup			(__NR_Linux + 41)
+__SYSCALL_SAME(__NR_dup, dup)
+#define __NR_pipe			(__NR_Linux + 42)
+__SYSCALL_SAME(__NR_pipe, pipe)
+#define __NR_times			(__NR_Linux + 43)
+__SYSCALL_COMP(__NR_times, times)
+#define __NR_getsockname		(__NR_Linux + 44)
+__SYSCALL_SAME(__NR_getsockname, getsockname)
+#define __NR_brk			(__NR_Linux + 45)
+__SYSCALL_SAME(__NR_brk, brk)
+#define __NR_setgid			(__NR_Linux + 46)
+__SYSCALL_SAME(__NR_setgid, setgid)
+#define __NR_getgid			(__NR_Linux + 47)
+__SYSCALL_SAME(__NR_getgid, getgid)
+
+#define __NR_signal			(__NR_Linux + 48)
+__SYSCALL_SAME(__NR_signal, signal)
+#define __NR_geteuid			(__NR_Linux + 49)
+__SYSCALL_SAME(__NR_geteuid, geteuid)
+#define __NR_getegid			(__NR_Linux + 50)
+__SYSCALL_SAME(__NR_getegid, getegid)
+#define __NR_acct			(__NR_Linux + 51)
+__SYSCALL_SAME(__NR_acct, acct)
+#define __NR_umount2			(__NR_Linux + 52)
+__SYSCALL_SAME(__NR_umount2, umount)
+#define __NR_getpeername		(__NR_Linux + 53)
+__SYSCALL_SAME(__NR_getpeername, getpeername)
+#define __NR_ioctl			(__NR_Linux + 54)
+__SYSCALL_COMP(__NR_ioctl, ioctl)
+#define __NR_fcntl			(__NR_Linux + 55)
+__SYSCALL_COMP(__NR_fcntl, fcntl)
+
+#define __NR_socketpair			(__NR_Linux + 56)
+__SYSCALL_SAME(__NR_socketpair, socketpair)
+#define __NR_setpgid			(__NR_Linux + 57)
+__SYSCALL_SAME(__NR_setpgid, setpgid)
+#define __NR_send			(__NR_Linux + 58)
+__SYSCALL_SAME(__NR_send, send)
+#define __NR_uname			(__NR_Linux + 59)
+__SYSCALL_OURS(__NR_uname, newuname)
+#define __NR_umask			(__NR_Linux + 60)
+__SYSCALL_SAME(__NR_umask, umask)
+#define __NR_chroot			(__NR_Linux + 61)
+__SYSCALL_SAME(__NR_chroot, chroot)
+#define __NR_ustat			(__NR_Linux + 62)
+__SYSCALL_SAME(__NR_ustat, ustat)
+#define __NR_dup2			(__NR_Linux + 63)
+__SYSCALL_SAME(__NR_dup2, dup2)
+
+#define __NR_getppid			(__NR_Linux + 64)
+__SYSCALL_SAME(__NR_getppid, getppid)
+#define __NR_getpgrp			(__NR_Linux + 65)
+__SYSCALL_SAME(__NR_getpgrp, getpgrp)
+#define __NR_setsid			(__NR_Linux + 66)
+__SYSCALL_SAME(__NR_setsid, setsid)
+#define __NR_pivot_root			(__NR_Linux + 67)
+__SYSCALL_SAME(__NR_pivot_root, pivot_root)
+#define __NR_sgetmask			(__NR_Linux + 68)
+__SYSCALL_UHOH(__NR_sgetmask, sgetmask)
+#define __NR_ssetmask			(__NR_Linux + 69)
+__SYSCALL_UHOH(__NR_ssetmask, ssetmask)
+#define __NR_setreuid			(__NR_Linux + 70)
+__SYSCALL_SAME(__NR_setreuid, setreuid)
+#define __NR_setregid			(__NR_Linux + 71)
+__SYSCALL_SAME(__NR_setregid, setregid)
+
+#define __NR_mincore			(__NR_Linux + 72)
+__SYSCALL_SAME(__NR_mincore, mincore)
+#define __NR_sigpending			(__NR_Linux + 73)
+__SYSCALL_COMP(__NR_sigpending, sigpending)
+#define __NR_sethostname		(__NR_Linux + 74)
+__SYSCALL_SAME(__NR_sethostname, sethostname)
+#define __NR_setrlimit			(__NR_Linux + 75)	/* Following 3 have linux-common-code structs containing longs -( */
+__SYSCALL_COMP(__NR_setrlimit, setrlimit)
+#define __NR_getrlimit			(__NR_Linux + 76)
+__SYSCALL_COMP(__NR_getrlimit, getrlimit)
+#define __NR_getrusage			(__NR_Linux + 77)
+__SYSCALL_COMP(__NR_getrusage, getrusage)
+#define __NR_gettimeofday		(__NR_Linux + 78)	/* struct timeval and timezone are maybe?? consistent wide and narrow */
+__SYSCALL_DIFF(__NR_gettimeofday, gettimeofday)
+#define __NR_settimeofday		(__NR_Linux + 79)
+__SYSCALL_DIFF(__NR_settimeofday, settimeofday)
+
+#define __NR_getgroups			(__NR_Linux + 80)
+__SYSCALL_SAME(__NR_getgroups, getgroups)
+#define __NR_setgroups			(__NR_Linux + 81)
+__SYSCALL_SAME(__NR_setgroups, setgroups)
+#define __NR_sendto			(__NR_Linux + 82)
+__SYSCALL_SAME(__NR_sendto, sendto)
+#define __NR_symlink			(__NR_Linux + 83)
+__SYSCALL_SAME(__NR_symlink, symlink)
+#define __NR_lstat			(__NR_Linux + 84)
+__SYSCALL_COMP(__NR_lstat, newlstat)
+#define __NR_readlink			(__NR_Linux + 85)
+__SYSCALL_SAME(__NR_readlink, readlink)
+#define __NR_uselib			(__NR_Linux + 86)	/* uselib -- dead */
+__SYSCALL_SAME(__NR_uselib, ni_syscall)
+#define __NR_swapon			(__NR_Linux + 87)
+__SYSCALL_SAME(__NR_swapon, swapon)
+
+#define __NR_reboot			(__NR_Linux + 88)
+__SYSCALL_SAME(__NR_reboot, reboot)
+#define __NR_mmap2			(__NR_Linux + 89)
+__SYSCALL_SAME(__NR_mmap2, mmap2)
+#define __NR_mmap			(__NR_Linux + 90)
+__SYSCALL_SAME(__NR_mmap, mmap)
+#define __NR_munmap			(__NR_Linux + 91)
+__SYSCALL_SAME(__NR_munmap, munmap)
+#define __NR_truncate			(__NR_Linux + 92)
+__SYSCALL_SAME(__NR_truncate, truncate)
+#define __NR_ftruncate			(__NR_Linux + 93)
+__SYSCALL_SAME(__NR_ftruncate, ftruncate)
+#define __NR_fchmod			(__NR_Linux + 94)
+__SYSCALL_SAME(__NR_fchmod, fchmod)
+#define __NR_fchown			(__NR_Linux + 95)
+__SYSCALL_SAME(__NR_fchown, fchown)
+
+#define __NR_getpriority		(__NR_Linux + 96)
+__SYSCALL_SAME(__NR_getpriority, getpriority)
+#define __NR_setpriority		(__NR_Linux + 97)
+__SYSCALL_SAME(__NR_setpriority, setpriority)
+#define __NR_recv			(__NR_Linux + 98)
+__SYSCALL_SAME(__NR_recv, recv)
+#define __NR_statfs			(__NR_Linux + 99)
+__SYSCALL_COMP(__NR_statfs, statfs)
+#define __NR_fstatfs			(__NR_Linux + 100)
+__SYSCALL_COMP(__NR_fstatfs, fstatfs)
+#define __NR_stat64			(__NR_Linux + 101)
+__SYSCALL_SAME(__NR_stat64, stat64)
+#define __NR_socketcall_IGNORE		(__NR_Linux + 102)	/* socketcall -- dead */
+__SYSCALL_SAME(__NR_socketcall_IGNORE, ni_syscall)
+#define __NR_syslog			(__NR_Linux + 103)
+__SYSCALL_SAME(__NR_syslog, syslog)
+
+#define __NR_setitimer			(__NR_Linux + 104)
+__SYSCALL_COMP(__NR_setitimer, setitimer)
+#define __NR_getitimer			(__NR_Linux + 105)
+__SYSCALL_COMP(__NR_getitimer, getitimer)
+#define __NR_capget			(__NR_Linux + 106)
+__SYSCALL_SAME(__NR_capget, capget)
+#define __NR_capset			(__NR_Linux + 107)
+__SYSCALL_SAME(__NR_capset, capset)
+#define __NR_pread64			(__NR_Linux + 108)
+__SYSCALL_OURS(__NR_pread64, pread64)
+#define __NR_pwrite64			(__NR_Linux + 109)
+__SYSCALL_OURS(__NR_pwrite64, pwrite64)
+#define __NR_getcwd			(__NR_Linux + 110)
+__SYSCALL_SAME(__NR_getcwd, getcwd)
+#define __NR_vhangup			(__NR_Linux + 111)
+__SYSCALL_SAME(__NR_vhangup, vhangup)
+
+#define __NR_fstat64			(__NR_Linux + 112)
+__SYSCALL_SAME(__NR_fstat64, fstat64)
+#define __NR_vfork			(__NR_Linux + 113)
+__SYSCALL_SAME(__NR_vfork, vfork_wrapper)
+#define __NR_wait4			(__NR_Linux + 114)	/* struct rusage contains longs... */
+__SYSCALL_COMP(__NR_wait4, wait4)
+#define __NR_swapoff			(__NR_Linux + 115)
+__SYSCALL_SAME(__NR_swapoff, swapoff)
+#define __NR_sysinfo			(__NR_Linux + 116)
+__SYSCALL_COMP(__NR_sysinfo, sysinfo)
+#define __NR_shutdown			(__NR_Linux + 117)
+__SYSCALL_SAME(__NR_shutdown, shutdown)
+#define __NR_fsync			(__NR_Linux + 118)
+__SYSCALL_SAME(__NR_fsync, fsync)
+#define __NR_madvise			(__NR_Linux + 119)
+__SYSCALL_SAME(__NR_madvise, madvise)
+
+#define __NR_clone			(__NR_Linux + 120)
+__SYSCALL_SAME(__NR_clone, clone_wrapper)
+#define __NR_setdomainname		(__NR_Linux + 121)
+__SYSCALL_SAME(__NR_setdomainname, setdomainname)
+#define __NR_sendfile			(__NR_Linux + 122)
+__SYSCALL_DIFF(__NR_sendfile, sendfile)
+#define __NR_recvfrom			(__NR_Linux + 123)
+__SYSCALL_SAME(__NR_recvfrom, recvfrom)
+#define __NR_adjtimex			(__NR_Linux + 124)
+__SYSCALL_COMP(__NR_adjtimex, adjtimex)
+#define __NR_mprotect			(__NR_Linux + 125)
+__SYSCALL_SAME(__NR_mprotect, mprotect)
+#define __NR_sigprocmask		(__NR_Linux + 126)	/* old_sigset_t forced to 32 bits.  Beware glibc sigset_t */
+__SYSCALL_COMP(__NR_sigprocmask, sigprocmask)
+#define __NR_create_module		(__NR_Linux + 127)	/* create_module -- dead */
+__SYSCALL_SAME(__NR_create_module, ni_syscall)
+
+#define __NR_init_module		(__NR_Linux + 128)
+__SYSCALL_SAME(__NR_init_module, init_module)
+#define __NR_delete_module		(__NR_Linux + 129)
+__SYSCALL_SAME(__NR_delete_module, delete_module)
+#define __NR_get_kernel_syms		(__NR_Linux + 130)	/* get_kernel_syms -- dead */
+__SYSCALL_SAME(__NR_get_kernel_syms, ni_syscall)
+#define __NR_quotactl			(__NR_Linux + 131)
+__SYSCALL_SAME(__NR_quotactl, quotactl)				/* time_t inside struct dqblk */
+#define __NR_getpgid			(__NR_Linux + 132)
+__SYSCALL_SAME(__NR_getpgid, getpgid)
+#define __NR_fchdir			(__NR_Linux + 133)
+__SYSCALL_SAME(__NR_fchdir, fchdir)
+#define __NR_bdflush			(__NR_Linux + 134)
+__SYSCALL_SAME(__NR_bdflush, bdflush)
+#define __NR_sysfs			(__NR_Linux + 135)
+__SYSCALL_SAME(__NR_sysfs, sysfs)
+
+#define __NR_personality		(__NR_Linux + 136)
+__SYSCALL_OURS(__NR_personality, personality)
+#define __NR_afs_syscall		(__NR_Linux + 137)	/* Syscall for Andrew File System */
+__SYSCALL_SAME(__NR_afs_syscall, ni_syscall)
+#define __NR_setfsuid			(__NR_Linux + 138)
+__SYSCALL_SAME(__NR_setfsuid, setfsuid)
+#define __NR_setfsgid			(__NR_Linux + 139)
+__SYSCALL_SAME(__NR_setfsgid, setfsgid)
+#define __NR__llseek			(__NR_Linux + 140)
+__SYSCALL_SAME(__NR__llseek, llseek)
+#define __NR_getdents			(__NR_Linux + 141)	/* struct linux_dirent has longs, like 'unsigned long d_ino' which */
+__SYSCALL_DIFF(__NR_getdents, getdents)			/* almost definitely should be 'ino_t d_ino' but it's too late now */
+#define __NR__newselect			(__NR_Linux + 142)
+__SYSCALL_COMP(__NR__newselect, select)
+#define __NR_flock			(__NR_Linux + 143)
+__SYSCALL_SAME(__NR_flock, flock)
+
+#define __NR_msync			(__NR_Linux + 144)
+__SYSCALL_SAME(__NR_msync, msync)
+#define __NR_readv			(__NR_Linux + 145)	/* struct iovec contains pointers */
+__SYSCALL_COMP(__NR_readv, readv)
+#define __NR_writev			(__NR_Linux + 146)
+__SYSCALL_COMP(__NR_writev, writev)
+#define __NR_getsid			(__NR_Linux + 147)
+__SYSCALL_SAME(__NR_getsid, getsid)
+#define __NR_fdatasync			(__NR_Linux + 148)
+__SYSCALL_SAME(__NR_fdatasync, fdatasync)
+#define __NR__sysctl			(__NR_Linux + 149)	/* struct __sysctl_args is a mess */
+__SYSCALL_DIFF(__NR__sysctl, sysctl)
+#define __NR_mlock			(__NR_Linux + 150)
+__SYSCALL_SAME(__NR_mlock, mlock)
+#define __NR_munlock			(__NR_Linux + 151)
+__SYSCALL_SAME(__NR_munlock, munlock)
+
+#define __NR_mlockall			(__NR_Linux + 152)
+__SYSCALL_SAME(__NR_mlockall, mlockall)
+#define __NR_munlockall			(__NR_Linux + 153)
+__SYSCALL_SAME(__NR_munlockall, munlockall)
+#define __NR_sched_setparam		(__NR_Linux + 154) /* struct sched_param is ok for now */
+__SYSCALL_SAME(__NR_sched_setparam, sched_setparam)
+#define __NR_sched_getparam		(__NR_Linux + 155)
+__SYSCALL_SAME(__NR_sched_getparam, sched_getparam)
+#define __NR_sched_setscheduler		(__NR_Linux + 156)
+__SYSCALL_SAME(__NR_sched_setscheduler, sched_setscheduler)
+#define __NR_sched_getscheduler		(__NR_Linux + 157)
+__SYSCALL_SAME(__NR_sched_getscheduler, sched_getscheduler)
+#define __NR_sched_yield		(__NR_Linux + 158)
+__SYSCALL_SAME(__NR_sched_yield, sched_yield)
+#define __NR_sched_get_priority_max	(__NR_Linux + 159)
+__SYSCALL_SAME(__NR_sched_get_priority_max, sched_get_priority_max)
+
+#define __NR_sched_get_priority_min	(__NR_Linux + 160)
+__SYSCALL_SAME(__NR_sched_get_priority_min, sched_get_priority_min)
+#define __NR_sched_rr_get_interval	(__NR_Linux + 161)
+__SYSCALL_DIFF(__NR_sched_rr_get_interval, sched_rr_get_interval)
+#define __NR_nanosleep			(__NR_Linux + 162)
+__SYSCALL_COMP(__NR_nanosleep, nanosleep)
+#define __NR_mremap			(__NR_Linux + 163)
+__SYSCALL_SAME(__NR_mremap, mremap)
+#define __NR_setresuid			(__NR_Linux + 164)
+__SYSCALL_SAME(__NR_setresuid, setresuid)
+#define __NR_getresuid			(__NR_Linux + 165)
+__SYSCALL_SAME(__NR_getresuid, getresuid)
+#define __NR_sigaltstack		(__NR_Linux + 166)
+__SYSCALL_DIFF(__NR_sigaltstack, sigaltstack_wrapper)
+#define __NR_query_module		(__NR_Linux + 167)	/* query_module -- dead */
+__SYSCALL_SAME(__NR_query_module, ni_syscall)
+
+#define __NR_poll			(__NR_Linux + 168)
+__SYSCALL_SAME(__NR_poll, poll)
+#define __NR_nfsservctl			(__NR_Linux + 169)	/* structs contain pointers and an in_addr... */
+__SYSCALL_COMP(__NR_nfsservctl, nfsservctl)
+#define __NR_setresgid			(__NR_Linux + 170)
+__SYSCALL_SAME(__NR_setresgid, setresgid)
+#define __NR_getresgid			(__NR_Linux + 171)
+__SYSCALL_SAME(__NR_getresgid, getresgid)
+#define __NR_prctl			(__NR_Linux + 172)
+__SYSCALL_SAME(__NR_prctl, prctl)
+#define __NR_rt_sigreturn		(__NR_Linux + 173)	/* signals need a careful review */
+__SYSCALL_SAME(__NR_rt_sigreturn, rt_sigreturn_wrapper)
+#define __NR_rt_sigaction		(__NR_Linux + 174)
+__SYSCALL_DIFF(__NR_rt_sigaction, rt_sigaction)
+#define __NR_rt_sigprocmask		(__NR_Linux + 175)
+__SYSCALL_DIFF(__NR_rt_sigprocmask, rt_sigprocmask)
+
+#define __NR_rt_sigpending		(__NR_Linux + 176)
+__SYSCALL_DIFF(__NR_rt_sigpending, rt_sigpending)
+#define __NR_rt_sigtimedwait		(__NR_Linux + 177)
+__SYSCALL_COMP(__NR_rt_sigtimedwait, rt_sigtimedwait)
+#define __NR_rt_sigqueueinfo		(__NR_Linux + 178)
+__SYSCALL_COMP(__NR_rt_sigqueueinfo, rt_sigqueueinfo)
+#define __NR_rt_sigsuspend		(__NR_Linux + 179)
+__SYSCALL_COMP(__NR_rt_sigsuspend, rt_sigsuspend)
+#define __NR_chown			(__NR_Linux + 180)
+__SYSCALL_SAME(__NR_chown, chown)
+#define __NR_setsockopt			(__NR_Linux + 181)	/* setsockopt() used by iptables: SO_SET_REPLACE/SO_SET_ADD_COUNTERS */
+__SYSCALL_COMP(__NR_setsockopt, setsockopt)
+#define __NR_getsockopt			(__NR_Linux + 182)
+__SYSCALL_COMP(__NR_getsockopt, getsockopt)
+#define __NR_sendmsg			(__NR_Linux + 183)
+__SYSCALL_COMP(__NR_sendmsg, sendmsg)
+
+#define __NR_recvmsg			(__NR_Linux + 184)
+__SYSCALL_COMP(__NR_recvmsg, recvmsg)
+#define __NR_semop			(__NR_Linux + 185)
+__SYSCALL_SAME(__NR_semop, semop)
+#define __NR_semget			(__NR_Linux + 186)
+__SYSCALL_SAME(__NR_semget, semget)
+#define __NR_semctl			(__NR_Linux + 187)
+__SYSCALL_DIFF(__NR_semctl, semctl)
+#define __NR_msgsnd			(__NR_Linux + 188)
+__SYSCALL_DIFF(__NR_msgsnd, msgsnd)
+#define __NR_msgrcv			(__NR_Linux + 189)
+__SYSCALL_DIFF(__NR_msgrcv, msgrcv)
+#define __NR_msgget			(__NR_Linux + 190)
+__SYSCALL_SAME(__NR_msgget, msgget)
+#define __NR_msgctl			(__NR_Linux + 191)
+__SYSCALL_SAME(__NR_msgctl, msgctl)
+
+#define __NR_shmat			(__NR_Linux + 192)
+__SYSCALL_SAME(__NR_shmat, shmat)
+#define __NR_shmdt			(__NR_Linux + 193)
+__SYSCALL_SAME(__NR_shmdt, shmdt)
+#define __NR_shmget			(__NR_Linux + 194)
+__SYSCALL_SAME(__NR_shmget, shmget)
+#define __NR_shmctl			(__NR_Linux + 195)
+__SYSCALL_SAME(__NR_shmctl, shmctl)
+#define __NR_getpmsg			(__NR_Linux + 196)	/* streams1 -- dead */
+__SYSCALL_SAME(__NR_getpmsg, ni_syscall)
+#define __NR_putpmsg			(__NR_Linux + 197)	/* streams2 -- dead */
+__SYSCALL_SAME(__NR_putpmsg, ni_syscall)
+#define __NR_lstat64			(__NR_Linux + 198)
+__SYSCALL_SAME(__NR_lstat64, lstat64)
+#define __NR_truncate64			(__NR_Linux + 199)
+__SYSCALL_OURS(__NR_truncate64, truncate64)
+
+#define __NR_ftruncate64		(__NR_Linux + 200)
+__SYSCALL_OURS(__NR_ftruncate64, ftruncate64)
+#define __NR_getdents64			(__NR_Linux + 201)
+__SYSCALL_SAME(__NR_getdents64, getdents64)
+#define __NR_fcntl64			(__NR_Linux + 202)
+__SYSCALL_COMP(__NR_fcntl64, fcntl64)
+#define __NR_attrctl			(__NR_Linux + 203)	/* attrctl -- dead */
+__SYSCALL_SAME(__NR_attrctl, ni_syscall)
+#define __NR_acl_get			(__NR_Linux + 204)	/* acl_get -- dead */
+__SYSCALL_SAME(__NR_acl_get, ni_syscall)
+#define __NR_acl_set			(__NR_Linux + 205)	/* acl_set -- dead */
+__SYSCALL_SAME(__NR_acl_set, ni_syscall)
+#define __NR_gettid			(__NR_Linux + 206)
+__SYSCALL_SAME(__NR_gettid, gettid)
+#define __NR_readahead			(__NR_Linux + 207)
+__SYSCALL_OURS(__NR_readahead, readahead)
+
+#define __NR_tkill			(__NR_Linux + 208)
+__SYSCALL_SAME(__NR_tkill, tkill)
+#define __NR_sendfile64			(__NR_Linux + 209)
+__SYSCALL_SAME(__NR_sendfile64, sendfile64)
+#define __NR_futex			(__NR_Linux + 210)
+__SYSCALL_COMP(__NR_futex, futex)
+#define __NR_sched_setaffinity		(__NR_Linux + 211)
+__SYSCALL_COMP(__NR_sched_setaffinity, sched_setaffinity)
+#define __NR_sched_getaffinity		(__NR_Linux + 212)
+__SYSCALL_COMP(__NR_sched_getaffinity, sched_getaffinity)
+#define __NR_set_thread_area		(__NR_Linux + 213)	/* set_thread_area */
+__SYSCALL_SAME(__NR_set_thread_area, ni_syscall)
+#define __NR_get_thread_area		(__NR_Linux + 214)	/* get_thread_area */
+__SYSCALL_SAME(__NR_get_thread_area, ni_syscall)
+#define __NR_io_setup			(__NR_Linux + 215)
+__SYSCALL_SAME(__NR_io_setup, io_setup)
+
+#define __NR_io_destroy			(__NR_Linux + 216)
+__SYSCALL_SAME(__NR_io_destroy, io_destroy)
+#define __NR_io_getevents		(__NR_Linux + 217)
+__SYSCALL_SAME(__NR_io_getevents, io_getevents)
+#define __NR_io_submit			(__NR_Linux + 218)
+__SYSCALL_SAME(__NR_io_submit, io_submit)
+#define __NR_io_cancel			(__NR_Linux + 219)
+__SYSCALL_SAME(__NR_io_cancel, io_cancel)
+#define __NR_alloc_hugepages		(__NR_Linux + 220)
+__SYSCALL_SAME(__NR_alloc_hugepages, alloc_hugepages)
+#define __NR_free_hugepages		(__NR_Linux + 221)
+__SYSCALL_SAME(__NR_free_hugepages, free_hugepages)
+#define __NR_exit_group			(__NR_Linux + 222)
+__SYSCALL_SAME(__NR_exit_group, exit_group)
+#define __NR_lookup_dcookie		(__NR_Linux + 223)
+__SYSCALL_DIFF(__NR_lookup_dcookie, lookup_dcookie)
+
+#define __NR_epoll_create		(__NR_Linux + 224)
+__SYSCALL_SAME(__NR_epoll_create, epoll_create)
+#define __NR_epoll_ctl			(__NR_Linux + 225)
+__SYSCALL_SAME(__NR_epoll_ctl, epoll_ctl)
+#define __NR_epoll_wait			(__NR_Linux + 226)
+__SYSCALL_SAME(__NR_epoll_wait, epoll_wait)
+#define __NR_remap_file_pages		(__NR_Linux + 227)
+__SYSCALL_SAME(__NR_remap_file_pages, remap_file_pages)
+#define __NR_semtimedop			(__NR_Linux + 228)
+__SYSCALL_SAME(__NR_semtimedop, semtimedop)
+#define __NR_mq_open			(__NR_Linux + 229)
+__SYSCALL_SAME(__NR_mq_open, mq_open)
+#define __NR_mq_unlink			(__NR_Linux + 230)
+__SYSCALL_SAME(__NR_mq_unlink, mq_unlink)
+#define __NR_mq_timedsend		(__NR_Linux + 231)
+__SYSCALL_SAME(__NR_mq_timedsend, mq_timedsend)
+
+#define __NR_mq_timedreceive		(__NR_Linux + 232)
+__SYSCALL_SAME(__NR_mq_timedreceive, mq_timedreceive)
+#define __NR_mq_notify			(__NR_Linux + 233)
+__SYSCALL_SAME(__NR_mq_notify, mq_notify)
+#define __NR_mq_getsetattr		(__NR_Linux + 234)
+__SYSCALL_SAME(__NR_mq_getsetattr, mq_getsetattr)
+#define __NR_waitid			(__NR_Linux + 235)
+__SYSCALL_COMP(__NR_waitid, waitid)
+#define __NR_fadvise64_64		(__NR_Linux + 236)
+__SYSCALL_OURS(__NR_fadvise64_64, fadvise64_64)
+#define __NR_set_tid_address		(__NR_Linux + 237)
+__SYSCALL_SAME(__NR_set_tid_address, set_tid_address)
+#define __NR_setxattr			(__NR_Linux + 238)
+__SYSCALL_SAME(__NR_setxattr, setxattr)
+#define __NR_lsetxattr			(__NR_Linux + 239)
+__SYSCALL_SAME(__NR_lsetxattr, lsetxattr)
+
+#define __NR_fsetxattr			(__NR_Linux + 240)
+__SYSCALL_SAME(__NR_fsetxattr, fsetxattr)
+#define __NR_getxattr			(__NR_Linux + 241)
+__SYSCALL_SAME(__NR_getxattr, getxattr)
+#define __NR_lgetxattr			(__NR_Linux + 242)
+__SYSCALL_SAME(__NR_lgetxattr, lgetxattr)
+#define __NR_fgetxattr			(__NR_Linux + 243)
+__SYSCALL_SAME(__NR_fgetxattr, fgetxattr)
+#define __NR_listxattr			(__NR_Linux + 244)
+__SYSCALL_SAME(__NR_listxattr, listxattr)
+#define __NR_llistxattr			(__NR_Linux + 245)
+__SYSCALL_SAME(__NR_llistxattr, llistxattr)
+#define __NR_flistxattr			(__NR_Linux + 246)
+__SYSCALL_SAME(__NR_flistxattr, flistxattr)
+#define __NR_removexattr		(__NR_Linux + 247)
+__SYSCALL_SAME(__NR_removexattr, removexattr)
+
+#define __NR_lremovexattr		(__NR_Linux + 248)
+__SYSCALL_SAME(__NR_lremovexattr, lremovexattr)
+#define __NR_fremovexattr		(__NR_Linux + 249)
+__SYSCALL_SAME(__NR_fremovexattr, fremovexattr)
+#define __NR_timer_create		(__NR_Linux + 250)
+__SYSCALL_COMP(__NR_timer_create, timer_create)
+#define __NR_timer_settime		(__NR_Linux + 251)
+__SYSCALL_COMP(__NR_timer_settime, timer_settime)
+#define __NR_timer_gettime		(__NR_Linux + 252)
+__SYSCALL_COMP(__NR_timer_gettime, timer_gettime)
+#define __NR_timer_getoverrun		(__NR_Linux + 253)
+__SYSCALL_SAME(__NR_timer_getoverrun, timer_getoverrun)
+#define __NR_timer_delete		(__NR_Linux + 254)
+__SYSCALL_SAME(__NR_timer_delete, timer_delete)
+#define __NR_clock_settime		(__NR_Linux + 255)
+__SYSCALL_COMP(__NR_clock_settime, clock_settime)
+
+#define __NR_clock_gettime		(__NR_Linux + 256)
+__SYSCALL_COMP(__NR_clock_gettime, clock_gettime)
+#define __NR_clock_getres		(__NR_Linux + 257)
+__SYSCALL_COMP(__NR_clock_getres, clock_getres)
+#define __NR_clock_nanosleep		(__NR_Linux + 258)
+__SYSCALL_COMP(__NR_clock_nanosleep, clock_nanosleep)
+#define __NR_tgkill			(__NR_Linux + 259)
+__SYSCALL_SAME(__NR_tgkill, tgkill)
+#define __NR_mbind			(__NR_Linux + 260)
+__SYSCALL_COMP(__NR_mbind, mbind)
+#define __NR_get_mempolicy		(__NR_Linux + 261)
+__SYSCALL_COMP(__NR_get_mempolicy, get_mempolicy)
+#define __NR_set_mempolicy		(__NR_Linux + 262)
+__SYSCALL_COMP(__NR_set_mempolicy, set_mempolicy)
+#define __NR_vserver			(__NR_Linux + 263)	/* reserved for vserver */
+__SYSCALL_SAME(__NR_vserver, ni_syscall)
+
+#define __NR_add_key			(__NR_Linux + 264)
+__SYSCALL_SAME(__NR_add_key, add_key)
+#define __NR_request_key		(__NR_Linux + 265)
+__SYSCALL_SAME(__NR_request_key, request_key)
+#define __NR_keyctl			(__NR_Linux + 266)
+__SYSCALL_SAME(__NR_keyctl, keyctl)
+#define __NR_ioprio_set			(__NR_Linux + 267)
+__SYSCALL_SAME(__NR_ioprio_set, ioprio_set)
+#define __NR_ioprio_get			(__NR_Linux + 268)
+__SYSCALL_SAME(__NR_ioprio_get, ioprio_get)
+#define __NR_inotify_init		(__NR_Linux + 269)
+__SYSCALL_SAME(__NR_inotify_init, inotify_init)
+#define __NR_inotify_add_watch		(__NR_Linux + 270)
+__SYSCALL_SAME(__NR_inotify_add_watch, inotify_add_watch)
+#define __NR_inotify_rm_watch		(__NR_Linux + 271)
+__SYSCALL_SAME(__NR_inotify_rm_watch, inotify_rm_watch)
+
+#define __NR_migrate_pages		(__NR_Linux + 272)
+__SYSCALL_SAME(__NR_migrate_pages, migrate_pages)
+#define __NR_pselect6			(__NR_Linux + 273)
+__SYSCALL_COMP(__NR_pselect6, pselect6)
+#define __NR_ppoll			(__NR_Linux + 274)
+__SYSCALL_COMP(__NR_ppoll, ppoll)
+#define __NR_openat			(__NR_Linux + 275)
+__SYSCALL_COMP(__NR_openat, openat)
+#define __NR_mkdirat			(__NR_Linux + 276)
+__SYSCALL_SAME(__NR_mkdirat, mkdirat)
+#define __NR_mknodat			(__NR_Linux + 277)
+__SYSCALL_SAME(__NR_mknodat, mknodat)
+#define __NR_fchownat			(__NR_Linux + 278)
+__SYSCALL_SAME(__NR_fchownat, fchownat)
+#define __NR_futimesat			(__NR_Linux + 279)
+__SYSCALL_COMP(__NR_futimesat, futimesat)
+
+#define __NR_fstatat64			(__NR_Linux + 280)
+__SYSCALL_SAME(__NR_fstatat64, fstatat64)
+#define __NR_unlinkat			(__NR_Linux + 281)
+__SYSCALL_SAME(__NR_unlinkat, unlinkat)
+#define __NR_renameat			(__NR_Linux + 282)
+__SYSCALL_SAME(__NR_renameat, renameat)
+#define __NR_linkat			(__NR_Linux + 283)
+__SYSCALL_SAME(__NR_linkat, linkat)
+#define __NR_symlinkat			(__NR_Linux + 284)
+__SYSCALL_SAME(__NR_symlinkat, symlinkat)
+#define __NR_readlinkat			(__NR_Linux + 285)
+__SYSCALL_SAME(__NR_readlinkat, readlinkat)
+#define __NR_fchmodat			(__NR_Linux + 286)
+__SYSCALL_SAME(__NR_fchmodat, fchmodat)
+#define __NR_faccessat			(__NR_Linux + 287)
+__SYSCALL_SAME(__NR_faccessat, faccessat)
+
+#define __NR_unshare			(__NR_Linux + 288)
+__SYSCALL_SAME(__NR_unshare, unshare)
+#define __NR_set_robust_list		(__NR_Linux + 289)
+__SYSCALL_COMP(__NR_set_robust_list, set_robust_list)
+#define __NR_get_robust_list		(__NR_Linux + 290)
+__SYSCALL_COMP(__NR_get_robust_list, get_robust_list)
+#define __NR_splice			(__NR_Linux + 291)
+__SYSCALL_SAME(__NR_splice, splice)
+#define __NR_sync_file_range		(__NR_Linux + 292)
+__SYSCALL_OURS(__NR_sync_file_range, sync_file_range)
+#define __NR_tee			(__NR_Linux + 293)
+__SYSCALL_SAME(__NR_tee, tee)
+#define __NR_vmsplice			(__NR_Linux + 294)
+__SYSCALL_COMP(__NR_vmsplice, vmsplice)
+#define __NR_move_pages			(__NR_Linux + 295)
+__SYSCALL_COMP(__NR_move_pages, move_pages)
+
+#define __NR_getcpu			(__NR_Linux + 296)
+__SYSCALL_SAME(__NR_getcpu, getcpu)
+#define __NR_epoll_pwait		(__NR_Linux + 297)
+__SYSCALL_SAME(__NR_epoll_pwait, epoll_pwait)
+#define __NR_statfs64			(__NR_Linux + 298)
+__SYSCALL_COMP(__NR_statfs64, statfs64)
+#define __NR_fstatfs64			(__NR_Linux + 299)
+__SYSCALL_COMP(__NR_fstatfs64, fstatfs64)
+#define __NR_kexec_load			(__NR_Linux + 300)
+__SYSCALL_COMP(__NR_kexec_load, kexec_load)
+#define __NR_utimensat			(__NR_Linux + 301)
+__SYSCALL_COMP(__NR_utimensat, utimensat)
+#define __NR_signalfd			(__NR_Linux + 302)
+__SYSCALL_COMP(__NR_signalfd, signalfd)
+#define __NR_timerfd			(__NR_Linux + 303)
+__SYSCALL_COMP(__NR_timerfd, timerfd)
+
+#define __NR_eventfd			(__NR_Linux + 304)
+__SYSCALL_SAME(__NR_eventfd, eventfd)
 
 
 #define __IGNORE_select		/* newselect */
 #define __IGNORE_fadvise64	/* fadvise64_64 */
 #define __IGNORE_utimes		/* utime */
 
+#undef __SYSCALL_SAME
+#undef __SYSCALL_DIFF
+#undef __SYSCALL_UHOH
+#undef __SYSCALL_OURS
+#undef __SYSCALL_COMP
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
 #define LINUX_GATEWAY_ADDR      0x100
@@ -973,8 +1328,6 @@ type name(type1 arg1, type2 arg2, type3 
 
 #endif /* __ASSEMBLY__ */
 
-#undef STR
