Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (cr821974-a.lndn1.on.wave.home.com [24.112.142.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B896482B
	for <parisc-linux@parisc-linux.org>; Wed, 31 Oct 2001 19:27:30 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id fA11u6g04815
	for parisc-linux@parisc-linux.org; Wed, 31 Oct 2001 20:56:06 -0500
Date: Wed, 31 Oct 2001 20:56:06 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Bug in flush_dcache_page?
Message-ID: <20011031205606.B4713@systemhalted>
References: <20011031173905.B5120@parcelfarce.linux.theplanet.co.uk> <20011031180840.C5120@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011031180840.C5120@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 31, 2001 at 06:08:40PM +0000
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

> 
> Aha.  A couple of things from talking to various VM/VFS people...
> 1. page->mapping is guaranteed to exist for pages in the page cache --
>    this is how they're located.
> 2. If a page is simultaneously mapped in both user and kernel space, and
>    user space touches it, either it leaves the page cache or it was mapped
>    shared.
> 

Why would a user touch cause the page to leave the cache? 
(Maybe I'm not reading enough into it...)

The shared case I can see.

> flush_dcache_page is only called on pages in the page cache, so we can
> assume that page->mapping exists, and we don't need to flush any user
> mappings of this page.
> 
> 	if (!page->mapping->i_mmap & !page->mapping->i_mmap_shared) {
> 		set_bit(PG_dcache_dirty, &page->flags);
> 	} else {
> 		struct vm_area_struct *vma = page->mapping->i_mmap_shared;
> 		if (vma) {
> 			flush_user_page(vma->vm_mm, vma->vm_start + page->index);
> 		}
> 		flush_kernel_dcache_page(page_address(page));
> 	}
> 

Any particular reason for the bitwise and?

c.
