From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Hacking SuperDome
Date: Sun, 8 Feb 2009 16:15:33 -0700
Message-ID: <20090208231533.GI31509@parisc-linux.org>
References: <20090207142906.GA8553@alpha.franken.de> <20090208043032.GA11398@bombadil.infradead.org> <20090208170516.GB11398@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090208170516.GB11398@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Feb 08, 2009 at 12:05:16PM -0500, Kyle McMartin wrote:
> I'd forgotten how simplistic our boot protocol is... we've really got
> very little way to communicate, well, anything extra, since we didn't
> sanitize the other unused registers before branching to the kernel
> entrypoint.

The usual solution to this is to put a magic value in a register.  For
example, mount(2) has 0xC0ED in the upper 16 bits of the flag register.
We're not exactly short on registers, so if one of the unused ones is
set to, say 0x0c2cd240, we would know that we're using the v2 protocol.

> Current plan is to define an extensible v2 palo format, using a
> 4096-byte data page (similar to the command line) and use the top
> 2048-bytes for the command line (so maybe people will whinge less.)

Heck, we could put a pointer in the data page, and have the command line
an unlimited length.  Or make one of the unused registers be the command
line.

> It's ugly, but aside from doing some ELF jiggery pokery or something, or
> reading the first couple instructions from the kernel, we've fairly
> little choice... I've decided that since %ret0 is guaranteed to have
> the start address of _stext in it, since we returned it from iplload,
> I'll just 'borrow' that as a flag to use the v2 boot protocol.
> (ie: if %ret0 isn't 0x10000, use v2.)

I'm fully in support, as long as a new palo will boot an old kernel, and
vice versa.  This doesn't seem like it would be too hard.

(Obviously, if you're using an old palo or an old kernel, you have to
live with the limitations of the v1 protocol).

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
