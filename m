Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72DBB489E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 11:40:09 -0700 (MST)
Date: Wed, 18 Feb 2004 19:40:04 +0100
Message-ID: <402A4CA5000052CB@ocpmta2.freegates.net>
In-Reply-To: <402A42A10000569A@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

>>> > But now I need more to try to complete job because:
>> > make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]
>
Just to be more complet here is the full cmd:
CPP='/Develop/parisc-linux/xc/bin/hppa-linux-gcc -E -x c-header'  /Develop/parisc-linux/build/glibc/elf/ld.so.1
--library-path /Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop/p
arisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/sunrpc/rpcgen -Y ../scripts -c rpcsvc/bootparam_prot.x
-o /Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.T

which fault immediately as strace confirm:
execve("/Develop/parisc-linux/build/glibc/elf/ld.so.1", ["/Develop/parisc-linux/build/glibc/elf/ld.so.1",
"--library-path", "/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Devel
op/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads",
"/Develop/parisc-linux/build/glibc/sunrpc/rpcgen", "-Y", "../scripts", "-c",
"rpcsvc/bootparam_prot.x", "-o", "/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.T"],
[/* 15 vars */]) = 0
newuname({sys="Linux", node="palx4000", ...}) = 0
brk(0)                                  = 0x4102d000
open("/Develop/parisc-linux/build/glibc/sunrpc/rpcgen", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\2\0\17\0\0\0\1\0\1\16"..., 512)
= 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40000000
mmap(0x10000, 77824, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) =
0x10000
mmap(0x32000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0x12000) = 0x32000
mmap(0x33000, 572, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS,
-1, 0) = 0x33000
close(3)                                = 0
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/Develop/parisc-linux/build/glibc/PARISC32/libc.so.6", O_RDONLY) =
-1 ENOENT (No such file or directory)
stat64("/Develop/parisc-linux/build/glibc/PARISC32", 0xfaf01548) = -1 ENOENT
(No such file or directory)
open("/Develop/parisc-linux/build/glibc/libc.so.6", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\16"..., 512)
= 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 1511008, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40001000
mprotect(0x40154000, 122464, PROT_NONE) = 0
mmap(0x40163000, 53248, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0x152000) = 0x40163000
mmap(0x40170000, 7776, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS,
-1, 0) = 0x40170000
close(3)                                = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

I am very fluent in strace langage ( :) ) but I have the filling that libc.so.6
is wrong? What do you think?

Thanks again,
    Joel.

PS: I will stopped here and tommorrow will try update all stuff and see ;)

----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
