From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
Date: Tue, 6 Jan 2004 00:39:25 -0500
Message-ID: <20040106053924.GC14464__43437.1507996277$1416623108$gmane$org@systemhalted>
References: <20040105172146.GE23782@systemhalted>
	<200401051848.i05Imt6p005065@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <carlos@baldric.uwo.ca>
In-Reply-To: <200401051848.i05Imt6p005065@hiauly1.hia.nrc.ca>
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
