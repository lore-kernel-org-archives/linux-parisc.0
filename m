From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Another ldcw inline assembler patch
Date: Sun, 29 Jun 2008 16:09:27 -0500
Message-ID: <1214773767.3405.17.camel@localhost.localdomain>
References: <20080628220756.GA8620@hiauly1.hia.nrc.ca>
	 <20080628233406.GI14894@parisc-linux.org>
	 <20080629205556.GA8381@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080629205556.GA8381@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-06-29 at 14:55 -0600, Grant Grundler wrote:
> On Sat, Jun 28, 2008 at 05:34:07PM -0600, Matthew Wilcox wrote:
> > On Sat, Jun 28, 2008 at 06:07:57PM -0400, John David Anglin wrote:
> > > There are two reasons to expose the memory *a in the asm:
> > > 
> > > 1) To prevent the compiler from discarding a preceeding write to *a, and
> > > 2) to prevent it from caching *a in a register over the asm.
> > 
> > Do either of those scenarios apply, given that every usage of this is
> > preceded by an asm clobbering memory?
> > 
> > I believe the correct thing to do is to take out the two mb()s in the
> > various spin_lock routines and make the __ldcw() macro itself clobber
> > memory.
> 
> I agree. Do you want jda to submit another patch or did you want kyle to
> take jda's patch and apply a second one to remove the mb()'s?

I really wouldn't do that.  Parisc is fairly unique in that we have C
spinlocks (most other architectures have asm coded ones).  The
requirement of the spinlock routines are that they be atomic memory
clobbers (as in the sequence of statements that does one shouldn't be
moved by the compiler)---which is why our C ones have mb before and
after.

if you make __ldcw() a memory clobber, that will pretty much cover the
atomic memory clobber requirements of __raw_spin_lock_flags() ... but
look at the rest of them ... it won't cover for them.  If we have to
have these mb()s in the rest, it makes sense to have them in
__raw_spin_lock_flags() as well, just to avoid problems if someone tries
to optimise again.  There probably should be a comment in this file to
that effect.

James


