Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA02082
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 08:56:37 -0600
From: willy@thepuffingroup.com
Date: Wed, 3 May 2000 11:53:10 -0400
To: Sam Creasey <sammy@sammy.net>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error
Message-ID: <20000503115310.A27702@thepuffingroup.com>
References: <200005011841.LAA11187@milano.cup.hp.com> <Pine.LNX.4.21.0005031016340.6083-100000@sammyville.sammy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005031016340.6083-100000@sammyville.sammy.net>; from Sam Creasey on Wed, May 03, 2000 at 10:18:54AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 03, 2000 at 10:18:54AM -0400, Sam Creasey wrote:
> ok, for a while I was dealing with this by simply hacking up initfini.s by
> hand, but that wasn't necessary last time I built.  I think this is
> related to the fact that somebody had taken out .proc/.procend from the
> assembler entirely (well, ignored them  on ELF targets).  I think this was
> a bad idea (if I remember tc-hppa.c from gas, it depends on these to build
> some of the global symbol information?  It did something even on an elf
> target).

it was a bad idea, it broke other things.  i suspect the right thing
to do is move some of the global symbol information-building code
which is currently invoked upon seeing a .proc or .procend to simply
seeing a non-local label, like the other assemblers do.  i don't see why
linux/elf/pa-risc needs anything special in this regard.  Alan (Modra),
do you have any comments?

> We might need our own magic sed script for parisc.

i'd prefer not to..
