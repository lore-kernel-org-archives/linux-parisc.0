Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F25C482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 07:42:27 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18s20P-0005Jy-00; Sun, 09 Mar 2003 14:42:25 +0000
Date: Sun, 9 Mar 2003 14:42:25 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, grundler@dsl2.external.hp.com,
	jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030309144225.O3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308063043.GB27859@dsl2.external.hp.com> <20030307.222945.32673395.davem@redhat.com> <20030308231125.M3865@parcelfarce.linux.theplanet.co.uk> <20030308.150214.30103426.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030308.150214.30103426.davem@redhat.com>; from davem@redhat.com on Sat, Mar 08, 2003 at 03:02:14PM -0800
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

On Sat, Mar 08, 2003 at 03:02:14PM -0800, David S. Miller wrote:
>    One other difference you forgot is that Sparc64 has writethrough caches
>    and PA has writeback caches.  This can make a difference.
>    
> It certainly could, but I think sparc64's schemes will work.
> Please document any differences you discover, preferably with
> text to go into Documentation/cachetlb.txt

Well.. one patch which affected us, but wouldn't affect a writethrough
cache is:

http://ftp.linux.org.uk/pub/linux/willy/patches/applied/shmem.diff

In that situation, the user has no view of that page currently so they
will read from memory.  With a writethrough cache it works without the
flush_dcache_page(), with writeback it does not.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
