Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA06991
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 22:39:02 -0600
Date: Fri, 17 Sep 1999 03:52:57 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: LaMont Jones <lamont@security.hp.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output
Message-ID: <19990917035257.K8112@suse.de>
References: <19990917005542.I8112@suse.de> <19990917013948.39E7E18711@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990917013948.39E7E18711@security.hp.com>; from LaMont Jones on Thu, Sep 16, 1999 at 07:39:47PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> > we don't save them at all, but directly read them.  Of course, printing them
> > doesn't make any sense (except for debugging the interruption code).
> 
> Reading them when PSW.Q=1 is undefined, and it sounds like that's where the
> problem is coming from....

erm.  yes, I know that.  Yes, I said it doesn't make any sense.

> IIR should have had a load or store in it for Grant's problem...

Grant's problem is most likely solved.  And no, there is no reason to save
IIR right now (there might be one when we have to find out whether a read or
write failed).

	Philipp Rumpf
