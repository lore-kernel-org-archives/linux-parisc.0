Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2589483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 05:33:57 -0600 (MDT)
Date: Fri, 26 Sep 2003 04:20:29 -0700
From: "David S. Miller" <davem@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: willy@debian.org, santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org, sct@redhat.com
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030926042029.1cdd77e9.davem@redhat.com>
In-Reply-To: <20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk>
References: <20030925105005.GX16872@tausq.org>
	<000801c38356$dea5cda0$e5624c0f@india.hp.com>
	<20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
	<20030925180848.2763911b.davem@redhat.com>
	<20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk>
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

On Fri, 26 Sep 2003 12:24:00 +0100
Matthew Wilcox <willy@debian.org> wrote:

> On Thu, Sep 25, 2003 at 06:08:48PM -0700, David S. Miller wrote:
> > The flush_dcache_page() is needed in case the platform has deferred
> > the flushing for a kernel cpu store to a page cache page.
> 
> But this isn't a page cache page.

Are you sure?  Isn't raw I/O allowed on user buffers backed by
some kind of file based mmap()?
