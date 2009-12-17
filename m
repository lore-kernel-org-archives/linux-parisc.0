From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git patches] xfs and block fixes for virtually indexed arches
Date: Thu, 17 Dec 2009 08:16:12 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0912170811130.15740@localhost.localdomain>
References: <20091216043618.GB9104@hera.kernel.org> <20091217132256.GO28962@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	James.Bottomley@suse.de, hch@infradead.org,
	linux-arch@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20091217132256.GO28962@bombadil.infradead.org>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Thu, 17 Dec 2009, Kyle McMartin wrote:
>
> Linus, any word on these? I'd really love to get jejb and hch off
> my back. :)

I hate them.

I don't see what the point of allowing kernel virtual addresses in bio's 
is. It's wrong. The fact that XFS does that sh*t is an XFS issue. Handle 
it there.

Fix XFS. Or convince me with some really good arguments, and make sure 
that Jens signs off on the cr*p too.

In other words, the thing I object to isn't even the new flushing thing, 
it's this idiocy:

 - save off virtual address:
	..
	bio->bi_private = data;
	..

 - do vmalloc_to_page:

	+		if (is_vmalloc_addr(data)) {
	+			flush_kernel_dcache_addr(data);
	+			page = vmalloc_to_page(data);
	+		} else
	+			page = virt_to_page(data);

WTF? Why the hell should the block layer support this kind of absolute 
crap? When has "use random kernel virtual address" ever been a valid thing 
to do for IO?

Why aren't you doing this before you submit the vmalloc range for IO?

So no. Not a way in hell do I pull this for 33. And preferably never.

		Linus
