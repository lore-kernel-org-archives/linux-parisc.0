From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: pass through '\t' to early (iodc) console
Date: Mon, 14 Jun 2010 22:08:44 +0200
Message-ID: <4C168C4C.9080706@gmx.de>
References: <20100614160227.GK20317@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100614160227.GK20317@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06/14/2010 06:02 PM, Kyle McMartin wrote:
> The firmware handles '\t' internally, so stop trying to emulate it
> (which, incidentally, had a bug in it.)
> 
> Fixes a really weird hang at bootup in rcu_bootup_announce, which,
> as far as I can tell, is the first printk in the core kernel to use
> a tab as the first character.
> 
> Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

Kernel boots now nicely.
Thanks Kyle!

Tested-by: Helge Deller <deller@gmx.de>


> ---
>  arch/parisc/kernel/firmware.c |   12 ++----------
>  1 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
> index 4c247e0..df971fa 100644
> --- a/arch/parisc/kernel/firmware.c
> +++ b/arch/parisc/kernel/firmware.c
> @@ -1123,7 +1123,6 @@ static char __attribute__((aligned(64))) iodc_dbuf[4096];
>   */
>  int pdc_iodc_print(const unsigned char *str, unsigned count)
>  {
> -	static int posx;        /* for simple TAB-Simulation... */
>  	unsigned int i;
>  	unsigned long flags;
>  
> @@ -1133,19 +1132,12 @@ int pdc_iodc_print(const unsigned char *str, unsigned count)
>  			iodc_dbuf[i+0] = '\r';
>  			iodc_dbuf[i+1] = '\n';
>  			i += 2;
> -			posx = 0;
>  			goto print;
> -		case '\t':
> -			while (posx & 7) {
> -				iodc_dbuf[i] = ' ';
> -				i++, posx++;
> -			}
> -			break;
>  		case '\b':	/* BS */
> -			posx -= 2;
> +			i--; /* overwrite last */
>  		default:
>  			iodc_dbuf[i] = str[i];
> -			i++, posx++;
> +			i++;
>  			break;
>  		}
>  	}

