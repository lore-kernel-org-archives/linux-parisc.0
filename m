Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E639482B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:27:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18rnj6-0005WT-00; Sat, 08 Mar 2003 23:27:36 +0000
Date: Sat, 8 Mar 2003 23:27:36 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, grundler@dsl2.external.hp.com,
	jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030308232736.N3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308172439.GA10161@dsl2.external.hp.com> <20030308.110459.35972945.davem@redhat.com> <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk> <20030308.150023.97153009.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030308.150023.97153009.davem@redhat.com>; from davem@redhat.com on Sat, Mar 08, 2003 at 03:00:23PM -0800
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

On Sat, Mar 08, 2003 at 03:00:23PM -0800, David S. Miller wrote:
> You need merely 8MB of address space (2 * 4MB) if you implement
> my {copy,clear}_user_page() dynamic mapping hack, that will be
> tons more cheaper than any kmap based scheme and also be nicer
> on the TLB as there will be zero TLB changes occurring around
> the copy/clear.
> 
> People can continue to talk about all their bright new idea, which
> is fine, but it feels like my known-working ideas are being ignored.

Sorry, I think you've misunderstood the problem.  This is write() vs mmap().
We call flush_dcache_page() after the write() -- but PA's flush_dcache_page() only flushes the kernel's mapping of that page, not the user's.  The question is how to fix that.

Randolph published a patch which flushes two pages -- one which is the
kernel's view of the page, and one which is the user's view of the page.
John disagreed that was necessary, and I'm proposing a way (with kmap)
to avoid it.

Nothing to do with copy/clear_user_page().

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
