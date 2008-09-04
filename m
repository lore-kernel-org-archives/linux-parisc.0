From: Helge Deller <deller@gmx.de>
Subject: Re: __kernel_suseconds_t is int on PA-RISC (and SPARC64)?
Date: Thu, 04 Sep 2008 23:03:10 +0200
Message-ID: <48C04D0E.8010905@gmx.de>
References: <Pine.LNX.4.64.0808262207450.7910@anakin> <48B46672.1000902@gmx.de> <Pine.LNX.4.64.0809042238090.19113@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org,
	Linux/m68k <linux-m68k@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0809042238090.19113@anakin>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Geert Uytterhoeven wrote:
> On Tue, 26 Aug 2008, Helge Deller wrote:
>> Geert Uytterhoeven wrote:
>>> Apparently __kernel_suseconds_t is `int' on PA-RISC (and on SPARC64),
>>> while it's `long' on all other platforms.
>>>
>>> Is there a specific reason for that?
>> I don't know for sure, but arch/parisc/kernel/syscall_table.S states:
>> /* even though manpage says struct timeval contains longs, ours has
>>  * time_t and suseconds_t -- both of which are safe wide/narrow */
>>    ENTRY_COMP(setitimer)
>>
>> So it was probably chosen to be int so that it can be easily used in 32- and
>> 64bit kernels (or compat code).
>>
>>> This causes compiler warnings in the HP SDC Real Time Clock driver,
>>> which is shared between PA-RISC and m68k:
> 
> Here's a patch to fix the compiler warnings. Is this OK for PA-RISC?
> 
> SUbject: [PATCH] HP input: kill warnings due to suseconds_t differences
> 
> Kill compiler warnings related to printf() formats in the input drivers for
> various HP9000 machines, which are shared between PA-RISC (suseconds_t is int)
> and m68k (suseconds_t is long). As both are 32-bit, it's safe to cast to int.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks Geert.
Tested and OK for PA-RISC.

Acked-by: Helge Deller <deller@gmx.de>


> ---
>  drivers/input/misc/hp_sdc_rtc.c |   10 +++++-----
>  drivers/input/serio/hp_sdc.c    |    2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> --- a/drivers/input/misc/hp_sdc_rtc.c
> +++ b/drivers/input/misc/hp_sdc_rtc.c
> @@ -458,35 +458,35 @@ static int hp_sdc_rtc_proc_output (char 
>  		p += sprintf(p, "i8042 rtc\t: READ FAILED!\n");
>  	} else {
>  		p += sprintf(p, "i8042 rtc\t: %ld.%02d seconds\n", 
> -			     tv.tv_sec, tv.tv_usec/1000);
> +			     tv.tv_sec, (int)tv.tv_usec/1000);
>  	}
>  
>  	if (hp_sdc_rtc_read_fhs(&tv)) {
>  		p += sprintf(p, "handshake\t: READ FAILED!\n");
>  	} else {
>          	p += sprintf(p, "handshake\t: %ld.%02d seconds\n", 
> -			     tv.tv_sec, tv.tv_usec/1000);
> +			     tv.tv_sec, (int)tv.tv_usec/1000);
>  	}
>  
>  	if (hp_sdc_rtc_read_mt(&tv)) {
>  		p += sprintf(p, "alarm\t\t: READ FAILED!\n");
>  	} else {
>  		p += sprintf(p, "alarm\t\t: %ld.%02d seconds\n", 
> -			     tv.tv_sec, tv.tv_usec/1000);
> +			     tv.tv_sec, (int)tv.tv_usec/1000);
>  	}
>  
>  	if (hp_sdc_rtc_read_dt(&tv)) {
>  		p += sprintf(p, "delay\t\t: READ FAILED!\n");
>  	} else {
>  		p += sprintf(p, "delay\t\t: %ld.%02d seconds\n", 
> -			     tv.tv_sec, tv.tv_usec/1000);
> +			     tv.tv_sec, (int)tv.tv_usec/1000);
>  	}
>  
>  	if (hp_sdc_rtc_read_ct(&tv)) {
>  		p += sprintf(p, "periodic\t: READ FAILED!\n");
>  	} else {
>  		p += sprintf(p, "periodic\t: %ld.%02d seconds\n", 
> -			     tv.tv_sec, tv.tv_usec/1000);
> +			     tv.tv_sec, (int)tv.tv_usec/1000);
>  	}
>  
>          p += sprintf(p,
> --- a/drivers/input/serio/hp_sdc.c
> +++ b/drivers/input/serio/hp_sdc.c
> @@ -323,7 +323,7 @@ static void hp_sdc_tasklet(unsigned long
>  			 * it back to the application. and be less verbose.
>  			 */
>  			printk(KERN_WARNING PREFIX "read timeout (%ius)!\n",
> -			       tv.tv_usec - hp_sdc.rtv.tv_usec);
> +			       (int)(tv.tv_usec - hp_sdc.rtv.tv_usec));
>  			curr->idx += hp_sdc.rqty;
>  			hp_sdc.rqty = 0;
>  			tmp = curr->seq[curr->actidx];
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 

