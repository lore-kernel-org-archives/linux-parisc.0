Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 140D3488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 23:05:37 -0700 (MST)
Date: Sun, 22 Feb 2004 01:04:56 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
Message-ID: <20040222060456.GJ25019@baldric.uwo.ca>
References: <20040218235225.GA1623@calypso>
	<20040219062907.GC13916@colo.lackof.org>
	<20040221075849.GA1642@calypso>
	<20040221170508.GB14198@baldric.uwo.ca>
	<20040221182436.GM11824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040221182436.GM11824@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 21, 2004 at 06:24:36PM +0000, Matthew Wilcox wrote:
> > I could never run IO stably at anything higher than 1. The drives don't
> > seem to handle it properly, the error recovery mechanisms seem less
> > than perfect, and the box just hangs.
> 
> So, um, maybe we should change the default?  Nobody seems to be
> investigating why this happens, so I don't see why our users should
> suffer.  I doubt anyone's going to be terribly motivated to track this
> problem down for such old machines, so let's just sacrifice a little
> performance for stability.

It just doesn't work on those older boxes? I'm not quite sure how much
more investigation I can do. I mean I've got my 715/50's all running, I
could build a few more kernels and see what's going on.

I could also commit a change to lower the max tags down to 1, that seems
a little harsh for performance, but all those perf people can crank it
back up. Perhaps a build time configure option?

c.
