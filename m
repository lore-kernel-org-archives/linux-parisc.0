Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E33FC483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 07:29:02 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A2sec-0000cV-09; Fri, 26 Sep 2003 14:29:02 +0100
Date: Fri, 26 Sep 2003 14:29:01 +0100
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: SANTOSH ABRAHAM <santosha@india.hp.com>, willy@debian.org,
	sct@redhat.com, santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-ID: <20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk>
References: <20030926053805.63bda07a.davem@redhat.com> <200309261311.SAA27414@redsea.india.hp.com> <20030926055652.32ddbbc2.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030926055652.32ddbbc2.davem@redhat.com>
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

On Fri, Sep 26, 2003 at 05:56:52AM -0700, David S. Miller wrote:
> On Fri, 26 Sep 2003 18:41:41 +0530 (IST)
> SANTOSH ABRAHAM <santosha@india.hp.com> wrote:
> 
> > The problem in this case is page->mapping is NULL. 
> 
> When page->mapping is NULL, flush_dcache_page() should purge the page
> (by physical addres) from it's caches.  This is what sparc64 does.

But you can't do that on PA-RISC.  You can only purge virtual addresses.

> Flushing just the current address space is incorrect, so don't get the
> fancy idea to pass the 'mm' and 'va' into flush_dcache_page().

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
