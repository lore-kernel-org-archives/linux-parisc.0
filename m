Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C95F3483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 06:20:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A2raB-00079l-Qt; Fri, 26 Sep 2003 13:20:23 +0100
Date: Fri, 26 Sep 2003 13:20:23 +0100
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, willy@debian.org,
	santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-ID: <20030926122023.GH24824@parcelfarce.linux.theplanet.co.uk>
References: <20030925105005.GX16872@tausq.org> <000801c38356$dea5cda0$e5624c0f@india.hp.com> <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk> <20030925180848.2763911b.davem@redhat.com> <20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk> <20030926042029.1cdd77e9.davem@redhat.com> <1064577420.4227.0.camel@sisko.scot.redhat.com> <20030926044841.29ecb672.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030926044841.29ecb672.davem@redhat.com>
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

On Fri, Sep 26, 2003 at 04:48:41AM -0700, David S. Miller wrote:
> On 26 Sep 2003 12:57:01 +0100
> "Stephen C. Tweedie" <sct@redhat.com> wrote:
> 
> > On Fri, 2003-09-26 at 12:20, David S. Miller wrote:
> > 
> > > Are you sure?  Isn't raw I/O allowed on user buffers backed by
> > > some kind of file based mmap()?
> > 
> > Yes, it is.
> 
> So there we go, that's how page can be a page cache page Matthew.

OK, so it *might* be a page cache page, but isn't necessarily.  So we
need to call *both* flush_dcache_page() and flush_cache_range(), right?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
