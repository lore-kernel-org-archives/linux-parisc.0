From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Next step in glibc test math failures analysis ;-)
Date: Sun, 14 May 2006 12:06:25 +0000
Message-ID: <44671D41.6010401@tiscali.be>
References: <IZ03Y4$9E8A6266AB8A578EB25FE5A0BE2593A0@scarlet.be>
	<119aab440605091805q741bba07i3d50aee4299e6d82@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440605091805q741bba07i3d50aee4299e6d82@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Hello all,

Next investigation are obviously:
/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-float.out
::::::::::::::
testing float (without inline functions)
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

First thought, the reported failure is very unrelevent: the actual pb is not related to computed value but well because cacos() let 
fpu flag with "Invalid operation" set. So imho this 1st patch:
--- libm-test.inc.Orig 2006-05-12 12:02:10.000000000 +0000
+++ libm-test.inc 2006-05-12 15:39:31.000000000 +0000
@@ -549,14 +549,19 @@
    int part_xfail;
    char str[200];

+  /* report first what computation did */
+  test_exceptions (test_name, exception);
+
    sprintf (str, "Real part of: %s", test_name);
    part_comp = __real__ computed;
    part_exp = __real__ expected;
    part_max_ulp = __real__ max_ulp;
    part_xfail = __real__ xfail;

+  /* Don't check again for exceptions, just pass through the
+     zero/inf sign test.  */
    check_float_internal (str, part_comp, part_exp, part_max_ulp, part_xfail,
-   exception, &real_max_error);
+   exception & IGNORE_ZERO_INF_SIGN, &real_max_error);

    sprintf (str, "Imaginary part of: %s", test_name);
    part_comp = __imag__ computed;
@@ -564,11 +569,8 @@
    part_max_ulp = __imag__ max_ulp;
    part_xfail = __imag__ xfail;

-  /* Don't check again for exceptions, just pass through the
-     zero/inf sign test.  */
    check_float_internal (str, part_comp, part_exp, part_max_ulp, part_xfail,
-   exception & IGNORE_ZERO_INF_SIGN,
-   &imag_max_error);
+   exception & IGNORE_ZERO_INF_SIGN, &imag_max_error);
  }


====<>====

would better report the actual pb like this test:
Failure: cacos (inf + NaN i) == NaN + inf i plus sign of zero/inf not specified: Exception "Invalid operation" set

Would it have a chance to be accepted?

That said, for now I just know that for the first failure only, the pb occure in:
__complex__ float
__cacosf (__complex__ float x)
{
   __complex__ float y;
   __complex__ float res;

   y = __casinf (x);

   __real__ res = (float) M_PI_2 - __real__ y;
   __imag__ res = -__imag__ y;

   return res;
}

when the "_real_ res" is computed.

The test "check_complex ("casin (inf + NaN i) == NaN + inf i plus sign of zero/inf not specified" pass well so the the computation 
would be __real__ res = (double) M_PI_2 - NaN.

And also seems to confirm my very first feeling: this formula is mathematicaly right but may be presents some lakes of numerical 
implementation like is the brotherhood funct:
__complex__ float
__casinf (__complex__ float x)
{
   __complex__ float res;

   if (isnan (__real__ x) || isnan (__imag__ x))
     {
       if (__real__ x == 0.0)
         {
           res = x;
         }
       else if (__isinff (__real__ x) || __isinff (__imag__ x))
         {
           __real__ res = __nanf ("");
           __imag__ res = __copysignf (HUGE_VALF, __imag__ x);
         }
       else
         {
           __real__ res = __nanf ("");
           __imag__ res = __nanf ("");
         }
     }
   else
     {
       __complex__ float y;

       __real__ y = -__imag__ x;
       __imag__ y = __real__ x;

       y = __casinhf (y);

       __real__ res = __imag__ y;
       __imag__ res = -__real__ y;
     }

   return res;
}

So my next question is: is some of you know a similar implementation of cacosf()? or what would be the results of cacosf() for 
various limit figure with nan, 0.0 and infinity?

Thanks in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
