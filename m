Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58278482B
	for <parisc-linux@parisc-linux.org>; Tue, 25 Sep 2001 18:39:17 -0600 (MDT)
Date: Wed, 26 Sep 2001 00:38:11 +0000
From: Richard Allen <ra@hp.is>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Trace/breakpoint trap
Message-ID: <20010926003811.B18261@hp.is>
References: <20010925234225.A18261@hp.is> <ra@hp.is> <20010926001857.1BAF937C8D@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010926001857.1BAF937C8D@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Tue, Sep 25, 2001 at 06:18:57PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 25, 2001 at 06:18:57PM -0600, Matt Taggart wrote:
> 
> Richard Allen writes...
> 
> > Here's a wild one:
> > 
> > bofh:~/rpm-4.0.3/rpmdb# make
> > Trace/breakpoint trap
> > bofh:~/rpm-4.0.3/rpmdb# echo $?
> > 133
> > bofh:~/rpm-4.0.3/rpmdb#
> 
> Try it with strace and post the results. Was anything printed on the console?

The console is on the other side of town.    Will check it tomorrow morning.


execve("/usr/bin/make", ["make"], [/* 17 vars */]) = 0
newuname({sys="Linux", node="bofh", ...}) = 0
brk(0)                                  = 0x44000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 7438, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\300"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
mmap(NULL, 1417616, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002a000
mprotect(0x40167000, 119184, PROT_NONE) = 0
mmap(0x40176000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x13c000) = 0x40176000
mmap(0x40181000, 12688, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
close(3)                                = 0
mprotect(0x10000, 135168, PROT_READ|PROT_WRITE) = 0
mprotect(0x10000, 135168, PROT_READ|PROT_EXEC) = 0
munmap(0x40019000, 7438)                = 0
getpid()                                = 4206
brk(0)                                  = 0x44000
brk(0x44030)                            = 0x44030
brk(0x45000)                            = 0x45000
rt_sigaction(SIGHUP, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGQUIT, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGINT, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTERM, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGXCPU, {0x40c2e, [HUP], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGXFSZ, {0x40c2e, [INT], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGCHLD, {SIG_DFL}, {SIG_DFL}, 8) = 0
getcwd("/root/rpm-4.0.3/rpmdb", 4095)   = 22
stat64("/usr/include", {st_mode=0, st_size=0, ...}) = 0
stat64("/usr/gnu/include", 0xbff01cc8)  = -1 ENOENT (No such file or directory)
stat64("/usr/local/include", {st_mode=0, st_size=50, ...}) = 0
stat64("/usr/include", {st_mode=0, st_size=0, ...}) = 0
rt_sigaction(SIGCHLD, {0x40dae, [], SA_INTERRUPT}, NULL, 8) = 0
rt_sigaction(SIGUSR1, {0x40ace, [], SA_RESTART}, {SIG_DFL}, 8) = 0
brk(0x46000)                            = 0x46000
brk(0x47000)                            = 0x47000
brk(0x48000)                            = 0x48000
stat64(".", {st_mode=0, st_size=9281424328817, ...}) = 0
open(".", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x4a000)                            = 0x4a000
getdents64(0x3, 0x47e70, 0x1000)        = 1096
getdents64(0x3, 0x47e70, 0x1000)        = 0
close(3)                                = 0
open("Makefile", O_RDONLY|O_LARGEFILE)  = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(3, "# Generated automatically from M"..., 4096) = 4096
brk(0x4b000)                            = 0x4b000
read(3, " yes\nVERSION = 4.0.3\nWITH_APIDOC"..., 4096) = 4096
brk(0x4c000)                            = 0x4c000
brk(0x4d000)                            = 0x4d000
read(3, "n-compile:\n\t-rm -f *.o core *.co"..., 4096) = 4096
brk(0x4e000)                            = 0x4e000
brk(0x4f000)                            = 0x4f000
brk(0x50000)                            = 0x50000
brk(0x51000)                            = 0x51000
brk(0x52000)                            = 0x52000
read(3, "og.h \\\n\t../rpmio/rpmerr.h ../lib"..., 4096) = 3537
brk(0x53000)                            = 0x53000
brk(0x54000)                            = 0x54000
brk(0x55000)                            = 0x55000
brk(0x56000)                            = 0x56000
brk(0x57000)                            = 0x57000
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x40019000, 4096)                = 0
stat64("RCS", 0xbff01d88)               = -1 ENOENT (No such file or directory)
stat64("SCCS", 0xbff01d88)              = -1 ENOENT (No such file or directory)
stat64("Makefile", {st_mode=0, st_size=0, ...}) = 0
time(NULL)                              = 1001464278
stat64("Makefile.in", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("Makefile.am", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../configure.in", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("..", {st_mode=0, st_size=9281424328817, ...}) = 0
open("..", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x59000)                            = 0x59000
getdents64(0x3, 0x56b60, 0x1000)        = 2520
getdents64(0x3, 0x56b60, 0x1000)        = 0
close(3)                                = 0
stat64("../RCS", 0xbff02440)            = -1 ENOENT (No such file or directory)
stat64("../SCCS", 0xbff02440)           = -1 ENOENT (No such file or directory)
stat64("../config.status", {st_mode=0, st_size=0, ...}) = 0
stat64("librpmdb.la", 0xbff02248)       = -1 ENOENT (No such file or directory)
stat64("dbconfig.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("dbconfig.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../system.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../config.h", {st_mode=0, st_size=0, ...}) = 0
stat64("../db3/db.h", {st_mode=0, st_size=0, ...}) = 0
stat64("../db3", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../db3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents64(0x3, 0x56b60, 0x1000)        = 4064
getdents64(0x3, 0x56b60, 0x1000)        = 4080
brk(0x5a000)                            = 0x5a000
getdents64(0x3, 0x56b60, 0x1000)        = 4040
brk(0x5b000)                            = 0x5b000
brk(0x5c000)                            = 0x5c000
getdents64(0x3, 0x56b60, 0x1000)        = 0
close(3)                                = 0
stat64("../db3/RCS", 0xbff028c8)        = -1 ENOENT (No such file or directory)
stat64("../db3/SCCS", 0xbff028c8)       = -1 ENOENT (No such file or directory)
stat64("../lib/rpmlib.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../lib", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x5e000)                            = 0x5e000
getdents64(0x3, 0x5b130, 0x1000)        = 1736
getdents64(0x3, 0x5b130, 0x1000)        = 0
close(3)                                = 0
stat64("../lib/RCS", 0xbff028c8)        = -1 ENOENT (No such file or directory)
stat64("../lib/SCCS", 0xbff028c8)       = -1 ENOENT (No such file or directory)
stat64("../rpmio/rpmio.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../rpmio", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents64(0x3, 0x5b130, 0x1000)        = 1704
getdents64(0x3, 0x5b130, 0x1000)        = 0
close(3)                                = 0
stat64("../rpmio/RCS", 0xbff028c8)      = -1 ENOENT (No such file or directory)
stat64("../rpmio/SCCS", 0xbff028c8)     = -1 ENOENT (No such file or directory)
stat64("../rpmio/rpmmessages.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmlog.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmerr.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/header.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/hdrinline.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../popt/popt.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../popt", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../popt", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents64(0x3, 0x5c510, 0x1000)        = 2008
getdents64(0x3, 0x5c510, 0x1000)        = 0
close(3)                                = 0
stat64("../popt/RCS", 0xbff028c8)       = -1 ENOENT (No such file or directory)
stat64("../popt/SCCS", 0xbff028c8)      = -1 ENOENT (No such file or directory)
stat64("../rpmio/rpmmacro.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmdb.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("fprint.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmhash.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../debug.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("fprint.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("fprint.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("poptDB.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("poptDB.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/rpmcli.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmurl.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmhash.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("rpmhash.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmdb.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("rpmdb.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/misc.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/ugid.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("db3.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("db3.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("db1.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("db1.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmio_internal.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("falloc.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("falloc.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("falloc.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64(".created", 0xbff023c8)          = -1 ENOENT (No such file or directory)
pipe([3, 4])                            = 0
fork()                                  = 4207
--- SIGCHLD (Child exited) ---
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++

Here it ends with a SEGV.   strace seems to change the behaviour ?  I then
tried strace -f and got (I hung, I had to break it. The last line repeating
forever):


execve("/usr/bin/make", ["make"], [/* 17 vars */]) = 0
newuname({sys="Linux", node="bofh", ...}) = 0
brk(0)                                  = 0x44000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 7438, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\300"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
mmap(NULL, 1417616, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002a000
mprotect(0x40167000, 119184, PROT_NONE) = 0
mmap(0x40176000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x13c000) = 0x40176000
mmap(0x40181000, 12688, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
close(3)                                = 0
mprotect(0x10000, 135168, PROT_READ|PROT_WRITE) = 0
mprotect(0x10000, 135168, PROT_READ|PROT_EXEC) = 0
munmap(0x40019000, 7438)                = 0
getpid()                                = 4248
brk(0)                                  = 0x44000
brk(0x44030)                            = 0x44030
brk(0x45000)                            = 0x45000
rt_sigaction(SIGHUP, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGQUIT, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGINT, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTERM, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGXCPU, {0x40c2e, [HUP], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGXFSZ, {0x40c2e, [INT], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGCHLD, {SIG_DFL}, {SIG_DFL}, 8) = 0
getcwd("/root/rpm-4.0.3/rpmdb", 4095)   = 22
stat64("/usr/include", {st_mode=0, st_size=0, ...}) = 0
stat64("/usr/gnu/include", 0xbff01cc8)  = -1 ENOENT (No such file or directory)
stat64("/usr/local/include", {st_mode=0, st_size=50, ...}) = 0
stat64("/usr/include", {st_mode=0, st_size=0, ...}) = 0
rt_sigaction(SIGCHLD, {0x40dae, [], SA_INTERRUPT}, NULL, 8) = 0
rt_sigaction(SIGUSR1, {0x40ace, [], SA_RESTART}, {SIG_DFL}, 8) = 0
brk(0x46000)                            = 0x46000
brk(0x47000)                            = 0x47000
brk(0x48000)                            = 0x48000
stat64(".", {st_mode=0, st_size=9281424328817, ...}) = 0
open(".", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x4a000)                            = 0x4a000
getdents64(0x3, 0x47e70, 0x1000)        = 1128
getdents64(0x3, 0x47e70, 0x1000)        = 0
close(3)                                = 0
open("Makefile", O_RDONLY|O_LARGEFILE)  = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(3, "# Generated automatically from M"..., 4096) = 4096
brk(0x4b000)                            = 0x4b000
read(3, " yes\nVERSION = 4.0.3\nWITH_APIDOC"..., 4096) = 4096
brk(0x4c000)                            = 0x4c000
brk(0x4d000)                            = 0x4d000
read(3, "n-compile:\n\t-rm -f *.o core *.co"..., 4096) = 4096
brk(0x4e000)                            = 0x4e000
brk(0x4f000)                            = 0x4f000
brk(0x50000)                            = 0x50000
brk(0x51000)                            = 0x51000
brk(0x52000)                            = 0x52000
read(3, "og.h \\\n\t../rpmio/rpmerr.h ../lib"..., 4096) = 3537
brk(0x53000)                            = 0x53000
brk(0x54000)                            = 0x54000
brk(0x55000)                            = 0x55000
brk(0x56000)                            = 0x56000
brk(0x57000)                            = 0x57000
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x40019000, 4096)                = 0
stat64("RCS", 0xbff01d88)               = -1 ENOENT (No such file or directory)
stat64("SCCS", 0xbff01d88)              = -1 ENOENT (No such file or directory)
stat64("Makefile", {st_mode=0, st_size=0, ...}) = 0
time(NULL)                              = 1001464482
stat64("Makefile.in", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("Makefile.am", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../configure.in", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("..", {st_mode=0, st_size=9281424328817, ...}) = 0
open("..", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x59000)                            = 0x59000
getdents64(0x3, 0x56b80, 0x1000)        = 2520
getdents64(0x3, 0x56b80, 0x1000)        = 0
close(3)                                = 0
stat64("../RCS", 0xbff02440)            = -1 ENOENT (No such file or directory)
stat64("../SCCS", 0xbff02440)           = -1 ENOENT (No such file or directory)
stat64("../config.status", {st_mode=0, st_size=0, ...}) = 0
stat64("librpmdb.la", 0xbff02248)       = -1 ENOENT (No such file or directory)
stat64("dbconfig.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("dbconfig.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../system.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../config.h", {st_mode=0, st_size=0, ...}) = 0
stat64("../db3/db.h", {st_mode=0, st_size=0, ...}) = 0
stat64("../db3", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../db3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents64(0x3, 0x56b80, 0x1000)        = 4064
getdents64(0x3, 0x56b80, 0x1000)        = 4080
brk(0x5a000)                            = 0x5a000
getdents64(0x3, 0x56b80, 0x1000)        = 4040
brk(0x5b000)                            = 0x5b000
brk(0x5c000)                            = 0x5c000
getdents64(0x3, 0x56b80, 0x1000)        = 0
close(3)                                = 0
stat64("../db3/RCS", 0xbff028c8)        = -1 ENOENT (No such file or directory)
stat64("../db3/SCCS", 0xbff028c8)       = -1 ENOENT (No such file or directory)
stat64("../lib/rpmlib.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../lib", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x5e000)                            = 0x5e000
getdents64(0x3, 0x5b150, 0x1000)        = 1736
getdents64(0x3, 0x5b150, 0x1000)        = 0
close(3)                                = 0
stat64("../lib/RCS", 0xbff028c8)        = -1 ENOENT (No such file or directory)
stat64("../lib/SCCS", 0xbff028c8)       = -1 ENOENT (No such file or directory)
stat64("../rpmio/rpmio.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../rpmio", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents64(0x3, 0x5b150, 0x1000)        = 1704
getdents64(0x3, 0x5b150, 0x1000)        = 0
close(3)                                = 0
stat64("../rpmio/RCS", 0xbff028c8)      = -1 ENOENT (No such file or directory)
stat64("../rpmio/SCCS", 0xbff028c8)     = -1 ENOENT (No such file or directory)
stat64("../rpmio/rpmmessages.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmlog.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmerr.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/header.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/hdrinline.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../popt/popt.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../popt", {st_mode=0, st_size=9281424328817, ...}) = 0
open("../popt", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=0, st_size=9281424328817, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents64(0x3, 0x5c530, 0x1000)        = 2008
getdents64(0x3, 0x5c530, 0x1000)        = 0
close(3)                                = 0
stat64("../popt/RCS", 0xbff028c8)       = -1 ENOENT (No such file or directory)
stat64("../popt/SCCS", 0xbff028c8)      = -1 ENOENT (No such file or directory)
stat64("../rpmio/rpmmacro.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmdb.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("fprint.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmhash.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../debug.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("fprint.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("fprint.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("poptDB.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("poptDB.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/rpmcli.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmurl.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmhash.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("rpmhash.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("rpmdb.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("rpmdb.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../lib/misc.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/ugid.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("db3.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("db3.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("db1.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("db1.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("../rpmio/rpmio_internal.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("falloc.h", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64("falloc.lo", {st_mode=0, st_size=0, ...}) = 0
stat64("falloc.c", {st_mode=0, st_size=9281424328817, ...}) = 0
stat64(".created", 0xbff023c8)          = -1 ENOENT (No such file or directory)
pipe([3, 4])                            = 0
fork()                                  = 4249
[pid  4248] close(4)                    = 0
[pid  4248] read(3,  <unfinished ...>
[pid  4249] dup2(4, 1)                  = 1
[pid  4249] close(4)                    = 0
[pid  4249] execve("/usr/local/sbin/cat", ["cat", "../db3/db3lobjs"], [/* 17 vars */]) = -1 ENOENT (No such file or directory)
[pid  4249] execve("/usr/local/bin/cat", ["cat", "../db3/db3lobjs"], [/* 17 vars */]) = -1074779704
[pid  4249] execve("/usr/bin/cat", ["cat", "../db3/db3lobjs"], [/* 17 vars */]) = -1 ENOENT (No such file or directory)
[pid  4249] execve("/sbin/cat", ["cat", "../db3/db3lobjs"], [/* 17 vars */]) = -1074779699
[pid  4249] execve("", [ptrace: umoven: Input/output error
0x2], [/* 2 vars */]) = 1073908880
[pid  4249] brk(0)                      = 0x23000
[pid  4249] open("/etc/ld.so.preload", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  4249] open("/etc/ld.so.cache", O_RDONLY) = 4
[pid  4249] fstat64(4, {st_mode=0, st_size=0, ...}) = 0
[pid  4249] mmap(NULL, 7438, PROT_READ, MAP_PRIVATE, 4, 0) = 0x40019000
[pid  4249] close(4)                    = 0
[pid  4249] open("/lib/libc.so.6", O_RDONLY) = 4
[pid  4249] read(4, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\300"..., 1024) = 1024
[pid  4249] fstat64(4, {st_mode=0, st_size=0, ...}) = 0
[pid  4249] mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
[pid  4249] mmap(NULL, 1417616, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x4002a000
[pid  4249] mprotect(0x40167000, 119184, PROT_NONE) = 0
[pid  4249] mmap(0x40176000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0x13c000) = 0x40176000
[pid  4249] mmap(0x40181000, 12688, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
[pid  4249] close(4)                    = 0
[pid  4249] mprotect(0x10000, 12288, PROT_READ|PROT_WRITE) = 0
[pid  4249] mprotect(0x10000, 12288, PROT_READ|PROT_EXEC) = 0
[pid  4249] munmap(0x40019000, 7438)    = 0
[pid  4249] getpid()                    = 4249
[pid  4249] brk(0)                      = 0x23000
[pid  4249] brk(0x23030)                = 0x23030
[pid  4249] brk(0x24000)                = 0x24000
[pid  4249] fstat64(1, {st_mode=0, st_size=0, ...}) = 0
[pid  4249] open("../db3/db3lobjs", O_RDONLY|O_LARGEFILE) = 4
[pid  4249] fstat64(4, {st_mode=0, st_size=0, ...}) = 0
[pid  4249] brk(0x26000)                = 0x26000
[pid  4249] read(4, "mut_fcntl.lo client.lo db_server"..., 4096) = 1735
[pid  4249] write(1, "mut_fcntl.lo client.lo db_server"..., 1735) = 1735
[pid  4249] read(4, "", 4096)           = 0
[pid  4249] close(4)                    = 0
[pid  4249] close(1)                    = 0
[pid  4249] exit(0)                     = ?
<... read resumed> "mut_fcntl.lo client.lo db_server"..., 200) = 200
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200
rt_sigreturn(0)                         = 200



-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
