From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] some starting . of glibc test math filaures ;-)
Date: Mon,  8 May 2006 18:36:34 +0200
Message-ID: <IYYGSY$E62A6934D9220D950CCC57E2A36080C6@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hello all,

After the clone() pb, I continue a bit investigating in broken test.

In summary, here are the math failing test:
/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-float.out
::::::::::::::
testing float (without inline functions)
Failure: Real part of: cacos (inf + NaN i) =3D=3D NaN + inf i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (-inf + NaN i) =3D=3D NaN + inf i plus sign =
of
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + inf i) =3D=3D NaN - inf i: Exception =
"Invalid
operation" set
Failure: Real part of: cacos (NaN - inf i) =3D=3D NaN + inf i: Exception =
"Invalid
operation" set
Failure: Real part of: cacos (NaN + NaN i) =3D=3D NaN + NaN i: Exception =
"Invalid
operation" set
Failure: Real part of: ccosh (inf + NaN i) =3D=3D inf + NaN i: Exception =
"Invalid
operation" set
Failure: Real part of: ccosh (-inf + NaN i) =3D=3D inf + NaN i: Exception=
 "Invalid
operation" set
Failure: Real part of: cpow (NaN + NaN i, NaN + NaN i) =3D=3D NaN + NaN i=
:
Exception "Invalid operation" set
Failure: Real part of: csinh (0.0 + NaN i) =3D=3D 0.0 + NaN i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-0 + NaN i) =3D=3D 0.0 + NaN i plus sign of=
 zero/inf
not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (inf + NaN i) =3D=3D inf + NaN i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-inf + NaN i) =3D=3D inf + NaN i plus sign =
of
zero/inf not specified: Exception "Invalid operation" set

Test suite completed:
2599 test cases plus 2384 tests for exception flags executed.
12 errors occurred.
::::::::::::::
/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-double.out
::::::::::::::
testing double (without inline functions)
Failure: Test: lround (1071930.0008) =3D=3D 1071930
Result:
is: 1071930
should be: 1071930
Failure: Real part of: cacos (inf + NaN i) =3D=3D NaN + inf i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (-inf + NaN i) =3D=3D NaN + inf i plus sign =
of
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + inf i) =3D=3D NaN - inf i: Exception =
"Invalid
operation" set
Failure: Real part of: cacos (NaN - inf i) =3D=3D NaN + inf i: Exception =
"Invalid
operation" set
Failure: Real part of: cacos (NaN + NaN i) =3D=3D NaN + NaN i: Exception =
"Invalid
operation" set
Failure: Real part of: ccosh (0.0 + NaN i) =3D=3D NaN + 0.0 i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: ccosh (-0 + NaN i) =3D=3D NaN + 0.0 i plus sign of=
 zero/inf
not specified: Exception "Invalid operation" set
Failure: Real part of: ccosh (inf + NaN i) =3D=3D inf + NaN i: Exception =
"Invalid
operation" set
Failure: Real part of: ccosh (-inf + NaN i) =3D=3D inf + NaN i: Exception=
 "Invalid
operation" set
Failure: Real part of: cpow (NaN + NaN i, NaN + NaN i) =3D=3D NaN + NaN i=
:
Exception "Invalid operation" set
Failure: Real part of: csinh (0.0 + NaN i) =3D=3D 0.0 + NaN i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-0 + NaN i) =3D=3D 0.0 + NaN i plus sign of=
 zero/inf
not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (inf + NaN i) =3D=3D inf + NaN i plus sign o=
f
zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-inf + NaN i) =3D=3D inf + NaN i plus sign =
of
zero/inf not specified: Exception "Invalid operation" set

Test suite completed:
2624 test cases plus 2399 tests for exception flags executed.
15 errors occurred.
::::::::::::::
/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-idouble.out
::::::::::::::
testing double (inline functions)
Failure: Test: lround (1071930.0008) =3D=3D 1071930
Result:
is: 1071930
should be: 1071930

Test suite completed:
2562 test cases plus 2337 tests for exception flags executed.
1 errors occurred.

=3D=3D=3D=3D<>=3D=3D=3D=3D

The easiest is obviously the last one; I just simplified libm-test.c and =
added
some printf() to read:
/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-idouble-b
testing double (inline functions)
computed: 1071930
expected: 1071930
labs (diff): 0
max_ulp: -214511494
Failure: Test: lround (1071930.0008) =3D=3D 1071930
Result:
is: 1071930
should be: 1071930

Test suite completed:
3 test cases plus 1 tests for exception flags executed.
1 errors occurred.
=3D=3D=3D=3D<>=3D=3D=3D=3D

The results are well ok as mentioned:
Result:
is: 1071930
should be: 1071930

it seems so being just a test pb in:
/* Check that computed and expected values are equal (long int values). *=
/
static void
check_long (const char *test_name, long int computed, long int expected,
long int max_ulp, int xfail, int exceptions)
{
long int diff =3D computed - expected;
printf ("computed: %ld\n", computed);
printf ("expected: %ld\n", expected);
int ok =3D 0;

test_exceptions (test_name, exceptions);
noTests++;
printf ("labs (diff): %ld\n", labs (diff));
printf ("max_ulp: %ld\n", max_ulp);
if (labs (diff) <=3D max_ulp)
ok =3D 1;

if (!ok)
print_ulps (test_name, diff);

if (print_screen (ok, xfail))
{
if (!ok)
printf ("Failure: ");
printf ("Test: %s\n", test_name);
printf ("Result:\n");
printf (" is: %ld\n", computed);
printf (" should be: %ld\n", expected);
}

update_stats (ok, xfail);
fpstack_test (test_name);
}
[snip]

while the call is:
[snip]
check_long ("lround (1071930.0008) =3D=3D 1071930", FUNC(lround)
(1071930.0008), 1071930, DELTA1247, 0, 0);
[snip]

DELTA1247 being define in math/libm-test-ulps.h as:
#define DELTA1247 CHOOSE(0, -214511494, 0, 0, -214511494, 0) /* lround
(1071930.0008) =3D=3D 1071930 */

and CHOOSE() in math/test-idouble.c:
#define
CHOOSE(Clongdouble,Cdouble,Cfloat,Cinlinelongdouble,Cinlinedouble,Cinline=
float)
Cinlinedouble

and effectively check_long() is well precompiled:
(.i file)
[snip]
check_long ("lround (1071930.0008) =3D=3D 1071930", lround (1071930.0008)=
,
1071930, -214511494, 0, 0);
[snip]

afaik, as math/libm-test-ulps.h, is genetated by a perl script driven by
../sysdeps/hppa/fpu/libm-test-ulps file. And it seems that hppa is the on=
ly
one to specify:
[snip]
# lround 
Test "lround (1071930.0008) =3D=3D 1071930":
double: -214511494
idouble: -214511494
[snip]

If somebody still remember why, that could help me a bit.

Thanks in advance,
Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devene=
z aujourd'hui Scarlet One grace a un client existant de Scarlet, vous rec=
evez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur ht=
tp://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
