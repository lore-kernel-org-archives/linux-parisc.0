From: Christoph Lameter <cl@linux.com>
Subject: Re: slub: fix panic with DISCONTIGMEM
Date: Tue, 19 Apr 2011 16:38:29 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1104191633250.23077@router.home>
References: <1303248576.11237.23.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-arch@vger.kernel.org, linux-mm@vger.kernel.org,
	"hugh.dickins@tiscali.co.uk" <hugh.dickins@tiscali.co.uk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1303248576.11237.23.camel@mulgrave.site>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 19 Apr 2011, James Bottomley wrote:

> Slub makes assumptions about page_to_nid() which are violated by
> DISCONTIGMEM and !NUMA.  This violation results in a panic because

Fix this by stating correctly by saying "The kernel makes assumptions in
various subsystems ..."

> page_to_nid() can be non-zero for pages in the discontiguous ranges and
> this leads to a null return by get_node().  The assertion by the
> maintainer is that DISCONTIGMEM should only be allowed when NUMA is also
> defined.  However, at least six architectures: alpha, ia64, m32r, m68k,

That is not what I said. DISCONTIG support needs to be fixed so that the
core subsystems using page_to_nid() will operate correctly with a !NUMA
discontig configuration. Core will expect page_to_nid() to only return 0
on !NUMA.
