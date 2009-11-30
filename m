From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix unwind with recent gcc versions
Date: Mon, 30 Nov 2009 09:14:15 -0500
Message-ID: <1259590455.2560.7.camel@mulgrave.site>
References: <20091128203311.GA24165@hera.kernel.org>
	 <alpine.LFD.2.00.0911290929110.3684@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0911290929110.3684@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2009-11-29 at 09:34 -0800, Linus Torvalds wrote:
> Also, are the PARISC people 100% sure that you really want unwinding in 
> the first place? We got rid of it as being terminally broken on x86, 
> because tools and asm always got it wrong, and special things like irq 
> frames etc continually broke it in the most annoying ways possible (ie 
> WARN_ON() statements became fatal oopses due to unwind errors etc).
> 
> Having a tentative and unreliable stack trace is generally better than 
> a totally broken one.

Being a risc system, we don't have a lot of choice.  returns on parisc
are conventionally jump through register two, so without unwind
information we have no idea where in the stack frame (or even if)
they're stored.  Our other problem is that our stack frames have a
predefined size which often doesn't get fully filled, so the stack gets
gummed up with a lot of cruft from previous calls; thus even if we just
trawl it for relevant addresses, we get a lot of bogus information.

Look at it this way:  our unwind information has to be correct otherwise
the debugger would continually fail on the platform, so the tool chain
has an incentive to get it right.

James


