Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A4EE48E5
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 17:54:08 -0600 (MDT)
Date: Sun, 19 Oct 2003 19:50:05 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: debian-glibc@lists.debian.org, Jeff Bailey <jbailey@nisa.net>
Cc: parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@hp.com>
Subject: Re: [parisc-linux] glibc 2.3.2-9 for hppa - "when hell freezes over" release
Message-ID: <20031019235005.GI8642@systemhalted>
References: <20031017181252.GE27289@systemhalted> <20031019181341.GF8642@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031019181341.GF8642@systemhalted>
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

On Sun, Oct 19, 2003 at 02:13:42PM -0400, Carlos O'Donell wrote:
> On Fri, Oct 17, 2003 at 02:12:52PM -0400, Carlos O'Donell wrote:
> > Please wait 2 days before doing the upload, I am in the process 
> > of getting other testers to make sure this release is of the
> > highest quality possible. If the testers do not agree with the
> > release quality I will request by email a delay of 2 more days 
> > to repatch and test, followed by an update to the list.
> 
> Requesting 2 more days.
> 
> - nscd is faulting on unaligned loads during real workload testing.
> 	= Remove unaligned handler and debug from core.

Fixed. Typo in syscall cancellation code. The corner case was a six arg
syscall that used said typo'd code (recvfrom). This should really be the
case to add threaded networking test code into libc's testsuite ;)
 
> - Looking into mlockall failures.

Passes QA on a 2.4 kernel (posix testsuite). 2.6 seems broken, though
that is unrelated to glibc.

Will produce a new patch and new testing debs. Thanks go to all the
testers that turned up these problems.

c.
