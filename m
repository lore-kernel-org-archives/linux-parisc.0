Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA05369
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 16:53:55 -0600
Date: Fri, 17 Sep 1999 00:55:42 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: LaMont Jones <lamont@security.hp.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output
Message-ID: <19990917005542.I8112@suse.de>
References: <199909162158.OAA21289@milano.cup.hp.com> <19990916224438.6F3BB18711@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990916224438.6F3BB18711@security.hp.com>; from LaMont Jones on Thu, Sep 16, 1999 at 04:44:38PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> Interestingly, IIR (the interupting instruction register) contains
> mfctl   ior,arg2, which is not what we want...  Likewise IOR (as
> opposed to ior) also looks suspect.  I would wager that someone is
> not saving the I* registers correctly...

we don't save them at all, but directly read them.  Of course, printing them
doesn't make any sense (except for debugging the interruption code).

	Philipp Rumpf
