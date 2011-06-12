From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: eglibc_2.13-5 on hppa
Date: Sun, 12 Jun 2011 14:47:20 -0400
Message-ID: <20110612184719.GA13337@hiauly1.hia.nrc.ca>
References: <20110608013308.GA15282@hiauly1.hia.nrc.ca> <BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 08 Jun 2011, Carlos O'Donell wrote:

> I have a pile of free time next week and I hope to dedicate some time
> to cleaning up the glibc testsuite.
> 
> > Thoughts?
> 
> Yes, the "warning: Unable to find libthread_db matching inferior's
> thread library, thread debugging will not be available." means you
> can't debug threads until you preload the new libc's
> libthread_db.so.1.

This is what I see with libthread_db.so.1 preloaded:

dave@mx3210:~/debian/glibc/eglibc-2.13$ strace /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/rt/tst-cputimer1
execve("/home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/rt/tst-cputimer1", ["/home/dave/debian/glibc/eglibc-2"...], [/* 21 vars */]) = 0
brk(0)                                  = 0x16000
newuname({sys="Linux", node="mx3210", ...}) = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40000000
open("/home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/nptl_db/libthread_db.so.1", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\23\320\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=0, st_size=4294967297000, ...}) = 0
mmap(NULL, 33776, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x403f8000
mmap(0x40400000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x40400000
close(3)                                = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 41129, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40269000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/librt.so.1", O_RDONLY)       = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\33\30\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 34464, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40244000
mmap(0x4024c000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x4024c000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0W|\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40001000
mmap(NULL, 125460, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x407eb000
mmap(0x40807000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c000) = 0x40807000
mmap(0x40808000, 6676, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40808000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\0\350\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 1448056, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40279000
mmap(0x403d2000, 24576, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x159000) = 0x403d2000
mmap(0x403d8000, 10360, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x403d8000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40002000
mprotect(0x40279000, 1413120, PROT_READ|PROT_WRITE) = 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40003000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40006000
mprotect(0x40279000, 1413120, PROT_READ|PROT_EXEC) = 0
munmap(0x40269000, 41129)               = 0
set_tid_address(0x40001ce8, 0xfdffb020, 0xfdffb028, 0xfdffb028, 0x407ef9b0) = 16602
set_robust_list(0x40001cf0, 0xc)        = 0
futex(0xfdffb2c8, FUTEX_WAKE_PRIVATE, 1) = 0
futex(0xfdffb2c8, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 0) = -1 EINVAL (Invalid argument)
rt_sigaction(SIGRTMIN, {0x4080726a, [], SA_SIGINFO}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0x40807272, [], SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=32768*1024, rlim_max=32768*1024}) = 0
clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40001ce8) = 16603
rt_sigaction(SIGALRM, {0x14156, [], SA_RESTART}, {SIG_DFL, [RTMIN RT_1 RT_2 RT_5 RT_8 RT_26], 0}, 8) = 0
alarm(15)                               = 0
clock_gettime returned timespec = { 0, 0 }
clock_getres returned timespec = { 0, 1 }
rt_sigaction(SIGINT, {0x14156, [], SA_RESTART}, {SIG_DFL, [RTMIN RT_1 RT_2 RT_5 RT_8 RT_26], 0}, 8) = 0
waitpid(16603, [{WIFSIGNALED(s) && WTERMSIG(s) == 92 && WCOREDUMP(s)} | 0x4c800], 0) = -512
--- SIGALRM (Alarm clock) @ 0 (0) ---
kill(16603, SIGKILL)                    = 0
waitpid(16603, 0xfdffb748, WNOHANG|WSTOPPED) = 0
nanosleep({0, 100000000}, NULL)         = -516
--- SIGCHLD (Child exited) @ 0 (0) ---
restart_syscall(<... resuming interrupted call ...>) = 0
waitpid(16603, [{WIFSIGNALED(s) && WTERMSIG(s) == SIGKILL}], WNOHANG|WSTOPPED) = 16603
write(2, "Timed out: killed the child proc"..., 36Timed out: killed the child process
) = 36
exit_group(1)                           = ?

There seems to be a problem with this futex call:
futex(0xfdffb2c8, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 0) =
-1 EINVAL (Invalid argument)

and the clock_gettime return seems wierd.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
