Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA17695
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 14:42:38 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A6CAA2F.16CB69AB@dot.at>
Date: Mon, 22 Jan 2001 22:46:23 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: Further (build ?): [parisc-linux] strace ??? - is there any ???
References: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net> <20010122151515.N3571@linuxcare.com> <3A6C7686.1FC5F754@dot.at> <3A6C918B.A6287A24@dot.at> <20010122201517.P3571@linuxcare.com> <3A6CA970.7F8F82DF@dot.at>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Again:  The configure script cannot find `config.h.in'
Is this missed in the CVS version of this day ?
	
	Christoph


Christoph Plattner wrote:
> 
> Hallo Mr Hirst !
> 
> Now I have following problem. What is the clean
> way to build such autoconfigured tool cross ?
> 
> Is it via `--target=hppa-linux', but here it will build for i386 !
> Or is it `--host=hppa-linux --build=i386-linux' ???
> 
> Or have I to define a CC=/usr/parisc/bin/hppa-linux-gcc ?
> 
> Must I use CC= also on configure and make or only on make
> or configure.....
> 
> ... etc....
> 
> How to do this in the correct way ?
> 
> Thanks
> 
>         Christoph
> 
> Richard Hirst wrote:
> >
> > On Mon, Jan 22, 2001 at 09:01:15PM +0100, Christoph Plattner wrote:
> > > I often use strace to analyse the problems I have with
> > > applications. Espacially I had success in analysing problems
> >
> > strace source is in cvs on puffin.external.hp.com, but you need to
> > check it out and build it yourself at the moment.
> >
> > Richard
> >
> > ---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.
> 
> --
> -------------------------------------------------------------------------
> private:        christoph.plattner@dot.at
> company:        christoph.plattner@alcatel.at

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
