From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] debian glibc 2.3.6-2.0 test
Date: Sun, 26 Feb 2006 00:10:06 +0000
Message-ID: <4400F1DE.1040604@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
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

Hello pa*,

With those debian src + Carlos's patch: <http://cvs.parisc-linux.org/glibc/posix/regcomp.c?rev=1.3&view=log>, here are the latest 
Error of make -k check:
# grep Err ../../../../Logs/glibc-2.3.6-2.0.Check make[2]: *** 
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/localedata/sort-test.out] Error 1
make[1]: *** [localedata/tests] Error 2
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-float.out] Error 1
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-double.out] Error 1
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-idouble.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/tst-rxspencer.out] Error 139
make[2]: [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/annexc.out] Error 1 (ignored)
make[1]: *** [posix/tests] Error 2
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxthreads/tst-attr1.out] Error 1
make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer.out] Error 137
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-aio4.out] Error 1
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer4.out] Error 1
make[1]: *** [rt/tests] Error 2
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-tls13.out] Error 1
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-execstack.out] Error 1
make[2]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-execstack-prog.out] Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

Sorry I didn't fond back the list of known Errors, could you point me out regressions?

TIA,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
