From: LaMont Jones <lamont@mmjgroup.com>
Subject: Re: [parisc-linux] Re: Question about cache flushing and fork
Date: Tue, 16 Dec 2003 08:53:24 -0700
Message-ID: <20031216155324.GB25535__10992.2281037599$1416623056$gmane$org@mmjgroup.com>
References: <20031216044033.GT533@tausq.org>
	<20031215204835.0993a51a.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Randolph Chung <randolph@tausq.org>, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org
To: "David S. Miller" <davem@redhat.com>
Return-Path: <lamont@mmjgroup.com>
In-Reply-To: <20031215204835.0993a51a.davem@redhat.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Dec 15, 2003 at 08:48:35PM -0800, David S. Miller wrote:
> On Mon, 15 Dec 2003 20:40:33 -0800
> Randolph Chung <randolph@tausq.org> wrote:
> > Can someone please explain why it is necessary to flush the cache 
> > during fork()? (i.e. call to flush_cache_mm() in dup_mmap)
> Writable pages that will be shared between the child and
> parent are marked read-only and COW, some cpu caches store
> protection information in the cache lines in order to avoid
> TLB lookups etc. so the caches must be flushed since the
> page protection information is changing.

On PARISC, the cache line contains the following elements:
	1) data (obviously)
	2) physical page
	3) dirty/clean/public/private/etc state

A cache access hits or misses depending on whether or not the physical page from
the TLB matches the physical page stored in the cache line.

If flushing is required during fork on PARISC, then there are cache consistency
issues elsewhere, something is horribly broken in the design (and it should be
falling all over anyway).

lamont
