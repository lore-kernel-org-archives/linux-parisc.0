From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: eglibc_2.13-5 on hppa
Date: Tue, 7 Jun 2011 21:33:09 -0400
Message-ID: <20110608013308.GA15282@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

What's the status of glibc?  In the testsuite, I seeing various
tests hang.  For example,

dave      2301  0.0  0.2  32912 25916 ?        S    13:31   0:03 apt-get --compile source libc6
dave      2458  0.0  0.0  32912  5112 ?        S    13:31   0:00  \_ apt-get --compile source libc6
dave      2817  0.0  0.0   1968   596 ?        S    13:32   0:00      \_ sh -c cd eglibc-2.13 && dpkg-buildpackage -b -uc
dave      2820  0.0  0.0   9164  5764 ?        S    13:32   0:00          \_ /usr/bin/perl /usr/bin/dpkg-buildpackage -b -uc
dave      3206  0.0  0.0   3836  1208 ?        S    13:32   0:02              \_ /usr/bin/make -f debian/rules build
dave     27678  0.0  0.0   4484  1396 ?        S    17:52   0:00                  \_ /bin/bash -e -c set -e ; \?if [ -n "" ]; then \?  echo "Tests have been disabled via DEB_BUILD_OPTIONS." | tee bu
dave     27689  0.0  0.0   2184   896 ?        S    17:52   0:00                      \_ /usr/bin/make -C build-tree/hppa-libc -k check
dave     27692  0.0  0.0   1968   596 ?        S    17:52   0:00                      |   \_ /bin/sh -c /usr/bin/make -r PARALLELMFLAGS="" CVSOPTS="" -C /home/dave/debian/glibc/eglibc-2.13 objdir=`p
dave     27695  0.0  0.0   4752  3320 ?        S    17:52   0:04                      |       \_ /usr/bin/make -r PARALLELMFLAGS= CVSOPTS= -C /home/dave/debian/glibc/eglibc-2.13 objdir=/home/dave/de
dave       301  1.5  0.0   5680  4288 ?        S    20:35   0:15                      |           \_ /usr/bin/make subdir=rt -C rt ..=../ tests
dave      8664  0.0  0.0   2956  1156 ?        S    20:49   0:00                      |               \_ /bin/bash -c GCONV_PATH=/home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/iconvdata LC
dave      8666  0.0  0.0   1920   396 ?        S    20:49   0:00                      |                   \_ /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1 --library-path /home
dave      8667  100  0.0  34836   588 ?        Sl   20:49   2:09                      |                       \_ /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1 --library-path /
dave     27690  0.0  0.0   3376   616 ?        S    17:52   0:01                      \_ tee build-tree/log-test-hppa-linux-gnu-libc

dave@mx3210:~/debian/glibc$ strace -p 8667
Process 8667 attached - interrupt to quit
futex(0x143d8, FUTEX_WAIT_PRIVATE, 3, NULL^C <unfinished ...>
Process 8667 detached
dave@mx3210:~/debian/glibc$ gdb /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1 8667
GNU gdb (GDB) 7.2-debian
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1...done.
Attaching to program: /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1, process 8667
Reading symbols from /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/rt/librt.so.1...done.
Loaded symbols for /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/rt/librt.so.1
Reading symbols from /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/nptl/libpthread.so.0...done.

warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
Loaded symbols for /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/nptl/libpthread.so.0
Reading symbols from /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/libc.so.6...done.

warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
Loaded symbols for /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/libc.so.6
Loaded symbols for /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1
0x40099b28 in __pthread_cond_wait_internal (cond=0x143d0, mutex=0x143a0) at ../nptl/pthread_cond_wait.c:153
153	      lll_futex_wait (&cond->__data.__futex, futex_val, pshared);
(gdb) x/x 0x143d8
0x143d8:	0x00000003
(gdb) p pshared
$1 = 0
(gdb) info threads
* 1 process 8667  0x40099b28 in __pthread_cond_wait_internal (cond=0x143d0, mutex=0x143a0) at ../nptl/pthread_cond_wait.c:153
(gdb) bt
#0  0x40099b28 in __pthread_cond_wait_internal (cond=0x143d0, mutex=0x143a0) at ../nptl/pthread_cond_wait.c:153
#1  0x40099ee4 in __pthread_cond_wait (cond=0x143d0, mutex=0x143a0) at ../ports/sysdeps/unix/sysv/linux/hppa/nptl/pthread_cond_wait.c:34

The "l" in the ps faux output indicates a multi-threaded process using
CLONE_THREAD, but gdb only sees one thread.

Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
