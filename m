Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B8F8482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 23:51:59 -0600 (MDT)
Message-Id: <200110240548.XAA19760@puffin.external.hp.com>
To: Daniel Engstrom <5116@telia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New 53c700 driver preformance evaluation 
In-Reply-To: Message from Daniel Engstrom <5116@telia.com>
   of "Wed, 24 Oct 2001 07:21:02 +0200." <20011024072102.D1650@zaphod.halden.lillfab.se>
Date: Tue, 23 Oct 2001 23:48:22 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Daniel Engstrom wrote:
> Which is what I saw even if it was not very clearly expressed.
> I got ~400k/s better block throughput with the old driver with disconnects
> disabled (due to some driver problem) than with the new driver.

ah ok. It wasn't obvious to me.

> > BTW, another HPUX (only on workstations) thing is to set WCE (write
> > cache enable) on the SCSI device. 
> Can this behaviur be controlled? I use 10.20.

yes. iirc, it via scsictl command.

# scsictl
Usage: scsictl [-akq] [-m mode[=value]]... [-c command]... device

But HPUX calls WCE something else: "Immediate Reporting".
Keep that in mind when reading the man page.

> Another thing which I want to bring up is locking. It seems out getc() perfor
>   mance is stuck at 314chars/sec while HPUX gives almost 600, could it be
> that HPUX lock primitive is twice as fast as ours?

I think the lock primitive is the same - it's "ldcw".
It's something in the libc/syscall path but I have no clue what.

grant
