From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] parisc: fix unwind with recent gcc versions
Date: Sun, 29 Nov 2009 09:34:45 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0911290929110.3684@localhost.localdomain>
References: <20091128203311.GA24165@hera.kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091128203311.GA24165@hera.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 28 Nov 2009, Kyle McMartin wrote:
>
> From: Helge Deller <deller@gmx.de>
> 
> kernel unwinding is broken with gcc >= 4.x. Part of the problem is, that
> binutils seems sensible where the unwind information is stored.

The commentary doesn't seem to make much sense to me. Do you mean 
"sensitive" rather than "sensible"? And is it an actual binutils bug, or 
what?

Also, are the PARISC people 100% sure that you really want unwinding in 
the first place? We got rid of it as being terminally broken on x86, 
because tools and asm always got it wrong, and special things like irq 
frames etc continually broke it in the most annoying ways possible (ie 
WARN_ON() statements became fatal oopses due to unwind errors etc).

Having a tentative and unreliable stack trace is generally better than 
a totally broken one.

		Linus
