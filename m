Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CAFB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 08:07:01 -0700 (MST)
Date: Wed, 26 Mar 2003 10:07:30 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.3.2 patches updated, still no working sysdep-cancel
Message-ID: <20030326150729.GC2370@systemhalted>
References: <3E817DB00000012B@ocpmta1.freegates.net> <3E817DB0000002C4@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E817DB0000002C4@ocpmta1.freegates.net>
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

> I had to kill a 'tst-cancel-stat' because it was eating 99% of cpu usage.
> As it was evidently looping, strace -p 31611 shows me hundred of thousand
> messages: kill(31610, SIGRT_1)    =-1 (no such process)

Yes, I've noticed this, and I'm not sure why it's doing that. It's the
only test that fails this way. The rest just SIGSEGV, which again means
I need to keep debugging the syscall/errno code.

I'll post an update after running some tests on my current patches.
Thanks for trying that out Joel. What hardware are you testing this on?

c.
