Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA04374
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 09:25:29 -0600
Received: from ppp-1-64.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.64)
  by mailserv2.iuinc.com with SMTP; 19 Aug 2000 15:25:16 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9833AB005; Sat, 19 Aug 2000 16:24:18 +0100 (BST)
Date: Sat, 19 Aug 2000 16:24:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000819162418.E13870@linuxcare.com>
References: <20000818124944.A13870@linuxcare.com> <200008182207.PAA07370@milano.cup.hp.com> <20000818220456.A32273@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000818220456.A32273@vodka.thepuffingroup.com>; from matthew@wil.cx on Fri, Aug 18, 2000 at 10:04:56PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 18, 2000 at 10:04:56PM -0400, Matthew Wilcox wrote:
> this _may_ have fixed it.  richard, could you take out the tulip hack you
> put in and let me know whether the 720 works now?

720 still doesn't work; I'll look in to why that is.

> however, there is still at least one nasty bug.  on the c3k i was testing
> with earlier today, it would hpmc while starting init.  this might be
> cured now the pci resources are being mangled properly -- could have
> been to do with init trying to open /dev/console perhaps?  this was an
> elf sash init, fwiw.
> 
> i'm in toronto until sunday evening with no access to parisc hardware, so
> don't check out a version of the tree after the LINUS_240_TEST6_PREMERGE
> tag unless you want to play hunt-the-bug.  clearly i'd love it if i
> checked my email on monday morning and found cvs checkins which fixed
> the bugs, but i'm a dreamer :-)

Dream on ;-)  I've fixed drivers/char/serial.c to allocate our serial ports
from ttyS00 rather than from ttyS04, and my A180 now boots to a sash
prompt.  That got rid of the 'pci bus 0 not registered" message also.

Richard
