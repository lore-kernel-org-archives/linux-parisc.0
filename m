From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
	tst-mmap-eofsync in glibc on parisc)
Date: 22 Aug 2003 13:56:06 -0500
Message-ID: <1061578568.2053.313.camel__39495.3001793057$1416622708$gmane$org@mulgrave>
References: <20030822110144.5f7b83c5.davem@redhat.com>
	<Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
	<20030822113106.0503a665.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Hugh Dickins <hugh@veritas.com>, willy@debian.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>, drepper@redhat.com
To: "David S. Miller" <davem@redhat.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030822113106.0503a665.davem@redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 2003-08-22 at 13:31, David S. Miller wrote:
> On Fri, 22 Aug 2003 19:34:41 +0100 (BST)
> Hugh Dickins <hugh@veritas.com> wrote:
> 
> > And to me.  If VM_SHARED is set, then __vma_link_file puts the vma on
> > on i_mmap_shared.  If VM_SHARED is not set, it puts the vma on i_mmap.
> > flush_dcache_page treats i_mmap_shared and i_mmap lists equally.
> 
> But file system page cache writes only call flush_dache_page()
> if the page has a non-empty i_mmap_shared list.

Hmm, but if it does that then the glibc bug test should show up on sparc
because the i_mmap_shared list is empty if we only do MAP_SHARED of read
only files.

James
