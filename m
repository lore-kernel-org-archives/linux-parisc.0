Return-Path: <davem@redhat.com>
Received: from rth.ninka.net (rth.ninka.net [216.101.162.244])
	by dsl2.external.hp.com (Postfix) with ESMTP id 961184840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 21:48:42 -0700 (MST)
Date: Mon, 15 Dec 2003 20:48:35 -0800
From: "David S. Miller" <davem@redhat.com>
To: Randolph Chung <randolph@tausq.org>
Message-Id: <20031215204835.0993a51a.davem@redhat.com>
In-Reply-To: <20031216044033.GT533@tausq.org>
References: <20031216044033.GT533@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: Question about cache flushing and fork
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 15 Dec 2003 20:40:33 -0800
Randolph Chung <randolph@tausq.org> wrote:

> Can someone please explain why it is necessary to flush the cache 
> during fork()? (i.e. call to flush_cache_mm() in dup_mmap)

Writable pages that will be shared between the child and
parent are marked read-only and COW, some cpu caches store
protection information in the cache lines in order to avoid
TLB lookups etc. so the caches must be flushed since the
page protection information is changing.
