From: "David S. Miller" <davem@redhat.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Date: Sat, 23 Aug 2003 14:43:30 -0700
Message-ID: <20030823144330.5ddab065.davem__28024.9565643773$1416622715$gmane$org@redhat.com>
References: <20030822110144.5f7b83c5.davem@redhat.com>
	<Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
	<20030822113106.0503a665.davem@redhat.com>
	<1061578568.2053.313.camel@mulgrave>
	<20030822121955.619a14eb.davem@redhat.com>
	<1061591255.1784.636.camel@mulgrave>
	<20030822154100.06314c8e.davem@redhat.com>
	<1061600974.2090.809.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: hugh@veritas.com, willy@debian.org, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org, drepper@redhat.com
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1061600974.2090.809.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On 22 Aug 2003 20:09:30 -0500
James Bottomley <James.Bottomley@SteelEye.com> wrote:

> What we were hoping is that we could rely on this little property of
> mmap:
> 
>        MAP_PRIVATE
>                   Create a private copy-on-write mapping.  Stores
>                   to the region do not affect the original  file.
>                   It  is  unspecified whether changes made to the
>                   file after the mmap call  are  visible  in  the
>                   mapped region.
> 
> To avoid having to flush the non-shared mappings (basically on parisc if
> you write to a file backing a MAP_PRIVATE mapping then we don't
> guarantee you see the update).
> 
> I suppose if we had a way of telling if any of the i_mmap list members
> were really MAP_SHARED semantics mappings, then we could alter our
> flush_dcache_page() implementation to work.

I thought about this very deeply last night and this morning.
And what you're trying to optimize won't work.  Here is why.

If the first access to a MAP_PRIVATE mapping of a page is a read,
we'll use the page-cache page.  This means that, with your
optimization, during this time if another cpu write()`s into the
page we'll lose the data update.

Sorry :(
