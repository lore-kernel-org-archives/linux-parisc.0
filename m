From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [RFC][PATCH] Demultiplexing SIGTRAP signal
Date: Mon, 22 Sep 2008 16:54:04 +0200
Message-ID: <20080922145404.GC27956@elte.hu>
References: <200809221602.32616.srinivasa@in.ibm.com> <20080922104202.GE30137@elte.hu> <200809221841.27993.srinivasa@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Roland McGrath <roland@redhat.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, paulus@samba.org,
	linuxppc-dev@ozlabs.org, linux-parisc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>
To: Srinivasa Ds <srinivasa@in.ibm.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809221841.27993.srinivasa@in.ibm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Srinivasa Ds <srinivasa@in.ibm.com> wrote:

> --- linux-2.6.27-rc7.orig/arch/ia64/include/asm/siginfo.h
> +++ linux-2.6.27-rc7/arch/ia64/include/asm/siginfo.h

please do not send patches that modify include/asm/ files, the 
include/asm-x86/ file should be modified instead.

(this problem will go away in v2.6.28 when we'll move include/asm-x86/ 
to arch/x86/include/)

> +	si_code = get_si_code((unsigned long*)&condition);

coding style problem: please run checkpatch.

>  	/* Ok, finally something we can handle */
> -	send_sigtrap(tsk, regs, error_code);
> +	send_sigtrap(tsk, regs, error_code, si_code);

ok, that looks much nicer.

> -	info.si_code = TRAP_BRKPT;
> +	info.si_code = get_si_code(&condition);

no need to pass in the condition by reference.

> +#define TRAP_BRANCH     (__SI_FAULT|3)  /* process taken branch trap */
> +#define TRAP_HWBKPT     (__SI_FAULT|4)  /* hardware breakpoint or watchpoint 
> */

stray linewrapped patch line - see Documentation/email-clients.txt.

> -void send_sigtrap(struct task_struct *tsk, struct pt_regs *regs, int 
> error_code)
> +void send_sigtrap(struct task_struct *tsk, struct pt_regs *regs, int 
> error_code,

linewrap.

> +++ linux-2.6.27-rc7/include/asm-x86/traps.h
> @@ -36,6 +36,16 @@ void do_invalid_op(struct pt_regs *, lon
>  void do_general_protection(struct pt_regs *, long);
>  void do_nmi(struct pt_regs *, long);
>  
> +int get_si_code(unsigned long *condition)
> +{
> +	if (*condition & DR_STEP)
> +		return TRAP_TRACE;

please declare inline functions explicitly as 'static inline'.

	Ingo
