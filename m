Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E792648C9
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 11:41:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19qFuJ-0003tr-63; Fri, 22 Aug 2003 18:41:03 +0100
Date: Fri, 22 Aug 2003 18:41:03 +0100
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: Matthew Wilcox <willy@debian.org>, James.Bottomley@SteelEye.com,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync in glibc on parisc)
Message-ID: <20030822174103.GI18834@parcelfarce.linux.theplanet.co.uk>
References: <1061563239.2090.25.camel@mulgrave> <20030822091447.6ecea6ca.davem@redhat.com> <20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk> <20030822093900.4468c012.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030822093900.4468c012.davem@redhat.com>
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

On Fri, Aug 22, 2003 at 09:39:00AM -0700, David S. Miller wrote:
> flush_dcache_page() works only on kernel pages.
> 
> It is defined to execute when the kernel executes store instructions
> into a page.
> 
> Therefore splitting it into a "user" part makes absolutely no
> sense.

Uhm.  So what happens when the user has stored into the page and now
the kernel wants to read from it?  There's still data in the cache for
the user mapping that's non-coherent with the kernel mapping.

> > > The VM_SHARED change you are proposing is definitely wrong.
> > 
> > Why is it wrong?  Why should whether-or-not a mapping is read-only affect
> > whether it's mapped shared?  I can't see anything in SuS v3 that suggests
> > we should do this.
> 
> MAP_SHARED has no meaning if the mapping isn't writable.

Sure it does.  It affects whether other writes to that page show up in
the shared read-only mapping.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
