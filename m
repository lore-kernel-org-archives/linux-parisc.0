From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Fri, 15 Jul 2005 19:44:48 -0400
Message-ID: <20050715234448.GA5314@systemhalted.org>
References: <20050715142609.GR5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
 Randolph Chung <tausq@debian.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050715142609.GR5314@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 15, 2005 at 10:26:10AM -0400, Carlos O'Donell wrote:
> make[2]: *** [/glibc/math/test-fenv.out] Error 1
> 	= Regression (1)
> make[2]: *** [/glibc/math/test-float.out] Error 1
> make[2]: *** [/glibc/math/test-double.out] Error 1
> make[2]: *** [/glibc/math/test-ifloat.out] Error 1
> make[2]: *** [/glibc/math/test-idouble.out] Error 1
> make[1]: *** [math/tests] Error 2
> make[2]: *** [/glibc/stdlib/tst-strtod.out] Error 1
> make[2]: *** [/glibc/stdlib/bug-strtod.out] Error 1
> make[1]: *** [stdlib/tests] Error 2
> make[2]: [/glibc/posix/annexc.out] Error 1 (ignored)
> make[2]: *** [/glibc/elf/tst-array1.out] Error 1
> make[2]: *** [/glibc/elf/tst-array2.out] Error 1
> make[2]: *** [/glibc/elf/tst-array3.out] Error 1
> make[2]: *** [/glibc/elf/tst-array4.out] Error 1
> make[2]: *** [/glibc/elf/tst-array1-static.out] Error 1
> 	= Regressions (5)
> make[2]: *** [/glibc/elf/tst-tls13.out] Error 1
> 	= TIMEOUTFACTOR=10 required.
> make[1]: *** [elf/tests] Error 2
> make: *** [check] Error 2

Fixed binutils...

Make that 1 regression:

make[2]: *** [/glibc/math/test-fenv.out] Error 1
make[2]: *** [/glibc/math/test-float.out] Error 1
make[2]: *** [/glibc/math/test-double.out] Error 1
make[2]: *** [/glibc/math/test-ifloat.out] Error 1
make[2]: *** [/glibc/math/test-idouble.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/glibc/stdlib/tst-strtod.out] Error 1
make[2]: *** [/glibc/stdlib/bug-strtod.out] Error 1
make[1]: *** [stdlib/tests] Error 2
make[2]: [/glibc/posix/annexc.out] Error 1 (ignored)
make: *** [check] Error 2

However, the following is troubling and where trouble goes, so does the
blame on the compiler.

test-float.out (Non-inline float):
 Test suite completed:
   2599 test cases plus 2384 tests for exception flags executed.
-  39 errors occurred.
+  4363 errors occurred.

test-double.out (Non-inline double):
 Test suite completed:
   2624 test cases plus 2399 tests for exception flags executed.
-  38 errors occurred.
+  4388 errors occurred.

Although the numbers don't add up with the errors a cursory check shows
*none* of the non-inline math tests passed.

The inline math does *much* better, observe:

test-ifloat.out (Inline float):
 Test suite completed:
   2537 test cases plus 2322 tests for exception flags executed.
-  1 errors occurred.
+  11 errors occurred.

test-idbouble.out (Inline double):
 Test suite completed:
   2562 test cases plus 2337 tests for exception flags executed.
-  1 errors occurred.
+  10 errors occurred.


c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
