From: Berthold Gunreben <b.gunreben@web.de>
Subject: Re: [parisc-linux] crash in mmap.c
Date: Sat, 11 Feb 2006 14:31:12 +0100
Message-ID: <200602111431.12986.b.gunreben@web.de>
References: <200602102054.42633.b.gunreben@web.de> <43ED2876.2070502@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43ED2876.2070502@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Am Samstag 11 Februar 2006 00:57 schrieb Randolph Chung:
> > I recently played around with gcc-4.1 and glibc to build a glibc with
> > nptl support. Unfortunately I don't know right now, where to get current
> > patches to glibc (cvs.parisc-linux.org seems to be outdated). But while
> > doing this, running binaries with this glibc under gdb crashed my
> > machine, while without gdb, the binaries would just segfault. Here is
> > what happened to the kernel (2.6.15-rc7-pa0) using the TOC button:
>
> Can you specify more clearly what is "this glibc"? How did you finally
> build it? From what sources, with which toolchain (gcc/binutils) and
> with which options?

I am sorry that I was unclear about the environment. The glibc sources are 
those from cvs.parisc-linux.org. The toolchain is

GNU assembler version 2.16.91 (hppa-suse-linux) using BFD version 2.16.91 
20051210 (SUSE Linux)

gcc version 4.1.0 20060109 (prerelease) (SUSE Linux)

> If you build a simple "Hello World" app and run it, does it also kill
> the machine? Does this happen whether the app is linked dynamically or
> statically?

It only happens when I run a dynamically linked binary under gdb. And if I 
more /lib/tls away, it does not segfault at all. I did not write about this 
program not working, it made me think that it crashed the machine, and that 
there seems to be some problem in the kernel.

I just tried to build a small hello world program, and this did not crash the 
machine (although with tls, it would just segfault). This is what I did:

# cat foo.c
#include <stdio.h>

int
main()
{
  printf("Hello world\n");
  return 0;
}

gcc -o foo foo.c

# gdb foo
GNU gdb 6.3
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "hppa-suse-linux"...Using host libthread_db library 
"/lib/tls/libthread_db.so.1".

(gdb) run
Starting program: /tmp/foo

Program received signal SIGSEGV, Segmentation fault.
0x403a11a0 in write () from /lib/tls/libc.so.6
(gdb) bt
#0  0x403a11a0 in write () from /lib/tls/libc.so.6
#1  0x4034f450 in _IO_new_file_write () from /lib/tls/libc.so.6
#2  0x4034f0cc in new_do_write () from /lib/tls/libc.so.6
#3  0x4034f3c0 in _IO_new_do_write () from /lib/tls/libc.so.6
#4  0x4034fce4 in _IO_new_file_overflow () from /lib/tls/libc.so.6
#5  0x40351dd8 in __overflow () from /lib/tls/libc.so.6
#6  0x40342a8c in puts () from /lib/tls/libc.so.6
#7  0x000104a0 in main ()

Without /lib/tls, everything works as expected.

Berthold
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
