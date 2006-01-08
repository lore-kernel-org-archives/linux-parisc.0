From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: [RFC] Updated glibc 2.3.5-8.1
Date: Sun, 8 Jan 2006 14:03:31 -0500 (EST)
Message-ID: <200601081903.k08J3Wvh024822@hiauly1.hia.nrc.ca>
References: <20060108030342.GA17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060108030342.GA17559@baldric.uwo.ca> from "Carlos O'Donell" at
	Jan 7, 2006 10:03:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I have this running on my local system without problems.
> I'm testing the NPTL/TLS toolchain using this as my system libc.
> 
> Dave could you please test if this fixes the strtold failures?

Here are the before and after results:

http://gcc.gnu.org/ml/gcc-testresults/2006-01/msg00364.html
http://gcc.gnu.org/ml/gcc-testresults/2006-01/msg00386.html

It looks like all the strtold failures in the libstdc++ tests are fixed.
However, we have some new failures:

FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O0 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O1 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O2 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O3 -fomit-frame-pointer 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O3 -fomit-frame-pointer -funroll-loops 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O3 -fomit-frame-pointer -funroll-all-loops -finline-functions 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -O3 -g 
FAIL: gfortran.fortran-torture/execute/power.f90 execution,  -Os 

FAIL: 26_numerics/complex/13450.cc execution test

There are also some other changes in the gfortran tests (header
optimization issues?).

I've looked at 6_numerics/complex/13450.cc at bit:

strace ./13450.xg
...
mmap(NULL, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40003000
--- SIGFPE (Floating point exception) @ 0 (0) ---
+++ killed by SIGFPE (core dumped) +++

(gdb) r
Starting program: /home/dave/gnu/gcc-4.0/objdir/hppa-linux/libstdc++-v3/testsuite/13450.xg

Program received signal SIGFPE, Arithmetic exception.
0x407efaa8 in __ieee754_expf (x=1.62841105)
    at ../sysdeps/ieee754/flt-32/e_expf.c:95
95      ../sysdeps/ieee754/flt-32/e_expf.c: No such file or directory.
    in ../sysdeps/ieee754/flt-32/e_expf.c
Current language:  auto; currently c
(gdb) bt
#0  0x407efaa8 in __ieee754_expf (x=1.62841105)
    at ../sysdeps/ieee754/flt-32/e_expf.c:95
#1  0x407f96ec in __cexpf (x=The value of variable 'x' is distributed across several
locations, and GDB cannot access its value.

) at ../sysdeps/generic/s_cexpf.c:41
#2  0x407fb5e8 in __cpowf (c=The value of variable 'c' is distributed across several
locations, and GDB cannot access its value.

) at ../sysdeps/generic/s_cpowf.c:28
#3  0x0001dba8 in test01_do<float> (a=-3.20000005, b=Cannot access memory at address 0x4
) at complex:966
#4  0x0001e13c in test01 ()
    at /home/dave/gnu/gcc-4.0/gcc/libstdc++-v3/testsuite/26_numerics/complex/13450.cc:54
#5  0x0001e13c in test01 ()
    at /home/dave/gnu/gcc-4.0/gcc/libstdc++-v3/testsuite/26_numerics/complex/13450.cc:54

Previous frame identical to this frame (corrupt stack?)
(gdb) disass 0x407efa88 0x407efac8
Dump of assembler code from 0x407efa88 to 0x407efac8:
0x407efa88 <__ieee754_expf+108>:        b,l 0x407ce1cc <__ieee754_acos+5136>,rp
0x407efa8c <__ieee754_expf+112>:        ldi 0,r26
0x407efa90 <__ieee754_expf+116>:        addil -1000,r4,%r1
0x407efa94 <__ieee754_expf+120>:        ldw 51c(,r1),r20
0x407efa98 <__ieee754_expf+124>:        fldw 0(,r20),fr22
0x407efa9c <__ieee754_expf+128>:        fmpy,sgl fr12,fr22,fr22
0x407efaa0 <__ieee754_expf+132>:        addil -1000,r4,%r1
0x407efaa4 <__ieee754_expf+136>:        ldw 520(,r1),r20
0x407efaa8 <__ieee754_expf+140>:        fldw 0(,r20),fr23
0x407efaac <__ieee754_expf+144>:        fadd,sgl fr22,fr23,fr25
0x407efab0 <__ieee754_expf+148>:        fsub,sgl fr25,fr23,fr25
0x407efab4 <__ieee754_expf+152>:        fcnvff,sgl,dbl fr12,fr24
0x407efab8 <__ieee754_expf+156>:        fcnvff,sgl,dbl fr25,fr23
0x407efabc <__ieee754_expf+160>:        addil -1000,r4,%r1
0x407efac0 <__ieee754_expf+164>:        ldw 524(,r1),r20
0x407efac4 <__ieee754_expf+168>:        fldd 0(,r20),fr22
End of assembler dump.
(gdb) p/x $r20
$2 = 0x40835264
(gdb) x/x 0x40835264
0x40835264 <M_LN2___5+12>:      0x4b400000

I suspect a kernel or gdb issue wrt the floating-point exception
registers:

(gdb) info reg all
...
mpsfu_high     0x0      0
mpsfu_low      0x0      0
mpsfu_ovflo    0x0      0
pad            0x0      0
fpsr           0x0      0
fpe1           0x0      0
fpe2           0x0      0
fpe3           0x0      0
fpe4           0x0      0
fpe5           0x0      0
fpe6           0x0      0
fpe7           0x0      0

The operands for the previous fmpy insn seem ok.  It's interesting
that when I single step from the fmpy that I don't see the result
in fr22 until after the SIGFPE.  It sort of looks like the exception
must be in __ieee754_acos.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
