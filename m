From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LCD patch
Date: Wed, 23 Mar 2005 13:18:31 -0700
Message-ID: <20050323201831.GC10544@colo.lackof.org>
References: <200503231855.10502.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503231855.10502.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 23, 2005 at 06:55:07PM +0000, David Pye wrote:
> It can DEFINITELY be improved further, primarily by increasing the delay 
> between rescheduling the work queue item, so reducing CPU util.  I'll submit 
> a later patch for that pending feedback on this one, which is of course very 
> welcome!

one nit after quickly glancing at it:
> +static int led_wq_created = 0;
> +static struct workqueue_struct *led_wq;

led_wq_created isn't needed. Just test led_wq != NULL.

> +	unsigned long wait_jiffies = (lcd_info.min_cmd_delay / 1000000) * HZ;

Won't this work out to be zero?
ISTR min_cmd_delay was "40" or something like that.

grundler <532>fgrep min_cmd_delay drivers/parisc/led.c
        unsigned int min_cmd_delay;     /* delay in uS after cmd-write (LCD only) */
        .min_cmd_delay =        40,
...

Yeah. You want (lcd_info.min_cmd_delay * 1000000)/HZ and this needs
to be rounded up.

> +	for (i=0; i<4; ++i) {
> +		if ((leds & mask[i]) != (lastleds & mask[i])) {
> +			gsc_writeb( blockp[i]->command, LCD_CMD_REG );
> +			
> +			set_current_state(TASK_UNINTERRUPTIBLE);		
> +			schedule_timeout(wait_jiffies);	
> +
> +			gsc_writeb( leds & mask[i] ? blockp[i]->on : 
> +					blockp[i]->off, LCD_DATA_REG );
> +			
> +			set_current_state(TASK_UNINTERRUPTIBLE);		
> +			schedule_timeout(wait_jiffies);	
> +		}

I like this *alot* better. Very nice.


thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
