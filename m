Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA02711
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Sep 2000 02:03:50 -0600
Sender: mang@mailserv2.iuinc.com
Message-ID: <39CC644E.BB3AA67E@subcarrier.org>
Date: Sat, 23 Sep 2000 04:05:34 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
References: <39CBF956.4833E405@subcarrier.org> <20000923152919.O21274@neep.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

This is because of a problem in your sed pattern.  Notice the mismatch
between "math-emu" and "mathemu".  You can hand edit your CVS/Repository
to be correct (add the dash back).

Playing directory games in the repository is always a bad scene.  But
there was a desire to get rid of the junk in the repository, and better
to pay the price now than have the old directories become entrenched. :/

	- Mike.

Andrew Shugg wrote:
> 
> Is anyone having trouble doing updates after the rename?
> 
> Not having any troubles with the binutils module but bombing out on
> linux ...
> 
> cvs server: Updating linux/arch/alpha/math-emu
> cvs [server aborted]: cannot open directory /home/cvs/parisc/linux/arch/alpha/mathemu: No such file or directory
