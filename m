From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sun, 13 Mar 2011 21:22:34 -0400 (EDT)
Message-ID: <20110314012235.229C64FDB@hiauly1.hia.nrc.ca>
References: <20110313235837.GB29986@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110313235837.GB29986@parisc-linux.org> from "Grant Grundler" at Mar 13, 2011 05:58:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sat, Mar 12, 2011 at 12:08:32PM -0500, John David Anglin wrote:
> > The attached change fixes the "SLOW!" timer_interrupt warning that I
> > occasionally see on my rp3440 (800 MHz).  We need to avoid using the
> > expensive div/mul method.  I have seen instances where it takes more
> > than 0x7000 cycles.
> 
> Hi Dave,
> Maybe the patch should be for this line of code instead?
>         if (unlikely(now2 - now > 0x3000))      /* 12K cycles */
> 
> ie increase the value slightly?

I tried that initially.  After bumping it a couple of times, it
seemed like more iterations in the `if' alternative was better as
most instructions only take one cycle.  My sense is that we only
exceed the current limit in rare circumstances.

> TBH, I didn't spend alot of time trying to figure out the optimal balance
> between the two cases that the proposed patch attempts to adjust.
> 
> Also, if the div/mul takes up to 0x7000 cycles, another alternative
> is to make the alternative faster.  What I suggested in the else case:
>         /* TODO: Reduce this to one fdiv op */
> 
> doesn't seem possible with fdiv in one op. My reading of the fdiv
> operator suggests it would need another FMUL and FSUB op in order
> to get the remainder. Still might be vary fast.
> 
> Looking through PA 2.0 arch book, looks like the PA2.0
> "Divide Step" (DS) operation (page 7-46) does what I was thinking of.
> But that's going to require a sequence of DS instructions that
> I don't quite understand at the moment and thus can't say how
> fast the worst case for DS might be.

Currently, I believe that the kernel does integer multiplication
and division using millicode.  If I remember correctly, division
uses the DS instruction.  The situation is worse for 64-bit operations
because HP never released their 64-bit millicode code.  So, gcc does
long division in this case.

I haven't seen any SLOW warnings with the patch I suggested but it
may be a bit inefficient.  I have the sense that the problem occurs
on the rp3440 because it has two dual core cpus.  I have never seen
the warning on machines with a single processor chip.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
