Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1595F4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Mar 2003 10:07:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18vh2c-0000jH-0g; Wed, 19 Mar 2003 17:07:50 +0000
Date: Wed, 19 Mar 2003 17:07:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: bruno_vidal@hp.com
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] struct page: page in use or not ?
Message-ID: <20030319170749.GX14520@parcelfarce.linux.theplanet.co.uk>
References: <3E789FE6.C9BB53CD@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E789FE6.C9BB53CD@hp.com>
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

On Wed, Mar 19, 2003 at 05:50:46PM +0100, bruno_vidal@hp.com wrote:
>     Hi
> I'm currently trying to reduce the dump time, and then I try to dump only
> pages that are currently use by the system. In page structure I found a flag,
> I was thinking a good one for this purpose:
> atomic_t count;                 /* Usage count, see below. */
> 
> But after taking only pages where count != 0, something was broken, I was
> not able to look at proc structure, and several things.....
> If a do a "full" dump I'm still able to look at what I need, so this page.count
> is not accurate for this purpose. So does't exist a good way to know if a page
> is in use or not ?

The problem is multi-page allocs.  The `struct page' is not valid
for those.  I'm not sure what a good way of doing this is -- have you
looked at the swsusp patches to see how they do it?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
