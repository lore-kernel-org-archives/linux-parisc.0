From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 13:55:53 -0600
Message-ID: <20060903195553.GC20217@colo.lackof.org>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
	<20060831214650.GC16032@colo.lackof.org>
	<119aab440609030754t5e0f869bq10b5c10770f14105@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440609030754t5e0f869bq10b5c10770f14105@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 03, 2006 at 10:54:18AM -0400, Carlos O'Donell wrote:
> >Yes. I'm now pretty sure the fix for that will be in gettimeoffset()
> >and not in timer_interrupt(). But I agree the two functions are very
> >similar but have to handle slightly different corner cases.
> 
> I still disagree, if you see James most recent patch which disabled
> IRQ's while we handle the timer interrupt, you will see that both
> functions are closer to being similar :)

I'm not sure about that. James might be wrong in this case.
See do_cpu_irq_mask().
It clears EIEM and thus disables all external interrupts
including the interval timer. The comment is wrong in that
we disable all EIEM bits, not just TIMER and IPI.

> I will assert that at the end of the day we will be writing
> "cr16_offset" which is a generic function that can be called with
> interrupts disabled and *that* will handle all the corner cases and be
> called by "timer_interrupt" and "gettimeoffset".

hrm ok. I'll keep that in mind. I'm not convinced of that
yet since those are both performance critical piecves of code.

...
> >Sorry - this didn't make sense. Can you provide an example?
> >For simplicity assume a 5 bit counter and pick the values
> >that illustrate your case.
> 
> 5 bit counter.
> it_value = 5
> cr16 = ... free running.
> clocktick = 5
> halftick = 2
> 
> a. Counter goes off at 8. Expected to go off at 5.

Itimer will interrupt at 5 if it was expect to go off at 5.
timer_interrupt() will never get invoked until 8 becuase of
interrupt handling overhead.

> b. Since (8 - 5) == 3 > 2 or a halftick, we push forward 2 ticks
> c. Set it_value to 15.

Ok. I really don't like the business with halftick pushing
system time "into the future".  Maybe we can just drop one tick
on the floor. Ie skip it and handle it on the next "full" tick?

> 1. User calls gettimeofday.
> 2. cr16 says time is 9
> 3. The it_value is 15, subtract a clocktick and you get 10.
> 
> *boom*
> 
> The value of cr16 is < the value of a rolled back clocktick.
> In counting the halftick, we need to rollback the halftick in gettimeoffset.

No. We need to just drop the next tick and not count it until
the next round.

> >Division is much more expensive than integer multiplication.
> >Is there a way to do the division once _and_ get the remainder?
> >
> >My assumption that integer multiplication is "cheaper"
> >could be wrong.
> 
> I timed this for some reasonable values of dividend and divisor.
> The division and modulo operation is ~156 cycles.
> The integer multiplication is ~73 cycles.
> This is the average cr16 tick over 1000 runs.
> The integer multiplication is "cheaper"

ok - many thanks for doing that.

...
> You say the following equations are correct:
> 
> ticks_elapsed = (now - next_tick) / clocktick;
> remainder = now - (ticks_elapsed * clocktick);
> 
> The ticks_elapsed equation *is* correct.
> 
> The remainder equation is wrong. The value of "now" could be 4GB, the
> value of "next_tick" could be "4GB - clocktick", the ticks_elapsed
> value is 1. This is correct. However, the remainder is going to be
> "4GB - 1 * clocktick" which is incorrect. The remainder in this case
> is zero.

> 
> To get the remainder you *must* do:
> 
> remainder = (now - next_tick) - (ticks_elapsed * clocktick)
> 
> This gives you the left over ticks you didn't count. I have added
> brackets here to clarify the math.

Yes - got it now. thanks again!

> I have come to the conclusion that adding the halftick is conceptually 
> wrong.
> 
> Follow me on this.
> 
> 1. By adding the halftick, as a real tick, the system time moves into
> the future.

I'm already convinced this is wrong and leads to too many complications.

> 2. A system with future time means we need negative gettimeoffset 
> adjustments.
> 3. Negative gettimeoffset adjustment complicate things needlessly.
> 4. Halfticks should not be counted, and should be ignored.
> 5. Ignoring halfticks is not a problem, when the late timer interrupt
> arrives we will accrue all full ticks anyway.
> 
> What do you think?

total agreement.
I'll rework my code later today to try to match the discussion so far.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
