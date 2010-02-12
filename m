From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] parisc: fix tracing of signals
Date: Fri, 12 Feb 2010 08:21:33 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1002120816100.7792@localhost.localdomain>
References: <20100212155306.GI24051@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org, roland@redhat.com,
	"David S. Miller" <davem@davemloft.net>,
	Paul Mundt <lethal@linux-sh.org>, linux-arch@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20100212155306.GI24051@bombadil.infradead.org>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Fri, 12 Feb 2010, Kyle McMartin wrote:
> 
> Mike Frysinger pointed out that calling tracehook_signal_handler with
> stepping=0 missed testing the thread flags, resulting in not calling
> ptrace_notify. Fix this by testing if we're single stepping or branch
> stepping and setting the flag accordingly.
> 
> Tested, seems to work.

Hmm. All other architectures either pass in zero, or test TIF_SINGLESTEP. 

I guess TIF_BLOCKSTEP is a parisc addition, so now parisc matches x86 and 
power etc, but it still makes me wonder about all those other 
architectures that pass in zero.

For the curious, that seems to be at least sparc and 64-bit (but not 
32-bit) sh.

David? Paul?

		Linus

---
> Reported-by: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
> ---
>  arch/parisc/kernel/signal.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index e8467e4..07b3dac 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -469,7 +469,9 @@ handle_signal(unsigned long sig, siginfo_t *info, struct k_sigaction *ka,
>  	recalc_sigpending();
>  	spin_unlock_irq(&current->sighand->siglock);
>  
> -	tracehook_signal_handler(sig, info, ka, regs, 0);
> +	tracehook_signal_handler(sig, info, ka, regs, 
> +		test_thread_flag(TIF_SINGLESTEP) ||
> +		test_thread_flag(TIF_BLOCKSTEP));
>  
>  	return 1;
>  }
> -- 
> 1.6.6
> 
