Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 158474840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Jan 2004 08:57:26 -0700 (MST)
Date: Tue, 6 Jan 2004 10:48:59 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
Message-ID: <20040106154859.GA18590@systemhalted>
References: <20040106053924.GC14464@systemhalted>
	<200401060616.i066GiBR007413@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401060616.i066GiBR007413@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 06, 2004 at 01:16:44AM -0500, John David Anglin wrote:
> > Does this seem like a reasonable triage list?
> > 
> > a. gdb.
> > b. atomic kernel ops.
> > c. libstdc++ failures.
> 
> I expect GCC 3.4 is coming in 2-3 months, although there isn't a definite
> timeline yet.  Would you like to try to get atomic kernel ops in 2.6.x?
> How important is the kernel timeline for this work?  We missed gdb 6.0.
> A couple of quick hacks allow 6.0 to build for hppa-linux.  Bug fixes are
> another matter.

No timeline, just icing.
 
> Probably, the v3 issues involve doing enough research to file a PR if
> the problem is generic, fix the problem if it is GCC hppa specific.
> If a problem turns out to be glibc/kernel related, we can wait for
> a fix ;)

I can interleave b,c in order to help you out? :)

80% gdb.
10% atomic ops.
10% libstc++ failures.

c.
