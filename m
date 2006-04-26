From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Wed, 26 Apr 2006 19:38:57 +0200
Message-ID: <IYCBOX$3B000069249C22339E9F9F5DC8AB8238@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
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

> >                 =3D=3D=3D gfortran Summary =3D=3D=3D
> > 
> > # of expected passes            12718
> > # of unexpected failures        2
> > # of expected failures          14
> > # of unsupported tests          96
> > # of expected failures          12
> > # of unsupported tests          315
> 
> Excellent.  All the complex fails are fixed.  I'll do a PR on the
> two enum fails.
> 
> It would be great if you could generate a test summary with
> contrib/test_summary 

mmm, the build of the gcc-snapshot dpkg already prepare its 'test-summary=
' file:
Results for 4.2.0 20060425 (experimental) testsuite on hppa-unknown-linux=
-gnu
LAST_UPDATED: 
Native configuration is hppa-unknown-linux-gnu

		=3D=3D=3D g++ tests =3D=3D=3D


Running target unix

		=3D=3D=3D g++ Summary =3D=3D=3D

# of expected passes		12322
# of expected failures		67
# of unsupported tests		124
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/build/gcc/testsuit=
e/g++/../../g++
 version 4.2.0 20060425 (experimental)

		=3D=3D=3D gcc tests =3D=3D=3D


Running target unix
WARNING: program timed out.
FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -g  (test for excess errors=
)
FAIL: gcc.c-torture/execute/builtin-bitops-1.c execution,  -O3
-fomit-frame-pointer -funroll-loops 
FAIL: gcc.c-torture/execute/builtin-bitops-1.c execution,  -O3
-fomit-frame-pointer -funroll-all-loops -finline-functions 
FAIL: gcc.dg/gomp/pr25989.c (test for excess errors)
FAIL: gcc.dg/torture/pr24626-1.c  -O2  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-1.c  -O3 -fomit-frame-pointer  (test for exc=
ess
errors)
FAIL: gcc.dg/torture/pr24626-1.c  -O3 -g  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-1.c  -Os  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-2.c  -O2  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-2.c  -O3 -fomit-frame-pointer  (test for exc=
ess
errors)
FAIL: gcc.dg/torture/pr24626-2.c  -O3 -g  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-3.c  -O2  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-3.c  -O3 -fomit-frame-pointer  (test for exc=
ess
errors)
FAIL: gcc.dg/torture/pr24626-3.c  -O3 -g  (test for excess errors)
FAIL: gcc.dg/torture/pr24626-3.c  -Os  (test for excess errors)
FAIL: gcc.dg/tree-prof/val-prof-2.c scan-tree-dump n \\+ \\-1
XPASS: gcc.dg/tree-ssa/loop-1.c scan-assembler-times foo 5

		=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes		37948
# of unexpected failures	16
# of unexpected successes	1
# of expected failures		79
# of untested testcases		28
# of unsupported tests		382
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/build/gcc/xgcc  ve=
rsion
4.2.0 20060425 (experimental)

		=3D=3D=3D gfortran tests =3D=3D=3D


Running target unix
FAIL: gfortran.dg/enum_2.f90  -O   (test for errors, line 9)
FAIL: gfortran.dg/enum_2.f90  -O  (test for excess errors)

		=3D=3D=3D gfortran Summary =3D=3D=3D

# of expected passes		12718
# of unexpected failures	2
# of expected failures		14
# of unsupported tests		96
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/build/gcc/testsuit=
e/gfortran/../../gfortran
 version 4.2.0 20060425 (experimental)

		=3D=3D=3D obj-c++ tests =3D=3D=3D


Running target unix
FAIL: obj-c++.dg/comp-types-10.mm (test for excess errors)
FAIL: obj-c++.dg/cxx-ivars-2.mm execution test
FAIL: obj-c++.dg/encode-3.mm (test for excess errors)
FAIL: obj-c++.dg/encode-8.mm execution test
FAIL: obj-c++.dg/isa-field-1.mm (test for excess errors)
FAIL: obj-c++.dg/lookup-2.mm (test for excess errors)
WARNING: obj-c++.dg/lookup-2.mm compilation failed to produce executable
FAIL: obj-c++.dg/try-catch-2.mm (test for excess errors)
WARNING: obj-c++.dg/try-catch-2.mm compilation failed to produce executab=
le
FAIL: obj-c++.dg/try-catch-9.mm (test for excess errors)
WARNING: obj-c++.dg/try-catch-9.mm compilation failed to produce executab=
le

		=3D=3D=3D obj-c++ Summary =3D=3D=3D

# of expected passes		425
# of unexpected failures	8
# of unsupported tests		13
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/build/gcc/testsuit=
e/obj-c++/../../g++
 version 4.2.0 20060425 (experimental)

		=3D=3D=3D objc tests =3D=3D=3D


Running target unix

		=3D=3D=3D objc Summary =3D=3D=3D

# of expected passes		1752
# of expected failures		7
# of unsupported tests		24
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/build/gcc/xgcc  ve=
rsion
4.2.0 20060425 (experimental)

		=3D=3D=3D treelang tests =3D=3D=3D


Running target unix

		=3D=3D=3D treelang Summary =3D=3D=3D

# of expected passes		50
		=3D=3D=3D libffi tests =3D=3D=3D


Running target unix

		=3D=3D=3D libffi Summary =3D=3D=3D

# of expected passes		1072
# of unsupported tests		8
		=3D=3D=3D libgomp tests =3D=3D=3D


Running target unix
FAIL: libgomp.c/critical-1.c (test for excess errors)
WARNING: libgomp.c/critical-1.c compilation failed to produce executable
FAIL: libgomp.c/loop-1.c (test for excess errors)
WARNING: libgomp.c/loop-1.c compilation failed to produce executable
FAIL: libgomp.c/loop-2.c (test for excess errors)
WARNING: libgomp.c/loop-2.c compilation failed to produce executable
FAIL: libgomp.c/ordered-1.c (test for excess errors)
WARNING: libgomp.c/ordered-1.c compilation failed to produce executable
FAIL: libgomp.c/ordered-2.c (test for excess errors)
WARNING: libgomp.c/ordered-2.c compilation failed to produce executable
FAIL: libgomp.c/sections-1.c (test for excess errors)
WARNING: libgomp.c/sections-1.c compilation failed to produce executable
FAIL: libgomp.c/single-1.c (test for excess errors)
WARNING: libgomp.c/single-1.c compilation failed to produce executable
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O0  execution test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O1  execution test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O2  execution test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O3 -fomit-frame-pointer  execution=
 test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O3 -fomit-frame-pointer -funroll-l=
oops
 execution test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O3 -fomit-frame-pointer
-funroll-all-loops -finline-functions  execution test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -O3 -g  execution test
WARNING: program timed out.
FAIL: libgomp.fortran/reduction6.f90  -Os  execution test

		=3D=3D=3D libgomp Summary =3D=3D=3D

# of expected passes		1136
# of unexpected failures	15
# of unsupported tests		110
		=3D=3D=3D libjava tests =3D=3D=3D


Running target unix
XPASS: PR26858 execution - source compiled test
XPASS: PR26858 output - source compiled test
XPASS: PR26858 execution - bytecode->native test
XPASS: PR26858 output - bytecode->native test
XPASS: PR26858 -O3 execution - source compiled test
XPASS: PR26858 -O3 output - source compiled test
XPASS: PR26858 -O3 execution - bytecode->native test
XPASS: PR26858 -O3 output - bytecode->native test
FAIL: Serialization output - gij test
FAIL: Serialization output - gij test
FAIL: negzero output - gij test
FAIL: negzero output - gij test
FAIL: pr25676 output - gij test
FAIL: pr25676 output - gij test

		=3D=3D=3D libjava Summary =3D=3D=3D

# of expected passes		4143
# of unexpected failures	6
# of unexpected successes	8
# of expected failures		12
# of untested testcases		10
		=3D=3D=3D libmudflap tests =3D=3D=3D


Running target unix

		=3D=3D=3D libmudflap Summary =3D=3D=3D

# of expected passes		1814
		=3D=3D=3D libstdc++ tests =3D=3D=3D


Running target unix
FAIL: 25_algorithms/prev_permutation/1.cc execution test
XPASS: 26_numerics/cmath/c99_classification_macros_c.cc (test for excess =
errors)

		=3D=3D=3D libstdc++ Summary =3D=3D=3D

# of expected passes		3540
# of unexpected failures	1
# of unexpected successes	1
# of expected failures		12
# of unsupported tests		315

Compiler version: 4.2.0 20060425 (experimental) 
Platform: hppa-unknown-linux-gnu
configure flags: -v --prefix=3D/usr/lib/gcc-snapshot --enable-shared
--with-system-zlib --disable-nls --enable-__cxa_atexit --enable-clocale=3D=
gnu
--enable-libstdcxx-debug --enable-java-awt=3Dgtk --enable-gtk-cairo
--with-java-home=3D/usr/lib/gcc-snapshot/jre --enable-mpfr --disable-werr=
or
hppa-linux-gnu --enable-languages=3Dc,c++,fortran,java,objc,obj-c++,treel=
ang
BOOT_CFLAGS=3D-O2


Build Dependencies:
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-install=
ed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: uppe=
rcase=3Dbad)
||/ Name           Version             Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
ii  binutils       2.16.1cvs20060413-1 The GNU assembler, linker and bina=
ry
utilities


Patches that Debian applied in this version:

cpu-default-i486:
  set default 32bit ix86 architecture to i486

gcc-ice-hack:
  2004-01-23  Jakub Jelinek  <jakub@redhat.com>
  
  	* system.h (ICE_EXIT_CODE): Define.
  	* gcc.c (execute): Don't free first string early, but at the end
  	of the function.  Call retry_ice if compiler exited with
  	ICE_EXIT_CODE.
  	(retry_ice): New function.
  	* diagnostic.c (diagnostic_count_diagnostic,
  	diagnostic_action_after_output, error_recursion): Exit with
  	ICE_EXIT_CODE instead of FATAL_EXIT_CODE.

Counting all warnings,
there are 0 warnings in stage3 of this bootstrap.

Number of warnings per file:

Number of warning types:
=3D=3D=3D=3D<>=3D=3D=3D=3D

Or would it be better to run the purely gcc script?


>and use the generated script to mail the
> results to gcc-testresults@gcc.gnu.org.
> 
> Thanks,

Welcome,
    Joel
=0A=0A----------=0AWordt ook lid van de Scarlet Club via een bestaande Sc=
arlet klant en ontvang cadeaucheques twv EUR 50! Bezoek snel http://www.s=
carletclub.be=0ADevenez aussi membre du Club Scarlet via un client Scarle=
t existant et recevez des cheques cadeaux jusqu'a EUR 50! Surfez vite sur=
 http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
