Return-Path: <hugh@veritas.com>
Received: from MTVMIME02.enterprise.veritas.com (bay-bridge.veritas.com
	[143.127.3.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9DFF4E64
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 09:35:15 -0600 (MDT)
Received: from peculier ([10.10.188.58]) (1553 bytes) by megami.veritas.com
	via sendmail with P:esmtp/R:smart_host/T:smtp
	(sender: <hugh@veritas.com>) id <m1BBbYf-0000eqC@megami.veritas.com>
	for
	<linux-kernel@vger.kernel.org>; Thu, 8 Apr 2004 08:35:13 -0700 (PDT)
	(Smail-3.2.0.101 1997-Dec-17 #15 built 2001-Aug-30)
Date: Thu, 8 Apr 2004 16:35:12 +0100 (BST)
From: Hugh Dickins <hugh@veritas.com>
To: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
In-Reply-To: <20040408151415.GB31667@dualathlon.random>
Message-ID: <Pine.LNX.4.44.0404081626460.7248-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 8 Apr 2004, Andrea Arcangeli wrote:
> On Thu, Apr 08, 2004 at 09:40:37AM -0500, James Bottomley wrote:
> > Whatever seems most convenient that won't impact the flushing fast path,
> > I suppose.  It's one of the hottest paths in the system since all data
> > transfers go through it for user visibility.
> 
> you'd need to take a semaphore there to be safe, so it's basically
> unfixable since you can't sleep or just trylock.

It's not fixable via the i_shared_sem, but we can add another layer
of spin_lock around the i_mmap* list/tree manipulations, one that
preprocesses away to nothing on all arches but parisc and arm, and
is used in their __flush_dcache_page.  *Not* the page_table_lock ;)
Unappealing, but a lot better than leaving them unsafe.

Hugh
