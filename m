Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2052C4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 19:32:09 -0700 (MST)
Date: Sun, 30 Mar 2003 21:32:40 -0500
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030331023240.GB23960@systemhalted>
References: <20030331003153.GS11333@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030331003153.GS11333@tausq.org>
From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] glibc/gcc bug -> perl/gcc bug?
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

> perl-5.8 fails to build on hppa because of a test failure. The problem
> can be seen very easily:
> 
> tausq@gsyprf11:~/build/perl-5.8.0$ cat t/t.pl
> print log "A";
> tausq@gsyprf11:~/build/perl-5.8.0$ ./perl t/t.pl
> Can't take log of 2.75773e-308 at t/t.pl line 1.
> 
> that should have said:
> tausq@gsyprf11:~/build/perl-5.8.0$ /usr/bin/perl t/t.pl
> Can't take log of 0 at t/t.pl line 1.
> 
> interestingly, a debug build of perl (using -g and no -O flags) doesn't
> have the same problem, so this looks like some kind of compiler
> optimization bug. I've tried this with both 3.2.3 and 3.3... same
> problems.
> 
> would anyone like to try to look at this some more and see if they can
> isolate the C code/a small test case that is causing the problem?

Glibc's math tests are still failing even under gcc-3.3 (not to mention
the threading problems I'm in the middle of fixing).

Though I'm seeing more:

Failure: Real part of: cacos (NaN + inf i) == NaN - inf i: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN - inf i) == NaN + inf i: Exception "Invalid operation" set
Failure: Real part of: cacos (NaN + NaN i) == NaN + NaN i: Exception "Invalid operation" set

Or:
Failure: Test: Imaginary part of: ctanh (NaN - 0 i) == NaN - 0 i
Result:
 is:          nan   nan
 should be:  -0.00000000000000000000e+00  -0x0.00000000000000000000p+0

Even with a new ulps, the tests were still failing.

c.
