Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFE00483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 07:03:04 -0600 (MDT)
From: SANTOSH ABRAHAM <santosha@india.hp.com>
Message-Id: <200309261311.SAA27414@redsea.india.hp.com>
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
To: davem@redhat.com
Date: Fri, 26 Sep 2003 18:41:41 +0530 (IST)
Cc: willy@debian.org, sct@redhat.com, santosh.abraham@hp.com,
	randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030926053805.63bda07a.davem@redhat.com> from "David S. Miller" at Sep "26," 2003 "05:38:05" am
MIME-Version: 1.0
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

> On Fri, 26 Sep 2003 13:20:23 +0100
> Matthew Wilcox <willy@debian.org> wrote:
> 
> > OK, so it *might* be a page cache page, but isn't necessarily.  So we
> > need to call *both* flush_dcache_page() and flush_cache_range(), right?
> 
> I'm starting to think that flush_dcache_page() needs to take care
> of this.
> 
> Santosh remarked that flush_dcache_page() doesn't get the user virtual
> address, but that is not needed.  From the page you can walk the mmap()s
> and flush the mapping in each address space it is contained within.

Are you talking about the page->mapping->{i_mmap_shared, i_mmap} lists ?
If so, this is already handled in __flush_dcache_page ().

The problem in this case is page->mapping is NULL. 

> 
> And you absolutely must flush each address space, not just the one currently
> doing the raw I/O request.
> 
> In that light, doing a flush_cache_range() with a specific VMA (2.6.x)
> or MM (2.4.x) is totally illogical here.
> 
