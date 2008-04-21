From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PARISC] fix signal trampoline cache flushing
Date: Mon, 21 Apr 2008 11:16:50 -0400
Message-ID: <20080421151650.GA30767@phobos.i.cabal.ca>
References: <20080415223638.GD17646@phobos.i.cabal.ca> <119aab440804210751g67baf212o786edbc6f9a5168e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440804210751g67baf212o786edbc6f9a5168e@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 21, 2008 at 07:51:01AM -0700, Carlos O'Donell wrote:
> On Tue, Apr 15, 2008 at 3:36 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> >  diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> >  index 58fccc9..06213d1 100644
> >  --- a/arch/parisc/kernel/signal.c
> >  +++ b/arch/parisc/kernel/signal.c
> >  @@ -534,7 +534,8 @@ insert_restart_trampoline(struct pt_regs *regs)
> >                  * Flushing one cacheline is cheap.
> >                  * "sync" on bigger (> 4 way) boxes is not.
> >                  */
> >  -               flush_icache_range(regs->gr[30], regs->gr[30] + 4);
> >  +               flush_user_dcache_range(regs->gr[30], regs->gr[30] + 4);
> >  +               flush_user_icache_range(regs->gr[30], regs->gr[30] + 4);
> 
> We also have a restartable syscall trampoline (I think this is unique
> to PA), does that one also need fixing?
> 

no.
