Return-Path: <hugh@veritas.com>
Received: from MTVMIME01.enterprise.veritas.com (bay-bridge.veritas.com
	[143.127.3.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDC59482A
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 08:16:41 -0600 (MDT)
Received: from peculier ([10.10.188.58]) (2267 bytes) by megami.veritas.com
	via sendmail with P:esmtp/R:smart_host/T:smtp
	(sender: <hugh@veritas.com>) id <m1BBaKe-0000GYC@megami.veritas.com>
	for
	<linux-kernel@vger.kernel.org>; Thu, 8 Apr 2004 07:16:40 -0700 (PDT)
	(Smail-3.2.0.101 1997-Dec-17 #15 built 2001-Aug-30)
Date: Thu, 8 Apr 2004 15:16:39 +0100 (BST)
From: Hugh Dickins <hugh@veritas.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
In-Reply-To: <1081432370.2105.77.camel@mulgrave>
Message-ID: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Andrea Arcangeli <andrea@suse.de>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On 8 Apr 2004, James Bottomley wrote:
> On Thu, 2004-04-08 at 08:41, Hugh Dickins wrote:
> > Something to notice about that parisc __flush_dcache_page I sent you:
> > there's no locking around searching the tree for vmas; there was never
> > any locking around searching the list for vmas.  arm is similar, but
> > at least has no CONFIG_SMP, just a preemption issue.  Any ideas?
> 
> I don't think you sent it to the parisc list?

That's right, at present it's just something in Andrea's -aa tree
and Martin's -mjb tree.  Will try to remember to copy maintainers
when sending to Andrew.  But the problem was there before the patch.

> I'm afraid we've just been pretty heavily updating flush_dcache_page
> recently to fill a number of holes in the implementation.

Don't be afraid, that's good!  Is it still going vertically down
i_mmap_shared and i_mmap?  Whereas it's only interested in vmas of
the one mm, so could go horizontally along it.  Just an option to
play with, but I don't believe it solves anything, just as unsafe
when threaded.

> As far as list traversal goes...we don't require the list to freeze:
> acidentally flushing dead vmas would be harmless and added ones wouldn't
> need flushing,

Yes.

> so all we need would probably be a safe traversal and a
> reference to prevent the vma being deallocated.

Which we're not giving you at all at present.  I guess another layer
of spinlocking/nopreemption, for parisc and arm, dissolving to nothing
on other arches.

Hugh
