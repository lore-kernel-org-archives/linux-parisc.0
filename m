Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18F7D4840
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Sep 2003 06:06:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A4JH2-0002jk-Nn; Tue, 30 Sep 2003 13:06:36 +0100
Date: Tue, 30 Sep 2003 13:06:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: Naresh <knaresh@india.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] MAX_ADDRESS.
Message-ID: <20030930120636.GV24824@parcelfarce.linux.theplanet.co.uk>
References: <3F7915A7.1F54379@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F7915A7.1F54379@india.hp.com>
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

On Tue, Sep 30, 2003 at 11:03:28AM +0530, Naresh wrote:
> This question is relevant to the 2.4 kernel. Is MAX_ADDRESS really the
> highest virtual address mapped by the kernel? I can see this comment in
> 'paging_init()' in the section for DISCONTIGMEM. However,
> pagetable_init() doesnt make a check before it calls 'map_pages( )' for
> all the ranges of memory. So we may DISCONTIGMEM turned off but  it may
> so happen that we have a 'pmem_ranges[]' entry that is greater than
> MAX_ADDRESS which may find its way into the kernel page tables.

Ignore the DISCONTIGMEM code.  It's completely broken (and we offer no
way to turn CONFIG_DISCONTIGMEM on).

I'm not sure what half of this code is for; you'd need to ask John Marvin
who wrote it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
