Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 478F8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 14:35:10 -0700 (MST)
Date: Mon, 24 Mar 2003 16:35:08 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030324213508.GA8436@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
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

John, Tausq,

Succeeded in building glibc 2.3.2 with syscall cancellation support, but
I'm pretty sure it's wrong.

The current list of failures includes:

iconvdata/bug-iconv3.out

- This is a new one.

math/test-fenv.out
math/test-float.out
math/test-double.out
math/test-ifloat.out

- We've had the math test failures for a while, would you like it if I
  tried building glibc with gcc head? It's been so long I've forgotten
  if this was really the delayed fp stuff that I fogot to implement :}
  Will get around to testing this more near the end of April.

stdlib/tst-strtod.out
stdlib/bug-strtod.out

- These are not so new, but indicate problems.

libio/tst-mmap-eofsync.out
libio/tst-mmap-fflushsync.out

- New kernel with Tausq's mmap flushing changes should make these go
  away... have to go into the office to install a new kernel.

dlfcn/default.out
dlfcn/tststatic.out

- New, possibly related to syscalls.

posix/annexc.out

- Expected.

linuxthreads/ex8.out
linuxthreads/ecmutex.out
linuxthreads/ex14.out
linuxthreads/ex15.out
linuxthreads/bug-sleep.out
linuxthreads/tst-cancel1.out
linuxthreads/tst-cancel2.out
linuxthreads/tst-cancel3.out
linuxthreads/tst-cancel4.out
linuxthreads/tst-cancel5.out
linuxthreads/tst-cancel6.out
linuxthreads/tst-popen.out
linuxthreads/tst-popen2.out
linuxthreads/tst-cancel-static.out
linuxthreads/tst-cancel-wrappers.out
rt/tst-shm.out
rt/tst-clock.out
rt/tst-aio.out
rt/tst-aio64.out
rt/tst-aio2.out
rt/tst-aio3.out
rt/tst-aio4.out
rt/tst-aio5.out
rt/tst-aio6.out
rt/tst-aio7.out

- I broke a lot of stuff... :}

elf/vismain.out
elf/neededtest.out
elf/neededtest2.out
elf/neededtest3.out
elf/neededtest4.out
elf/circleload1.out

- These have been around for a while, any idea about how to fix them?

Cheers,
Carlos.
