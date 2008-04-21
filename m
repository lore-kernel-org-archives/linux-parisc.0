From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PARISC] fix signal trampoline cache flushing
Date: Mon, 21 Apr 2008 07:51:01 -0700
Message-ID: <119aab440804210751g67baf212o786edbc6f9a5168e@mail.gmail.com>
References: <20080415223638.GD17646@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080415223638.GD17646@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 15, 2008 at 3:36 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
>  diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
>  index 58fccc9..06213d1 100644
>  --- a/arch/parisc/kernel/signal.c
>  +++ b/arch/parisc/kernel/signal.c
>  @@ -534,7 +534,8 @@ insert_restart_trampoline(struct pt_regs *regs)
>                  * Flushing one cacheline is cheap.
>                  * "sync" on bigger (> 4 way) boxes is not.
>                  */
>  -               flush_icache_range(regs->gr[30], regs->gr[30] + 4);
>  +               flush_user_dcache_range(regs->gr[30], regs->gr[30] + 4);
>  +               flush_user_icache_range(regs->gr[30], regs->gr[30] + 4);

We also have a restartable syscall trampoline (I think this is unique
to PA), does that one also need fixing?

Cheers,
Carlos.
