Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C8E6482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 11:56:27 -0600 (MDT)
Message-Id: <200110221752.LAA07067@puffin.external.hp.com>
To: Daniel Engstrom <5116@telia.com>
Cc: parisc-linux@lists.parisc-linux.org,
	Richard Hirst <rhirst@linuxcare.com>,
	JamesBottomley@zaphod.halden.lillfab.se
Subject: Re: [parisc-linux] New 53c700 driver preformance evaluation 
In-Reply-To: Message from Daniel Engstrom <5116@telia.com>
   of "Sun, 21 Oct 2001 16:19:44 +0200." <20011021161944.G6663@zaphod.halden.lillfab.se>
Date: Mon, 22 Oct 2001 11:52:44 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Daniel Engstrom wrote:
> Hi,
> 
> When I got the new driver running I also did some more bonnie runs with the
> following drivers: 
> 2.4.9-pa32 with the old driver and disconnects disbled
> 2.4.9-pa61 with the new driver and tagged-queueing disabled
> HPUX 10.20

Daniel,
thanks for running these tests...always interesting to see.

The difference between -pa32 and -pa61 are numerous.
Lots of bug fixes many new minor features working.
Really need to compare same -paXX with/without disconnects
enabled in order to compare that variable.

> I wonder if the lower speed for block I/O with the new driver is due to the
> disabled disconnects?

I don't think so.
In general, disconnects increase context switching/cpu utilization
but improve SCSI bus utilization for environments with lots of
devices and lots of IO "in flight". ie more throughput at the cost of
more latency. For a single threaded test, I would expect disconnects
*enabled* to have lower throughput than when disabled.

Also, the fact that -pa61 output is more in line with hpux suggest -pa32
could be lying about it's performance. ie the data isn't on media
like bonnie expects. Same might be true for hpux on input. dunno.
Need to troll and bonnie or other disk io perf mailing lists.

BTW, another HPUX (only on workstations) thing is to set WCE (write
cache enable) on the SCSI device. This allows the SCSI device to claim
a write has completed before the data is actually on media.
WCE + disabling disconnects is usally a good combo for perf since the
device can immediately report good status. The problem is a
SCSI bus reset or power failure will blow cached data away.
That's why HPUX servers don't permit WCE on.

hth,
grant
