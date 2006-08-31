From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Thu, 31 Aug 2006 14:52:44 -0400
Message-ID: <119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: willy@debian.org,
 James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831065327.GG3999@colo.lackof.org>
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
> > 1. cr16 is treated as signed.
>
> This was by design. Paul Bame (IIRC) wrote this code and
> while I was never that comfortable with it, I could never
> find anything wrong with it either. Randolph Chung and I
> stared at timer_interrupt() _alot_.

It's twice as smart as I am, therefore I am four times too dumb to
maintain this code. My aim was ti simplify this code, because when the
new timer infrastructure goes into place it will be crucial that we
handle the wrapping right.

> > 2. No attempt is made to handle cr16 wrapping.
>
> The signed math was supposed to handle it.
> I believe it did but forgot details since looking at
> it a few years ago.

That is *even* worse, signed arithmetic overflow is compiler
implementation dependant. It's also therefore not very nice C code.
The overflow case is in the middle of the 32-bit range now, where you
had a very large positive number which wraps to a very large negative
number. The gap is almost the entire 32-bit range, or 27 seconds on a
160Mhz box as we have shown already.

> I personally prefer to NOT use signed math in this case.
> But that's honestly not a great reason to change this code.
> I'd really prefer some evidence the kernel code is wrong.

I agree, this patch was an attempt to provide an alternate
implementation that made sense and was maintainer friendly. I believe
we should be able to get this working better and handle the failures
seen on the slower boxes.

> And I've hacked your version some more.
> diff is below.

Thanks.

> I've included your changes to gettimeoffset() in my patch below
> and will review those next.

Ok.

> And something is certainly wrong with my version of the code.
> It seems to be running the system clock at ~ 1/2 speed now. :)
>
> odine:~# while : ; do sleep 10 ; ntpdate pool.ntp.org ; done
> 30 Aug 23:51:13 ntpdate[14051]: step time server 203.217.30.156 offset 60.165510 sec
> 30 Aug 23:51:39 ntpdate[14053]: step time server 203.217.30.156 offset 13.065388 sec
> 30 Aug 23:52:04 ntpdate[14055]: step time server 195.234.188.26 offset 11.578574 sec
> 30 Aug 23:52:31 ntpdate[14058]: step time server 203.217.30.156 offset 13.954358 sec
> ...

Technically it is implementation dependant, and can be as low as 1/2
the peak instruction rate. In correcting timer_interrupt, I remember
removing what I thought was a spurious 'clocktick' addition in the
implementation. Does cr16 *actuall* count at the instruction rate, or
does it count at 1/2 rate?

> > A. cr16 is treated as an unsigned long.
> > B. The following 3 scenarios exist.
> >
> > 1. The timer interrupt fires, and 'now' comes after 'next_tick'
>
> This is the "normal" case I think. 'now' should always lag behind
> 'next_tick' and how much depends on how long interrupts are blocked
> on that CPU.

Sounds good.

> > 2. The timer interrupt fires, and 'now' has wrapped and is before
> > 'next_tick'
> > 3. The timer interrupt fires, and 'now' is *just* before 'next_tick'
> >
> > In theory 99% of the time we should be in scenario 1. On occasion we
> > may miss a timer interrupt, end up close to wrapping, and we get
> > scenario 2.
>
> I'll assert we don't need to miss a timer interrupt to hit Scenario 2.
> All we need is a timer interrupt that scheduled near 4GB (but below)
> and 'normal' lag in interrupt delivery/handling will allow the
> CR16 to wrap.

A timer interrupt that is scheduled near the 4GB boundary is what I
meant by "end up close to wrapping." You are right that interrupt
delivery/handling lag might mean cr16 would wrap without causing a
missed interrupt.

> > Scenario 3 is just plain wrong and for now I will BUG() if
> > the timer fires before we intended.
>
> I agree.

I think the detection of Scenario 3 is wrong in your patch, I'll
epxlain further down in the code.

> ...
> > I assert that 'gettimeoffset' should never return a negative value. It
> > represents the postive adjustment accounting for the fact that we are
> > *part* of the way through a tick.
>
> I have to think about this more. But I wonder if how "halftick" is
> handled in timer_interrupt does not play well with this concept.

There is a bug here because of this, you are right to be warry of the
halftick adjustment. It is also needed in gettimeoffset, or "now" will
appear before "next_tick" without wrapping.

> Please review and see if I added any new bugs.

There is 1 addtional bug.

> Note that I replaced the "~0UL - XXX" with "~ XXX".
> I'll be off by one cycle. I don't care.
>
> thanks,
> grant
>
>
> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
> index 5facc9b..9f6cf58 100644
> --- a/arch/parisc/kernel/time.c
> +++ b/arch/parisc/kernel/time.c
> @@ -44,34 +44,58 @@ #endif
>
>  irqreturn_t timer_interrupt(int irq, void *dev_id, struct pt_regs *regs)
>  {
> -       long now;
> -       long next_tick;
> -       int nticks;
> +       unsigned long now;
> +       unsigned long next_tick;
> +        unsigned long remainder;
> +       unsigned long ticks_elapsed = 0;
>         int cpu = smp_processor_id();
>
>         profile_tick(CPU_PROFILING, regs);
>
> -       now = mfctl(16);
> -       /* initialize next_tick to time at last clocktick */
> +       /* Initialize next_tick to the expected tick time. */
>         next_tick = cpu_data[cpu].it_value;
>
> -       /* since time passes between the interrupt and the mfctl()
> -        * above, it is never true that last_tick + clocktick == now.  If we
> -        * never miss a clocktick, we could set next_tick = last_tick + clocktick
> -        * but maybe we'll miss ticks, hence the loop.
> -        *
> -        * Variables are *signed*.
> +       /* Get current interval timer.
> +        * CR16 reads as 64 or 32 bit value depending CPU wide/narrow mode.
>          */
> +       now = mfctl(16);
> +
> +       /* Determine how much time elapsed.  */
> +       if (now > next_tick) {
> +               /* Scenario 1: "now" is late. A bit late is normal. */
> +               ticks_elapsed = (now - next_tick) / clocktick;
> +               remainder = now - (ticks_elapsed * clocktick);

What have you got against modulo? The correct math is as follows.

remainder = now - next_tick - ticks_elapsed * clocktick;

> +       }
> +        else {
> +               /* "now" is either early or cr16 wrapped.  */
> +               if (~next_tick < clocktick) {

Too clever for me :)

> +                       unsigned long difference;
> +
> +                       /* Scenario 2: A missed clock tick would wrap. */
> +                       difference = ~0UL - (next_tick - now);
> +                       ticks_elapsed = difference / clocktick;
> +                       remainder = difference % clocktick;
> +               } else {
> +                       /* Scenario 3: We didn't miss a clock tick.
> +                          "now" is early?  */
> +                       printk ("timer_interrupt: Now is early, now = %lx, next_tick = %lx, clocktick = %lx\n", now, next_tick, clocktick);
> +                       BUG ();
> +               }
> +       }
>
> -       nticks = 0;
> -       while((next_tick - now) < halftick) {
> -               next_tick += clocktick;
> -               nticks++;
> +       if (remainder > halftick) {
> +               /* More than 1/2 way into the next tick. It counts.  */
> +               ticks_elapsed++;
>         }
> +
> +       /* Add any full ticks that have elapsed plus the one we want next. */
> +       next_tick += (ticks_elapsed + 1) * clocktick;
> +
> +        /* Only bottom 32-bits of next_tick are written to cr16.  */
>         mtctl(next_tick, 16);
>         cpu_data[cpu].it_value = next_tick;
>
> -       while (nticks--) {
> +       while (ticks_elapsed--) {
>  #ifdef CONFIG_SMP
>                 smp_do_timer(regs);
>  #else
> @@ -124,21 +148,47 @@ #ifndef CONFIG_SMP
>          *    Once parisc-linux learns the cr16 difference between processors,
>          *    this could be made to work.
>          */
> -       long last_tick;
> -       long elapsed_cycles;
> +       unsigned long now;
> +       unsigned long last_tick;
> +       unsigned long next_tick;
> +       unsigned long next_next_tick;
> +       unsigned long elapsed_cycles;
> +       unsigned long usec;
> +       unsigned long lost;
>
>         /* it_value is the intended time of the next tick */
> -       last_tick = cpu_data[smp_processor_id()].it_value;
> +       next_tick = cpu_data[smp_processor_id()].it_value;
> +       next_next_tick = next_tick + clocktick;
>
> -       /* Subtract one tick and account for possible difference between
> -        * when we expected the tick and when it actually arrived.
> -        * (aka wall vs real)
> -        */
> -       last_tick -= clocktick * (jiffies - wall_jiffies + 1);
> -       elapsed_cycles = mfctl(16) - last_tick;
> +       /* This represents lost jiffies.  */
> +       lost = clocktick * (jiffies - wall_jiffies);
> +
> +       /* We roll back 1 tick.  */
> +       last_tick = next_tick - clocktick;
> +
> +       /* Read the hardware interval timer.  */
> +       now = mfctl(16);
> +
> +       if (now > last_tick) {
> +               /* Scenario 1: "now" is later than last_tick.  */
> +               elapsed_cycles = now - last_tick;
> +       } else {
> +               /* "now" is either early or cr16 wrapped.  */
> +               if (next_next_tick < last_tick) {

This could also use your clever "~next_tick < clocktick" trick.
Remember this is only a heuristic to catch wrapping.

> +                       /* Scenario 2: A missed clock tick would wrap. */
> +                       elapsed_cycles = ~0UL - (last_tick - now);
> +               } else {
> +                       /* Scenario 3: We didn't miss a clock tick.
> +                          "now" is early?  */
> +                       printk ("gettimeoffset: Now is early, now = %lx, last_tick = %lx, next_tick = %lx, clocktick = %lx\n", now, last_tick, next_tick, clocktick);
> +                       BUG ();
> +               }
> +       }

Somwhere in thie function we need to makeup for the halftick...

> -       /* the precision of this math could be improved */
> -       return elapsed_cycles / (PAGE0->mem_10msec / 10000);
> +       /* FIXME: Improve precision. */
> +       usec = elapsed_cycles * 10000 / PAGE0->mem_10msec;
> +       usec += lost;
> +       return usec;
>  #else
>         return 0;
>  #endif

Joel has already seen a BUG, which IMO is caused by gettimeoffset not
taking into account the halftick.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
