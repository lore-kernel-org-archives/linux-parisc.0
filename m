Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 55D154840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 20:46:53 -0700 (MST)
Date: Mon, 15 Dec 2003 20:40:33 -0800
From: Randolph Chung <randolph@tausq.org>
To: linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20031216044033.GT533@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: [parisc-linux] Question about cache flushing and fork
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

Can someone please explain why it is necessary to flush the cache 
during fork()? (i.e. call to flush_cache_mm() in dup_mmap)

It seems that after fork, the parent and child have access to the same
vm, so it should be sufficient to flush the tlb, and create two pte's
for the processes. I can see that during COW processing there can be
kernel/user cache aliasing issues on virtually indexed caches, but
that seems to be taken care of by copy_cow_page(). 

I've read through cachetlb.txt, but it just says:

        This interface is used to handle whole address space
        page table operations such as what happens during
        fork, exit, and exec.

I can see why this is needed for exit(), but why fork()? and i don't see
this used for exec() ?

Also is there an updated version of the "Linux Cache Flush Architecture"
document? (http://en.tldp.org/LDP/khg/HyperNews/get/memory/flush.html)
This is a very nicely written doc, but it seems a bit out of date for
2.6 (e.g. flush_page_to_ram is gone)

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
