From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: add LATENCYTOP_SUPPORT and
	CONFIG_STACKTRACE_SUPPORT
Date: Fri, 6 Feb 2009 16:32:24 -0500
Message-ID: <20090206213224.GE9743@bombadil.infradead.org>
References: <498CA29F.10907@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <498CA29F.10907@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 06, 2009 at 09:50:39PM +0100, Helge Deller wrote:
> +#include <asm/unwind.h>
> +
> +static void dump_trace(struct task_struct *task, struct stack_trace *trace)
> +{
> +	struct unwind_frame_info info;
> +
> +	/* initialize unwind info */
> +	if (task == current) {
> +		unsigned long sp;
> +		struct pt_regs r;
> +HERE:
> +		asm volatile ("copy %%r30, %0" : "=r"(sp));
> +		memset(&r, 0, sizeof(struct pt_regs));
> +		r.iaoq[0] = (unsigned long)&&HERE;
> +		r.gr[2] = (unsigned long)__builtin_return_address(0);
> +		r.gr[30] = sp;
> +		unwind_frame_init(&info, task, &r);
> +	} else {
> +		unwind_frame_init_from_blocked_task(&info, task);
> +	}
> +

applied, with a clean up that takes this to a forced inline to share
between here and traps.c.

cheers, Kyle
