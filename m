From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
	tst-mmap-eofsync in glibc on parisc)
Date: 22 Aug 2003 20:09:30 -0500
Message-ID: <1061600974.2090.809.camel__11627.7249101133$1416622710$gmane$org@mulgrave>
References: <20030822110144.5f7b83c5.davem@redhat.com>
	<Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
	<20030822113106.0503a665.davem@redhat.com>
	<1061578568.2053.313.camel@mulgrave>
	<20030822121955.619a14eb.davem@redhat.com>
	<1061591255.1784.636.camel@mulgrave>
	<20030822154100.06314c8e.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: hugh@veritas.com, willy@debian.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>, drepper@redhat.com
To: "David S. Miller" <davem@redhat.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030822154100.06314c8e.davem@redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 2003-08-22 at 17:41, David S. Miller wrote:
> I think on parisc you are trying to avoid the write() case
> of the cache flush for non-shared mmap()s, and sorry you
> really can't do this, again this is:
> 
> 	When a write() system call occurs, the kernel "class" is writing to
> 	the page so all user mappings (shared or not!) need to be flushed
> 	out.
> 
> If your flush_dcache_page() is not doing this, it's no wonder
> the test case fails for you.

Yes, that's precisely what we're trying to do.  Our problem is that we
have to issue the flush to all the aliased addresses (one cache line at
a time) which is phenomenally expensive.

What we were hoping is that we could rely on this little property of
mmap:

       MAP_PRIVATE
                  Create a private copy-on-write mapping.  Stores
                  to the region do not affect the original  file.
                  It  is  unspecified whether changes made to the
                  file after the mmap call  are  visible  in  the
                  mapped region.

To avoid having to flush the non-shared mappings (basically on parisc if
you write to a file backing a MAP_PRIVATE mapping then we don't
guarantee you see the update).

I suppose if we had a way of telling if any of the i_mmap list members
were really MAP_SHARED semantics mappings, then we could alter our
flush_dcache_page() implementation to work.

James
