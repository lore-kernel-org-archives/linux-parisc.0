From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync
 in glibc on parisc)
Date: Fri, 22 Aug 2003 19:34:41 +0100 (BST)
Message-ID: <Pine.LNX.4.44.0308221926060.2200-100000__30100.2135187902$1416622707$gmane$org@localhost.localdomain>
References: <20030822110144.5f7b83c5.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: willy@debian.org, <James.Bottomley@SteelEye.com>,
	<linux-kernel@vger.kernel.org>,
	<parisc-linux@lists.parisc-linux.org>, <drepper@redhat.com>
To: "David S. Miller" <davem@redhat.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030822110144.5f7b83c5.davem@redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 22 Aug 2003, David S. Miller wrote:
> 
> So the proposed patch looks bogus to me.

And to me.  If VM_SHARED is set, then __vma_link_file puts the vma on
on i_mmap_shared.  If VM_SHARED is not set, it puts the vma on i_mmap.
flush_dcache_page treats i_mmap_shared and i_mmap lists equally.

Might the problem be in parisc's __flush_dcache_page,
which only examines i_mmap_shared?

Though it's odd, I'm not keen on changing do_mmap_pgoff's usage of
VM_SHARED in a hurry: it's worked like that for years, and other
things (I forget) depend on it.

Hugh
