From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
    tst-mmap-eofsync in glibc on parisc)
Date: Fri, 22 Aug 2003 20:02:44 +0100 (BST)
Message-ID: <Pine.LNX.4.44.0308221954570.2256-100000__9948.05100276626$1416622708$gmane$org@localhost.localdomain>
References: <1061577688.2090.285.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: "David S. Miller" <davem@redhat.com>, <willy@debian.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	<drepper@redhat.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1061577688.2090.285.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On 22 Aug 2003, James Bottomley wrote:
> On Fri, 2003-08-22 at 13:34, Hugh Dickins wrote:
> > Might the problem be in parisc's __flush_dcache_page,
> > which only examines i_mmap_shared?
> 
> This is the issue: we do treat them differently.
> 
> Semantics differ between privately mapped data (where there's no
> coherency guarantee) and shared data (where there is).  Flushing the
> virtual cache is expensive on pa, so we only do it for the i_mmap_shared
> list.
> 
> The difficulty is that a mmap of a read only file with MAP_SHARED is
> expecting the shared cache semantics, but gets added to the non shared
> list.
> 
> Since flushing the caches is a performance hog, we'd like do be able to
> distinguish the cases where we have to do the flush MAP_SHARED mappings
> from those we don't (MAP_PRIVATE).

The naming "i_mmap_shared" does suggest that once upon a time those
lists were as you'd like; and that at some point it was changed.

Perhaps some arches prefer the coherency guarantee I'm familiar with
in MAP_PRIVATE (yes, when you modify a page yourself, it cows off and
becomes private; but in i386 it's shared up until then), and other
arches (like yours) would prefer to avoid the overhead.

Hugh
