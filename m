From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Hacking SuperDome
Date: Sun, 8 Feb 2009 12:05:16 -0500
Message-ID: <20090208170516.GB11398@bombadil.infradead.org>
References: <20090207142906.GA8553@alpha.franken.de> <20090208043032.GA11398@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090208043032.GA11398@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Feb 07, 2009 at 11:30:32PM -0500, Kyle McMartin wrote:
> We can fix this pretty easily, palo knows if it was started with 64-bit
> firmware, we can just bring this into the kernel. I'll hack a patch for
> palo this weekend, but you might as well continue just using what you've
> got until then.
> 

I'd forgotten how simplistic our boot protocol is... we've really got
very little way to communicate, well, anything extra, since we didn't
sanitize the other unused registers before branching to the kernel
entrypoint.

Current plan is to define an extensible v2 palo format, using a
4096-byte data page (similar to the command line) and use the top
2048-bytes for the command line (so maybe people will whinge less.)

It's ugly, but aside from doing some ELF jiggery pokery or something, or
reading the first couple instructions from the kernel, we've fairly
little choice... I've decided that since %ret0 is guaranteed to have
the start address of _stext in it, since we returned it from iplload,
I'll just 'borrow' that as a flag to use the v2 boot protocol.
(ie: if %ret0 isn't 0x10000, use v2.)

This may seem unnecessary, but really, we might as well, I seem to
recall d-i running into the command line length being an issue earlier.

regards, Kyle
