Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9686A4845
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 05:13:58 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18vyvk-0001Mc-M0; Thu, 20 Mar 2003 12:13:56 +0000
Date: Thu, 20 Mar 2003 12:13:56 +0000
From: Matthew Wilcox <willy@debian.org>
To: bruno_vidal@hp.com
Cc: Matthew Wilcox <willy@debian.org>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] struct page: page in use or not ?
Message-ID: <20030320121356.GZ14520@parcelfarce.linux.theplanet.co.uk>
References: <3E789FE6.C9BB53CD@hp.com> <20030319170749.GX14520@parcelfarce.linux.theplanet.co.uk> <3E79A49C.81C188AA@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E79A49C.81C188AA@hp.com>
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

On Thu, Mar 20, 2003 at 12:23:08PM +0100, bruno_vidal@hp.com wrote:
>     Hi
> What do you mean by "swsusp" patche ? What it do....
> Actually I'm looking at the kmalloc() function in order to
> understand how it determine the bucket, and so to know
> which pages I need to dump before I can use the page structure.
> Do you think it is a good starting point, or using page
> struture is really a bad option ?

kmalloc (ie slab) is the wrong allocator to be looking at.  you want
get_free_pages.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
