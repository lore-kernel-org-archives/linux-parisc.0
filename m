Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D9B8B482B
	for <parisc-linux@parisc-linux.org>; Wed, 31 Oct 2001 20:03:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15z88U-00079q-00; Thu, 01 Nov 2001 03:03:18 +0000
Date: Thu, 1 Nov 2001 03:03:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Bug in flush_dcache_page?
Message-ID: <20011101030318.H5120@parcelfarce.linux.theplanet.co.uk>
References: <20011031173905.B5120@parcelfarce.linux.theplanet.co.uk> <20011031180840.C5120@parcelfarce.linux.theplanet.co.uk> <20011031205606.B4713@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011031205606.B4713@systemhalted>; from carlos@baldric.uwo.ca on Wed, Oct 31, 2001 at 08:56:06PM -0500
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

On Wed, Oct 31, 2001 at 08:56:06PM -0500, Carlos O'Donell Jr. wrote:
> > 2. If a page is simultaneously mapped in both user and kernel space, and
> >    user space touches it, either it leaves the page cache or it was mapped
> >    shared.
> 
> Why would a user touch cause the page to leave the cache? 
> (Maybe I'm not reading enough into it...)
> 
> The shared case I can see.

I meant `dirty' rather than `touch'.  If the page is mapped shared, writes
to it are visible to all users.  If it's mapped private, a write does
a copy-on-write.  The page leaves the page cache at this point because its
contents are no longer valuable to anyone except the process.

> > 	if (!page->mapping->i_mmap & !page->mapping->i_mmap_shared) {
> > 		set_bit(PG_dcache_dirty, &page->flags);
> > 	} else {
>
> Any particular reason for the bitwise and?

It's not a sequence point.  So it doesn't have to be test, branch, test,
branch; it can be test, test, branch.  I'm not sure how the compiler does
on this, to be honest.  It's a microoptimisation that's almost certainly
not worth making.

-- 
Revolutions do not require corporate support.
