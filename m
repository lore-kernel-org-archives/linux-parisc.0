Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DCA0F486E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 05:24:01 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A2qhc-0006VV-6S; Fri, 26 Sep 2003 12:24:00 +0100
Date: Fri, 26 Sep 2003 12:24:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: Matthew Wilcox <willy@debian.org>, santosh.abraham@hp.com,
	randolph@tausq.org, parisc-linux@lists.parisc-linux.org,
	sct@redhat.com
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-ID: <20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk>
References: <20030925105005.GX16872@tausq.org> <000801c38356$dea5cda0$e5624c0f@india.hp.com> <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk> <20030925180848.2763911b.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030925180848.2763911b.davem@redhat.com>
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

On Thu, Sep 25, 2003 at 06:08:48PM -0700, David S. Miller wrote:
> On Thu, 25 Sep 2003 15:26:23 +0100
> Matthew Wilcox <willy@debian.org> wrote:
> 
> > I think you're right.  flush_dcache_page is for page cache pages, not for
> > random user addresses.  Would something like this make sense?
> 
> The flush_dcache_page() is needed in case the platform has deferred
> the flushing for a kernel cpu store to a page cache page.

But this isn't a page cache page.

> You cannot just delete this call and replace it with a flush_cache_range()
> call, that simply won't work.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
