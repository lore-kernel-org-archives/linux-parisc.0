From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] TLS toolchain update (6 regressions left)
Date: Fri, 15 Jul 2005 10:26:10 -0400
Message-ID: <20050715142609.GR5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
 Randolph Chung <tausq@debian.org>,
 parisc-linux@lists.parisc-linux.org
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


Please stand up and pat yourself on the back:

make[2]: *** [/glibc/math/test-fenv.out] Error 1
	= Regression (1)
make[2]: *** [/glibc/math/test-float.out] Error 1
make[2]: *** [/glibc/math/test-double.out] Error 1
make[2]: *** [/glibc/math/test-ifloat.out] Error 1
make[2]: *** [/glibc/math/test-idouble.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/glibc/stdlib/tst-strtod.out] Error 1
make[2]: *** [/glibc/stdlib/bug-strtod.out] Error 1
make[1]: *** [stdlib/tests] Error 2
make[2]: [/glibc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/glibc/elf/tst-array1.out] Error 1
make[2]: *** [/glibc/elf/tst-array2.out] Error 1
make[2]: *** [/glibc/elf/tst-array3.out] Error 1
make[2]: *** [/glibc/elf/tst-array4.out] Error 1
make[2]: *** [/glibc/elf/tst-array1-static.out] Error 1
	= Regressions (5)
make[2]: *** [/glibc/elf/tst-tls13.out] Error 1
	= TIMEOUTFACTOR=10 required.
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

That's 6 regressions for the C Library, which I'll target over the next
couple of weeks.

The last big error was that glibc was considering the build a
cross-compile and the environment just puked.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
