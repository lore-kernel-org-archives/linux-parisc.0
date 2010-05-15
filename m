From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Sat, 15 May 2010 16:59:52 -0600
Message-ID: <20100515225952.GD7587@lackof.org>
References: <4BE86174.1080008@gmx.de> <20100514192015.GB14840@lackof.org> <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com> <20100515172749.GE6764@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100515172749.GE6764@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 15, 2010 at 01:27:49PM -0400, Kyle McMartin wrote:
> It's a two instruction penalty(*) in the kernel syscall return path, just
> do it there. I've got a box at Red Hat with all the source to the whole
> damn world on it we run greps against to look for dumb stuff like memcpy
> bugs.

Why look for it? Just change the kernel to not ever return one of them.

>  I'll toss a grep for EAGAIN and not EWOULDBLOCK and vice versa and
> see how much stuff might b0rk.

Please do...I'd be curious to see which programs might be affected and
if we care.

> We discussed this a couple years ago, and it ended up being a complete
> rats nest of error returns that needed fixing.
> 
> regards, Kyle.
> 
> *: CMPI,N(=), LDI, maybe a third since I don't remember how sign
> extension works off the top of my head.

Mispredicted branches cost something like 20-25 cycles. I forgot now but I
do know they aren't cheap.

I'd rather not add more hacks for this they are unlikely to ever
be removed again. I'd rather have status quo than add some hack
to the syscall return path.

thanks,
grant

