Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA24900
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 00:04:53 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 07:07:04 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA28831;
	Tue, 21 Nov 2000 18:05:36 +1100
Date: Tue, 21 Nov 2000 18:05:36 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] signal handling problems (32 bit kernel)
In-Reply-To: <20001120175838.Q32715@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0011211713550.15623-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 20 Nov 2000, Richard Hirst wrote:

> #warning XXX FIXME probably bogus -PB
>         /* I think this is bogus -- it'll cause the first instn of the
>          * signal handler to be executed twice!  Better might be to

Definitely bogus, as with quite a lot of iaoq manipulation in signal.c

> I've fixed that by setting iaoq[1] = iaoq[0]+4.  Is that OK, or

Sounds like the right thing to do.  I reckon everywhere ioaq is fudged
from/to r31 should have this sort of mapping.  ie. it should be

	regs->gr[31] = regs->iaoq[0];

in sys_rt_sigreturn, and

	err |= __put_user(regs->gr[31], &sc->sc_iaoq[0]);
	err |= __put_user(regs->gr[31] + 4, &sc->sc_iaoq[1]);

in setup_sigcontext, and so on.  I'm guessing the origial author of this
code didn't know which of iaoq[0] and ioaq[1] was ioaq_front. :)

> and then in another terminal do 'kill -USR1 <pid>'.  The program
> either goes 'Wah!', gives a SEGV, or works.  That seems to be because
> %r1 is corrupted while processing the signal.  The signal handler ends
> with a syscall (rt_sigreturn_wrapper), and %r1, at least, is not saved
> and restored over the syscall.  %r31 also appears to get corrupted, as
> it is used in the final branch of the syscall return.

I don't really understand what is going on here, but it seems wrong to me
that setup_rt_frame should be touching regs->iaoq at all when in_syscall.

Hmm, and in that case why all the other gr[31] to/from ioaq[] fudgery?

Alan
-- 
Linuxcare.  Support for the Revolution.
