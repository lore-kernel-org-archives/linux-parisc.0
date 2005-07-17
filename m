From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] TLS toolchain update (6 regressions left)
Date: Sun, 17 Jul 2005 12:21:06 -0400
Message-ID: <20050717162105.GL5314@systemhalted.org>
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
> Please stand up and pat yourself on the back:
> 
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

Patched up the floating point asm constraints.

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

No regressions. But we still have a couple of functions that look like
the math is a bit wrong. However, we are doing better than non-tls, I
figure because the constraints are still a bit wrong.


----- GCC 4.0 (glibc + fp constriant fix + tls) -----
==> test-double.out <==

Test suite completed:
  2624 test cases plus 2399 tests for exception flags executed.
  24 errors occurred.

==> test-float.out <==

Test suite completed:
  2599 test cases plus 2384 tests for exception flags executed.
  23 errors occurred.

==> test-idouble.out <==

Test suite completed:
  2562 test cases plus 2337 tests for exception flags executed.
  10 errors occurred.

==> test-ifloat.out <==

Test suite completed:
  2537 test cases plus 2322 tests for exception flags executed.
  11 errors occurred.

----- GCC 3.3.5 (glibc) -----

==> test-double.out <==

Test suite completed:
  2624 test cases plus 2399 tests for exception flags executed.
  38 errors occurred.

==> test-float.out <==

Test suite completed:
  2599 test cases plus 2384 tests for exception flags executed.
  39 errors occurred.

==> test-idouble.out <==

Test suite completed:
  2562 test cases plus 2337 tests for exception flags executed.
  1 errors occurred.

==> test-ifloat.out <==

Test suite completed:
  2537 test cases plus 2322 tests for exception flags executed.
  1 errors occurred.

We are on par with the previous test results. I'm very pleased.
-----

Looking at the test failures in test-float, I see the following:

testing float (without inline functions)
Failure: Test: atan2 (-0.00756827042671106339, -.001792735857538728036)
== -1.80338464113663849327153994379639112
Result:
 is:         -1.80338394641876220703e+00  -0x1.cdaa9200000000000000p+0
 should be:  -1.80338466167449951172e+00  -0x1.cdaa9e00000000000000p+0
 difference:  7.15255737304687500000e-07   0x1.80000000000000000000p-21
 ulp       :  6.0000  
 max.ulp   :  0.0000  

I can't seem to fix this test, but I figure it's because I haven't
played enough with ulps settings that flag the test as failed.
The error is in the e-06 rang which really sucks. Any thoughts?

Next is a set of failures all related to "rint" for rounding an integer
to the correct value. The failures are very werid.

Failure: Test: rint (1.5) == 1.0
Result:
 is:          2.00000000000000000000e+00   0x1.00000000000000000000p+1
 should be:   1.00000000000000000000e+00   0x1.00000000000000000000p+0
 difference:  1.00000000000000000000e+00   0x1.00000000000000000000p+0
 ulp       :  8388608.0000
 max.ulp   :  0.0000  

That ulp is bogus? Not to mention that the rounding direction is wrong.

Lastly is:

Failure: Real part of: cacos (inf + NaN i) == NaN + inf i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (-inf + NaN i) == NaN + inf i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + inf i) == NaN - inf i: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN - inf i) == NaN + inf i: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + NaN i) == NaN + NaN i: Exception "Invalid operation" set
Failure: Real part of: ccosh (inf + NaN i) == inf + NaN i: Exception "Invalid operation" set
Failure: Real part of: ccosh (-inf + NaN i) == inf + NaN i: Exception "Invalid operation" set
Failure: Real part of: cpow (NaN + NaN i, NaN + NaN i) == NaN + NaN i: Exception "Invalid operation" set
Failure: Real part of: csinh (0.0 + NaN i) == 0.0 + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-0 + NaN i) == 0.0 + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (inf + NaN i) == inf + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-inf + NaN i) == inf + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set

Which all looks like corner case tets for these functions and the processor
is raising an exception. I've never had a chance or desire to look at these
but I will when I have nothing better to do ;)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
