Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E9E54841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Oct 2003 08:17:40 -0600 (MDT)
Date: Tue, 21 Oct 2003 10:13:35 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jeff Bailey <jbailey@nisa.net>
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@debian.org>
Subject: Re: [parisc-linux] glibc 2.3.2-9 for hppa - "when hell freezes over" release
Message-ID: <20031021141335.GE5606@systemhalted>
References: <20031017181252.GE27289@systemhalted> <20031019181341.GF8642@systemhalted> <20031019235005.GI8642@systemhalted> <20031020234345.GC5606@systemhalted> <1066737838.1176.5.camel@outpost.dnsalias.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1066737838.1176.5.camel@outpost.dnsalias.org>
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

On Tue, Oct 21, 2003 at 08:03:59AM -0400, Jeff Bailey wrote:
> Hey Carlos - When submitting these upstream, will you consider adding
> test cases for these failures?  feraiseexcept should certainly be tested
> somewhere.  I don't know if there's a reasonable way to put in the test
> for the syscalls, though.

o test-fenv (Already exists)
 
> If you don't have time, that's fine too.  I just like to encourage
> people to improve testsuites whenever they can. =)

o Requires adding threaded networking code. 
	= Might be a good thing to add!

c.
