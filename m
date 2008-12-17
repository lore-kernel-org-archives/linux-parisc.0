From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] fix BUG: sleeping function called from invalid context
	at mm/slab.c:3044
Date: Wed, 17 Dec 2008 18:41:24 -0500
Message-ID: <20081217234124.GA30438@bombadil.infradead.org>
References: <494983DE.2050105@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <494983DE.2050105@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 11:57:34PM +0100, Helge Deller wrote:
> Since unwind_frame_init_from_blocked_task() may be called from
> interrupt/in_atomic context, it needs to kmalloc() memory with
> GFP_ATOMIC instead of GFP_KERNEL.
> 

that's right, it used to just allocate r2 but i introduced this bug when
i killed some stack heavy things a while back.

applied, kyle
