Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EDC24906
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Mar 2004 09:43:16 -0700 (MST)
Date: Fri, 12 Mar 2004 11:41:16 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040312164116.GI24266@baldric.uwo.ca>
References: <20040311184239.GC24266@baldric.uwo.ca>
	<404EC1C600002A41@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <404EC1C600002A41@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Mar 12, 2004 at 04:32:34PM +0100, Joel Soete wrote:
> with export TIMEOUTFACTOR=100
> 
> make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-float.out] Error 1
> make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-double.out] Error 1
> make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-ifloat.out] Error 1

Failure is OK.

> make[1]: *** [math/tests] Error 2
> make[2]: *** [/Develop/parisc-linux/build/glibc/stdlib/tst-strtod.out] Error 1
> make[2]: *** [/Develop/parisc-linux/build/glibc/stdlib/bug-strtod.out] Error 1

Failure is OK.

> make[1]: *** [stdlib/tests] Error 2
> make[2]: *** [/Develop/parisc-linux/build/glibc/posix/tst-regex] Error 1

I haven't seen this one before, what's the problem with the test?

> make[1]: *** [posix/tests] Error 2
> make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex10] Error 1
> make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex11] Error 1

These are new, usually means the compiler optimized something that it
shouldn't have optimized. Can you see what the error is? e.g. Look at
the out file.

> make[1]: *** [linuxthreads/tests] Error 2
> make[2]: *** [/Develop/parisc-linux/build/glibc/elf/resolvfail] Error 1

That's bad.

> make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-dlmodcount.out] Error 139

This is worse, the program crashes.

> make[1]: *** [elf/tests] Error 2
> make: *** [check] Error 2

Yes. tst-tls13 should be the only failure affected by TIMEOUTFACTOR,
though I wasn't sure about the system you were running so I suggested
it.

c.
