Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBE55482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Jun 2001 07:43:40 -0600 (MDT)
Sender: delahaym@esiee.fr
Message-ID: <3B24CE2E.77B5F5F6@esiee.fr>
Date: Mon, 11 Jun 2001 15:57:02 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel faults on boot
References: <Pine.LNX.4.33.0106111249020.9668-100000@leo.uni-sw.gwdg.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hum, could you check your Hardware clock before booting.
I got this problem on a 742 box and when I set the hwclock
to the right date and time (The clock was unset due to lack
of battery), cron worked.

Peter Weilbacher wrote:
> 
> On Sun, 10 Jun 2001, Richard Hirst wrote:
> 
> > On Fri, Jun 08, 2001 at 07:28:51PM +0200, Peter Weilbacher wrote:
> > > I have played with a 712/60 and had the same problem as Frank. I got
> > > it installed over the first reboot, but after a the next one on
> > > every reboot it crashed with Kernel faults at cron.
> > >
> > > Now I have reinstalled and I do not get over the reboot. Is it
> > > explained somewhere, which I need to write down, to help you debug
> > > the problem? (I guess it doesn't make it into any logs, which I
> > > could look at by putting the disk on another machine.)
> >
> > I expect to get my hands on a 712 very soon, so I'll see if I can
> > reproduce this problem.  So far as what you can write down for me...
> > Usually a kernel crash gives a stack dump followed by the fault type
> > and address, then a bunch of registers.  I'm not too interested in the
> > stack dump (which has probably scrolled off the screen, anyway), but
> > everything after the stack dump would be useful.
> 
> Hmm, it seems that the numbers change every time, but here are the
> ones from the last instance:
> 
>         Kernel Fault: Code=15 regs=1051ca80 (Addr=1dc0ce18)
> 
>              YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>         PSW: 00000000000001000000000000001111
>         r0-3o 00000000 10236000 10193d70 1dc0cd18
>         r4-7o 146fc000 102fe13c 00000001 00000100
>         r8-11o 4020b1a8 00000000 00000004 146ff000
>         r12-15o 00000100 00000030 00003000 102fe138
>         r16-19o 00000080 1051c908 00000001 14786000
>         r20-23o 146fc000 102959f8 101da1d4 00000000
>         r24-27o 000000ff 1dc0ce18 146fc000 10268010
>         r28-31o 00001920 00000004 1051ccc0 10192c78
>         sr0-3o 00000000 0000012a 00000000 0000012a
>         sr4-7o 00000000 00000000 00000000 00000000
> 
>         IASQ: 00000000 00000000 IAOQ: 10236234 10236238
>          IIR: 0f221033    ISR: 00000000  IOR: 1dc0ce18
>          ORIG_R28: 1005f210
> 
> Phew, quite a work to type all this stuff, I am glad that you are
> not interested in the stack... Perhaps this is useful.
> 
> In the meantime I noticed that about every 6th time it boots up
> without crashing, but the keyboard setting from the installation
> (German) was obviously not saved.
> 
> Peter.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/
