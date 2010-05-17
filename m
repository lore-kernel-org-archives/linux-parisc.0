From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Mon, 17 May 2010 15:39:22 -0400
Message-ID: <AANLkTil-y0_G8HcYbV2KXKYexVozRATfjVnH7UzyP6K3@mail.gmail.com>
References: <4BE86174.1080008@gmx.de> <20100514192015.GB14840@lackof.org>
	 <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com>
	 <20100515172749.GE6764@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100515172749.GE6764@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 15, 2010 at 1:27 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sat, May 15, 2010 at 07:24:54AM -0400, Carlos O'Donell wrote:
>> An application that checked only for EWOULDBLOCK might fail now that
>> EAGAIN is being returned.
>>
>> Is this a concern? I don't think it is. The POSIX standard, in all
>> cases I could find, says the functions return "EAGAIN or EWOULDBLOCK",
>> meaning that a conforming program must check for both.
>>
>
> It's a two instruction penalty(*) in the kernel syscall return path, just
> do it there. I've got a box at Red Hat with all the source to the whole
> damn world on it we run greps against to look for dumb stuff like memcpy
> bugs. I'll toss a grep for EAGAIN and not EWOULDBLOCK and vice versa and
> see how much stuff might b0rk.

Is there any benefit to doing it in userspace?

As opposed to changing the kernel to define EGAIN == EWOULDBLOCK?

Both changes break ABI.

The userspace change makes the syscall return path a couple of
instructions slower.

The kernel change might break the future emulation of hpux application
on parisc linux?

> We discussed this a couple years ago, and it ended up being a complete
> rats nest of error returns that needed fixing.

If we set EAGAIN=EWOULDBLOCK in the kernel for parisc, would that be hard?

I'm just trying to understand and weigh the options.

Cheers,
Carlos.
