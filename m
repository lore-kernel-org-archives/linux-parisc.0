Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA18959
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 15:38:25 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 22:42:13 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5774CB005; Mon, 22 Jan 2001 22:32:32 +0000 (GMT)
Date: Mon, 22 Jan 2001 22:32:31 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Further (build ?): [parisc-linux] strace ??? - is there any ???
Message-ID: <20010122223231.T3571@linuxcare.com>
References: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net> <20010122151515.N3571@linuxcare.com> <3A6C7686.1FC5F754@dot.at> <3A6C918B.A6287A24@dot.at> <20010122201517.P3571@linuxcare.com> <3A6CA970.7F8F82DF@dot.at> <3A6CAA2F.16CB69AB@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A6CAA2F.16CB69AB@dot.at>; from christoph.plattner@dot.at on Mon, Jan 22, 2001 at 10:46:23PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 10:46:23PM +0100, Christoph Plattner wrote:
> Again:  The configure script cannot find `config.h.in'
> Is this missed in the CVS version of this day ?

autoheader will generate that for you.

I normally build strace natively on my B180, will try and recall how
to cross-compile.

Richard
