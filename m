Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0A2D4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:36:34 -0700 (MST)
Date: Sat, 08 Mar 2003 15:14:58 -0800 (PST)
Message-Id: <20030308.151458.92123437.davem@redhat.com>
To: willy@debian.org
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030308232736.N3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk>
	<20030308.150023.97153009.davem@redhat.com>
	<20030308232736.N3865@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

	Sorry, I think you've misunderstood the problem.  This is
	write() vs mmap().  We call flush_dcache_page() after the
	write() -- but PA's flush_dcache_page() only flushes the
	kernel's mapping of that page, not the user's.  The question
	is how to fix that.

Right, flush_dcache_page() must get rid of all instances of
the underlying physical data from the cache.  This means all
kernel and user virtual mappings of the page.

Chips with a "flush physical page X" scheme can just do that,
others can flush the kernel virtual mapping then walk the
VMA list of user mappings and hit those one by one.
