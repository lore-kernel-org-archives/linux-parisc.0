From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Latest glibc failures.
Date: Fri, 9 Jun 2006 10:57:05 -0400
Message-ID: <119aab440606090757vc2966ear8a4d30c04af17ae2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: "Randolph Chung" <randolph@tausq.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

Randolph,

Everything for libc-ports is upstream, even fixes for errlist-compat
(new errnos added to the kernel mandated a new symbol).

I'm seeing the funny tst-printfsz failures. Not sure what to make of these.

Cheers,
Carlos.

make[2]: *** [/libc/math/test-float.out] Error 1
make[2]: *** [/libc/math/test-double.out] Error 1
make[2]: *** [/libc/math/test-ifloat.out] Error 1
make[2]: *** [/libc/math/test-idouble.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/libc/stdio-common/tst-printfsz.out] Error 139
make[2]: *** [/libc/stdio-common/tst-printf.out] Error 1
make[1]: *** [stdio-common/tests] Error 2
make[2]: [/libc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/libc/linuxthreads/tst-clock1.out] Error 1
make[2]: *** [/libc/linuxthreads/tst-attr1.out] Error 1
make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/libc/rt/tst-aio9.out] Error 1
make[2]: *** [/libc/rt/tst-aio10.out] Error 1
make[1]: *** [rt/tests] Error 2
make[2]: *** [/libc/elf/tst-pie1.out] Error 139
make[2]: *** [/libc/elf/tst-leaks1-mem] Error 1
make[2]: *** [/libc/elf/order.out] Error 1
make[2]: *** [/libc/elf/nodelete2.out] Error 1
make[2]: *** [/libc/elf/tst-align2.out] Error 1
make[2]: *** [/libc/elf/order2.out] Error 1
make[2]: *** [/libc/elf/tst-audit2.out] Error 139
make[2]: *** [/libc/elf/check-textrel.out] Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
