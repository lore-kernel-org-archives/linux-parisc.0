Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DE1D48A8
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 22:47:44 -0700 (MST)
Date: Tue, 6 Jan 2004 00:39:25 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
Message-ID: <20040106053924.GC14464@systemhalted>
References: <20040105172146.GE23782@systemhalted>
	<200401051848.i05Imt6p005065@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401051848.i05Imt6p005065@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 05, 2004 at 01:48:54PM -0500, John David Anglin wrote:
> As usual, I expect there will be many ups and downs in the process.
> So, we won't get as far as we would like.
> 
> > jda, you mentioned that the libstdc++ testsuite could be examined in
> > order to fix some of our failures.
> 
> Yes, these need to be looked at before 3.4 is released.  Some appear
> to be related to long double support.  Just guessing, but I think the
> rest are locale or glibc related.

Does this seem like a reasonable triage list?

a. gdb.
b. atomic kernel ops.
c. libstdc++ failures.

c.
