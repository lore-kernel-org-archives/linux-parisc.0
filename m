From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 6/7] parisc: add parameter to read_cr16()
Date: Wed, 22 Apr 2009 23:39:26 +0200
Message-ID: <49EF8E8E.10104@gmx.de>
References: <49EF6AAE.5000207@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>
To: coly.li@suse.de, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49EF6AAE.5000207@suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Coly Li wrote:
> This patch modifies parameter of au1x_counter1_read() from 'void' to 'struct
> clocksource *cs', which fixes compile warning for incompatible parameter type.
> 
> Signed-off-by: Coly Li <coly.li@suse.de>
> Cc: Helge Deller <deller@gmx.de>

Patch is good.
Thanks!

Acked-by: Helge Deller <deller@gmx.de>


> Cc: Ingo Molnar <mingo@elte.hu>
> ---
>  arch/parisc/kernel/time.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
> index d4dd056..d97d07f 100644
> --- a/arch/parisc/kernel/time.c
> +++ b/arch/parisc/kernel/time.c
> @@ -173,7 +173,7 @@ EXPORT_SYMBOL(profile_pc);
> 
>  /* clock source code */
> 
> -static cycle_t read_cr16(void)
> +static cycle_t read_cr16(struct clocksource *cs)
>  {
>  	return get_cycles();
>  }
> 

