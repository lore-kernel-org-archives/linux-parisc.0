Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E75A4860
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  1 May 2004 12:02:25 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BJyo3-0002sw-00 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 01 May 2004 14:01:43 -0400
Date: Sat, 1 May 2004 14:01:43 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040501180143.GW12850@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa glibc status 2004-05-01
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


parisc-linux,

If you are building glibc for something other than debian, and you
follow upstream closely (looks at gentoo folks), the you should only see
the following set of failures (TIMEOUTFACTOR set appropriately for slow
tests):

make[2]: *** [/build-hppa/math/test-float.out] Error 1
make[2]: *** [/build-hppa/math/test-double.out] Error 1
make[2]: *** [/build-hppa/math/test-ifloat.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/build-hppa/stdlib/tst-strtod.out] Error 1
make[2]: *** [/build-hppa/stdlib/bug-strtod.out] Error 1
make[1]: *** [stdlib/tests] Error 2
make[2]: [/build-hppa/posix/annexc.out] Error 1 (ignored)
make: *** [check] Error 2

All related to our missing long-double implementation.

http://parisc-linux.org/~carlos/glibc-hppa-patches-2004-05-01.tar.gz

I'm working partly on a 64-bit userspace, no word on that yet though,
I'm reworking the directory structures, and it's going to be like a
million patches that I have to breakup and write Changelogs. First step
would be to create the configure chagnes, and move the directories, and
get back a 32-bit build that works.

c.
