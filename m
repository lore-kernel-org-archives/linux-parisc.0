Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tdl.com (tdl.com [206.180.224.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 254D5482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Sep 2001 04:38:12 -0600 (MDT)
Received: (from randall@localhost)
	by tdl.com (8.9.3/8.9.3) id DAA15837
	for parisc-linux@lists.parisc-linux.org; Sat, 8 Sep 2001 03:27:37 -0700
Date: Sat, 8 Sep 2001 03:27:36 -0700
From: Randall Craig <randall@tdl.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010908032736.A15589@tdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] fork does not return signal with make
List-ID: <linux-parisc.vger.kernel.org>

I tried to do make config on the linux-2.4.9-pa17 kernel tree using the pa17
kernel, which resulted in:

This is on a C240.

execve("/usr/bin/make", ["make", "config"], [/* 18 vars */]) = 0
newuname({sys="Linux", node="agaricus", ...}) = 0
brk(0)                                  = 0x44000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
idle()                                  = 0
mmap(NULL, 8081, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\300"..., 1024) = 1024
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
mmap(NULL, 1417616, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002a000
mprotect(0x40167000, 119184, PROT_NONE) = 0
mmap(0x40176000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x13c000) = 0x40176000
mmap(0x40181000, 12688, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
close(3)                                = 0
mprotect(0x10000, 135168, PROT_READ|PROT_WRITE) = 0
mprotect(0x10000, 135168, PROT_READ|PROT_EXEC) = 0
munmap(0x40019000, 8081)                = 0
getpid()                                = 383
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
getcwd("/usr/src/linux-pa17", 4095)     = 20
ioperm(0x2cee4, 0xfaf01cc8, 0xfaf01cc8) = 0
ioperm(0x2cef4, 0xfaf01cc8, 0xfaf01cc8) = -1 ENOENT (No such file or directory)
ioperm(0x2cf08, 0xfaf01cc8, 0xfaf01cc8) = 0
ioperm(0x2cee4, 0xfaf01cc8, 0xfaf01cc8) = 0
rt_sigaction(SIGCHLD, {0x40dae, [], SA_INTERRUPT}, NULL, 8) = 0
rt_sigaction(SIGUSR1, {0x40ace, [], SA_RESTART}, {SIG_DFL}, 8) = 0
brk(0x46000)                            = 0x46000
brk(0x47000)                            = 0x47000
brk(0x48000)                            = 0x48000
ioperm(0x2aabc, 0xfaf01e08, 0xfaf01e08) = 0
open(".", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
idle()                                  = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0x4a000)                            = 0x4a000
SYS_201(0x3, 0x47f80, 0x1000, 0xd78beec7, 0) = 928
SYS_201(0x3, 0x47f80, 0x1000, 0x40178ca8, 0x3a0) = 0
close(3)                                = 0
open("Makefile", O_RDONLY|O_LARGEFILE)  = 3
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(3, "VERSION = 2\nPATCHLEVEL = 4\nSUBLE"..., 4096) = 4096
pipe([4, 5])                            = 0
fork()                                  = 384
close(5)                                = 0
read(4, "parisc\n", 200)                = 7
read(4, "\230", 193)                    = -512
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = -1 EINTR (Interrupted system call)
read(4, "", 193)                        = 0
close(4)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 384
pipe([4, 5])                            = 0
fork()                                  = 387
close(5)                                = 0
read(4, "/bin/sh\n", 200)               = 8
read(4, "", 192)                        = -512
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = -1 EINTR (Interrupted system call)
read(4, "", 192)                        = 0
close(4)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 387
pipe([4, 5])                            = 0
fork()                                  = 388
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = 388
close(5)                                = 0
read(4, "/usr/src/linux-pa17\n", 200)   = 20
read(4, "", 180)                        = 0
close(4)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 388
open(".config", O_RDONLY|O_LARGEFILE)   = 4
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "#\n# Automatically generated by m"..., 4096) = 4096
brk(0x4b000)                            = 0x4b000
read(4, "CONFIG_SCSI_EATA_DMA is not set\n"..., 4096) = 4096
read(4, "PAD is not set\n\n#\n# Joysticks\n#\n"..., 4096) = 4096
brk(0x4c000)                            = 0x4c000
read(4, "#\n\n#\n# Frame-buffer support\n#\n# "..., 4096) = 1077
read(4, "", 4096)                       = 0
close(4)                                = 0
munmap(0x4001a000, 4096)                = 0
open(".depend", O_RDONLY|O_LARGEFILE)   = 4
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "init/main.o: init/main.c \\\n   /u"..., 4096) = 2847
brk(0x4d000)                            = 0x4d000
brk(0x4e000)                            = 0x4e000
ioperm(0xfaf02268, 0xfaf02310, 0xfaf02310) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02308, 0xfaf02308) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02310, 0xfaf02310) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02310, 0xfaf02310) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02310, 0xfaf02310) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02310, 0xfaf02310) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02318, 0xfaf02318) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02318, 0xfaf02318) = -1 ENOENT (No such file or directory)
ioperm(0xfaf02268, 0xfaf02310, 0xfaf02310) = -1 ENOENT (No such file or directory)
brk(0x4f000)                            = 0x4f000
read(4, "", 4096)                       = 0
close(4)                                = 0
munmap(0x4001a000, 4096)                = 0
read(3, "+= drivers/scsi/scsidrv.o\nDRIVER"..., 4096) = 4096
brk(0x50000)                            = 0x50000
open("arch/parisc/Makefile", O_RDONLY|O_LARGEFILE) = 4
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "#\n# parisc/Makefile\n#\n# This fil"..., 4096) = 3156
pipe([5, 6])                            = 0
fork()                                  = 389
close(6)                                = 0
read(5, "parisc\n", 200)                = 7
read(5, "", 193)                        = 0
close(5)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 389
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = 389
rt_sigreturn(0)                         = 389
(repeated many times)

-------------------------------------------------------------------------

doing this with the 2.4.0 kernel did not cause this error...


execve("/usr/bin/make", ["make", "config"], [/* 21 vars */]) = 0
newuname({sys="Linux", node="agaricus", ...}) = 0
brk(0)                                  = 0x44000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)

...

mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "#\n# parisc/Makefile\n#\n# This fil"..., 4096) = 3156
pipe([9, 10])                           = 0
fork()                                  = 1305
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = 1305
close(10)                               = 0
read(9, "parisc\n", 200)                = 7
read(9, "", 193)                        = 0
close(9)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 1305
brk(0x58000)                            = 0x58000
read(4, "", 4096)                       = 0
(program continues)

Maybe one of you knows what is going on.

Cheers,

Randall
