From: Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] parisc: add CALLER_ADDR{0-6} macros
Date: Tue, 27 Oct 2009 12:49:49 +0800
Message-ID: <4AE67BED.8040705@tausq.org>
References: <20091025214836.GA15038@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091025214836.GA15038@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge,

> +unsigned long return_address(unsigned int level)
> +{
> +	struct unwind_frame_info info;
> +	struct pt_regs r;
> +	unsigned long sp;
> +
> +	/* initialize unwind info */
> +	asm volatile ("copy %%r30, %0" : "=r"(sp));
> +	memset(&r, 0, sizeof(struct pt_regs));
> +	r.iaoq[0] = (unsigned long) current_text_addr();
> +	r.gr[2] = (unsigned long) __builtin_return_address(0);
> +	r.gr[30] = sp;
> +	unwind_frame_init(&info, current, &r);
> +
> +	/* unwind stack */
> +	++level;
> +	do {
> +		if (unwind_once(&info) < 0 || info.ip == 0)
> +			return 0;
> +		if (!__kernel_text_address(info.ip)) {
> +			return 0;
> +		}
> +	} while (info.ip && level--);
> +
> +	return info.ip;
> +}
> +

Can you show an objdump of this function once it is compiled? I suspect 
the stack pointer initialization here is not reliable.

Ideally unwind_frame_init is called with the frame address in gr[30]. 
With a big struct like pt_regs on the stack, the sp initialization might 
be quite far from the actual frame address.

The unwind_once() code uses like heuristics to try to recover from 
inaccurate stack pointers (by aligning and stepping the frame 64 bytes 
at a time) but that is really a brute force guess.

I realize I used a similar construct in traps.c, but even there I think 
it doesn't work reliably.

Maybe somebody else on the list (Dave? :) can suggest a better way to do 
this.

randolph
