Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA07127
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 18:28:52 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 May 2000 00:28:49 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA10469;
	Thu, 4 May 2000 10:28:33 +1000
Date: Thu, 4 May 2000 10:28:33 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: willy@thepuffingroup.com
cc: Sam Creasey <sammy@sammy.net>, Grant Grundler <grundler@cup.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error
In-Reply-To: <20000503115310.A27702@thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0005041021050.8334-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 3 May 2000 willy@thepuffingroup.com wrote:

> On Wed, May 03, 2000 at 10:18:54AM -0400, Sam Creasey wrote:
> > ok, for a while I was dealing with this by simply hacking up initfini.s by
> > hand, but that wasn't necessary last time I built.  I think this is
> > related to the fact that somebody had taken out .proc/.procend from the
> > assembler entirely (well, ignored them  on ELF targets).  I think this was
> > a bad idea (if I remember tc-hppa.c from gas, it depends on these to build
> > some of the global symbol information?  It did something even on an elf
> > target).
> 
> it was a bad idea, it broke other things.  i suspect the right thing
> to do is move some of the global symbol information-building code
> which is currently invoked upon seeing a .proc or .procend to simply
> seeing a non-local label, like the other assemblers do.  i don't see why
> linux/elf/pa-risc needs anything special in this regard.  Alan (Modra),
> do you have any comments?

Well, I'm still coming up to speed on the parisc architecture, so maybe my
comments aren't that valuable.  There are quite a lot of things I don't
like about the current set of puffin parisc patches though, and zapping
these pseudo ops is one of them.

On another issue, can someone tell me why the assembler comment character
needed to be changed from `;' to `!' ?  This seems a really ill-advised
change to me.

-- 
Linuxcare.  Support for the Revolution.
