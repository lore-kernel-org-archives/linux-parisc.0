From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] NPTL: The Bad News.
Date: Wed, 6 Sep 2006 20:23:18 -0400
Message-ID: <119aab440609061723r168cc628x3bf2dfb18bac1641@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

The bad news is that I didn't work much on my thesis this long weekend.
The good news is that I fixed many serious flaws related to:

1. Stack direction, stack guards, and stack permissions.
2. Low level locking primitives returning the wrong values.
3. EAGAIN != EWOULDBLOCK snafu's
4. Compiler bugs.
5. Makefile bugs.

My current set of libc + tls + nptl failures is now down to:

make[2]: *** [libc-tls-nptl/math/test-float.out] Error 1
make[2]: *** [libc-tls-nptl/math/test-double.out] Error 1
make[2]: *** [libc-tls-nptl/math/test-ifloat.out] Error 1
make[2]: *** [libc-tls-nptl/math/test-idouble.o] Error 1
make[1]: *** [math/tests] Error 2

- These are cool.

make[2]: [libc-tls-nptl/posix/annexc.out] Error 1 (ignored)
make[2]: *** [libc-tls-nptl/nptl/tst-cond16.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cond17.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-robustpi8.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-align2.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cancel24] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-oddstacklimit.out] Error 139
make[2]: *** [libc-tls-nptl/nptl/tst-getpid1.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-getpid2.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cancelx4.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cancelx5.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cancelx20.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cancelx21.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-cleanupx4.out] Error 1
make[2]: *** [libc-tls-nptl/nptl/tst-fini1.out] Error 42
make[1]: *** [nptl/tests] Error 2

- These are not cool.

make[2]: *** [libc-tls-nptl/rt/tst-timer.out] Error 139
make[2]: *** [libc-tls-nptl/rt/tst-mqueue3.out] Error 1
make[2]: *** [libc-tls-nptl/rt/tst-timer4.out] Error 1
make[2]: *** [libc-tls-nptl/rt/tst-timer5.out] Error 1
make[2]: *** [libc-tls-nptl/rt/tst-cputimer1.out] Error 1
make[2]: *** [libc-tls-nptl/rt/tst-cputimer2.out] Error 1
make[2]: *** [libc-tls-nptl/rt/tst-cputimer3.out] Error 1
make[1]: *** [rt/tests] Error 2

- Who needs timers...

make[2]: *** [libc-tls-nptl/elf/tst-pie1.out] Error 139
make[2]: *** [libc-tls-nptl/elf/tst-leaks1-mem] Error 1
make[2]: *** [libc-tls-nptl/elf/order.out] Error 1
make[2]: *** [libc-tls-nptl/elf/nodelete2.out] Error 1
make[2]: *** [libc-tls-nptl/elf/tst-align2.out] Error 1
make[2]: *** [libc-tls-nptl/elf/order2.out] Error 1
make[2]: *** [libc-tls-nptl/elf/tst-audit2.out] Error 139
make[2]: *** [libc-tls-nptl/elf/tst-addr1.out] Error 1
make[2]: *** [libc-tls-nptl/elf/check-textrel.out] Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

- These elf ones are all bad news, and for a fact I know I will have
to track down DSO initializer and finalizer bugs.

Huzah.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
