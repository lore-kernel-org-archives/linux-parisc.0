Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC4104868
	for <parisc-linux@parisc-linux.org>; Thu, 18 Sep 2003 14:35:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A05Uc-0005nG-6Y
	for parisc-linux@parisc-linux.org; Thu, 18 Sep 2003 21:35:10 +0100
Date: Thu, 18 Sep 2003 21:35:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sched_clock implementation
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

Anyone want to do better than the lame implementation?  ;-)

----- Forwarded message from Andrew Morton <akpm@osdl.org> -----

I'll be merging Ingo & Con's CPOU scheduler changes into Linus's tree soon.

It does require that the architecture provides a new timing function:

A lame implementation is:

/*
 * Returns nanoseconds
 */

unsigned long long sched_clock(void)
{
	return (unsigned long long)jiffies * (1000000000 / HZ);
}

But for best CPU scheduler results the architecture should try to return a
higher-resolution number than this of course.

sched_clock() has no absolute time requirements: it just has to return some
number which goes up by 1,000,000,000 times per second.

I already have implementations for x86, ppc, sparc64 and ia64.

I have a completely stupid ppc64 implementation which is only accurate on
1GHz CPUs.  Anton please note!

As for the rest, it'll break the build, sorry.

----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
