Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07D7648D8
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 10:46:29 -0600 (MDT)
Date: Fri, 22 Aug 2003 09:39:00 -0700
From: "David S. Miller" <davem@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: James.Bottomley@SteelEye.com, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org, drepper@redhat.com
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Message-Id: <20030822093900.4468c012.davem@redhat.com>
In-Reply-To: <20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>
References: <1061563239.2090.25.camel@mulgrave>
	<20030822091447.6ecea6ca.davem@redhat.com>
	<20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 22 Aug 2003 17:34:29 +0100
Matthew Wilcox <willy@debian.org> wrote:

> On Fri, Aug 22, 2003 at 09:14:47AM -0700, David S. Miller wrote:
> > On 22 Aug 2003 09:40:37 -0500
> > flush_dcache_page() checks both the shared and non-shared mmap lists,
> > so if it is on _either_ list it is flushed.  It does not check only
> > the shared list.
> 
> Gah, that's going to get really inefficient.  I still think we want to
> split flush_dcache_page() into two operations -- flush_dcache_user() and
> flush_dcache_kernel().  flush_dcache_user() would flush this specific
> user mapping back to ram and flush_dcache_kernel() would flush the
> kernel mapping.  Obviously we'd still want to have flush_dcache_page()
> as there are instances when you want to flush all user mappings and the
> kernel mapping back to ram.

flush_dcache_page() works only on kernel pages.

It is defined to execute when the kernel executes store instructions
into a page.

Therefore splitting it into a "user" part makes absolutely no
sense.

> > The VM_SHARED change you are proposing is definitely wrong.
> 
> Why is it wrong?  Why should whether-or-not a mapping is read-only affect
> whether it's mapped shared?  I can't see anything in SuS v3 that suggests
> we should do this.

MAP_SHARED has no meaning if the mapping isn't writable.
