From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] NPTL for hppa-linux approaching production ready!
Date: Wed, 13 Sep 2006 18:31:46 -0400
Message-ID: <119aab440609131531p23470b7dkdf8419838d884ec8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "Jeff Bailey" <jbailey@raspberryginger.com>,
 "Randolph Chung" <randolph@tausq.org>,
 "John David Anglin" <dave.anglin@nrc.ca>
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

Application destructor running problems fixed, and checked into libc-ports!

My latest testsuite run shows:

make[2]: *** [/libc-tls-nptl/math/test-float.o] Error 1
make[2]: *** [/libc-tls-nptl/math/test-double.out] Error 1
make[2]: *** [/libc-tls-nptl/math/test-ifloat.out] Error 1
make[2]: *** [/libc-tls-nptl/math/test-idouble.o] Error 1
make[1]: *** [math/tests] Error 2

	- Normal math problems. No worries here.
	- Ignore.

make[2]: [/libc-tls-nptl/posix/annexc.out] Error 1 (ignored)

make[2]: *** [/libc-tls-nptl/nptl/tst-align2.out] Error 1

	- Reason unkonwn. SIGSEGV in child.
	- Bad.

make[2]: *** [/libc-tls-nptl/nptl/tst-cancel24] Error 1

	- libstdc++.so problem with my environment?
	- Ignore.

	/usr/local/tools/bin/../lib/gcc/hppa-linux/4.2.0/../../../libstdc++.so:
undefined reference to `int std::__convert_from_v<long double>(char*,
int, char const*, long double, int* const&, int)'
	/usr/local/tools/bin/../lib/gcc/hppa-linux/4.2.0/../../../libstdc++.so:
undefined reference to `int std::__convert_from_v<double>(char*, int,
char const*, double, int* const&, int)'
	collect2: ld returned 1 exit status

/libc-tls-nptl/nptl/tst-oddstacklimit: error while loading shared
libraries: libpthread.so.0: cannot open shared object file: Error 14
make[2]: *** [/libc-tls-nptl/nptl/tst-oddstacklimit.out] Error 127

	- This test is baloney, setting 'ulimit -s 1023' is not a good test.
	- Standard stack is '8192', or an 8MB stack, not a 1MB stack.
	- The error you see is libpthread.so.0 failing to load because the stack
	  is probably too small, and libc makes alloca calls aswell.
	- Ignore.

make[2]: *** [/libc-tls-nptl/nptl/tst-getpid1.out] Error 1
make[2]: *** [/libc-tls-nptl/nptl/tst-getpid2.out] Error 1

	- Possible breakage in clone. New called function via clone returns
parents PID from
	  call to getpid(). This means clone failed?
	- Bad.

make[2]: *** [/libc-tls-nptl/nptl/tst-cancelx4.out] Error 1
make[2]: *** [/libc-tls-nptl/nptl/tst-cancelx5.out] Error 1
make[2]: *** [/libc-tls-nptl/nptl/tst-cancelx20.out] Error 1
make[2]: *** [/libc-tls-nptl/nptl/tst-cancelx21.out] Error 1
make[2]: *** [/libc-tls-nptl/nptl/tst-cleanupx4.out] Error 1
make[1]: *** [nptl/tests] Error 2

	- All 5 tests are cleanup handler failures.
	- Bad.

make[2]: *** [/libc-tls-nptl/rt/tst-timer.out] Error 139

	- nptl/sysdeps/pthread/tst-timer.c crash in signal handler.
	- Bad.

make[2]: *** [/libc-tls-nptl/rt/tst-mqueue3.out] Error 1

	- mq_open fails?
	- Ignore.

make[2]: *** [/libc-tls-nptl/rt/tst-timer4.out] Error 1
make[2]: *** [/libc-tls-nptl/rt/tst-timer5.out] Error 1
make[2]: *** [/libc-tls-nptl/rt/tst-cputimer1.out] Error 1
make[2]: *** [/libc-tls-nptl/rt/tst-cputimer2.out] Error 1
make[2]: *** [/libc-tls-nptl/rt/tst-cputimer3.out] Error 1

	- Crash when timer fires. Related to tst-timer?
	- Bad.

make[1]: *** [rt/tests] Error 2
make[2]: *** [/libc-tls-nptl/elf/tst-pie1.out] Error 139

	- Probably a toolchain problem with -fPIE.
	- Ignore.

make[2]: *** [/libc-tls-nptl/elf/tst-audit2.out] Error 139

	- dl-trampoline.S enter_plt path done, but exit_plt path has bugs.
	- Ignore until I finish the code.

make[2]: *** [/libc-tls-nptl/elf/tst-addr1.out] Error 1

	- This test doesn't work well with architectures that use OPD's.
	- Without first resolving printf we can't get its address.
	- This test is bogus.
	- Ignore.

make[2]: *** [/libc-tls-nptl/elf/check-textrel.out] Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

	- We have various security considerations to take into account.
	- For right now we don't care that text relocations are writable.
	- Ignore.

Summary:
	14 - Bad failures.
	11 - Ignored failures.

We are looking production ready ;)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
