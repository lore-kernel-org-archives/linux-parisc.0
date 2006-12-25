From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [RFC] [PATCH] fix gettimeofday() on parisc to be monotonic
Date: Mon, 25 Dec 2006 15:40:05 -0700
Message-ID: <20061225224005.GA14136__14450.8289093666$1416624240$gmane$org@colo.lackof.org>
References: <200612210450.55640.deller@gmx.de> <200612210509.09787.deller@gmx.de> <200612211005.04078.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200612211005.04078.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 21, 2006 at 10:05:03AM +0100, Helge Deller wrote:
...
> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
> index bad7d1e..896057f 100644
> --- a/arch/parisc/kernel/time.c
> +++ b/arch/parisc/kernel/time.c
> @@ -34,6 +34,27 @@
>  
>  static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
>  
> +static struct time_interpolator mfctl16_interpolator = {
> +	.shift = 16,
> +	.mask = 0UL-1,

My preference is to use "~OUL" since it's unsigned.
The "0-1" doesn't make sense for unsigned even though most people
will know what it does.

> +	.source = TIME_SOURCE_CPU
> +};
...

> --- a/kernel/timer.c
> +++ b/kernel/timer.c
> @@ -1625,7 +1625,7 @@ struct time_interpolator *time_interpola
>  static struct time_interpolator *time_interpolator_list __read_mostly;
>  static DEFINE_SPINLOCK(time_interpolator_lock);
>  
> -static inline u64 time_interpolator_get_cycles(unsigned int src)
> +static inline cycles_t time_interpolator_get_cycles(unsigned int src)
>  {
>  	unsigned long (*x)(void);
>  
> @@ -1652,7 +1652,7 @@ static inline u64 time_interpolator_get_
>  	if (time_interpolator->jitter)
>  	{
>  		u64 lcycle;
> -		u64 now;
> +		cycles_t now;
>  
>  		do {
>  			lcycle = time_interpolator->last_cycle;

Too bad lcycle and time_interpolator_get_count also don't use cycles_t.

Still looking at the code though.

thanks,
grant
