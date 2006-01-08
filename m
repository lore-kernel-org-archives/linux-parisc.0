From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [Update] TLS toolchain.
Date: Sun, 8 Jan 2006 00:51:10 -0500
Message-ID: <20060108055109.GE17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Binutils is good to go with a recent merge at 2005-12-10.
GCC is working from our CVS, but the merge is 7 months old and based on
the 4.0.0 release.

GLIBC is merge from 2005-06-08 and I have tls+linuxthreads working
without many failures:
---
make[2]: *** [/glibc/math/atest-exp2.out] Error 136
make[2]: *** [/glibc/math/test-float.out] Error 136
make[2]: *** [/glibc/math/test-double.out] Error 1
make[2]: *** [/glibc/math/test-ifloat.out] Error 136
make[2]: *** [/glibc/math/test-idouble.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/glibc/linuxthreads/tst-attr1.out] Error 1
make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/glibc/elf/tst-array1.out] Error 1
make[2]: *** [/glibc/elf/tst-array2.out] Error 1
make[2]: *** [/glibc/elf/tst-array3.out] Error 1
make[2]: *** [/glibc/elf/tst-array4.out] Error 1
make[2]: *** [/glibc/elf/tst-array1-static.out] Error 1
make[2]: *** [/glibc/elf/order.out] Error 1
make[2]: *** [/glibc/elf/nodelete2.out] Error 1
make[2]: *** [/glibc/elf/tst-align2.out] Error 1
make[2]: *** [/glibc/elf/order2.out] Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2
---
The FPU code is a bit borked right now and needs review, I tried
incorporating my changes and Daniel's alignment patch but it didn't work
out very well.

The linuxthreads tst-attr1 test is unclassified.

The elf related failures are relatively new and related to binutils.
---

I'm going to run the NPTL build and see how the tests turn out.

Anyone remember what the next step was?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
