Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D83448ED
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 12:41:40 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7MIfRI10000;
	Fri, 22 Aug 2003 14:41:27 -0400
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
	tst-mmap-eofsync in glibc on parisc)
From: James Bottomley <James.Bottomley@steeleye.com>
To: Hugh Dickins <hugh@veritas.com>
Cc: "David S. Miller" <davem@redhat.com>, willy@debian.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>, drepper@redhat.com
In-Reply-To: <Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
References: <Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
Content-Type: text/plain
Date: 22 Aug 2003 13:41:26 -0500
Message-Id: <1061577688.2090.285.camel@mulgrave>
Mime-Version: 1.0
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

On Fri, 2003-08-22 at 13:34, Hugh Dickins wrote:
> Might the problem be in parisc's __flush_dcache_page,
> which only examines i_mmap_shared?

This is the issue: we do treat them differently.

Semantics differ between privately mapped data (where there's no
coherency guarantee) and shared data (where there is).  Flushing the
virtual cache is expensive on pa, so we only do it for the i_mmap_shared
list.

The difficulty is that a mmap of a read only file with MAP_SHARED is
expecting the shared cache semantics, but gets added to the non shared
list.

Since flushing the caches is a performance hog, we'd like do be able to
distinguish the cases where we have to do the flush MAP_SHARED mappings
from those we don't (MAP_PRIVATE).

James
