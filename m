Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14286489A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Aug 2003 10:32:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19mc4S-0002jK-TB; Tue, 12 Aug 2003 17:32:28 +0100
Date: Tue, 12 Aug 2003 17:32:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@hp.com>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030812163228.GB10015@parcelfarce.linux.theplanet.co.uk>
References: <20030725070449.GB13017@systemhalted> <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk> <20030812035810.GB9325@systemhalted> <20030812160612.GF20514@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030812160612.GF20514@dsl2.external.hp.com>
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

On Tue, Aug 12, 2003 at 10:06:12AM -0600, Grant Grundler wrote:
> Note that itlb misses is a function of accesses to lots of "random"
> pages in memory and having enough memory so the odds of hitting
> the same page often is low. ie run thousands of jobs and the
> scheduler thrash the itlb.
> 
> at least that's how I understand it.

since we're still using 4k page size, and we have typically 160 TLB entries,
that only covers 640k of our 1.5MB cache ... 

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
