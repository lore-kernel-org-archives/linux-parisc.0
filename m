From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: Wed, 8 Sep 2004 10:52:10 -0600
Message-ID: <20040908165210.GA10316@colo.lackof.org>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
	<1094395005.1690.1.camel@mulgrave>
	<20040906041952.GA17107@colo.lackof.org>
	<1094480131.2037.6.camel@mulgrave>
	<20040907151722.GC18849@colo.lackof.org>
	<1094571019.2068.101.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1094571019.2068.101.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Sep 07, 2004 at 11:30:17AM -0400, James Bottomley wrote:
> > Maybe I'm just confused again. I was thinking gcc could move instructions
> > between the asm("ldcw") and mb(). And the same thing between
> > mb() and "lock = 1".
> 
> It can, in a restricted fashion (the asm volatile ensures this
> restriction).  But that's OK.  What we want is that when we complete the
> spin_lock code, the spin is locked and memory clobbered.  That's why the
> only necessary mb() is at the end.

yes - I understand that part and agree the current code is correct.

> > In other words, I'm worried about the "distance" bewteen lock/unlock
> > ops is greater than the "distance" between two mb() that contain
> > the critical section of code.
> 
> Well, the point about using an optimising compiler is that you're
> supposed to give it the information necessary to do its job.  In this
> case, the correct information is that a is volatile. 

Yeah - there is a tradeoff between optimizing the pipeline between
cases where the lock is contended and where it is not. The compiler
does not have that info unless it could consume Profile info.
(ie "Profile Based Optimization").
I was thinking we should favor the contended case to make it
less painful. I've changed my mind and will not push this patch.

> And further, after
> it's finished the spin lock code we prevent no reordering leaks and
> clobber memory.

Yes - no argument about correctness of current code.

> > Erm, how?
> > Our mb() definition uses asm(:::"memory").
> > Is that different from using "memory" in the actual bit of assembly?
> 
> Because in your implementation you have the barrier in the middle of a
> loop; that means it's crossed many times in the contended case.  In mine
> it's only crossed once.

But the _ldcw() is part of a tight "while" loop.
What's the penalty for "crossing" the barrier?
I don't see one.

BTW, do you think we should use coherent loads/stores for locks?
That's the other aspect of the patch that I think jda would like
to see incorporated.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
