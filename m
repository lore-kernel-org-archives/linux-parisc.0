Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id D15D44829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 13:42:39 -0700 (MST)
Date: Mon, 11 Nov 2002 15:42:48 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111204248.GB9704@systemhalted>
References: <20021111171255.GI8848@systemhalted> <200211111736.gABHaP7E002352@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211111736.gABHaP7E002352@hiauly1.hia.nrc.ca>
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

> > Looks like we need some __asm format fixes?
> 
> These are the changes that I had for glibc-2.2.5-14 to build with gcc-3.3.
> The string literal change makes the asms ugly but I think we have to live
> with it.  I don't know the ins and outs of why the change was necessary
> but I know the cpp people will not change back.
> 

With gcc-3.3 experimental (cvs pull as of yesterday):

make[2]: *** [/math/test-fenv.out] Error 136
make[2]: *** [/math/test-float.out] Error 1
make[2]: *** [/math/test-double.out] Error 1
make[2]: *** [/math/test-ifloat.out] Error 1
make[1]: *** [math/tests] Error 2

	= Same as before, I'm going to regen these right now.

make[2]: *** [/stdlib/bug-strtod.out] Error 1
make[1]: *** [stdlib/tests] Error 2
make[2]: *** [/libio/tst-mmap-eofsync.out] Error 1
make[2]: *** [/libio/tst-mmap-fflushsync.out] Error 1
make[1]: *** [libio/tests] Error 2
make[2]: *** [/dlfcn/default.out] Error 1
make[2]: *** [/dlfcn/tststatic.out] Error 139
make[1]: *** [dlfcn/tests] Error 2
make[2]: [/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/elf/tst-array1.out] Error 1
make[2]: *** [/elf/tst-array2.out] Error 1
make[2]: *** [/elf/tst-array3.out] Error 1

	= These three are new!
	= They seem to be a common failure on x86

make[2]: *** [/elf/vismain.out] Error 1
make[2]: *** [/elf/neededtest.out] Error 14
make[2]: *** [/elf/neededtest2.out] Error 14
make[2]: *** [/elf/neededtest3.out] Error 17
make[2]: *** [/elf/neededtest4.out] Error 2
make[2]: *** [/elf/circleload1.out] Error 9
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

c.
