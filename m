From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 18:13:22 +0200
Message-ID: <20040408161322.GE31667__22951.6329280616$1416623346$gmane$org@dualathlon.random>
References: <20040408151415.GB31667@dualathlon.random>
	<Pine.LNX.4.44.0404081626460.7248-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: Hugh Dickins <hugh@veritas.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <Pine.LNX.4.44.0404081626460.7248-100000@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 04:35:12PM +0100, Hugh Dickins wrote:
> It's not fixable via the i_shared_sem, but we can add another layer

I meant it's unfixable unless we change the VM common code.

> of spin_lock around the i_mmap* list/tree manipulations, one that
> preprocesses away to nothing on all arches but parisc and arm, and
> is used in their __flush_dcache_page.  *Not* the page_table_lock ;)

I'd prefer to use only a spinlock then to carry around two overlapping
locks, the need_resched() check is needed anyways even with preempt in
the real costly paths.
