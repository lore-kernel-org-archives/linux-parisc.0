Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mtvmime01.veritas.com (bay-bridge.veritas.com [143.127.3.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id A418548E2
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 12:33:01 -0600 (MDT)
Received: from oldfart([10.10.185.155]) (1462 bytes) by megami
	via sendmail with P:esmtp/R:smart_host/T:smtp
	(sender: <hugh@veritas.com>)
	id <m19qGiZ-00008sC@megami>
	for <linux-kernel@vger.kernel.org>; Fri, 22 Aug 2003 11:32:59 -0700 (PDT)
	(Smail-3.2.0.101 1997-Dec-17 #15 built 2001-Aug-30)
Date: Fri, 22 Aug 2003 19:34:41 +0100 (BST)
From: Hugh Dickins <hugh@veritas.com>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, <James.Bottomley@SteelEye.com>,
	<linux-kernel@vger.kernel.org>,
	<parisc-linux@lists.parisc-linux.org>, <drepper@redhat.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync
 in glibc on parisc)
In-Reply-To: <20030822110144.5f7b83c5.davem@redhat.com>
Message-ID: <Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
