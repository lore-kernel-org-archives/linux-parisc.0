From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Remove FIXME comment
Date: Fri, 18 Jul 2014 22:49:36 +0200
Message-ID: <53C98860.2010905@gmx.de>
References: <1405715823-17492-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: tiwai@suse.de, jkosina@suse.cz, joe@perches.com,
	dave.anglin@bell.net, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>, jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1405715823-17492-1-git-send-email-xerofoify@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/18/2014 10:37 PM, Nicholas Krause wrote:
> The comment for size of frame not being needed is incorrect , the
> function called needs this parameter.

Thanks for the patch Nicholas.

It has been queued up:
https://patchwork.kernel.org/patch/4587631/
and
https://patchwork.kernel.org/patch/4486231/

I will apply it at some point, but not yet.
There are other (more important) patches upcoming regarding the 
signal handling,  and I don't want to break those at the moment.

Helge

> 
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  arch/parisc/kernel/signal.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index 1cba8f2..1d550b5 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -240,7 +240,6 @@ setup_rt_frame(int sig, struct k_sigaction *ka, siginfo_t *info,
>  #endif
>  	
>  	usp = (regs->gr[30] & ~(0x01UL));
> -	/*FIXME: frame_size parameter is unused, remove it. */
>  	frame = get_sigframe(ka, usp, sizeof(*frame));
>  
>  	DBG(1,"SETUP_RT_FRAME: START\n");
> 

