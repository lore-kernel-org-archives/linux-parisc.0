Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48F5F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 14:16:15 -0700 (MST)
Date: Mon, 11 Nov 2002 16:16:24 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111211624.GC9704@systemhalted>
References: <20021111171255.GI8848@systemhalted> <200211111736.gABHaP7E002352@hiauly1.hia.nrc.ca> <20021111204248.GB9704@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021111204248.GB9704@systemhalted>
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

> 
> With gcc-3.3 experimental (cvs pull as of yesterday):
> 
> make[2]: *** [/math/test-fenv.out] Error 136
> make[2]: *** [/math/test-float.out] Error 1
> make[2]: *** [/math/test-double.out] Error 1
> make[2]: *** [/math/test-ifloat.out] Error 1
> make[1]: *** [math/tests] Error 2
> 
> 	= Same as before, I'm going to regen these right now.
> 

Hrm....

test-double.out says:

GCONV_PATH=/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/iconvdata LC_ALL=C   /mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/elf/ld.so.1 --library-path /mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/math:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/elf:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/dlfcn:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/nss:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/nis:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/rt:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/resolv:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/crypt:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/linuxthreads /mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/math/test-double

testing double (without inline functions)
Failure: Real part of: cacos (inf + NaN i) == NaN + inf i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (-inf + NaN i) == NaN + inf i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + inf i) == NaN - inf i: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN - inf i) == NaN + inf i: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + NaN i) == NaN + NaN i: Exception "Invalid operation" set
Failure: Real part of: ccosh (0.0 + NaN i) == NaN + 0.0 i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: ccosh (-0 + NaN i) == NaN + 0.0 i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: ccosh (inf + NaN i) == inf + NaN i: Exception "Invalid operation" set
Failure: Real part of: ccosh (-inf + NaN i) == inf + NaN i: Exception "Invalid operation" set
Failure: Real part of: cpow (NaN + NaN i, NaN + NaN i) == NaN + NaN i: Exception "Invalid operation" set
Failure: Real part of: csinh (0.0 + NaN i) == 0.0 + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-0 + NaN i) == 0.0 + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (inf + NaN i) == inf + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
Failure: Real part of: csinh (-inf + NaN i) == inf + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set

Test suite completed:
  2518 test cases plus 2306 tests for exception flags executed.
  14 errors occurred.


They look to be exception related?

c.
