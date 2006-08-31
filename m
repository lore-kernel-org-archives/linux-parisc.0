From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Thu, 31 Aug 2006 15:46:50 -0600
Message-ID: <20060831214650.GC16032@colo.lackof.org>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 31, 2006 at 02:52:44PM -0400, Carlos O'Donell wrote:
...
> >> 2. No attempt is made to handle cr16 wrapping.
> >
> >The signed math was supposed to handle it.
> >I believe it did but forgot details since looking at
> >it a few years ago.
> 
> That is *even* worse, signed arithmetic overflow is compiler
> implementation dependant. It's also therefore not very nice C code.
> The overflow case is in the middle of the 32-bit range now, where you
> had a very large positive number which wraps to a very large negative
> number. The gap is almost the entire 32-bit range, or 27 seconds on a
> 160Mhz box as we have shown already.

I think it's arbitrary where the overflow occurs.
Maybe unsigned math overflow is easier to visualize/understand.
At least it is for me.

> >I personally prefer to NOT use signed math in this case.
> >But that's honestly not a great reason to change this code.
> >I'd really prefer some evidence the kernel code is wrong.
> 
> I agree, this patch was an attempt to provide an alternate
> implementation that made sense and was maintainer friendly. I believe
> we should be able to get this working better and handle the failures
> seen on the slower boxes.

Yes. I'm now pretty sure the fix for that will be in gettimeoffset()
and not in timer_interrupt(). But I agree the two functions are very
similar but have to handle slightly different corner cases.

> >13.065388 sec
> >30 Aug 23:52:04 ntpdate[14055]: step time server 195.234.188.26 offset 
> >11.578574 sec
> >30 Aug 23:52:31 ntpdate[14058]: step time server 203.217.30.156 offset 
> >13.954358 sec
> >...
> 
> Technically it is implementation dependant, and can be as low as 1/2
> the peak instruction rate. In correcting timer_interrupt, I remember
> removing what I thought was a spurious 'clocktick' addition in the
> implementation.

I was thinking the opposite: I'm missing a "tick_elapsed" count
on each timer interrupt.

>  Does cr16 *actuall* count at the instruction rate, or
> does it count at 1/2 rate?

I _believe_ all implementations count at the actual rate.
At least I'm not aware of any implementations that don't
count at the advertized clock speed.

...
> I think the detection of Scenario 3 is wrong in your patch, I'll
> epxlain further down in the code.
...

> 
> >...
> >> I assert that 'gettimeoffset' should never return a negative value. It
> >> represents the postive adjustment accounting for the fact that we are
> >> *part* of the way through a tick.
> >
> >I have to think about this more. But I wonder if how "halftick" is
> >handled in timer_interrupt does not play well with this concept.
> 
> There is a bug here because of this, you are right to be warry of the
> halftick adjustment. It is also needed in gettimeoffset, or "now" will
> appear before "next_tick" without wrapping.

Sorry - this didn't make sense. Can you provide an example?
For simplicity assume a 5 bit counter and pick the values
that illustrate your case.


> >Please review and see if I added any new bugs.
> 
> There is 1 addtional bug.
...
> >+       /* Determine how much time elapsed.  */
> >+       if (now > next_tick) {
> >+               /* Scenario 1: "now" is late. A bit late is normal. */
> >+               ticks_elapsed = (now - next_tick) / clocktick;
> >+               remainder = now - (ticks_elapsed * clocktick);
> 
> What have you got against modulo?

Modulo is a division.
Division is much more expensive than integer multiplication.
Is there a way to do the division once _and_ get the remainder?

My assumption that integer multiplication is "cheaper"
could be wrong.

>  The correct math is as follows.
> 
> remainder = now - next_tick - ticks_elapsed * clocktick;

Erm, no.  ticks_elapsed was calculated here:
	ticks_elapsed = (now - next_tick) / clocktick;

(the line above.)
I'm taking advantage of truncation since this is integer division.
That make more sense?

> >+               /* "now" is either early or cr16 wrapped.  */
> >+               if (~next_tick < clocktick) {
> 
> Too clever for me :)

Now I'm worried. :)
I've already removed this code in the version I'm working on now.

...
> >+       } else {
> >+               /* "now" is either early or cr16 wrapped.  */
> >+               if (next_next_tick < last_tick) {
> 
> This could also use your clever "~next_tick < clocktick" trick.
> Remember this is only a heuristic to catch wrapping.

Yup - I'll post a new version that boots 64-bit correctly in a bit.
I've still not got the "wrapping" rules correct.

...
> Somwhere in thie function we need to makeup for the halftick...

Hrm. I need to think more about that. You might be right.

> Joel has already seen a BUG, which IMO is caused by gettimeoffset not
> taking into account the halftick.

ok. I was just looking at that.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
