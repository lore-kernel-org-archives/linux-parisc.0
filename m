From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] Re: [PATCH] Compat signal fixes for 64-bit parisc.
Date: Mon, 12 Feb 2007 21:23:48 -0500
Message-ID: <20070213022348.GD20686__2147.41068562052$1416624289$gmane$org@athena.road.mcmartin.ca>
References: <119aab440702121814g7fbe0e90tf026c8f75ddd56d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702121814g7fbe0e90tf026c8f75ddd56d3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 12, 2007 at 09:14:28PM -0500, Carlos O'Donell wrote:
> I see we are back to using our antiquated version of
> copy_siginfo_to_user32. Let's stomp some bugs shall we? Please review.
> 

Well, you never pushed any of it upstream. I don't know what
you're complaining about.

> This fixes the tst-timer segfault with glibc head, and does a little
> cleanup. I have an acute feeling of deja-vu. Thankfully I feel taller
> than ever, and the whole fix only took a little sleuthing.
> 
> For nostalgia read..
> 
> Date	Wed, 10 Dec 2003 19:17:56 -0500
> From	Carlos O'Donell <>
> Subject	[RFC] Compat siginfo_t for 64-bit kernels running 32-bit 
> userspace.
> http://lkml.org/lkml/2003/12/10/225
> 
> ...and note the date.
> 

I'm well aware. You can't make such changes to the core kernel and then just
leave it for 3 years. We had to carry tens of KB of diff to the core kernel.

Whatever, I've hit a wall with parisc, anything I want to do is blocked on an
utter lack of documentation, so I pretty much have gone into maintenance mode
hibernation. I have cooler toys these days anyway.

-- Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
