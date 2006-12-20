From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Wed, 20 Dec 2006 17:42:08 -0500 (EST)
Message-ID: <200612202242.kBKMg8sD022756__39748.6056005166$1416624237$gmane$org@hiauly1.hia.nrc.ca>
References: <200612202237.46357.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200612202237.46357.deller@gmx.de> from "Helge Deller" at Dec 20, 2006 10:37:45 pm
List-ID: <linux-parisc.vger.kernel.org>

> > FAIL: 22_locale/time_get/get_date/wchar_t/4.cc execution test
> > 
> > which may be a kernel problem since the fail doesn't occur using
> > a 64-bit kernel.  The test also doesn't fail under hpux, so it's
> > not likely a compilation issue.  The problem is in setting a
> > date/time string.  Might have something to do with locale functions.
> 
> Can you provide an strace ?

Don't see anything that's obvious.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

execve("./4.xg", ["./4.xg"], [/* 18 vars */]) = 0
newuname({sys="Linux", node="hiauly6", ...}) = 0
brk(0)                                  = 0x13000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40000000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("PARISC/libstdc++.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("libstdc++.so.6", O_RDONLY)        = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/gcc/PARISC/libstdc++.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/gcc/PARISC", 0xc01ce5c8) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/gcc/libstdc++.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/gcc", {st_mode=0, st_size=4303557231594, ...}) = 0
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/./libstdc++-v3/src/.libs/PARISC/libstdc++.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/./libstdc++-v3/src/.libs/PARISC", 0xc01ce5c8) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/./libstdc++-v3/src/.libs/libstdc++.so.6", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\4.\360"..., 512) = 512
fstat64(3, {st_mode=0, st_size=4303557231594, ...}) = 0
mmap(NULL, 1081212, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x402a3000
mmap(0x4039e000, 32768, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xfa000) = 0x4039e000
mmap(0x403a6000, 20348, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x403a6000
close(3)                                = 0
open("PARISC/libm.so.6", O_RDONLY)      = -1 ENOENT (No such file or directory)
open("libm.so.6", O_RDONLY)             = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/gcc/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/./libstdc++-v3/src/.libs/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libstdc++-v3/.libs/PARISC/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libstdc++-v3/.libs/PARISC", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libstdc++-v3/.libs/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libstdc++-v3/.libs", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libmudflap/.libs/PARISC/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libmudflap/.libs/PARISC", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libmudflap/.libs/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libmudflap/.libs", {st_mode=0, st_size=4303557231594, ...}) = 0
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libssp/.libs/PARISC/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libssp/.libs/PARISC", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libssp/.libs/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libssp/.libs", {st_mode=0, st_size=4303557231594, ...}) = 0
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libgomp/.libs/PARISC/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libgomp/.libs/PARISC", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libgomp/.libs/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libgomp/.libs", {st_mode=0, st_size=4303557231594, ...}) = 0
open("/home/dave/gnu/gcc-4.2/objdir/./gcc/PARISC/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/./gcc/PARISC", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/./gcc/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/./gcc", {st_mode=0, st_size=4303557231594, ...}) = 0
open("/home/dave/gnu/gcc-4.2/objdir/./prev-gcc/PARISC/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/./prev-gcc/PARISC", 0xc01ce608) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/./prev-gcc/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/home/dave/gnu/gcc-4.2/objdir/./prev-gcc", {st_mode=0, st_size=4303557231594, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 83644, PROT_READ, MAP_PRIVATE, 3, 0) = 0x403da000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libm.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\226"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40001000
mmap(NULL, 573884, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40031000
mprotect(0x400ab000, 74172, PROT_NONE)  = 0
mmap(0x400ba000, 16384, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) = 0x400ba000
close(3)                                = 0
open("PARISC/libgcc_s.so.4", O_RDONLY)  = -1 ENOENT (No such file or directory)
open("libgcc_s.so.4", O_RDONLY)         = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/gcc/libgcc_s.so.4", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\27"..., 512) = 512
fstat64(3, {st_mode=0, st_size=4303557231594, ...}) = 0
mmap(NULL, 64160, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x406ae000
mmap(0x406bd000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe000) = 0x406bd000
close(3)                                = 0
open("PARISC/libc.so.6", O_RDONLY)      = -1 ENOENT (No such file or directory)
open("libc.so.6", O_RDONLY)             = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/gcc/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/./libstdc++-v3/src/.libs/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libmudflap/.libs/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libssp/.libs/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/hppa-linux/libgomp/.libs/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/./gcc/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/dave/gnu/gcc-4.2/objdir/./prev-gcc/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\1\364"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 1364696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40a63000
mprotect(0x40b93000, 119512, PROT_NONE) = 0
mmap(0x40ba2000, 53248, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12f000) = 0x40ba2000
mmap(0x40baf000, 4824, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40baf000
close(3)                                = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40002000
mmap(NULL, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40004000
munmap(0x403da000, 83644)               = 0
brk(0)                                  = 0x13000
brk(0x34000)                            = 0x34000
open("/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40dd5000
mmap2(NULL, 835584, PROT_READ, MAP_PRIVATE, 3, 0x3116) = 0x405d5000
close(3)                                = 0
open("/usr/lib/gconv/gconv-modules.cache", O_RDONLY) = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 21568, PROT_READ, MAP_SHARED, 3, 0) = 0x40752000
close(3)                                = 0
open("/usr/lib/gconv/BIG5.so", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\10"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 149404, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x401db000
mprotect(0x401f0000, 63388, PROT_NONE)  = 0
mmap(0x401ff000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14000) = 0x401ff000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40008000
write(2, "4.xg: /home/dave/gnu/gcc-4.2/gcc"..., 1674.xg: /home/dave/gnu/gcc-4.2/gcc/libstdc++-v3/testsuite/22_locale/time_get/get_date/wchar_t/4.cc:55: void test01(): Assertion `errorstate == ios_base::eofbit' failed.
) = 167
rt_sigprocmask(SIG_UNBLOCK, [ABRT], NULL, 8) = 0
getpid()                                = 16763
kill(16763, SIGABRT)                    = 0
--- SIGABRT (Aborted) @ 0 (0) ---
+++ killed by SIGABRT (core dumped) +++
Process 16763 detached
