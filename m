Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E9164829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:37:31 -0700 (MST)
Date: Sat, 08 Mar 2003 15:15:55 -0800 (PST)
Message-Id: <20030308.151555.15490234.davem@redhat.com>
To: tausq@debian.org
Cc: willy@debian.org, grundler@dsl2.external.hp.com,
	jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030308233141.GC11363@tausq.org>
References: <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk>
	<20030308.150023.97153009.davem@redhat.com>
	<20030308233141.GC11363@tausq.org>
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

   From: Randolph Chung <tausq@debian.org>
   Date: Sat, 8 Mar 2003 15:31:41 -0800

   > You need merely 9MB of address space (2 * 4MB) if you implement
   > my {copy,clear}_user_page() dynamic mapping hack, that will be
   > tons more cheaper than any kmap based scheme and also be nicer
   > on the TLB as there will be zero TLB changes occurring around
   > the copy/clear.
   
   i hope i'm not missing something obvious, but from what i understand
   from this discussion, {copy,user}_user_page helps with the initial
   syncing up of new mappings that are created for a process... but how
   does this deal with syncing up changes afterwards? for that we still
   need the flush_dcache_page to walk the user mappings right?
   
Yes, the {copy,clear}_user_page() thing is an optimization for
handling of cache alias issues wrt. anonymous pages.

The PA-RISC mmap/write bug is something entirely different,
flush_dcache_page() just isn't doing what it is defined to
do :-)
