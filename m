Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B242483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 07:35:09 -0600 (MDT)
Date: Fri, 26 Sep 2003 06:21:43 -0700
From: "David S. Miller" <davem@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: santosha@india.hp.com, willy@debian.org, sct@redhat.com,
	santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030926062143.20d85a72.davem@redhat.com>
In-Reply-To: <20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk>
References: <20030926053805.63bda07a.davem@redhat.com>
	<200309261311.SAA27414@redsea.india.hp.com>
	<20030926055652.32ddbbc2.davem@redhat.com>
	<20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk>
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

On Fri, 26 Sep 2003 14:29:01 +0100
Matthew Wilcox <willy@debian.org> wrote:

> On Fri, Sep 26, 2003 at 05:56:52AM -0700, David S. Miller wrote:
> > When page->mapping is NULL, flush_dcache_page() should purge the page
> > (by physical addres) from it's caches.  This is what sparc64 does.
> 
> But you can't do that on PA-RISC.  You can only purge virtual addresses.

Then for page->mapping == NULL your flush_dcache_page() is not doing
what it is supposed to, and you can expect problems extending further
than this raw I/O case.

You have to find a way to walk all the address spaces to figure out
where the page is mapped.

If you just put a flush_cache_range() there, you may get your current
test working but that code is wrong.  It will be wrong in any case
where the page is mapped to anywhere other then this mapping in
this address space.

The real problem for you guys is that in 2.4.x there is no easy way to
go from a page to it's mapping regardless of what kind of page it is.
That's what you need to rectify somehow.
