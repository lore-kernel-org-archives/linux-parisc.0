From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when	compiling
 ruby1.9
Date: Fri, 19 Dec 2008 23:59:11 +0100
Message-ID: <494C273F.1040200@gmx.de>
References: <4949812D.7080608@gmx.de> <20081219212906.GG8945@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081219212906.GG8945@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> Honestly, I can't decide whether to apply this. It really should never
> happen in the kernel, since the kernel can guarantee it won't get the
> access rights failure (highest privilege level, and can set %sr and
> %protid to whatever it wants.)

Yes, that's the problem.
We catch a bug in the kernel which shouldn't be there (and which we
can't find yet).
If it wouldn't be there, we wouldn't need this patch..
Chicken and egg problem.

> It really genuinely is a bug that probably should panic the kernel. The
> only precedent I can easily see is x86 fixing up a bad iret with a
> general protection fault, which is more or less analogous to code 27
> here.
> 
> On the other hand, taking the exception on a userspace access really
> isn't all that critical, and there's fundamentally little reason for the
> kernel not to SIGSEGV the process, and continue...
> 
> Argh.

Argh. Argh :-)


> (btw, I've instrumented my do_sys_poll with a pile of assertions that
>  %cr8 << 1 == %sr3 == current->mm.context... let's see if where we're
>  getting corrupted is deterministic, though, I would guess that it won't
>  be.)

I'll continue to debug as well. I have some more ideas left to try...

Thanks for cleaning up my patch and splitting out the fixup_exception()
code.
Your patch is fine and I think you should apply it (with one minor
addition - see below).
The reason I think why you should apply it is, that we shouldn't let the
kernel crash on (correct) userspace apps.
Maybe adding a comment that this check in trap #27 should be removed
when the bug is fixed would be good though.

> diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
> index 4878b95..1c6dbb6 100644
> --- a/arch/parisc/include/asm/uaccess.h
> +++ b/arch/parisc/include/asm/uaccess.h
> @@ -745,6 +745,10 @@ void handle_interruption(int code, struct pt_regs *regs)
>  		/* Fall Through */
>  	case 27: 
>  		/* Data memory protection ID trap */
> +		if (code == 27 && !user_mode(regs) &&
> +			fixup_exception(regs))
> +                   return;

I think you should add a self-explaining printk(KERN_CRIT,..) here, so
that we can track when this bug appeared in userspace.
Something like:
printk("strange data protection ID trap happened to <procname> PID: xxx.
(this is a bug in the kernel)\n");
(you probably find a better wording)

Having a correctly-coded userspace process which suddenly just return
failures in syscalls is not good and would make people wonder and
unnecessarily try to debug their (correct) userspace apps...

Helge
