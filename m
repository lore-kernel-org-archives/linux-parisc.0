Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDA17482B
	for <parisc-linux@parisc-linux.org>; Sat, 13 Jul 2002 12:55:27 -0600 (MDT)
Date: Sat, 13 Jul 2002 14:54:19 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] compiling kernels with gcc-3.2
Message-ID: <20020713185419.GA9983@systemhalted>
References: <20020712073628.GB8838@tausq.org> <20020713052016.GA10191@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020713052016.GA10191@tausq.org>
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
> tausq@a500:~$ uname -a
> Linux version 2.4.18-pa54 (tausq@a500) (gcc version 3.2 20020711 (experimental)) #2 SMP Fri Jul 12 22:04:23 PDT 2002
> tausq@a500:~$
> 
> I'm quite perplexed about why it doesn't seem to always work for
> others... i didn't really have to do anything special with either gcc or
> the kernel to get it to boot.
> 
> randolph

I think the issue is one of quality assurance. We don't have a strict
set of criteria for testing/validating/certifying that a given snapshot
of a given toolchain, in a given configuration, will work.

I'm trying to address some of these things by building a cross-check
test-suite to test the toolchain weekly or nightly. This all came out
of a talk I had with Matt Taggart :) who is another toolchain-junkie.

When I get more work done I'll post.

c.
