Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 781AA4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:22:01 -0700 (MST)
Date: Sat, 08 Mar 2003 15:00:23 -0800 (PST)
Message-Id: <20030308.150023.97153009.davem@redhat.com>
To: willy@debian.org
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308172439.GA10161@dsl2.external.hp.com>
	<20030308.110459.35972945.davem@redhat.com>
	<20030308224503.L3865@parcelfarce.linux.theplanet.co.uk>
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

   From: Matthew Wilcox <willy@debian.org>
   Date: Sat, 8 Mar 2003 22:45:03 +0000
   
   The upshot is that if two addresses are congruent modulo 4MB and they
   map to the same physical address, the cache will detect it.  I've been
   thinking about (ab)using kmap() for this for a while.  The trouble
   is we'd need to have 1024 slots just to be guaranteed space to map 1
   page -- if we need to guarantee to be able to map two pages at once,
   we need 2048 slots (ie 8MB of virtual space).  Etc.  I have no idea how
   many pages we expect to be able to map simultaneously, and haven't been
   able to get a straight answer out of anyone so far.

You need merely 8MB of address space (2 * 4MB) if you implement
my {copy,clear}_user_page() dynamic mapping hack, that will be
tons more cheaper than any kmap based scheme and also be nicer
on the TLB as there will be zero TLB changes occurring around
the copy/clear.

People can continue to talk about all their bright new idea, which
is fine, but it feels like my known-working ideas are being ignored.
