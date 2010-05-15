From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Sat, 15 May 2010 13:27:49 -0400
Message-ID: <20100515172749.GE6764@bombadil.infradead.org>
References: <4BE86174.1080008@gmx.de> <20100514192015.GB14840@lackof.org> <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 15, 2010 at 07:24:54AM -0400, Carlos O'Donell wrote:
> An application that checked only for EWOULDBLOCK might fail now that
> EAGAIN is being returned.
> 
> Is this a concern? I don't think it is. The POSIX standard, in all
> cases I could find, says the functions return "EAGAIN or EWOULDBLOCK",
> meaning that a conforming program must check for both.
> 

It's a two instruction penalty(*) in the kernel syscall return path, just
do it there. I've got a box at Red Hat with all the source to the whole
damn world on it we run greps against to look for dumb stuff like memcpy
bugs. I'll toss a grep for EAGAIN and not EWOULDBLOCK and vice versa and
see how much stuff might b0rk.

We discussed this a couple years ago, and it ended up being a complete
rats nest of error returns that needed fixing.

regards, Kyle.

*: CMPI,N(=), LDI, maybe a third since I don't remember how sign
extension works off the top of my head.
