Return-Path: <torvalds@osdl.org>
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B4C74840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 21:56:37 -0700 (MST)
Date: Mon, 15 Dec 2003 20:56:33 -0800 (PST)
From: Linus Torvalds <torvalds@osdl.org>
To: Randolph Chung <randolph@tausq.org>
In-Reply-To: <20031216044033.GT533@tausq.org>
Message-ID: <Pine.LNX.4.58.0312152049140.3345@home.osdl.org>
References: <20031216044033.GT533@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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



On Mon, 15 Dec 2003, Randolph Chung wrote:
>
> Can someone please explain why it is necessary to flush the cache
> during fork()? (i.e. call to flush_cache_mm() in dup_mmap)

I don't know if it is strictly necessary - we might well be able to just
do the right thing in the page fault COW handler. But doing the cache
flush at fork time just means that we should never have a page that is
marked read-only but that may have dirty data in the virtual caches. That
could easily get confusing. In fact, I wouldn't be totally surprised if
some architecture refused to do write-backs through a read-only mapping.

But quite frankly, I suspect that since only a few CPU's have virtually
indexed caches, the cache-flush code hasn't gotten that much testing, and
there may be somewhat of an overkill approach there. As you found out,
it's not _that_ well documented.

		Linus
