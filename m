From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] glibc nptl failure baseline update.
Date: Tue, 6 Feb 2007 23:26:19 +0100
Message-ID: <20070206232619.214a9180.gmsoft__11682.1314012215$1416624276$gmane$org@gentoo.org>
References: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
	<20070206224246.3000a76c.gmsoft@gentoo.org>
	<119aab440702061358s5c0ee062l65eaff50429ada47@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702061358s5c0ee062l65eaff50429ada47@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 6 Feb 2007 16:58:05 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> On 2/6/07, Guy Martin <gmsoft@gentoo.org> wrote:
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-float.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-double.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-ifloat.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-idouble.out] Error 1
> > make[1]: *** [math/tests] Error 2
> 
> Compiler too old. You need a compiler with the quiet NaN fixes that
> Joel Soete and John David Anglin fixed.

The NaN fix was applied. The bug changed this way after aplying it :

hake patches # less /var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-float.out
testing float (without inline functions)
Failure: Test: erfc (0.75) == 0.288844366346484868401062165408589223
Result:
 is:          2.88844347000122070312e-01   0x1.27c6d000000000000000p-2
 should be:   2.88844376802444458008e-01   0x1.27c6d200000000000000p-2
 difference:  2.98023223876953125000e-08   0x1.00000000000000000000p-25
 ulp       :  1.0000
 max.ulp   :  0.0000
Maximal error of `erfc'
 is      : 1 ulp
 accepted: 0 ulp
Failure: Test: Real part of: cpow (2 + 3 i, 4 + 0 i) == -119.0 - 120.0 i
Result:
 is:         -1.18999961853027343750e+02  -0x1.dbfff600000000000000p+6
 should be:  -1.19000000000000000000e+02  -0x1.dc000000000000000000p+6
 difference:  3.81469726562500000000e-05   0x1.40000000000000000000p-15
 ulp       :  5.0000
 max.ulp   :  4.0000
Maximal error of real part of: cpow
 is      : 5 ulp
 accepted: 4 ulp
Maximal error of imaginary part of: cpow
 is      : 2 ulp
 accepted: 2 ulp

Test suite completed:
  2917 test cases plus 2564 tests for exception flags executed.
  4 errors occurred.

> 
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/libio/tst-memstream2.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/libio/tst-wmemstream2.out] Error 1
> > make[1]: *** [libio/tests] Error 2
> 
> export TIMEOUTFACTOR=30
> 
>
> You must increase the timeouts for all testsuite runs.
> 

2 down :)


> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/string/tst-strxfrm2.out] Error 1
> > make[1]: *** [string/tests] Error 2
> 
> Unknown.

This is the result of the test :
hake patches # cat /var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/string/tst-strxfrm2.out
setlocale failed

  if (setlocale (LC_ALL, "de_DE.UTF-8") == NULL)
      puts ("setlocale failed");
This locale is not installed. It's not likely to work :)


> Watch out there is a compiler bug I ran into with vfprintf. I have a
> patch to disable delayed branch reorganization when compiling
> vfprintf.c from stdio.

Where is this patch ? :)

> 
> > make[2]: [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/posix/annexc.out] Error 1 (ignored)
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx4.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx5.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx20.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx21.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cleanupx4.out] Error 1
> > make[1]: *** [nptl/tests] Error 2
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-timer4.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-timer5.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-cputimer1.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-cputimer2.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-cputimer3.out] Error 1
> > make[1]: *** [rt/tests] Error 2
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-pie1.out] Error 139
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-audit2.out] Error 139
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-addr1.out] Error 1
> > make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/check-textrel.out] Error 1
> > make[1]: *** [elf/tests] Error 2
> > make: *** [check] Error 2
> 
> This looks great!
> 
> > I used those patches :
> >
> > 7001_hppa_local-inlining.patch : from debian's deb
> > 7002_hppa_submitted-lt.patch : idem
> > 7003_hppa_ports-cvs-head-20070129.patch : cvs head of the ports repo on the 20070129
> > 7005_hppa_cvs-head-20061203.patch : cvs head as of 20061203 of the libcd repo. This is the time of the last hppa commit to ports
> > 7006_hppa_ports-cvs-head-20070205.patch : your patch mentionned in your previous email
> > 7007_hppa_various-fixes.patch : cfi_endproc fix + 2 small include fix
> 
> > The cancel tests fail with message similar to this :
> > cleanup handler not called for 'pause'
> 
> This is in coordination with the compiler. I haven't determined why
> they don't work.
> 
> > tst-timer4.out :
> > clock_gettime returned timespec = { 1170787417, 996313000 }
> > clock_getres returned timespec = { 0, 4000250 }
> 
> Unknown.
> 
> > tst-addr1.out :
> > found symbol (null) in /var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-addr1
> 
> Unknown. But likely binutils related.
>

I used this binutils :
GNU ld version 2.17.50.0.9 20070103

I'll try a newer version but got not much hope.

> > check-textrel.out :
> > /var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/libc.so: segment 3 is executable and writable
> 
> We don't support RO text yet.
>

One less test to worry about :)
 
>
> Thanks for quick turnaround!
> 
> With this new glibc are you able to get a usable userspace in gentoo?
> Cancellation might break C++ applications...


So far so good, python and openldap test suite wich failed in odd ways wrt thread stuff now works fine :)

This is still only in a chroot, we'll put that in portage soon for testing.


Cheers,
  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
