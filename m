Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA78E48E9
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 12:38:42 -0600 (MDT)
Date: Fri, 22 Aug 2003 11:31:06 -0700
From: "David S. Miller" <davem@redhat.com>
To: Hugh Dickins <hugh@veritas.com>
Cc: willy@debian.org, James.Bottomley@SteelEye.com,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Message-Id: <20030822113106.0503a665.davem@redhat.com>
In-Reply-To: <Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
References: <20030822110144.5f7b83c5.davem@redhat.com>
	<Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
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

On Fri, 22 Aug 2003 19:34:41 +0100 (BST)
Hugh Dickins <hugh@veritas.com> wrote:

> And to me.  If VM_SHARED is set, then __vma_link_file puts the vma on
> on i_mmap_shared.  If VM_SHARED is not set, it puts the vma on i_mmap.
> flush_dcache_page treats i_mmap_shared and i_mmap lists equally.

But file system page cache writes only call flush_dache_page()
if the page has a non-empty i_mmap_shared list.

> Might the problem be in parisc's __flush_dcache_page,
> which only examines i_mmap_shared?

No, it examines both lists, the problem is not there.

The issue seems to be some confusion about whether the
test program in question is actually mmap()'ing the area
with PROT_WRITE set, and if so why the test case isn't
passing because in such a case the page will have a non-empty
i_mmap_shared list.
