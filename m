Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA00392
	for <parisc-linux@puffin.external.hp.com>; Sun, 1 Aug 1999 22:20:46 -0600
Date: Mon, 2 Aug 1999 06:21:41 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Jeffrey A Law <law@cygnus.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX syscall ABI?
Message-ID: <19990802062141.A23880@suse.de>
References: <19990802053239.N13236@suse.de> <31287.933567147@upchuck.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <31287.933567147@upchuck.cygnus.com>; from Jeffrey A Law on Sun, Aug 01, 1999 at 10:12:27PM -0600
List-ID: <linux-parisc.vger.kernel.org>

>> An ABI that would specify too many argument registers would force the 
>> caller
>> to load them before the call and the callee to save them again because both
>> would need the additional argument registers.
> At function entry the compiler copies all parameters passed in registers into
> pseudo-registers.
> 
> Those pseudo registers are then subject to normal register allocation.  ie,
> the compiler can allocate it into a call saved register, into a stack slot
> (and bring it into a register where needed) or into a call clobbered register
> and save/restore it around calls based on which of the options minimizes
> cost.

Is this gcc-specific ?

> There's no benefit to not using those call clobbered registers for parameter
> passing other than to save a little stack space (you have a register flush to
> fixed areas in the frame inside varargs/stdarg functions).

I can imagine cases for which the PA1.1 ABI is better but of course I am not
sure how frequent they are.  For syscalls we definitely want to avoid having
to look at the user stack as soon as we have PL 0.

	Philipp Rumpf
