Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42AB348CC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 10:22:15 -0600 (MDT)
Date: Fri, 22 Aug 2003 09:14:47 -0700
From: "David S. Miller" <davem@redhat.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Cc: linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org, drepper@redhat.com
Message-Id: <20030822091447.6ecea6ca.davem@redhat.com>
In-Reply-To: <1061563239.2090.25.camel@mulgrave>
References: <1061563239.2090.25.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync in glibc on
 parisc)
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

On 22 Aug 2003 09:40:37 -0500
James Bottomley <James.Bottomley@SteelEye.com> wrote:

> This test essentially opens a file (via open(2)), writes something,
> opens it via a mmaped file object *read only* (via fopen(...,"rm)) reads
> what was writtent, writes some more and reads it via the mmaped file
> object.
> 
> This last read fails to get the data on parisc.  The problem is that our
> CPU cache is virtually indexed, and the page the write is storing the
> data to (in the buffer cache) and the page it is mmapped to have the
> same physical, but different virtual addresses.  We need the write() to
> trigger a cache update via flush_dcache_page to get the virtually
> indexed cache in sync.
> 
> The reason this doesn't happen is because the mapping is not on the
> mmap_shared list that flush_dcache_page() updates.

flush_dcache_page() checks both the shared and non-shared mmap lists,
so if it is on _either_ list it is flushed.  It does not check only
the shared list.

The VM_SHARED change you are proposing is definitely wrong.
