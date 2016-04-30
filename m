From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] libseccomp: Add parisc architecture support (v3)
Date: Sat, 30 Apr 2016 22:51:11 +0200
Message-ID: <57251ABF.4080201@gmx.de>
References: <20160213200731.GA18161@ls3530.box> <3673666.V2ZqGazvLY@sifl>
 <56C24911.8000200@gmx.de> <1907254.cBdVSxntFv@sifl>
 <20160409070549.GA5442@ls3530.box>
 <CAHC9VhSseu8kLg0W+Ee0bnOiPSKHfGq-zsq-xmrOfMFozohmZA@mail.gmail.com>
 <571103AD.20500@gmx.de> <20160415151103.GB11180@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 John David Anglin <dave.anglin@bell.net>, libseccomp@googlegroups.com,
 Mike Frysinger <vapier@gentoo.org>
To: Paul Moore <paul@paul-moore.com>
Return-path: <libseccomp+bncBC23VB5X54DBBSNVSS4QKGQE733GABY@googlegroups.com>
In-Reply-To: <20160415151103.GB11180@ls3530.dhcp.wdf.sap.corp>
List-Post: <https://groups.google.com/group/libseccomp/post>, <mailto:libseccomp@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:libseccomp+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/libseccomp
List-Subscribe: <https://groups.google.com/group/libseccomp/subscribe>, <mailto:libseccomp+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+473669215327+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/libseccomp/subscribe>
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul,

On 15.04.2016 17:11, Helge Deller wrote:
> This patch (v3) adds support for the parisc and parisc64 architectures
> to libseccomp.

Linux kernel 4.5.2-1 with full seccomp support for parisc/hppa is
now publically available in debian:
https://buildd.debian.org/status/package.php?p=linux&suite=sid

Any chance to get this patch (v3) applied to the libseccomp git tree now ?

Thanks,
Helge

> I didn't split up the patch, because it's pretty trivial.
> Those parisc-specific files gets added:
>  src/arch-parisc-syscalls.c
>  src/arch-parisc.c
>  src/arch-parisc.h
>  src/arch-parisc64.c
> 
> All other changes are trivial because they simply add parisc-specific
> case statements in variouse switch statements.
> 
> I did ran a "make check" on parisc and all testcases suceeded.
> All live testcases succeed as well when running "./regression -T live".
> 
> The patch applies cleanly to current libseccomp git head.
> 
> Changes between v2 and v1 of this patch:
> - Enabled seccomp mode 2 regression tests on parisc. Kernel support for hppa
>   was added in kernel 4.6-rc1 and backported into the kernel v4.5.2 stable
>   series.
> 
> Changes between v3 and v2 of this patch:
> - Stipped out patch which reports if a check was skipped because valgrind
>   isn't installed.
> - Added tuxcall pseudo syscall for 19-sim-missing_syscalls testcase
> - Added sysmips pseudo syscall for 29-sim-pseudo_syscall testcase
> 
> Thanks,
> Helge
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diffstat:
>  include/seccomp.h.in              |    6 
>  src/Makefile.am                   |    2 
>  src/arch-parisc-syscalls.c        |  424 ++++++++++++++++++++++++++++++++++++++
>  src/arch-parisc.c                 |   22 +
>  src/arch-parisc.h                 |   38 +++
>  src/arch-parisc64.c               |   22 +
>  src/arch-syscall-dump.c           |    5 
>  src/arch.c                        |   13 +
>  src/gen_pfc.c                     |    4 
>  src/python/libseccomp.pxd         |    2 
>  src/python/seccomp.pyx            |    8 
>  tests/26-sim-arch_all_be_basic.c  |    6 
>  tests/26-sim-arch_all_be_basic.py |    2 
>  tests/regression                  |    3 
>  tools/scmp_arch_detect.c          |    6 
>  tools/scmp_bpf_sim.c              |    4 
>  tools/util.c                      |    4 
>  17 files changed, 570 insertions(+), 1 deletion(-)
> 
> diff --git a/include/seccomp.h.in b/include/seccomp.h.in
> index 6bf6751..5b9057f 100644
> --- a/include/seccomp.h.in
> +++ b/include/seccomp.h.in
> @@ -185,6 +185,12 @@ struct scmp_arg_cmp {
>  #define SCMP_ARCH_S390X		AUDIT_ARCH_S390X
>  
>  /**
> + * The PA-RISC hppa architecture tokens
> + */
> +#define SCMP_ARCH_PARISC	AUDIT_ARCH_PARISC
> +#define SCMP_ARCH_PARISC64	AUDIT_ARCH_PARISC64
> +
> +/**
>   * Convert a syscall name into the associated syscall number
>   * @param x the syscall name
>   */
> diff --git a/src/Makefile.am b/src/Makefile.am
> index c2d805e..dcc79d9 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -35,6 +35,8 @@ SOURCES_ALL = \
>  	arch-mips.h arch-mips.c arch-mips-syscalls.c \
>  	arch-mips64.h arch-mips64.c arch-mips64-syscalls.c \
>  	arch-mips64n32.h arch-mips64n32.c arch-mips64n32-syscalls.c \
> +	arch-parisc.h arch-parisc.c arch-parisc-syscalls.c \
> +	arch-parisc64.h arch-parisc64.c \
>  	arch-ppc.h arch-ppc.c arch-ppc-syscalls.c \
>  	arch-ppc64.h arch-ppc64.c arch-ppc64-syscalls.c \
>  	arch-s390.h arch-s390.c arch-s390-syscalls.c \
> diff --git a/src/arch-parisc-syscalls.c b/src/arch-parisc-syscalls.c
> new file mode 100644
> index 0000000..78474e1
> --- /dev/null
> +++ b/src/arch-parisc-syscalls.c
> @@ -0,0 +1,424 @@
> +/*
> + * Copyright 2016
> + * Author: Helge Deller <deller@gmx.de>
> + */
> +
> +#include <string.h>
> +
> +#include <seccomp.h>
> +
> +#include "arch.h"
> +#include "arch-parisc.h"
> +
> +#ifndef __NR_Linux
> +#define __NR_Linux 0
> +#endif
> +
> +/* NOTE: based on Linux 4.3 */
> +const struct arch_syscall_def parisc_syscall_table[] = { \
> +	{ "_llseek",	(__NR_Linux + 140) },
> +	{ "_newselect",	(__NR_Linux + 142) },
> +	{ "_sysctl",	(__NR_Linux + 149) },
> +	{ "accept4",	(__NR_Linux + 320) },
> +	{ "accept",	(__NR_Linux + 35) },
> +	{ "access",	(__NR_Linux + 33) },
> +	{ "acct",	(__NR_Linux + 51) },
> +	{ "acl_get",	(__NR_Linux + 204) },
> +	{ "acl_set",	(__NR_Linux + 205) },
> +	{ "add_key",	(__NR_Linux + 264) },
> +	{ "adjtimex",	(__NR_Linux + 124) },
> +	{ "afs_syscall",	(__NR_Linux + 137) },
> +	{ "alarm",	(__NR_Linux + 27) },
> +	{ "alloc_hugepages",	(__NR_Linux + 220) },
> +	{ "attrctl",	(__NR_Linux + 203) },
> +	{ "bdflush",	(__NR_Linux + 134) },
> +	{ "bind",	(__NR_Linux + 22) },
> +	{ "bpf",	(__NR_Linux + 341) },
> +	{ "brk",	(__NR_Linux + 45) },
> +	{ "capget",	(__NR_Linux + 106) },
> +	{ "capset",	(__NR_Linux + 107) },
> +	{ "chdir",	(__NR_Linux + 12) },
> +	{ "chmod",	(__NR_Linux + 15) },
> +	{ "chown",	(__NR_Linux + 180) },
> +	{ "chroot",	(__NR_Linux + 61) },
> +	{ "clock_adjtime",	(__NR_Linux + 324) },
> +	{ "clock_getres",	(__NR_Linux + 257) },
> +	{ "clock_gettime",	(__NR_Linux + 256) },
> +	{ "clock_nanosleep",	(__NR_Linux + 258) },
> +	{ "clock_settime",	(__NR_Linux + 255) },
> +	{ "clone",	(__NR_Linux + 120) },
> +	{ "close",	(__NR_Linux + 6) },
> +	{ "connect",	(__NR_Linux + 31) },
> +	{ "create_module",	(__NR_Linux + 127) },
> +	{ "creat",	(__NR_Linux + 8) },
> +	{ "delete_module",	(__NR_Linux + 129) },
> +	{ "dup2",	(__NR_Linux + 63) },
> +	{ "dup3",	(__NR_Linux + 312) },
> +	{ "dup",	(__NR_Linux + 41) },
> +	{ "epoll_create1",	(__NR_Linux + 311) },
> +	{ "epoll_create",	(__NR_Linux + 224) },
> +	{ "epoll_ctl",	(__NR_Linux + 225) },
> +	{ "epoll_pwait",	(__NR_Linux + 297) },
> +	{ "epoll_wait",	(__NR_Linux + 226) },
> +	{ "eventfd2",	(__NR_Linux + 310) },
> +	{ "eventfd",	(__NR_Linux + 304) },
> +	{ "execveat",	(__NR_Linux + 342) },
> +	{ "execve",	(__NR_Linux + 11) },
> +	{ "exit_group",	(__NR_Linux + 222) },
> +	{ "exit",	(__NR_Linux + 1) },
> +	{ "faccessat",	(__NR_Linux + 287) },
> +	{ "fadvise64_64",	(__NR_Linux + 236) },
> +	{ "fallocate",	(__NR_Linux + 305) },
> +	{ "fanotify_init",	(__NR_Linux + 322) },
> +	{ "fanotify_mark",	(__NR_Linux + 323) },
> +	{ "fchdir",	(__NR_Linux + 133) },
> +	{ "fchmodat",	(__NR_Linux + 286) },
> +	{ "fchmod",	(__NR_Linux + 94) },
> +	{ "fchownat",	(__NR_Linux + 278) },
> +	{ "fchown",	(__NR_Linux + 95) },
> +	{ "fcntl64",	(__NR_Linux + 202) },
> +	{ "fcntl",	(__NR_Linux + 55) },
> +	{ "fdatasync",	(__NR_Linux + 148) },
> +	{ "fgetxattr",	(__NR_Linux + 243) },
> +	{ "finit_module",	(__NR_Linux + 333) },
> +	{ "flistxattr",	(__NR_Linux + 246) },
> +	{ "flock",	(__NR_Linux + 143) },
> +	{ "fork",	(__NR_Linux + 2) },
> +	{ "free_hugepages",	(__NR_Linux + 221) },
> +	{ "fremovexattr",	(__NR_Linux + 249) },
> +	{ "fsetxattr",	(__NR_Linux + 240) },
> +	{ "fstat64",	(__NR_Linux + 112) },
> +	{ "fstatat64",	(__NR_Linux + 280) },
> +	{ "fstatfs64",	(__NR_Linux + 299) },
> +	{ "fstatfs",	(__NR_Linux + 100) },
> +	{ "fstat",	(__NR_Linux + 28) },
> +	{ "fsync",	(__NR_Linux + 118) },
> +	{ "ftruncate64",	(__NR_Linux + 200) },
> +	{ "ftruncate",	(__NR_Linux + 93) },
> +	{ "futex",	(__NR_Linux + 210) },
> +	{ "futimesat",	(__NR_Linux + 279) },
> +	{ "getcpu",	(__NR_Linux + 296) },
> +	{ "getcwd",	(__NR_Linux + 110) },
> +	{ "getdents64",	(__NR_Linux + 201) },
> +	{ "getdents",	(__NR_Linux + 141) },
> +	{ "getegid",	(__NR_Linux + 50) },
> +	{ "geteuid",	(__NR_Linux + 49) },
> +	{ "getgid",	(__NR_Linux + 47) },
> +	{ "getgroups",	(__NR_Linux + 80) },
> +	{ "getitimer",	(__NR_Linux + 105) },
> +	{ "get_kernel_syms",	(__NR_Linux + 130) },
> +	{ "get_mempolicy",	(__NR_Linux + 261) },
> +	{ "getpeername",	(__NR_Linux + 53) },
> +	{ "getpgid",	(__NR_Linux + 132) },
> +	{ "getpgrp",	(__NR_Linux + 65) },
> +	{ "getpid",	(__NR_Linux + 20) },
> +	{ "getpmsg",	(__NR_Linux + 196) },
> +	{ "getppid",	(__NR_Linux + 64) },
> +	{ "getpriority",	(__NR_Linux + 96) },
> +	{ "getrandom",	(__NR_Linux + 339) },
> +	{ "getresgid",	(__NR_Linux + 171) },
> +	{ "getresuid",	(__NR_Linux + 165) },
> +	{ "getrlimit",	(__NR_Linux + 76) },
> +	{ "get_robust_list",	(__NR_Linux + 290) },
> +	{ "getrusage",	(__NR_Linux + 77) },
> +	{ "getsid",	(__NR_Linux + 147) },
> +	{ "getsockname",	(__NR_Linux + 44) },
> +	{ "getsockopt",	(__NR_Linux + 182) },
> +	{ "get_thread_area",	(__NR_Linux + 214) },
> +	{ "gettid",	(__NR_Linux + 206) },
> +	{ "gettimeofday",	(__NR_Linux + 78) },
> +	{ "getuid",	(__NR_Linux + 24) },
> +	{ "getxattr",	(__NR_Linux + 241) },
> +	{ "init_module",	(__NR_Linux + 128) },
> +	{ "inotify_add_watch",	(__NR_Linux + 270) },
> +	{ "inotify_init1",	(__NR_Linux + 314) },
> +	{ "inotify_init",	(__NR_Linux + 269) },
> +	{ "inotify_rm_watch",	(__NR_Linux + 271) },
> +	{ "io_cancel",	(__NR_Linux + 219) },
> +	{ "ioctl",	(__NR_Linux + 54) },
> +	{ "io_destroy",	(__NR_Linux + 216) },
> +	{ "io_getevents",	(__NR_Linux + 217) },
> +	{ "ioprio_get",	(__NR_Linux + 268) },
> +	{ "ioprio_set",	(__NR_Linux + 267) },
> +	{ "io_setup",	(__NR_Linux + 215) },
> +	{ "io_submit",	(__NR_Linux + 218) },
> +	{ "kcmp",	(__NR_Linux + 332) },
> +	{ "kexec_load",	(__NR_Linux + 300) },
> +	{ "keyctl",	(__NR_Linux + 266) },
> +	{ "kill",	(__NR_Linux + 37) },
> +	{ "lchown",	(__NR_Linux + 16) },
> +	{ "lgetxattr",	(__NR_Linux + 242) },
> +	{ "linkat",	(__NR_Linux + 283) },
> +	{ "link",	(__NR_Linux + 9) },
> +	{ "listen",	(__NR_Linux + 32) },
> +	{ "listxattr",	(__NR_Linux + 244) },
> +	{ "llistxattr",	(__NR_Linux + 245) },
> +	{ "lookup_dcookie",	(__NR_Linux + 223) },
> +	{ "lremovexattr",	(__NR_Linux + 248) },
> +	{ "lseek",	(__NR_Linux + 19) },
> +	{ "lsetxattr",	(__NR_Linux + 239) },
> +	{ "lstat64",	(__NR_Linux + 198) },
> +	{ "lstat",	(__NR_Linux + 84) },
> +	{ "madvise",	(__NR_Linux + 119) },
> +	{ "mbind",	(__NR_Linux + 260) },
> +	{ "memfd_create",	(__NR_Linux + 340) },
> +	{ "migrate_pages",	(__NR_Linux + 272) },
> +	{ "mincore",	(__NR_Linux + 72) },
> +	{ "mkdirat",	(__NR_Linux + 276) },
> +	{ "mkdir",	(__NR_Linux + 39) },
> +	{ "mknodat",	(__NR_Linux + 277) },
> +	{ "mknod",	(__NR_Linux + 14) },
> +	{ "mlockall",	(__NR_Linux + 152) },
> +	{ "mlock",	(__NR_Linux + 150) },
> +	{ "mmap2",	(__NR_Linux + 89) },
> +	{ "mmap",	(__NR_Linux + 90) },
> +	{ "mount",	(__NR_Linux + 21) },
> +	{ "move_pages",	(__NR_Linux + 295) },
> +	{ "mprotect",	(__NR_Linux + 125) },
> +	{ "mq_getsetattr",	(__NR_Linux + 234) },
> +	{ "mq_notify",	(__NR_Linux + 233) },
> +	{ "mq_open",	(__NR_Linux + 229) },
> +	{ "mq_timedreceive",	(__NR_Linux + 232) },
> +	{ "mq_timedsend",	(__NR_Linux + 231) },
> +	{ "mq_unlink",	(__NR_Linux + 230) },
> +	{ "mremap",	(__NR_Linux + 163) },
> +	{ "msgctl",	(__NR_Linux + 191) },
> +	{ "msgget",	(__NR_Linux + 190) },
> +	{ "msgrcv",	(__NR_Linux + 189) },
> +	{ "msgsnd",	(__NR_Linux + 188) },
> +	{ "msync",	(__NR_Linux + 144) },
> +	{ "munlockall",	(__NR_Linux + 153) },
> +	{ "munlock",	(__NR_Linux + 151) },
> +	{ "munmap",	(__NR_Linux + 91) },
> +	{ "name_to_handle_at",	(__NR_Linux + 325) },
> +	{ "nanosleep",	(__NR_Linux + 162) },
> +	{ "nfsservctl",	(__NR_Linux + 169) },
> +	{ "nice",	(__NR_Linux + 34) },
> +	{ "openat",	(__NR_Linux + 275) },
> +	{ "open_by_handle_at",	(__NR_Linux + 326) },
> +	{ "open",	(__NR_Linux + 5) },
> +	{ "pause",	(__NR_Linux + 29) },
> +	{ "perf_event_open",	(__NR_Linux + 318) },
> +	{ "personality",	(__NR_Linux + 136) },
> +	{ "pipe2",	(__NR_Linux + 313) },
> +	{ "pipe",	(__NR_Linux + 42) },
> +	{ "pivot_root",	(__NR_Linux + 67) },
> +	{ "poll",	(__NR_Linux + 168) },
> +	{ "ppoll",	(__NR_Linux + 274) },
> +	{ "prctl",	(__NR_Linux + 172) },
> +	{ "pread64",	(__NR_Linux + 108) },
> +	{ "preadv",	(__NR_Linux + 315) },
> +	{ "prlimit64",	(__NR_Linux + 321) },
> +	{ "process_vm_readv",	(__NR_Linux + 330) },
> +	{ "process_vm_writev",	(__NR_Linux + 331) },
> +	{ "pselect6",	(__NR_Linux + 273) },
> +	{ "ptrace",	(__NR_Linux + 26) },
> +	{ "putpmsg",	(__NR_Linux + 197) },
> +	{ "pwrite64",	(__NR_Linux + 109) },
> +	{ "pwritev",	(__NR_Linux + 316) },
> +	{ "query_module",	(__NR_Linux + 167) },
> +	{ "quotactl",	(__NR_Linux + 131) },
> +	{ "readahead",	(__NR_Linux + 207) },
> +	{ "readlinkat",	(__NR_Linux + 285) },
> +	{ "readlink",	(__NR_Linux + 85) },
> +	{ "read",	(__NR_Linux + 3) },
> +	{ "readv",	(__NR_Linux + 145) },
> +	{ "reboot",	(__NR_Linux + 88) },
> +	{ "recvfrom",	(__NR_Linux + 123) },
> +	{ "recvmmsg",	(__NR_Linux + 319) },
> +	{ "recvmsg",	(__NR_Linux + 184) },
> +	{ "recv",	(__NR_Linux + 98) },
> +	{ "remap_file_pages",	(__NR_Linux + 227) },
> +	{ "removexattr",	(__NR_Linux + 247) },
> +	{ "renameat2",	(__NR_Linux + 337) },
> +	{ "renameat",	(__NR_Linux + 282) },
> +	{ "rename",	(__NR_Linux + 38) },
> +	{ "request_key",	(__NR_Linux + 265) },
> +	{ "restart_syscall",	(__NR_Linux + 0) },
> +	{ "rmdir",	(__NR_Linux + 40) },
> +	{ "rt_sigaction",	(__NR_Linux + 174) },
> +	{ "rt_sigpending",	(__NR_Linux + 176) },
> +	{ "rt_sigprocmask",	(__NR_Linux + 175) },
> +	{ "rt_sigqueueinfo",	(__NR_Linux + 178) },
> +	{ "rt_sigreturn",	(__NR_Linux + 173) },
> +	{ "rt_sigsuspend",	(__NR_Linux + 179) },
> +	{ "rt_sigtimedwait",	(__NR_Linux + 177) },
> +	{ "rt_tgsigqueueinfo",	(__NR_Linux + 317) },
> +	{ "sched_getaffinity",	(__NR_Linux + 212) },
> +	{ "sched_getattr",	(__NR_Linux + 335) },
> +	{ "sched_getparam",	(__NR_Linux + 155) },
> +	{ "sched_get_priority_max",	(__NR_Linux + 159) },
> +	{ "sched_get_priority_min",	(__NR_Linux + 160) },
> +	{ "sched_getscheduler",	(__NR_Linux + 157) },
> +	{ "sched_rr_get_interval",	(__NR_Linux + 161) },
> +	{ "sched_setaffinity",	(__NR_Linux + 211) },
> +	{ "sched_setattr",	(__NR_Linux + 334) },
> +	{ "sched_setparam",	(__NR_Linux + 154) },
> +	{ "sched_setscheduler",	(__NR_Linux + 156) },
> +	{ "sched_yield",	(__NR_Linux + 158) },
> +	{ "seccomp",	(__NR_Linux + 338) },
> +	{ "semctl",	(__NR_Linux + 187) },
> +	{ "semget",	(__NR_Linux + 186) },
> +	{ "semop",	(__NR_Linux + 185) },
> +	{ "semtimedop",	(__NR_Linux + 228) },
> +	{ "sendfile64",	(__NR_Linux + 209) },
> +	{ "sendfile",	(__NR_Linux + 122) },
> +	{ "sendmmsg",	(__NR_Linux + 329) },
> +	{ "sendmsg",	(__NR_Linux + 183) },
> +	{ "send",	(__NR_Linux + 58) },
> +	{ "sendto",	(__NR_Linux + 82) },
> +	{ "setdomainname",	(__NR_Linux + 121) },
> +	{ "setfsgid",	(__NR_Linux + 139) },
> +	{ "setfsuid",	(__NR_Linux + 138) },
> +	{ "setgid",	(__NR_Linux + 46) },
> +	{ "setgroups",	(__NR_Linux + 81) },
> +	{ "sethostname",	(__NR_Linux + 74) },
> +	{ "setitimer",	(__NR_Linux + 104) },
> +	{ "set_mempolicy",	(__NR_Linux + 262) },
> +	{ "setns",	(__NR_Linux + 328) },
> +	{ "setpgid",	(__NR_Linux + 57) },
> +	{ "setpriority",	(__NR_Linux + 97) },
> +	{ "setregid",	(__NR_Linux + 71) },
> +	{ "setresgid",	(__NR_Linux + 170) },
> +	{ "setresuid",	(__NR_Linux + 164) },
> +	{ "setreuid",	(__NR_Linux + 70) },
> +	{ "setrlimit",	(__NR_Linux + 75) },
> +	{ "set_robust_list",	(__NR_Linux + 289) },
> +	{ "setsid",	(__NR_Linux + 66) },
> +	{ "setsockopt",	(__NR_Linux + 181) },
> +	{ "set_thread_area",	(__NR_Linux + 213) },
> +	{ "set_tid_address",	(__NR_Linux + 237) },
> +	{ "settimeofday",	(__NR_Linux + 79) },
> +	{ "setuid",	(__NR_Linux + 23) },
> +	{ "setxattr",	(__NR_Linux + 238) },
> +	{ "sgetmask",	(__NR_Linux + 68) },
> +	{ "shmat",	(__NR_Linux + 192) },
> +	{ "shmctl",	(__NR_Linux + 195) },
> +	{ "shmdt",	(__NR_Linux + 193) },
> +	{ "shmget",	(__NR_Linux + 194) },
> +	{ "shutdown",	(__NR_Linux + 117) },
> +	{ "sigaltstack",	(__NR_Linux + 166) },
> +	{ "signalfd4",	(__NR_Linux + 309) },
> +	{ "signalfd",	(__NR_Linux + 302) },
> +	{ "signal",	(__NR_Linux + 48) },
> +	{ "sigpending",	(__NR_Linux + 73) },
> +	{ "sigprocmask",	(__NR_Linux + 126) },
> +	{ "socket",	(__NR_Linux + 17) },
> +	{ "socketpair",	(__NR_Linux + 56) },
> +	{ "splice",	(__NR_Linux + 291) },
> +	{ "ssetmask",	(__NR_Linux + 69) },
> +	{ "stat64",	(__NR_Linux + 101) },
> +	{ "statfs64",	(__NR_Linux + 298) },
> +	{ "statfs",	(__NR_Linux + 99) },
> +	{ "stat",	(__NR_Linux + 18) },
> +	{ "stime",	(__NR_Linux + 25) },
> +	{ "swapoff",	(__NR_Linux + 115) },
> +	{ "swapon",	(__NR_Linux + 87) },
> +	{ "symlinkat",	(__NR_Linux + 284) },
> +	{ "symlink",	(__NR_Linux + 83) },
> +	{ "sync_file_range",	(__NR_Linux + 292) },
> +	{ "syncfs",	(__NR_Linux + 327) },
> +	{ "sync",	(__NR_Linux + 36) },
> +	{ "sysfs",	(__NR_Linux + 135) },
> +	{ "sysmips",	__PNR_sysmips },
> +	{ "sysinfo",	(__NR_Linux + 116) },
> +	{ "syslog",	(__NR_Linux + 103) },
> +	{ "tee",	(__NR_Linux + 293) },
> +	{ "tgkill",	(__NR_Linux + 259) },
> +	{ "time",	(__NR_Linux + 13) },
> +	{ "timer_create",	(__NR_Linux + 250) },
> +	{ "timer_delete",	(__NR_Linux + 254) },
> +	{ "timerfd_create",	(__NR_Linux + 306) },
> +	{ "timerfd_gettime",	(__NR_Linux + 308) },
> +	{ "timerfd",	(__NR_Linux + 303) },
> +	{ "timerfd_settime",	(__NR_Linux + 307) },
> +	{ "timer_getoverrun",	(__NR_Linux + 253) },
> +	{ "timer_gettime",	(__NR_Linux + 252) },
> +	{ "timer_settime",	(__NR_Linux + 251) },
> +	{ "times",	(__NR_Linux + 43) },
> +	{ "tkill",	(__NR_Linux + 208) },
> +	{ "truncate64",	(__NR_Linux + 199) },
> +	{ "truncate",	(__NR_Linux + 92) },
> +	{ "tuxcall",	__PNR_tuxcall },
> +	{ "umask",	(__NR_Linux + 60) },
> +	{ "umount2",	(__NR_Linux + 52) },
> +	{ "uname",	(__NR_Linux + 59) },
> +	{ "unlinkat",	(__NR_Linux + 281) },
> +	{ "unlink",	(__NR_Linux + 10) },
> +	{ "unshare",	(__NR_Linux + 288) },
> +	{ "uselib",	(__NR_Linux + 86) },
> +	{ "ustat",	(__NR_Linux + 62) },
> +	{ "utime",	(__NR_Linux + 30) },
> +	{ "utimensat",	(__NR_Linux + 301) },
> +	{ "utimes",	(__NR_Linux + 336) },
> +	{ "vfork",	(__NR_Linux + 113) },
> +	{ "vhangup",	(__NR_Linux + 111) },
> +	{ "vmsplice",	(__NR_Linux + 294) },
> +	{ "vserver",	(__NR_Linux + 263) },
> +	{ "wait4",	(__NR_Linux + 114) },
> +	{ "waitid",	(__NR_Linux + 235) },
> +	{ "waitpid",	(__NR_Linux + 7) },
> +	{ "write",	(__NR_Linux + 4) },
> +	{ "writev",	(__NR_Linux + 146) },
> +	{ NULL, __NR_SCMP_ERROR },
> +};
> +
> +/**
> + * Resolve a syscall name to a number
> + * @param name the syscall name
> + *
> + * Resolve the given syscall name to the syscall number using the syscall table.
> + * Returns the syscall number on success, including negative pseudo syscall
> + * numbers; returns __NR_SCMP_ERROR on failure.
> + *
> + */
> +int parisc_syscall_resolve_name(const char *name)
> +{
> +	unsigned int iter;
> +	const struct arch_syscall_def *table = parisc_syscall_table;
> +
> +	/* XXX - plenty of room for future improvement here */
> +	for (iter = 0; table[iter].name != NULL; iter++) {
> +		if (strcmp(name, table[iter].name) == 0)
> +			return table[iter].num;
> +	}
> +
> +	return __NR_SCMP_ERROR;
> +}
> +
> +/**
> + * Resolve a syscall number to a name
> + * @param num the syscall number
> + *
> + * Resolve the given syscall number to the syscall name using the syscall table.
> + * Returns a pointer to the syscall name string on success, including pseudo
> + * syscall names; returns NULL on failure.
> + *
> + */
> +const char *parisc_syscall_resolve_num(int num)
> +{
> +	unsigned int iter;
> +	const struct arch_syscall_def *table = parisc_syscall_table;
> +
> +	/* XXX - plenty of room for future improvement here */
> +	for (iter = 0; table[iter].num != __NR_SCMP_ERROR; iter++) {
> +		if (num == table[iter].num)
> +			return table[iter].name;
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * Iterate through the syscall table and return the syscall name
> + * @param spot the offset into the syscall table
> + *
> + * Return the syscall name at position @spot or NULL on failure.  This function
> + * should only ever be used internally by libseccomp.
> + *
> + */
> +const char *parisc_syscall_iterate_name(unsigned int spot)
> +{
> +	/* XXX - no safety checks here */
> +	return parisc_syscall_table[spot].name;
> +}
> diff --git a/src/arch-parisc.c b/src/arch-parisc.c
> new file mode 100644
> index 0000000..6407f8a
> --- /dev/null
> +++ b/src/arch-parisc.c
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright 2016
> + * Author: Helge Deller <deller@gmx.de>
> + */
> +
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <linux/audit.h>
> +
> +#include "arch.h"
> +#include "arch-parisc.h"
> +
> +const struct arch_def arch_def_parisc = {
> +	.token = SCMP_ARCH_PARISC,
> +	.token_bpf = AUDIT_ARCH_PARISC,
> +	.size = ARCH_SIZE_32,
> +	.endian = ARCH_ENDIAN_BIG,
> +	.syscall_resolve_name = parisc_syscall_resolve_name,
> +	.syscall_resolve_num = parisc_syscall_resolve_num,
> +	.syscall_rewrite = NULL,
> +	.rule_add = NULL,
> +};
> diff --git a/src/arch-parisc.h b/src/arch-parisc.h
> new file mode 100644
> index 0000000..b9fe1df
> --- /dev/null
> +++ b/src/arch-parisc.h
> @@ -0,0 +1,38 @@
> +/**
> + * Enhanced Seccomp PARISC Specific Code
> + *
> + * Copyright (c) 2016 Helge Deller <deller@gmx.de>
> + *
> + */
> +
> +/*
> + * This library is free software; you can redistribute it and/or modify it
> + * under the terms of version 2.1 of the GNU Lesser General Public License as
> + * published by the Free Software Foundation.
> + *
> + * This library is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public License
> + * along with this library; if not, see <http://www.gnu.org/licenses>.
> + */
> +
> +#ifndef _ARCH_PARISC_H
> +#define _ARCH_PARISC_H
> +
> +#include <inttypes.h>
> +
> +#include "arch.h"
> +#include "system.h"
> +
> +extern const struct arch_def arch_def_parisc;
> +extern const struct arch_def arch_def_parisc64;
> +
> +int parisc_syscall_resolve_name(const char *name);
> +const char *parisc_syscall_resolve_num(int num);
> +
> +const char *parisc_syscall_iterate_name(unsigned int spot);
> +
> +#endif
> diff --git a/src/arch-parisc64.c b/src/arch-parisc64.c
> new file mode 100644
> index 0000000..b75a182
> --- /dev/null
> +++ b/src/arch-parisc64.c
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright 2016
> + * Author: Helge Deller <deller@gmx.de>
> +*/
> +
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <linux/audit.h>
> +
> +#include "arch.h"
> +#include "arch-parisc.h"
> +
> +const struct arch_def arch_def_parisc64 = {
> +	.token = SCMP_ARCH_PARISC64,
> +	.token_bpf = AUDIT_ARCH_PARISC64,
> +	.size = ARCH_SIZE_64,
> +	.endian = ARCH_ENDIAN_BIG,
> +	.syscall_resolve_name = parisc_syscall_resolve_name,
> +	.syscall_resolve_num = parisc_syscall_resolve_num,
> +	.syscall_rewrite = NULL,
> +	.rule_add = NULL,
> +};
> diff --git a/src/arch-syscall-dump.c b/src/arch-syscall-dump.c
> index 636fd9a..c95b899 100644
> --- a/src/arch-syscall-dump.c
> +++ b/src/arch-syscall-dump.c
> @@ -38,6 +38,7 @@
>  #include "arch-mips64.h"
>  #include "arch-mips64n32.h"
>  #include "arch-aarch64.h"
> +#include "arch-parisc.h"
>  #include "arch-ppc.h"
>  #include "arch-ppc64.h"
>  #include "arch-s390.h"
> @@ -116,6 +117,10 @@ int main(int argc, char *argv[])
>  		case SCMP_ARCH_MIPSEL64N32:
>  			sys_name = mips64n32_syscall_iterate_name(iter);
>  			break;
> +		case SCMP_ARCH_PARISC:
> +		case SCMP_ARCH_PARISC64:
> +			sys_name = parisc_syscall_iterate_name(iter);
> +			break;
>  		case SCMP_ARCH_PPC:
>  			sys_name = ppc_syscall_iterate_name(iter);
>  			break;
> diff --git a/src/arch.c b/src/arch.c
> index 0f24d1c..f5a898d 100644
> --- a/src/arch.c
> +++ b/src/arch.c
> @@ -38,6 +38,7 @@
>  #include "arch-mips.h"
>  #include "arch-mips64.h"
>  #include "arch-mips64n32.h"
> +#include "arch-parisc.h"
>  #include "arch-ppc.h"
>  #include "arch-ppc64.h"
>  #include "arch-s390.h"
> @@ -79,6 +80,10 @@ const struct arch_def *arch_def_native = &arch_def_mips64n32;
>  #elif __MIPSEL__
>  const struct arch_def *arch_def_native = &arch_def_mipsel64n32;
>  #endif /* _MIPS_SIM_NABI32 */
> +#elif __hppa64__ /* hppa64 must be checked before hppa */
> +const struct arch_def *arch_def_native = &arch_def_parisc64;
> +#elif __hppa__
> +const struct arch_def *arch_def_native = &arch_def_parisc;
>  #elif __PPC64__
>  #ifdef __BIG_ENDIAN__
>  const struct arch_def *arch_def_native = &arch_def_ppc64;
> @@ -139,6 +144,10 @@ const struct arch_def *arch_def_lookup(uint32_t token)
>  		return &arch_def_mips64n32;
>  	case SCMP_ARCH_MIPSEL64N32:
>  		return &arch_def_mipsel64n32;
> +	case SCMP_ARCH_PARISC:
> +		return &arch_def_parisc;
> +	case SCMP_ARCH_PARISC64:
> +		return &arch_def_parisc64;
>  	case SCMP_ARCH_PPC:
>  		return &arch_def_ppc;
>  	case SCMP_ARCH_PPC64:
> @@ -185,6 +194,10 @@ const struct arch_def *arch_def_lookup_name(const char *arch_name)
>  		return &arch_def_mips64n32;
>  	else if (strcmp(arch_name, "mipsel64n32") == 0)
>  		return &arch_def_mipsel64n32;
> +	else if (strcmp(arch_name, "parisc64") == 0)
> +		return &arch_def_parisc64;
> +	else if (strcmp(arch_name, "parisc") == 0)
> +		return &arch_def_parisc;
>  	else if (strcmp(arch_name, "ppc") == 0)
>  		return &arch_def_ppc;
>  	else if (strcmp(arch_name, "ppc64") == 0)
> diff --git a/src/gen_pfc.c b/src/gen_pfc.c
> index 99c3297..b9c122e 100644
> --- a/src/gen_pfc.c
> +++ b/src/gen_pfc.c
> @@ -71,6 +71,10 @@ static const char *_pfc_arch(const struct arch_def *arch)
>  		return "mips64n32";
>  	case SCMP_ARCH_MIPSEL64N32:
>  		return "mipsel64n32";
> +	case SCMP_ARCH_PARISC:
> +		return "parisc";
> +	case SCMP_ARCH_PARISC64:
> +		return "parisc64";
>  	case SCMP_ARCH_PPC64:
>  		return "ppc64";
>  	case SCMP_ARCH_PPC64LE:
> diff --git a/src/python/libseccomp.pxd b/src/python/libseccomp.pxd
> index 15c94f8..500da15 100644
> --- a/src/python/libseccomp.pxd
> +++ b/src/python/libseccomp.pxd
> @@ -43,6 +43,8 @@ cdef extern from "seccomp.h":
>          SCMP_ARCH_MIPSEL
>          SCMP_ARCH_MIPSEL64
>          SCMP_ARCH_MIPSEL64N32
> +        SCMP_ARCH_PARISC
> +        SCMP_ARCH_PARISC64
>          SCMP_ARCH_PPC
>          SCMP_ARCH_PPC64
>          SCMP_ARCH_PPC64LE
> diff --git a/src/python/seccomp.pyx b/src/python/seccomp.pyx
> index c87bc3f..cb17642 100644
> --- a/src/python/seccomp.pyx
> +++ b/src/python/seccomp.pyx
> @@ -147,6 +147,8 @@ cdef class Arch:
>      MIPSEL - MIPS little endian O32 ABI
>      MIPSEL64 - MIPS little endian 64-bit ABI
>      MIPSEL64N32 - MIPS little endian N32 ABI
> +    PARISC - 32-bit PA-RISC
> +    PARISC64 - 64-bit PA-RISC
>      PPC64 - 64-bit PowerPC
>      PPC - 32-bit PowerPC
>      """
> @@ -165,6 +167,8 @@ cdef class Arch:
>      MIPSEL = libseccomp.SCMP_ARCH_MIPSEL
>      MIPSEL64 = libseccomp.SCMP_ARCH_MIPSEL64
>      MIPSEL64N32 = libseccomp.SCMP_ARCH_MIPSEL64N32
> +    PARISC = libseccomp.SCMP_ARCH_PARISC
> +    PARISC64 = libseccomp.SCMP_ARCH_PARISC64
>      PPC = libseccomp.SCMP_ARCH_PPC
>      PPC64 = libseccomp.SCMP_ARCH_PPC64
>      PPC64LE = libseccomp.SCMP_ARCH_PPC64LE
> @@ -205,6 +209,10 @@ cdef class Arch:
>                  self._token = libseccomp.SCMP_ARCH_MIPSEL64
>              elif arch == libseccomp.SCMP_ARCH_MIPSEL64N32:
>                  self._token = libseccomp.SCMP_ARCH_MIPSEL64N32
> +            elif arch == libseccomp.SCMP_ARCH_PARISC:
> +                self._token = libseccomp.SCMP_ARCH_PARISC
> +            elif arch == libseccomp.SCMP_ARCH_PARISC64:
> +                self._token = libseccomp.SCMP_ARCH_PARISC64
>              elif arch == libseccomp.SCMP_ARCH_PPC:
>                  self._token = libseccomp.SCMP_ARCH_PPC
>              elif arch == libseccomp.SCMP_ARCH_PPC64:
> diff --git a/tests/26-sim-arch_all_be_basic.c b/tests/26-sim-arch_all_be_basic.c
> index d2c191c..d31ce12 100644
> --- a/tests/26-sim-arch_all_be_basic.c
> +++ b/tests/26-sim-arch_all_be_basic.c
> @@ -52,6 +52,12 @@ int main(int argc, char *argv[])
>  	rc = seccomp_arch_add(ctx, seccomp_arch_resolve_name("mips64n32"));
>  	if (rc != 0)
>  		goto out;
> +	rc = seccomp_arch_add(ctx, seccomp_arch_resolve_name("parisc"));
> +	if (rc != 0)
> +		goto out;
> +	rc = seccomp_arch_add(ctx, seccomp_arch_resolve_name("parisc64"));
> +	if (rc != 0)
> +		goto out;
>  	rc = seccomp_arch_add(ctx, seccomp_arch_resolve_name("ppc"));
>  	if (rc != 0)
>  		goto out;
> diff --git a/tests/26-sim-arch_all_be_basic.py b/tests/26-sim-arch_all_be_basic.py
> index b0b660a..3a177b4 100755
> --- a/tests/26-sim-arch_all_be_basic.py
> +++ b/tests/26-sim-arch_all_be_basic.py
> @@ -33,6 +33,8 @@ def test(args):
>      f.add_arch(Arch("mips"))
>      f.add_arch(Arch("mips64"))
>      f.add_arch(Arch("mips64n32"))
> +    f.add_arch(Arch("parisc"))
> +    f.add_arch(Arch("parisc64"))
>      f.add_arch(Arch("ppc"))
>      f.add_arch(Arch("ppc64"))
>      f.add_arch(Arch("s390"))
> diff --git a/tests/regression b/tests/regression
> index 53d26b2..5949459 100755
> --- a/tests/regression
> +++ b/tests/regression
> @@ -28,6 +28,7 @@ GLBL_ARCH_LE_SUPPORT=" \
>  	ppc64le"
>  GLBL_ARCH_BE_SUPPORT=" \
>  	mips mips64 mips64n32 \
> +	parisc parisc64 \
>  	ppc ppc64 \
>  	s390 s390x"
>  
> @@ -701,7 +702,7 @@ function run_test_live() {
>  
>  	# setup the arch specific return values
>  	case "$arch" in
> -	x86|x86_64|x32|arm|aarch64|ppc|ppc64|ppc64le|ppc|s390|s390x)
> +	x86|x86_64|x32|arm|aarch64|parisc|parisc64|ppc|ppc64|ppc64le|ppc|s390|s390x)
>  		rc_kill=159
>  		rc_allow=160
>  		rc_trap=161
> diff --git a/tools/scmp_arch_detect.c b/tools/scmp_arch_detect.c
> index 4b452d1..ad43f2d 100644
> --- a/tools/scmp_arch_detect.c
> +++ b/tools/scmp_arch_detect.c
> @@ -99,6 +99,12 @@ int main(int argc, char *argv[])
>  		case SCMP_ARCH_MIPSEL64N32:
>  			printf("mipsel64n32\n");
>  			break;
> +		case SCMP_ARCH_PARISC:
> +			printf("parisc\n");
> +			break;
> +		case SCMP_ARCH_PARISC64:
> +			printf("parisc64\n");
> +			break;
>  		case SCMP_ARCH_PPC:
>  			printf("ppc\n");
>  			break;
> diff --git a/tools/scmp_bpf_sim.c b/tools/scmp_bpf_sim.c
> index a0cf6d1..3d3204a 100644
> --- a/tools/scmp_bpf_sim.c
> +++ b/tools/scmp_bpf_sim.c
> @@ -265,6 +265,10 @@ int main(int argc, char *argv[])
>  				arch = AUDIT_ARCH_MIPS64N32;
>  			else if (strcmp(optarg, "mipsel64n32") == 0)
>  				arch = AUDIT_ARCH_MIPSEL64N32;
> +			else if (strcmp(optarg, "parisc") == 0)
> +				arch = AUDIT_ARCH_PARISC;
> +			else if (strcmp(optarg, "parisc64") == 0)
> +				arch = AUDIT_ARCH_PARISC64;
>  			else if (strcmp(optarg, "ppc") == 0)
>  				arch = AUDIT_ARCH_PPC;
>  			else if (strcmp(optarg, "ppc64") == 0)
> diff --git a/tools/util.c b/tools/util.c
> index cc48647..7122335 100644
> --- a/tools/util.c
> +++ b/tools/util.c
> @@ -62,6 +62,10 @@
>  #elif __MIPSEL__
>  #define ARCH_NATIVE		AUDIT_ARCH_MIPSEL64N32
>  #endif /* _MIPS_SIM_NABI32 */
> +#elif __hppa64__
> +#define ARCH_NATIVE		AUDIT_ARCH_PARISC64
> +#elif __hppa__
> +#define ARCH_NATIVE		AUDIT_ARCH_PARISC
>  #elif __PPC64__
>  #ifdef __BIG_ENDIAN__
>  #define ARCH_NATIVE		AUDIT_ARCH_PPC64
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
You received this message because you are subscribed to the Google Groups "libseccomp" group.
To unsubscribe from this group and stop receiving emails from it, send an email to libseccomp+unsubscribe@googlegroups.com.
To post to this group, send email to libseccomp@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
