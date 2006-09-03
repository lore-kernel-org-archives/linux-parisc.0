From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 10:54:18 -0400
Message-ID: <119aab440609030754t5e0f869bq10b5c10770f14105@mail.gmail.com>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
	<20060831214650.GC16032@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831214650.GC16032@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/31/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> I think it's arbitrary where the overflow occurs.
> Maybe unsigned math overflow is easier to visualize/understand.
> At least it is for me.

I agree with you, unsigned long code is easier to maintain.
Signed math overflow is implementation defined behaviour, it should
not be relied upon.

> Yes. I'm now pretty sure the fix for that will be in gettimeoffset()
> and not in timer_interrupt(). But I agree the two functions are very
> similar but have to handle slightly different corner cases.

I still disagree, if you see James most recent patch which disabled
IRQ's while we handle the timer interrupt, you will see that both
functions are closer to being similar :)

I will assert that at the end of the day we will be writing
"cr16_offset" which is a generic function that can be called with
interrupts disabled and *that* will handle all the corner cases and be
called by "timer_interrupt" and "gettimeoffset".

> I was thinking the opposite: I'm missing a "tick_elapsed" count
> on each timer interrupt.

That might also be the case.

> >  Does cr16 *actuall* count at the instruction rate, or
> > does it count at 1/2 rate?
>
> I _believe_ all implementations count at the actual rate.
> At least I'm not aware of any implementations that don't
> count at the advertized clock speed.

OK.

> > There is a bug here because of this, you are right to be warry of the
> > halftick adjustment. It is also needed in gettimeoffset, or "now" will
> > appear before "next_tick" without wrapping.
>
> Sorry - this didn't make sense. Can you provide an example?
> For simplicity assume a 5 bit counter and pick the values
> that illustrate your case.

5 bit counter.
it_value = 5
cr16 = ... free running.
clocktick = 5
halftick = 2

a. Counter goes off at 8. Expected to go off at 5.
b. Since (8 - 5) == 3 > 2 or a halftick, we push forward 2 ticks
c. Set it_value to 15.

1. User calls gettimeofday.
2. cr16 says time is 9
3. The it_value is 15, subtract a clocktick and you get 10.

*boom*

The value of cr16 is < the value of a rolled back clocktick.
In counting the halftick, we need to rollback the halftick in gettimeoffset.

> > What have you got against modulo?
>
> Modulo is a division.
> Division is much more expensive than integer multiplication.
> Is there a way to do the division once _and_ get the remainder?
>
> My assumption that integer multiplication is "cheaper"
> could be wrong.

I timed this for some reasonable values of dividend and divisor.
The division and modulo operation is ~156 cycles.
The integer multiplication is ~73 cycles.
This is the average cr16 tick over 1000 runs.
The integer multiplication is "cheaper"

> >  The correct math is as follows.
> >
> > remainder = now - next_tick - ticks_elapsed * clocktick;
>
> Erm, no.  ticks_elapsed was calculated here:
>         ticks_elapsed = (now - next_tick) / clocktick;
>
> (the line above.)
> I'm taking advantage of truncation since this is integer division.
> That make more sense?

Let us do some math.

You say the following equations are correct:

ticks_elapsed = (now - next_tick) / clocktick;
remainder = now - (ticks_elapsed * clocktick);

The ticks_elapsed equation *is* correct.

The remainder equation is wrong. The value of "now" could be 4GB, the
value of "next_tick" could be "4GB - clocktick", the ticks_elapsed
value is 1. This is correct. However, the remainder is going to be
"4GB - 1 * clocktick" which is incorrect. The remainder in this case
is zero.

To get the remainder you *must* do:

remainder = (now - next_tick) - (ticks_elapsed * clocktick)

This gives you the left over ticks you didn't count. I have added
brackets here to clarify the math.

> > >+               /* "now" is either early or cr16 wrapped.  */
> > >+               if (~next_tick < clocktick) {
> >
> > Too clever for me :)
>
> Now I'm worried. :)
> I've already removed this code in the version I'm working on now.

I was only joking here, but a comment is absolutely required when you
use clever 1's compliment tricks to approximate more compilcated
mathematics. Including a comment saying that it's 1 off.

> > Somwhere in thie function we need to makeup for the halftick...
>
> Hrm. I need to think more about that. You might be right.

I have come to the conclusion that adding the halftick is conceptually wrong.

Follow me on this.

1. By adding the halftick, as a real tick, the system time moves into
the future.
2. A system with future time means we need negative gettimeoffset adjustments.
3. Negative gettimeoffset adjustment complicate things needlessly.
4. Halfticks should not be counted, and should be ignored.
5. Ignoring halfticks is not a problem, when the late timer interrupt
arrives we will accrue all full ticks anyway.

What do you think?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
