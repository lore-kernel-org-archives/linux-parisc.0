From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] PA-RISC: panic immediately when panic_on_oops
Date: Wed, 9 Mar 2016 22:03:36 +0100
Message-ID: <56E08FA8.8050500@gmx.de>
References: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
 <1457554123-18491-3-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Ralf Baechle <ralf@linux-mips.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-mips@linux-mips.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1457554123-18491-3-git-send-email-aaro.koskinen@iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09.03.2016 21:08, Aaro Koskinen wrote:
> PA-RISC wants to sleep 5 seconds before panicking when panic_on_oops
> is set, with no apparent reason. 

That's not completely true.
A few years back, when we had lots of crashes, it was very useful to at least
have some time to see the crash before the oops was cleaned from the screen.
Today the parisc port is really stable.

> Remove this feature, since some users
> may want their systems to fail as quickly as possible.
> 
> Users who want to delay reboot after panic can use PANIC_TIMEOUT.

That's OK.

> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: Helge Deller <deller@gmx.de>


> ---
>  arch/parisc/kernel/traps.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 553b098..16e0735 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -284,11 +284,8 @@ void die_if_kernel(char *str, struct pt_regs *regs, long err)
>  	if (in_interrupt())
>  		panic("Fatal exception in interrupt");
>  
> -	if (panic_on_oops) {
> -		printk(KERN_EMERG "Fatal exception: panic in 5 seconds\n");
> -		ssleep(5);
> +	if (panic_on_oops)
>  		panic("Fatal exception");
> -	}
>  
>  	oops_exit();
>  	do_exit(SIGSEGV);
> 

