From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Tue, 16 Aug 2005 03:23:28 -0600
Message-ID: <4301B090.9040405@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
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

In the interim until I can source an ISA/EISA fast ethernet card, I've
been playing with my new C160.  I decided to benchmark it and compare it
to my B132L.  To my surprise, when it came to integer operations, the
B132L outperforms the C160!

I benchmarked using nbench, which is a Linux/Unix port of Byte
magazine's ByteMark.  Full results from both machines are at the end of
this post.

Both machines were benchmarked using identical binaries compiled with:
-O3 -march=1.1 -mschedule=7300 -mfast-indirect-calls -mgas

Thinking that the scheduling and architecture might be slowing down the
C160, I recompiled it with:
-O3 -march=2.0 -mschedule=8000 -mfast-indirect-calls -mgas

When that produced even worse results, I tried -march=2.0 vs 1.1 and
-mschedule=8000 vs 7300 seperately.  Each one alone slows down the
benchmark and the effect is addititive.  It seems that in Linux, right
now at least, compiling with -march=2.0 or -mschedule=8000 is a Bad Thing.

If you look at the individual results, in most areas the C160 performs
about 20% better than the B132.  It's just that in a few areas, the C160
has absolutely dismal performance.  Numeric sorting and the assignment
algorithm were both notably slower on the C160.

With a clock speed 20% faster, I must admit that the C160's poor showing
was a dissappointment.  I'm wondering if this is because there isn't a
64-bit userland yet.  Is stepping down to 32-bit on the C160 hurting its
performance that badly?

I suppose (assuming I'm correct about the reason for the performance
drop) my options are to wait for 64-bit userland or to put HPUX on it.

Is there any way which someone can help the 64-bit userland effort who
is quite strong in system-level programming in general though weak in
Linux kernel programming specifically?  Is there a project web site for
this effort?

	Kurt


Phong (C160):
------------------------------------------------------------------
TEST                : Iterations/sec.  : Old Index   : New Index
                    :                  : Pentium 90* : AMD K6/233*
--------------------:------------------:-------------:------------
NUMERIC SORT        :           37.51  :       0.96  :       0.32
STRING SORT         :          5.0486  :       2.26  :       0.35
BITFIELD            :      1.6052e+07  :       2.75  :       0.58
FP EMULATION        :          8.4215  :       4.04  :       0.93
FOURIER             :          1102.1  :       1.25  :       0.70
ASSIGNMENT          :         0.59547  :       2.27  :       0.59
IDEA                :          115.34  :       1.76  :       0.52
HUFFMAN             :          89.382  :       2.48  :       0.79
NEURAL NET          :          1.6905  :       2.72  :       1.14
LU DECOMPOSITION    :          41.254  :       2.14  :       1.54
=======================ORIGINAL BYTEMARK RESULTS=======================
INTEGER INDEX       : 2.187
FLOATING-POINT INDEX: 1.938
Baseline: MSDOS P90, 256 KB L2-cache, Watcom* compiler 10.0
===========================LINUX DATA BELOW============================
CPU                 : Raven U 160 (9000/780/C160) 160MHz
L2 Cache            : 512 KB (WB, 0-way associative)
OS                  : Linux 2.6.10-pa11-phong-3
C compiler          : gcc version 3.3.5 (Debian 1:3.3.5-13)
libc                : ld-2.3.2.so
MEMORY INDEX        : 0.491
INTEGER INDEX       : 0.591
FLOATING-POINT INDEX: 1.075
Baseline: Linux AMD K6/233*, 512 KB L2-cache, gcc 2.7.2.3, libc-5.4.38
=======================================================================


Megabyte (B132L):
------------------------------------------------------------------
TEST                : Iterations/sec.  : Old Index   : New Index
                    :                  : Pentium 90* : AMD K6/233*
--------------------:------------------:-------------:------------
NUMERIC SORT        :          60.695  :       1.56  :       0.51
STRING SORT         :          3.3905  :       1.51  :       0.23
BITFIELD            :      1.1081e+07  :       1.90  :       0.40
FP EMULATION        :          6.0832  :       2.92  :       0.67
FOURIER             :          876.58  :       1.00  :       0.56
ASSIGNMENT          :         0.80283  :       3.05  :       0.79
IDEA                :          150.04  :       2.29  :       0.68
HUFFMAN             :          76.017  :       2.11  :       0.67
NEURAL NET          :          1.1334  :       1.82  :       0.77
LU DECOMPOSITION    :          41.733  :       2.16  :       1.56
=======================ORIGINAL BYTEMARK RESULTS=======================
INTEGER INDEX       : 2.121
FLOATING-POINT INDEX: 1.577
Baseline: MSDOS P90, 256 KB L2-cache, Watcom* compiler 10.0
===========================LINUX DATA BELOW============================
CPU                 : Merlin L2 132 (9000/778/B132L) 132MHz
Cache               : 64 KB (WB, 0-way associative)
OS                  : Linux 2.6.8.1-pa11-megabyte-20050720
C compiler          : gcc version 3.3.5 (Debian 1:3.3.5-13)
libc                : ld-2.3.2.so
MEMORY INDEX        : 0.419
INTEGER INDEX       : 0.630
FLOATING-POINT INDEX: 0.875
Baseline: Linux AMD K6/233*, 512 KB L2-cache, gcc 2.7.2.3, libc-5.4.38
=======================================================================

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
