Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3A6D4830
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Sep 2003 09:53:40 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19tqyq-0000kF-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 01 Sep 2003 11:52:36 -0400
Date: Mon, 1 Sep 2003 11:52:36 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030901155235.GD19107@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [Status udate] hppa glibc 2.3.2 (Builders wanted!)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

parisc,

Thanks to the help of many people (lamont, randolph, james, willy,
dave, grant ... and more) I've gotten glibc 2.3.2 into a working state. 
This set of patches represents our current state. 

There are a number of failures right now, and I'm trying to narrow them
down to into categories before release, I would be much appreciated to
have other people build glibc and report back their list of errors.

===============
    WARNING
===============

This glibc should NOT be installed on any system you value, there are
still some suspect high priority problems. I am merely looking for
people to build and run the testsuite on their setup. Thanks :)

===============
    WARNING
===============

The recipe:

0. Make some room!

mkdir glibc-cvs
cd glibc-cvs

1. Get fresh source and store it for a rainy day.

cvs -z 9 -d :pserver:anoncvs@sources.redhat.com:/cvs/glibc login
{enter "anoncvs" as the password}
cvs -z 9 -d :pserver:anoncvs@sources.redhat.com:/cvs/glibc co libc

tar cvf libc.tar libc

2. Download the newest patches (updated this morning).

wget http://www.baldric.uwo.ca/~carlos/glibc-2.3.2-patches.tar.gz

3. Download some scripts.

wget http://www.baldric.uwo.ca/~carlos/glibc-build.sh
wget http://www.baldric.uwo.ca/~carlos/glibc-upnpatch.sh

4. Run the scripts in this order.

./glibc-upnpatch.sh			(Look for rejects)
./glibc-build.sh hppa			(Build it!)

5. The latter script will output the error from the 'make -k check'
   phase, please report those back to the list.

---

Current errors and their status:

make[2]: *** [/glibc-cvs/build-hppa/iconvdata/bug-iconv3.out] Error 1

	Priority: Unknown.

	o Unknown, problem with our libc_lock functions, this test
	  starts up the iconv code in a non-threaded environment, then
	  dlopen's libpthread to make it reentrant and then starts the
	  iconv code back up again to see if the libc_lock functions
	  work... it deadlocks. 

make[1]: *** [iconvdata/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/math/test-fenv.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/math/test-float.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/math/test-double.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/math/test-ifloat.out] Error 1

	Priority: Low.

	o We've had these for ever. Printf problems?

make[1]: *** [math/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/stdlib/tst-strtod.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/stdlib/bug-strtod.out] Error 1

	Priority: Medium.

	o Recent regeressions in 2.3.2, reasons unknown, Randolph had
	  given them a look but it might be mmap related, not tested on
	  a kernel with jejb's fix. Going to try that today.

make[1]: *** [stdlib/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/libio/tst-mmap-eofsync.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/libio/tst-mmap-fflushsync.out] Error 1

	Priority: High.

	o Fixed by jejb's recent patch to 2.6 and backport to 2.4
	  (Thanks!). Actually we know if fixes one of these, have yet to
	  see if it fixes both.

make[1]: *** [libio/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/dlfcn/tststatic.out] Error 139

	Priority: High.

	o Static object dlopening RTLD_LAZY and tryint to call the
	  function descriptor stub put in place by RTLD_LAZY. This is a
	  suspect PLABEL problem with the dynamic loader, needs more analysis.
	  Perhaps randolph/dave's patches to binutils for converting
	  relocations might be helpfull here since the dlopen might
	  expect that r19 should be setup for the jump to the stub?

make[1]: *** [dlfcn/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/posix/tst-regex.out] Error 139

	Priority: High.

	o Regresssion. I think it's somehow related to restoring r19
	  after a signal handler. Need to think more about the
	  restoration of r19 across different syscalls.

make[2]: [/glibc-cvs/build-hppa/posix/annexc.out] Error 1 (ignored)

	Ignored.

make[1]: *** [posix/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/linuxthreads/tst-cancel2.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/linuxthreads/tst-popen.out] Error 1
make[2]: *** [/glibc-cvs/build-hppa/linuxthreads/tst-popen2.out] Error 1

	Priority: High.

	o Regresssions. Reasons unkown. Children die of SIGSEGV, related
	  to restoring r19 and signal handlers?

make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/rt/tst-timer.out] Error 139

	Priority: High.

	o Regression. Dies after returning from rt_sigsuspend and we
	  restore r19, perhaps we shouldn't?

make[1]: *** [rt/tests] Error 2
make[2]: *** [/glibc-cvs/build-hppa/elf/neededtest.out] Error 14
make[2]: *** [/glibc-cvs/build-hppa/elf/neededtest2.out] Error 14
make[2]: *** [/glibc-cvs/build-hppa/elf/neededtest3.out] Error 17
make[2]: *** [/glibc-cvs/build-hppa/elf/neededtest4.out] Error 2
make[2]: *** [/glibc-cvs/build-hppa/elf/circleload1.out] Error 9

	Priority: Low

	o Been here since the start of time, related to the fact that we
	  aren't properly initializing _r_debug in the dynamic loader.

make[2]: *** [/glibc-cvs/build-hppa/elf/tst-tls13.out] Error 1

	Priority: Low.

	o We don't even have tls enabled let alone implemented? :)

make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

Thanks to everyone who helped me out!

Cheers,
Carlos.
