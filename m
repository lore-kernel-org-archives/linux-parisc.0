Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 407484829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:23:50 -0700 (MST)
Date: Sat, 08 Mar 2003 15:02:14 -0800 (PST)
Message-Id: <20030308.150214.30103426.davem@redhat.com>
To: willy@debian.org
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030308231125.M3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308063043.GB27859@dsl2.external.hp.com>
	<20030307.222945.32673395.davem@redhat.com>
	<20030308231125.M3865@parcelfarce.linux.theplanet.co.uk>
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
   Date: Sat, 8 Mar 2003 23:11:25 +0000

   One other difference you forgot is that Sparc64 has writethrough caches
   and PA has writeback caches.  This can make a difference.
   
It certainly could, but I think sparc64's schemes will work.
Please document any differences you discover, preferably with
text to go into Documentation/cachetlb.txt

The big variable is whether the cache lines are tagged with
physical addresses or not, that _does_ make a known difference.

But, it appears that so far all information suggests that
PA Risc uses physical tags.
