From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sat, 20 Dec 2008 12:07:00 -0500 (EST)
Message-ID: <20081220170701.1B1DF4EE7@hiauly1.hia.nrc.ca>
References: <20081219233435.GA25457@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@infradead.org, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081219233435.GA25457@bombadil.infradead.org> from "Kyle McMartin" at Dec 19, 2008 06:34:35 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>  	case 27: 
>  		/* Data memory protection ID trap */
> +#define HANDLE_KERNEL_PROTECTION_TRAPS
> +#ifdef HANDLE_KERNEL_PROTECTION_TRAPS
> +		/* XXX very very evil */
> +		if (code == 27 && !user_mode(regs)) {

Should a check be added for regs->sr[3] != (unsigned long)current->mm.context?

> +			/* bang the spaceid back into sr3 */
> +			regs->sr[3] = (unsigned long)current->mm.context;

I seem to recall that James thought there was a problem with sr3 handling
a year or two ago.

> +			/* TODO? reprogram %cr8? load_context will get it. */
> +			/* TODO? thread_struct.faulted count to catch
> +			 *  taking the same fault on the same insn again?

Is this a general problem with parisc exception support?  The reason
I ask is it seems possible for an infinite loop to occur when an application
catches exceptions like bash.  It catches terminating signals so that it
can write the history file.  When terminate_immediately is zero, the
signal handler (termsig_sighandler) just records the terminating signal
and returns.  It doesn't reset the default handler for the signal or
specify SA_RESETHAND as far as I can tell.

It then appears the kernel restarts the application at the point of the
exception generating another exception.  This causes the kernel log files
to fill in short order.

I would say bash's behavior in trying to continue after a SEGV is questionable
but I also think the kernel shouldn't retry a faulting instruction unless
there's a chance the fault has been fixed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
