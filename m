Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CD114829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 19:14:53 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 186Lu4-0000NP-00; Tue, 29 Oct 2002 02:14:48 +0000
Date: Tue, 29 Oct 2002 02:14:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-pa24 (uaccess.h patch)
Message-ID: <20021029021448.W27461@parcelfarce.linux.theplanet.co.uk>
References: <200210290012.RAA27628@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210290012.RAA27628@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Mon, Oct 28, 2002 at 05:12:03PM -0700
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

On Mon, Oct 28, 2002 at 05:12:03PM -0700, John Marvin wrote:
> > ex_table is used for recovering from a page fault.  i don't see how we
> > can take a page fault when copying to kernel ram.
> 
> Let's wait on removing this support.  This mechanism provides a way of
> testing whether or not an address is a valid kernel address (in addition
> to range checking the address).  I'd like to consider implementing the
> virtual mem map support (currently implemented on ia64) on parisc as an
> alternative mechanism (to willy's idea of using kmap/kunmap) for getting
> back the 256Mb of memory we currently ignore for Astro based machines with
> more than 3.75 Gb of memory.  The virtual mem map code uses this exact
> mechanism to determine whether or not a struct page pointer is pointing
> into a sparse (unallocated) region of the virtual mem map array (i.e. on
> ia64 the ia64_page_valid() routine does a get_user on the first byte and
> checks the return from get_user to see if it fails/succeeds).

Well.. if you're interested in working on PA again, I have 3 ideas which
kind of overlap (you seem to have confused two of them, so it's worth
talking about them all):

(1) get/put_user & copy_to/from_user should always copy to %sr3.
    set_fs et al should manipulate sr3.  Last time this came up, you said
    this should work but would need testing.  That gets rid of the duplicate
    exception tables.

(2) the kmap/kunmap idea was to avoid cache aliasing.  we always kmap a
    pagecache page before we access it, so we can map it to an address that
    is "equivalent" to the userspace address before accessing it.  Not sure
    we get away with making flush_dcache_page() a no-op, though.

(3) For getting back the 256MB of memory mapped at 64GB, I think the
    DISCONTIG code in 2.5 is now suitable.  It's now based on zones,
    not nodes, so we can have a ZONE_DMA from 0-3.75GB, ZONE_NORMAL from
    4-xGB and ZONE_HIGHMEM from 64GB to 64GB+256MB.  I suspect this is
    the right thing to do on ia64 too, for 2.5.

-- 
Revolutions do not require corporate support.
