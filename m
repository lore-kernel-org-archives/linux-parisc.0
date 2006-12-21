From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [RFC] [PATCH] fix gettimeofday() on parisc to be
	monotonic
Date: Thu, 21 Dec 2006 05:09:09 +0100
Message-ID: <200612210509.09787.deller__47972.40449484$1416624238$gmane$org@gmx.de>
References: <200612210450.55640.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612210450.55640.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Sorry.... idea is correct (I think), but patch is wrong. 
kernel/timer.c still uses "u64" in my patch. It's easy to mix up "cycle_t" and "cycles_t".

Still needs more testing...

Helge

On Thu Dec 21 2006, Helge Deller wrote:
> I would like to get your feedback on the attached patch.
> 
> While testing the Linux Test Project gettimeofday02 testcase, I found that our gettimeofday() implementation is not monotonic.
> I know there was much work on gettimeofday() a few monthes back, but still we have problems.
> Just try this stripped-down testcase yourself:
> 
> /*
>  *      based on gettimeofday02.c  from LTP
>  * DESCRIPTION
>  *      Check if gettimeofday is monotonous
>  *
>  * ALGORITHM
>  *      Call gettimeofday() to get a t1 (fist value)
>  *      call it again to get t2, see if t2 < t1, set t2 = t1, repeat 
>  */
> 
> #include <stdio.h>
> #include <sys/time.h>
> 
> int main(int ac, char **av)
> {
>         struct timeval tv1,tv2;
> 
>         fprintf(stderr, "Start of test....\n");
>         gettimeofday(&tv1,NULL);
>         while (1) {
>                 gettimeofday(&tv2,NULL);
>                 if (    (tv2.tv_usec < tv1.tv_usec) &&
>                         (tv2.tv_sec <= tv1.tv_sec)
>                         ) {
>                         fprintf(stderr,"Time is going backwards (old %d.%d vs new %d.%d!)\n",tv1.tv_sec,tv1.tv_usec,tv2.tv_sec,tv2.tv_usec);
>                         return(1);
>                 }
>                 tv1=tv2;
>         }
>         return 0;
> }
> 
> 
> The patch below fixes this nicely for PARISC-Linux, while it removes our own implementation and uses the existing CONFIG_TIME_INTERPOLATION framework.
> AFAICS up to now it's only used by IA64 and SPARC64.
> 
> The things where I wanted to get your feedback on is, that on a 32bit HPPA Kernel we don't allow cmpxchg() with a 8-byte variable, which is used in the generic code in kernel/timer.c line 1674.
> To make my implementation work, I changed some "u64" variables/struct members in the "struct time_interpolator" in include/linux/timex.h  to "cycles_t" instead.
> "cycles_t" is defined in include/asm/timex.h mostly as "unsigned long", which is what the default platform width is (e.g. 64bit on 64bit platforms) and get_cycles() is exactly the input-value for the time interpolation framework.
> As such I think it just makes sense to use this type as well all over the code.
> For PARISC this chage gives 8bytes on HPPA64 and 4bytes on HPPA32, and so we can use the current implementation with the cmpxchg() in kernel/timer.c.
> 
> What do you think ?
> Will this be acceptable by Linus/others ?
> It works on my 32bit hppa.
> 
> Patch is here:
> 
> diffstat:
>  arch/parisc/Kconfig       |    4 +
>  arch/parisc/kernel/time.c |  151 ++++++++++------------------------------------
>  include/linux/timex.h     |    8 +-
>  kernel/timer.c            |   10 +--
>  4 files changed, 47 insertions(+), 126 deletions(-)
> 
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 848a67a..e85c931 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -50,6 +50,10 @@ config GENERIC_CALIBRATE_DELAY
>  	bool
>  	default y
>  
> +config TIME_INTERPOLATION
> +	bool
> +	default y
> +
>  config TIME_LOW_RES
>  	bool
>  	depends on SMP
> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
> index bad7d1e..56a246b 100644
> --- a/arch/parisc/kernel/time.c
> +++ b/arch/parisc/kernel/time.c
> @@ -34,6 +34,27 @@
>  
>  static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
>  
> +static struct time_interpolator mfctl16_interpolator = {
> +	.shift = 16,
> +	.mask = 0UL-1,
> +	.source = TIME_SOURCE_CPU
> +};
> +
> +
> +static int nojitter;
> +
> +static int __init nojitter_setup(char *str)
> +{
> +	nojitter = 1;
> +	printk("Jitter checking for ctl16 timers disabled\n");
> +	return 1;
> +}
> +
> +__setup("nojitter", nojitter_setup);
> +
> +
> +
> +
>  /*
>   * We keep time on PA-RISC Linux by using the Interval Timer which is
>   * a pair of registers; one is read-only and one is write-only; both
> @@ -172,121 +193,6 @@ unsigned long profile_pc(struct pt_regs 
>  EXPORT_SYMBOL(profile_pc);
>  
>  
> -/*
> - * Return the number of micro-seconds that elapsed since the last
> - * update to wall time (aka xtime).  The xtime_lock
> - * must be at least read-locked when calling this routine.
> - */
> -static inline unsigned long gettimeoffset (void)
> -{
> -#ifndef CONFIG_SMP
> -	/*
> -	 * FIXME: This won't work on smp because jiffies are updated by cpu 0.
> -	 *    Once parisc-linux learns the cr16 difference between processors,
> -	 *    this could be made to work.
> -	 */
> -	unsigned long now;
> -	unsigned long prev_tick;
> -	unsigned long next_tick;
> -	unsigned long elapsed_cycles;
> -	unsigned long usec;
> -	unsigned long cpuid = smp_processor_id();
> -	unsigned long cpt = clocktick;
> -
> -	next_tick = cpu_data[cpuid].it_value;
> -	now = mfctl(16);	/* Read the hardware interval timer.  */
> -
> -	prev_tick = next_tick - cpt;
> -
> -	/* Assume Scenario 1: "now" is later than prev_tick.  */
> -	elapsed_cycles = now - prev_tick;
> -
> -/* aproximate HZ with shifts. Intended math is "(elapsed/clocktick) > HZ" */
> -#if HZ == 1000
> -	if (elapsed_cycles > (cpt << 10) )
> -#elif HZ == 250
> -	if (elapsed_cycles > (cpt << 8) )
> -#elif HZ == 100
> -	if (elapsed_cycles > (cpt << 7) )
> -#else
> -#warn WTF is HZ set to anyway?
> -	if (elapsed_cycles > (HZ * cpt) )
> -#endif
> -	{
> -		/* Scenario 3: clock ticks are missing. */
> -		printk (KERN_CRIT "gettimeoffset(CPU %ld): missing %ld ticks!"
> -			" cycles %lX prev/now/next %lX/%lX/%lX  clock %lX\n",
> -			cpuid, elapsed_cycles / cpt,
> -			elapsed_cycles, prev_tick, now, next_tick, cpt);
> -	}
> -
> -	/* FIXME: Can we improve the precision? Not with PAGE0. */
> -	usec = (elapsed_cycles * 10000) / PAGE0->mem_10msec;
> -	return usec;
> -#else
> -	return 0;
> -#endif
> -}
> -
> -void
> -do_gettimeofday (struct timeval *tv)
> -{
> -	unsigned long flags, seq, usec, sec;
> -
> -	/* Hold xtime_lock and adjust timeval.  */
> -	do {
> -		seq = read_seqbegin_irqsave(&xtime_lock, flags);
> -		usec = gettimeoffset();
> -		sec = xtime.tv_sec;
> -		usec += (xtime.tv_nsec / 1000);
> -	} while (read_seqretry_irqrestore(&xtime_lock, seq, flags));
> -
> -	/* Move adjusted usec's into sec's.  */
> -	while (usec >= USEC_PER_SEC) {
> -		usec -= USEC_PER_SEC;
> -		++sec;
> -	}
> -
> -	/* Return adjusted result.  */
> -	tv->tv_sec = sec;
> -	tv->tv_usec = usec;
> -}
> -
> -EXPORT_SYMBOL(do_gettimeofday);
> -
> -int
> -do_settimeofday (struct timespec *tv)
> -{
> -	time_t wtm_sec, sec = tv->tv_sec;
> -	long wtm_nsec, nsec = tv->tv_nsec;
> -
> -	if ((unsigned long)tv->tv_nsec >= NSEC_PER_SEC)
> -		return -EINVAL;
> -
> -	write_seqlock_irq(&xtime_lock);
> -	{
> -		/*
> -		 * This is revolting. We need to set "xtime"
> -		 * correctly. However, the value in this location is
> -		 * the value at the most recent update of wall time.
> -		 * Discover what correction gettimeofday would have
> -		 * done, and then undo it!
> -		 */
> -		nsec -= gettimeoffset() * 1000;
> -
> -		wtm_sec  = wall_to_monotonic.tv_sec + (xtime.tv_sec - sec);
> -		wtm_nsec = wall_to_monotonic.tv_nsec + (xtime.tv_nsec - nsec);
> -
> -		set_normalized_timespec(&xtime, sec, nsec);
> -		set_normalized_timespec(&wall_to_monotonic, wtm_sec, wtm_nsec);
> -
> -		ntp_clear();
> -	}
> -	write_sequnlock_irq(&xtime_lock);
> -	clock_was_set();
> -	return 0;
> -}
> -EXPORT_SYMBOL(do_settimeofday);
>  
>  /*
>   * XXX: We can do better than this.
> @@ -323,13 +229,24 @@ void __init time_init(void)
>  		write_seqlock_irqsave(&xtime_lock, flags);
>  		xtime.tv_sec = tod_data.tod_sec;
>  		xtime.tv_nsec = tod_data.tod_usec * 1000;
> -		set_normalized_timespec(&wall_to_monotonic,
> -		                        -xtime.tv_sec, -xtime.tv_nsec);
>  		write_sequnlock_irqrestore(&xtime_lock, flags);
>  	} else {
>  		printk(KERN_ERR "Error reading tod clock\n");
>  	        xtime.tv_sec = 0;
>  		xtime.tv_nsec = 0;
>  	}
> +
> +	mfctl16_interpolator.frequency = 100 * PAGE0->mem_10msec;
> +	mfctl16_interpolator.drift = -1;
> +#ifdef CONFIG_SMP
> +	if (!nojitter) mfctl16_interpolator.jitter = 1;
> +#endif
> +	register_time_interpolator(&mfctl16_interpolator);
> +
> +	/*
> +	 * Initialize wall_to_monotonic such that adding it to xtime will yield zero, the
> +	 * tv_nsec field must be normalized (i.e., 0 <= nsec < NSEC_PER_SEC).
> +	 */
> +	set_normalized_timespec(&wall_to_monotonic, -xtime.tv_sec, -xtime.tv_nsec);
>  }
>  
> diff --git a/include/linux/timex.h b/include/linux/timex.h
> index db501dc..deb4369 100644
> --- a/include/linux/timex.h
> +++ b/include/linux/timex.h
> @@ -255,11 +255,11 @@ struct time_interpolator {
>  	u8 jitter;			/* if set compensate for fluctuations */
>  	u32 nsec_per_cyc;		/* set by register_time_interpolator() */
>  	void *addr;			/* address of counter or function */
> -	u64 mask;			/* mask the valid bits of the counter */
> +	cycles_t mask;			/* mask the valid bits of the counter */
>  	unsigned long offset;		/* nsec offset at last update of interpolator */
> -	u64 last_counter;		/* counter value in units of the counter at last update */
> -	u64 last_cycle;			/* Last timer value if TIME_SOURCE_JITTER is set */
> -	u64 frequency;			/* frequency in counts/second */
> +	cycles_t last_counter;		/* counter value in units of the counter at last update */
> +	cycles_t last_cycle;		/* Last timer value if TIME_SOURCE_JITTER is set */
> +	cycles_t frequency;		/* frequency in counts/second */
>  	long drift;			/* drift in parts-per-million (or -1) */
>  	unsigned long skips;		/* skips forward */
>  	unsigned long ns_skipped;	/* nanoseconds skipped */
> diff --git a/kernel/timer.c b/kernel/timer.c
> index feddf81..08242f8 100644
> --- a/kernel/timer.c
> +++ b/kernel/timer.c
> @@ -1625,7 +1625,7 @@ struct time_interpolator *time_interpola
>  static struct time_interpolator *time_interpolator_list __read_mostly;
>  static DEFINE_SPINLOCK(time_interpolator_lock);
>  
> -static inline u64 time_interpolator_get_cycles(unsigned int src)
> +static inline cycle_t time_interpolator_get_cycles(unsigned int src)
>  {
>  	unsigned long (*x)(void);
>  
> @@ -1645,14 +1645,14 @@ static inline u64 time_interpolator_get_
>  	}
>  }
>  
> -static inline u64 time_interpolator_get_counter(int writelock)
> +static inline cycle_t time_interpolator_get_counter(int writelock)
>  {
>  	unsigned int src = time_interpolator->source;
>  
>  	if (time_interpolator->jitter)
>  	{
> -		u64 lcycle;
> -		u64 now;
> +		cycle_t lcycle;
> +		cycle_t now;
>  
>  		do {
>  			lcycle = time_interpolator->last_cycle;
> @@ -1701,7 +1701,7 @@ unsigned long time_interpolator_get_offs
>  
>  void time_interpolator_update(long delta_nsec)
>  {
> -	u64 counter;
> +	cycle_t counter;
>  	unsigned long offset;
>  
>  	/* If there is no time interpolator set up then do nothing */
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
