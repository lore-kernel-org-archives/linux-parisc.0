Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19290490F
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Apr 2004 08:19:34 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i36EIua32150; Tue, 6 Apr 2004 10:18:56 -0400
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
In-Reply-To: <20040406132158.GP26344@baldric.uwo.ca>
References: <20040405174131.84BF1494194@palinux.hppa>
	<20040406132158.GP26344@baldric.uwo.ca>
Content-Type: text/plain
Date: 06 Apr 2004 09:18:51 -0500
Message-Id: <1081261133.1804.27.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-04-06 at 08:21, Carlos O'Donell wrote:
> What was the fix? Can you explain the change please? :)

copy_to_user_page() does the copy via a non-equivalently aliased kernel
page.  Unless that page is flushed at the kernel address, the writeback
cache may not make the data visible (which is why gdb wasn't able to set
breakpoints anymore).

For some reason every arch implements copy_to_user_page as a memcpy
followed by flush_icache_user_range().  The usually map
flush_icache_user_range() to a kernel dcache page flush, which is
contradictory.

> The glibc test-suite almost completed without issue on the newest
> kernel, though I saw a transient failure in one of the resolv tests, it
> wasn't a failure in the test, but rather the test ran longer than 2
> seconds and was killed. The test uses mtrace() and I've not been able to
> duplicate the failure, the test should *not* have run over the
> milisecond mark.  I wasn't running anything on the box at that point so
> it worries me quite a bit. With the box up and running I'm no longer
> able to trigger the slow behaviour that caused the timeout. Previous to
> this I had run the entire compile + testsuite from a clean boot, I'll
> see if doing that again triggers the failure. It might not be related to
> anything you've done, I don't think I've ever run a glibc build and
> testsuite from a cold boot... who knows what VM issues lurk?

It's possible.  As global flushes get removed any lurking holes in the
rest of the API will emerge when they stop being covered by the global
flush.

James
