Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA26025
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 11:25:49 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911221827.KAA13990@opus.allegro.com>
Subject: Re: [parisc-linux] Progress
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 22 Nov 1999 10:27:25 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199911221811.NAA27290@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 22, 1999 01:11:29 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> Missed this point because of the strange nop.  The current addib loop is 3
> instructions.  Alignment to a multiple of 16 should be good enough to
> ensure that the loop lies within a cache line.  This would insert a maximum
> of 3 nops before the loop.  This would provide a slightly more deterministic
> result.
> 
> Also, re the BogoMIPS number, I think this should be (loops_per_sec*3)/2000000
...

This should be timed on a PA-RISC 2.0 machine, just in case.  Some of
them are really good at apparently doing things twice as fast as you'd
expect :)    

Our K460 gets twice the MIPs you'd expect ... i.e., it executes a simple 
timing loop at about 360 million instructions per second ... 
on a single CPU machine with a 180 MHz clock!

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
