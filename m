Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6FCF4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 15:00:15 -0700 (MST)
Date: Sun, 09 Mar 2003 13:38:30 -0800 (PST)
Message-Id: <20030309.133830.82279538.davem@redhat.com>
To: willy@debian.org
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030309144225.O3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308231125.M3865@parcelfarce.linux.theplanet.co.uk>
	<20030308.150214.30103426.davem@redhat.com>
	<20030309144225.O3865@parcelfarce.linux.theplanet.co.uk>
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
   Date: Sun, 9 Mar 2003 14:42:25 +0000
   
   Well.. one patch which affected us, but wouldn't affect a writethrough
   cache is:
   
   http://ftp.linux.org.uk/pub/linux/willy/patches/applied/shmem.diff
   
   In that situation, the user has no view of that page currently so they
   will read from memory.  With a writethrough cache it works without the
   flush_dcache_page(), with writeback it does not.
   
I think the real issue is SHMLBA isn't being honored, right?

The whole purpose of SHMLBA is to ensure a particular alignment
for shared memory anonymous regions, if that isn't happening anymore
that is a bug.

This is why SHMLBA is set to the virtual cache size on sparc32 for
certain cpus and on sparc64 for all cpus.
