Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id E78164A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 16:55:37 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 014D2B005; Thu,  8 Feb 2001 23:55:54 +0000 (GMT)
Date: Thu, 8 Feb 2001 23:55:54 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: Christoph Plattner <christoph.plattner@alcatel.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] //strace// Generic Parisc Linux Kernel Questions& 9000/730 success report
Message-ID: <20010208235554.G1374@linuxcare.com>
References: <Pine.LNX.4.21.0102080959100.7974-100000@front.linuxcare.com.au> <3A8320E7.CF0F64A3@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A8320E7.CF0F64A3@dot.at>; from christoph.plattner@dot.at on Thu, Feb 08, 2001 at 11:42:47PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 08, 2001 at 11:42:47PM +0100, Christoph Plattner wrote:
> Again, I have problems with strace:
> -----------------------------------

Works for me, this is on a B180, latest nfsroot.tar.gz (but on local
disk), with most of the newer debs from

ftp://puffin.external.hp.com/pub/parisc/binaries/new-debs/debian/

However, I believe it worked for me before those updates also:


richard@merlin:~$ uname -a
Linux merlin 2.4.0 #2 Wed Feb 7 16:29:34 GMT 2001 parisc unknown
richard@merlin:~$ 
richard@merlin:~$ cvs checkout strace
cvs server: Updating strace
U strace/.cvsignore
U strace/COPYRIGHT
...
...
U strace/test/sfd.c
U strace/test/sig.c
richard@merlin:~$ 
richard@merlin:~$ 
richard@merlin:~$ cd strace
richard@merlin:~/strace$ autoconf
richard@merlin:~/strace$ autoheader 
richard@merlin:~/strace$ ./configure
creating cache ./config.cache
checking host system type... hppa-unknown-linux-gnu
checking for supported operating system... linux
checking for supported architecture... hppa
checking for gcc... gcc
checking whether the C compiler (gcc -D_GNU_SOURCE  ) works... yes
checking whether the C compiler (gcc -D_GNU_SOURCE  ) is a cross-compiler... no
...
...
updating cache ./config.cache
creating ./config.status
creating Makefile
creating linux/hppa/Makefile
creating config.h
richard@merlin:~/strace$ make
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c strace.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c version.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c syscall.c
syscall.c:459: warning: `decode_subcall' defined but not used
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c util.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c desc.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c file.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c ipc.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c io.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c ioctl.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c mem.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c net.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c process.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c bjm.c
bjm.c: In function `sys_query_module':
bjm.c:83: warning: int format, size_t arg (arg 4)
bjm.c:92: warning: int format, size_t arg (arg 2)
bjm.c:114: warning: int format, size_t arg (arg 2)
bjm.c:115: warning: int format, size_t arg (arg 2)
bjm.c:132: warning: int format, size_t arg (arg 2)
bjm.c:133: warning: int format, size_t arg (arg 2)
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c resource.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c signal.c
signal.c:867:2: warning: #warning NO sys_sigreturn DECODE FOR HPPA
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c sock.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c system.c
system.c: In function `sys_sysctl':
system.c:1737: warning: int format, size_t arg (arg 2)
system.c:1747: warning: int format, size_t arg (arg 3)
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c term.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c time.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c proc.c
gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa -Ilinux -I./linux -D_GNU_SOURCE  -c stream.c
gcc  -o strace strace.o version.o syscall.o util.o desc.o file.o ipc.o io.o ioctl.o mem.o net.o process.o bjm.o resource.o signal.o sock.o system.o term.o time.o proc.o stream.o -lnsl 
richard@merlin:~/strace$ 
richard@merlin:~/strace$ 
richard@merlin:~/strace$ ./strace ./strace
execve("./strace", ["./strace"], [/* 22 vars */]) = 0
newuname({sys="Linux", node="merlin", ...}) = 0
brk(0)                                  = 0x34000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
newfstat(3, {st_mode=S_IFREG|0644, st_size=7103, ...}) = 0
mmap(NULL, 7103, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4001c000
close(3)                                = 0
open("/lib/libnsl.so.1", O_RDONLY)      = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0J\244"..., 1024) = 1024
newfstat(3, {st_mode=S_IFREG|0644, st_size=92920, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001e000
mmap(NULL, 104028, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001f000
mprotect(0x40035000, 13916, PROT_NONE)  = 0
mmap(0x40035000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x15000) = 0x40035000
mmap(0x40037000, 5724, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40037000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2k\314"..., 1024) = 1024


etc. etc.

Richard
