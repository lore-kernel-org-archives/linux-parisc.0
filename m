From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sun, 13 Mar 2011 19:50:58 -0600
Message-ID: <20110314015058.GE29986@parisc-linux.org>
References: <20110313235837.GB29986@parisc-linux.org> <20110314012235.229C64FDB@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110314012235.229C64FDB@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 13, 2011 at 09:22:34PM -0400, John David Anglin wrote:
...
> > Hi Dave,
> > Maybe the patch should be for this line of code instead?
> >         if (unlikely(now2 - now > 0x3000))      /* 12K cycles */
> > 
> > ie increase the value slightly?
> 
> I tried that initially.  After bumping it a couple of times, it
> seemed like more iterations in the `if' alternative was better as
> most instructions only take one cycle.  My sense is that we only
> exceed the current limit in rare circumstances.

Ok. If your patch avoids the case, then it's certainly worth entertaining.

> > TBH, I didn't spend alot of time trying to figure out the optimal balance
> > between the two cases that the proposed patch attempts to adjust.
> > 
> > Also, if the div/mul takes up to 0x7000 cycles, another alternative
> > is to make the alternative faster.  What I suggested in the else case:
> >         /* TODO: Reduce this to one fdiv op */
> > 
> > doesn't seem possible with fdiv in one op. My reading of the fdiv
> > operator suggests it would need another FMUL and FSUB op in order
> > to get the remainder. Still might be vary fast.
> > 
> > Looking through PA 2.0 arch book, looks like the PA2.0
> > "Divide Step" (DS) operation (page 7-46) does what I was thinking of.
> > But that's going to require a sequence of DS instructions that
> > I don't quite understand at the moment and thus can't say how
> > fast the worst case for DS might be.
> 
> Currently, I believe that the kernel does integer multiplication
> and division using millicode.  If I remember correctly, division
> uses the DS instruction.  The situation is worse for 64-bit operations
> because HP never released their 64-bit millicode code.  So, gcc does
> long division in this case.

The URL I provided in other reply:
    http://www.cs.bham.ac.uk/research/projects/poplog/src/master/C.hppa/src/aarith.s

implemented 64-bit/32-bit math. Should be easy to integrate.


> I haven't seen any SLOW warnings with the patch I suggested but it
> may be a bit inefficient.  I have the sense that the problem occurs
> on the rp3440 because it has two dual core cpus.  I have never seen
> the warning on machines with a single processor chip.

The dual core might be competing for a shared resource related to FP?
I don't know either. But if your patch avoids the warning, I'd say apply
it until someone else cares enough to integrate the 64-bit divU and
make use of it here.

cheers,
grant
