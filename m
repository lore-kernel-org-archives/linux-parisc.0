Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50B534852
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 16:20:23 -0700 (MST)
Date: Sun, 21 Dec 2003 18:13:00 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20031221231300.GV31767@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] kernel to blame? gprof vs. no-gprof,
	my parisc has gone insane with flushing madness...
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


jda,

So the weirdest thing happens to me today...

I'm chasing down the last of the glibc bugs that are of interest to
making userspace a bit better. The last bug is tst-tls13, which in
principle does dlopen/dlclose 1000 times. This seems to take 3 seconds,
the test is only alloting 2 seconds. I wonder, what the hell is taking
so long?

So using Randolphs patch, I decide to enable profiling with -g -pg when
I build the test. The test is linked by hand, and I change up crt1.o for
gcrt1.o as required to build a profiled executable.

---
gcc tst-tls13.c -g -pg -c -std=gnu99 -O2 -Wall -Wbad-function-cast
-Wcast-qual -Wcomment -Wcomments -Wfloat-equal -Winline
-Wmissing-declarations -Wmissing-noreturn -Wmissing-prototypes
-Wmultichar -Wsign-compare -Wstrict-prototypes -Wtrigraphs
-Wwrite-strings -g      -I../include -I.
-I/home/carlos/src/glibc-work/build-hppa/elf -I.. -I../libio
-I/home/carlos/src/glibc-work/build-hppa -I../sysdeps/hppa/elf
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa
-I../linuxthreads/sysdeps/unix/sysv/linux
-I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread
-I../linuxthreads/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix
-I../linuxthreads/sysdeps/hppa -I../sysdeps/unix/sysv/linux/hppa
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common
-I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv
-I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1
-I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32
-I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128
-I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754
-I../sysdeps/generic/elf -I../sysdeps/generic -I
/lib/modules/2.4.23-pa2/build/include -D_LIBC_REENTRANT -include
../include/libc-symbols.h   -DNOT_IN_libc=1    -o
/home/carlos/src/glibc-work/build-hppa/elf/tst-tls13.o -MD -MP -MF
/home/carlos/src/glibc-work/build-hppa/elf/tst-tls13.o.dt

BUILD=/home/carlos/src/glibc-work/build-hppa/elf

## PROFILING BUILD ##
gcc -pg -g -nostdlib -nostartfiles -o
/home/carlos/src/glibc-work/build-hppa/elf/tst-tls13
-Wl,-dynamic-linker=$BUILD/ld.so.1
/home/carlos/src/glibc-work/build-hppa/csu/gcrt1.o <------- * GPROF *
/home/carlos/src/glibc-work/build-hppa/csu/crti.o `gcc
--print-file-name=crtbegin.o`
/home/carlos/src/glibc-work/build-hppa/elf/tst-tls13.o
/home/carlos/src/glibc-work/build-hppa/dlfcn/libdl.so.2
-Wl,-rpath=/home/carlos/src/glibc-work/build-hppa:\
/home/carlos/src/glibc-work/build-hppa/math:\
/home/carlos/src/glibc-work/build-hppa/elf:\
/home/carlos/src/glibc-work/build-hppa/dlfcn:\
/home/carlos/src/glibc-work/build-hppa/nss:\
/home/carlos/src/glibc-work/build-hppa/nis:\
/home/carlos/src/glibc-work/build-hppa/rt:\
/home/carlos/src/glibc-work/build-hppa/resolv:\
/home/carlos/src/glibc-work/build-hppa/crypt:\
/home/carlos/src/glibc-work/build-hppa/linuxthreads
/home/carlos/src/glibc-work/build-hppa/libc.so.6
/home/carlos/src/glibc-work/build-hppa/libc_nonshared.a -lgcc `gcc
--print-file-name=crtend.o`
/home/carlos/src/glibc-work/build-hppa/csu/crtn.o
---

## Run the test
GCONV_PATH=/home/carlos/src/glibc-work/build-hppa/iconvdata 
LC_ALL=C time /home/carlos/src/glibc-work/build-hppa/elf/tst-tls13

0.01user 0.02system 0:00.23elapsed 19%CPU (0avgtext+0avgdata 0maxresident)k 
0inputs+0outputs (126major+49minor)pagefaults 0swaps

See the low number of pagefaults, and I'm using gcrt1.o

When I run using crt1.o I see:

0.08user 2.48system 0:02.76elapsed 92%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (4121major+45minor)pagefaults 0swaps

And a ridiculous number of faults. What is going on here? 
Running a kernel with profiling enabled I capture the following.

The kernel shows this for the non-profiled case:
  1118 flush_user_icache_range_asm               31.0556
  1115 flush_user_dcache_range_asm               30.9722
    61 flush_kernel_icache_page                   0.6100
    48 copy_user_page_asm                         0.3158
    16 unmap_page_range                           0.0244

While the profiled case shows:
    10 __wake_up                                  0.1250
     7 flush_kernel_icache_page                   0.0700
     7 fget_light                                 0.0486
     7 $lctu_done                                 0.4375

I see nothing like the *insane* flushing going on in the non-profiling
case. There is definately something in the regular code that is tripping
some sort of flushing that *horribly* degrades our performance. I would
have thought the profiling case to be *the* bad case. Though the loader 
does things a bit differently when profiled, I didn't expect such a
difference.

c.
