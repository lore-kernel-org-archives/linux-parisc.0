Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA16184
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 07:30:07 -0600
Date: Wed, 22 Sep 1999 15:32:24 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
        Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Questions understanding exec_kernel
Message-ID: <19990922153224.Z5481@suse.de>
References: <37E82CE6.3A5DFFB0@uswest.net> <199909220426.VAA27105@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909220426.VAA27105@milano.cup.hp.com>; from Grant Grundler on Tue, Sep 21, 1999 at 09:26:50PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> >  [Question: Page 5-149 from the PA-RISC 1.1 Architecture and Instruction
> > Set Reference Manual states: "Level 0:  If the target control register
> > is CR 8, 9, 12, 13, 17, or 20, this instructin executes as a null
> > instruction."  I am assuming we are running at level 0 since the rfi
> > command required running at level 0, so what is the difference between a
> > null instruction and a nop?]

There is none.  Null instructions (here) refer to instructions ignored since
they don't apply to the specific hardware.  Nops are usually regular forms of
arithmetic / logical instructions that happen to do nothing.

> That's an easy one:
> Nullfied instructions are simple ignored - output discarded.

Except we're not talking about nullified instructions :)

	Philipp Rumpf
