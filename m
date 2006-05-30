From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] glibc tls linuxthreads failure baseline.
Date: Mon, 29 May 2006 22:50:10 -0400
Message-ID: <119aab440605291950w7f1f0022nd96fcdce3082bb44@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "Randolph Chung" <randolph@tausq.org>
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

Randolph,

This is the baseline failures I have for glibc tls linuxthreads:

make[2]: *** [/libc/math/test-float.out] Error 1
make[2]: *** [/libc/math/test-double.out] Error 1
make[2]: *** [/libc/math/test-ifloat.out] Error 1
make[2]: *** [/libc/math/test-idouble.out] Error 1

Much of this is fixed by Joel's great work. New compiler building.

make[1]: *** [math/tests] Error 2
make[2]: *** [/libc/stdlib/tst-strtod.out] Error 1
make[2]: *** [/libc/stdlib/bug-strtod.out] Error 1

Usual long-double problem.

make[1]: *** [stdlib/tests] Error 2
make[2]: [/libc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/libc/crypt/cert.out] Error 139

GCC optimizer bug.

make[1]: *** [crypt/tests] Error 2
make[2]: *** [/libc/linuxthreads/tst-clock1.out] Error 1

This looks like a wrapper problem.

make[2]: *** [/libc/linuxthreads/tst-attr1.out] Error 1

Guard address problem.

make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/libc/rt/tst-aio9.out] Error 1
make[2]: *** [/libc/rt/tst-aio10.out] Error 1

Unknown. New regressions.

make[1]: *** [rt/tests] Error 2
make[2]: *** [/libc/elf/tst-pie1.out] Error 139

Unknown.

make[2]: *** [/libc/elf/tst-leaks1-mem] Error 1

Bad mojo.

make[2]: *** [/libc/elf/order.out] Error 1

Bad mojo, library constructor/destructors are processed out of order.

make[2]: *** [/libc/elf/nodelete2.out] Error 1

Bad mojo.

make[2]: *** [/libc/elf/tst-align2.out] Error 1

Bad mojo.

make[2]: *** [/libc/elf/order2.out] Error 1

Bad mojo.

make[2]: *** [/libc/elf/tst-audit2.out] Error 139

This is because our LA code is a bogus stub.

make[2]: *** [/libc/elf/check-textrel.out] Error 1

Huh... ?

make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

I'm not seeing tst-printf failures.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
