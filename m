Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1E714829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 05:28:13 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Bwcq-0003qj-00; Wed, 13 Nov 2002 12:28:08 +0000
Date: Wed, 13 Nov 2002 12:28:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Broken Cache Flushing in arch/parisc/kernel/signal.c.??
Message-ID: <20021113122808.E30392@parcelfarce.linux.theplanet.co.uk>
References: <1037173492.9031.7.camel@beavis> <20021113075234.GF8261@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021113075234.GF8261@tausq.org>; from randolph@tausq.org on Tue, Nov 12, 2002 at 11:52:34PM -0800
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

On Tue, Nov 12, 2002 at 11:52:34PM -0800, Randolph Chung wrote:
> this is partly my fault, since i thought we have unbroken cache flushing
> and asked thibaut to check this in... now i see that the original code
> flushes sr3 space, but flush_icache_range() flushes the kernel space...
> oops!
> 
> perhaps we should just check the old code back in for now?

Can we use
  void flush_icache_user_range(struct vm_area_struct *vma,
                        struct page *page, unsigned long addr, int len)
?  I'm not sure where we'd get the struct page from, though.

-- 
Revolutions do not require corporate support.
