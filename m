Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FDED483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 06:51:32 -0600 (MDT)
Date: Fri, 26 Sep 2003 05:38:05 -0700
From: "David S. Miller" <davem@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: sct@redhat.com, willy@debian.org, santosh.abraham@hp.com,
	randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030926053805.63bda07a.davem@redhat.com>
In-Reply-To: <20030926122023.GH24824@parcelfarce.linux.theplanet.co.uk>
References: <20030925105005.GX16872@tausq.org>
	<000801c38356$dea5cda0$e5624c0f@india.hp.com>
	<20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
	<20030925180848.2763911b.davem@redhat.com>
	<20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk>
	<20030926042029.1cdd77e9.davem@redhat.com>
	<1064577420.4227.0.camel@sisko.scot.redhat.com>
	<20030926044841.29ecb672.davem@redhat.com>
	<20030926122023.GH24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 26 Sep 2003 13:20:23 +0100
Matthew Wilcox <willy@debian.org> wrote:

> OK, so it *might* be a page cache page, but isn't necessarily.  So we
> need to call *both* flush_dcache_page() and flush_cache_range(), right?

I'm starting to think that flush_dcache_page() needs to take care
of this.

Santosh remarked that flush_dcache_page() doesn't get the user virtual
address, but that is not needed.  From the page you can walk the mmap()s
and flush the mapping in each address space it is contained within.

And you absolutely must flush each address space, not just the one currently
doing the raw I/O request.

In that light, doing a flush_cache_range() with a specific VMA (2.6.x)
or MM (2.4.x) is totally illogical here.
