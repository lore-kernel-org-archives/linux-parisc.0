Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC0554843
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 19:22:11 -0600 (MDT)
Date: Thu, 25 Sep 2003 18:08:48 -0700
From: "David S. Miller" <davem@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org, sct@redhat.com
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030925180848.2763911b.davem@redhat.com>
In-Reply-To: <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
References: <20030925105005.GX16872@tausq.org>
	<000801c38356$dea5cda0$e5624c0f@india.hp.com>
	<20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
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

On Thu, 25 Sep 2003 15:26:23 +0100
Matthew Wilcox <willy@debian.org> wrote:

> I think you're right.  flush_dcache_page is for page cache pages, not for
> random user addresses.  Would something like this make sense?

The flush_dcache_page() is needed in case the platform has deferred
the flushing for a kernel cpu store to a page cache page.

You cannot just delete this call and replace it with a flush_cache_range()
call, that simply won't work.
