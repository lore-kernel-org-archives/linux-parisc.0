From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Thu, 24 Mar 2005 23:25:17 -0700
Message-ID: <20050325062517.GH29361@colo.lackof.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<1111694714.5519.28.camel@mulgrave>
	<200503242100.06699.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503242100.06699.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 24, 2005 at 09:00:05PM +0000, David Pye wrote:
...
> +	for (i=0; i<4; ++i) 
> +	{
> +		if ((leds & mask[i]) != (lastleds & mask[i])) 
> +		{
> +			gsc_writeb( blockp[i]->command, LCD_CMD_REG );
> +			msleep(msec_cmd_delay);
> +			
> +			gsc_writeb( leds & mask[i] ? blockp[i]->on : 
> +					blockp[i]->off, LCD_DATA_REG );
> +			msleep(msec_cmd_delay);
> +		}
>  	}
> +	lastleds = leds;

I still *really* like this bit. Good work!

> -   ** updates the chassis LCD/LED 
> +   ** is scheduled every 5 milliseconds and updates the chassis LCD/LED 
...
> -#define NORMALIZED_COUNT(count) (count/(HZ/100))
> +#define LED_MINIMUM_ON_TIME (HZ*10/100)

Why not just update every 10ms and ditch all the "minimum on time" stuff?
Can someone tell if an LED/LCD came on 5ms later than it should have been?

> +	static unsigned long diskio_on_jiffies;
> +	static unsigned long lantx_on_jiffies;
> +	static unsigned long lanrcv_on_jiffies;

If not, then this bit and...

> +	/* If the leds are on, but should be turned off, make sure they have been on for
> +	 * the minimum time, to prevent 'flutter' 
> +	 */

...and...

> +		else if (lastleds & LED_LAN_TX && time_before(jiffies, lantx_on_jiffies + LED_MINIMUM_ON_TIME))
> +		{
> +			currentleds |= LED_LAN_TX;
> +		}

can go away. Ditto for DiskIO.

We already know heartbeat stays on/off longer than that (about).

>  	/* blink all LEDs twice a second if we got an Oops (HPMC) */
> -	if (oops_in_progress) {
> +	if (oops_in_progress) 
> +	{
>  		currentleds = (count_HZ<=(HZ/2)) ? 0 : 0xff;
>  	}

Will this work for LCD?
Will the itimer continue to run and workq continue to get serviced?
Even if it does, I'm nervous about it.
Maybe stop all activity at that point?

The panic chassis log will get printed and that should be a good indicator.
Anyway, this is a seperate issue from the rest of the patch.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
