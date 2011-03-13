From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sun, 13 Mar 2011 17:58:37 -0600
Message-ID: <20110313235837.GB29986@parisc-linux.org>
References: <20110312170831.GA15698@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110312170831.GA15698@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Mar 12, 2011 at 12:08:32PM -0500, John David Anglin wrote:
> The attached change fixes the "SLOW!" timer_interrupt warning that I
> occassionally see on my rp3440 (800 MHz).  We need to avoid using the
> expensive div/mul method.  I have seen instances where it takes more
> than 0x7000 cycles.

Hi Dave,
Maybe the patch should be for this line of code instead?
        if (unlikely(now2 - now > 0x3000))      /* 12K cycles */

ie increase the value slightly?

TBH, I didn't spend alot of time trying to figure out the optimal balance
between the two cases that the proposed patch attempts to adjust.

Also, if the div/mul takes up to 0x7000 cycles, another alternative
is to make the alternative faster.  What I suggested in the else case:
        /* TODO: Reduce this to one fdiv op */

doesn't seem possible with fdiv in one op. My reading of the fdiv
operator suggests it would need another FMUL and FSUB op in order
to get the remainder. Still might be vary fast.

Looking through PA 2.0 arch book, looks like the PA2.0
"Divide Step" (DS) operation (page 7-46) does what I was thinking of.
But that's going to require a sequence of DS instructions that
I don't quite understand at the moment and thus can't say how
fast the worst case for DS might be.

hth,
grant


> Signed-off-by: John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> 
> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
> index 05511cc..63071c4 100644
> --- a/arch/parisc/kernel/time.c
> +++ b/arch/parisc/kernel/time.c
> @@ -76,7 +76,7 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
>  
>  	cycles_elapsed = now - next_tick;
>  
> -	if ((cycles_elapsed >> 6) < cpt) {
> +	if ((cycles_elapsed >> 7) < cpt) {
>  		/* use "cheap" math (add/subtract) instead
>  		 * of the more expensive div/mul method
>  		 */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
