Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A72B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 00:37:30 -0700 (MST)
Date: Thu, 30 Jan 2003 08:37:26 +0100
Message-ID: <3E35C33F0000092D@ocpmta3.freegates.net>
In-Reply-To: <20030130070340.GI20940@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Issues with seteuid()?
To: "Randolph Chung" <tausq@debian.org>
Cc: "Luigi Gangitano" <luigi@debian.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Randolph,

>
>
>> A. On a testing debian system (ie gcc-3.0 3.0.4-10 && libc6 2.2.5-14.3)
>and
>> the very last kernel 2.4.20-pa23:
>> 
>> Compile with gcc -O 2 -Wall -D_REENTRANT foo.c -o foo
>> 
>> [ Create a user and a group named proxy with id 13 for both ]
>> 
>> First as it is ./foo would failled to fork() immediately with 'Segmentation
>> fault'.
>
># uname -a
>Linux legolas 2.4.20-pa23 #110 Mon Jan 27 23:44:18 PST 2003 parisc unknown
>unknown GNU/Linux
>
>ii  gcc-3.0        3.0.4-7        The GNU C compiler.
>ii  libc6          2.2.5-14.3     GNU C Library: Shared libraries and Timezone
>
># gcc-3.0 -O2 -Wall -D_REENTRANT seteuid.c -o seteuid
># ./seteuid
>leave_suid: PID 18443 called
>leave_suid: PID 18443 giving up root, becoming 'proxy'
>Creating Swap Directories
>[....]
>
>no segfault... 
>
>can you maybe run it with strace and send the last few lines of output?
>
Well so short that I can give you all:

ii  gcc-3.0        3.0.4-10       The GNU C compiler.
ii  gcc-3.0-base   3.0.4-10       The GNU Compiler Collection (base package).
ii  libc6          2.2.5-14.3     GNU C Library: Shared libraries and Timezone


# strace -f ./a.out
execve("./a.out", ["./a.out"], [/* 18 vars */]) = 0
newuname({sys="Linux", node="fw01.office.palinux", ...}) = 0
brk(0)                                  = 0x26000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40017000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 16726, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40018000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\37"..., 1024)
= 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 1392404, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40028000
mprotect(0x4015f000, 118548, PROT_NONE) = 0
mmap(0x4016e000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0x136000) = 0x4016e000
mmap(0x40179000, 12052, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS,
-1, 0) = 0x40179000
close(3)                                = 0
munmap(0x40018000, 16726)               = 0
getpid()                                = 25520
write(2, "leave_suid: PID 25520 called\n", 29leave_suid: PID 25520 called
) = 29
geteuid()                               = 0
setgroups(1, [13])                      = 0
setgid(13)                              = 0
getpid()                                = 25520
write(2, "leave_suid: PID 25520 giving up "..., 55leave_suid: PID 25520 giving
up root, becoming 'proxy'
) = 55
setresuid(ruid 4294967295, euid 13, suid 4294967295) = 0
geteuid()                               = 13
write(2, "Creating Swap Directories\n", 26Creating Swap Directories
) = 26
fork()                                  = -1 EAGAIN (Resource temporarily
unavailable)
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++


Well as explained in a previous mail if I do a su - proxy and launch same
program no problem to fork() ??

Thanks for your attention,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
