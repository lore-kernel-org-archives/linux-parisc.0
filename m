Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maild.telia.com (maild.telia.com [194.22.190.101])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1575A482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 23:21:18 -0600 (MDT)
Date: Wed, 24 Oct 2001 07:21:02 +0200
From: Daniel Engstrom <5116@telia.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org,
	Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] New 53c700 driver preformance evaluation
Message-ID: <20011024072102.D1650@zaphod.halden.lillfab.se>
References: <5116@telia.com> <200110221752.LAA07067@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <200110221752.LAA07067@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Oct 22, 2001 at 19:52:44 +0200
List-ID: <linux-parisc.vger.kernel.org>

Grant,

On 2001.10.22 19:52 Grant Grundler wrote:
> The difference between -pa32 and -pa61 are numerous.
> Lots of bug fixes many new minor features working.
> Really need to compare same -paXX with/without disconnects
> enabled in order to compare that variable.

I disabled disconnect with pa61 and got similar results as with disconnects
disabled with pa32, so most of the difference may be the disconnects.

> > I wonder if the lower speed for block I/O with the new driver is due to the
> > disabled disconnects?

I phrased this in a bad way, the old driver which is faster have disconnects
disabled.

> For a single threaded test, I would expect disconnects
> *enabled* to have lower throughput than when disabled.
Which is what I saw even if it was not very clearly expressed.
I got ~400k/s better block throughput with the old driver with disconnects
disabled (due to some driver problem) than with the new driver.
 
> Also, the fact that -pa61 output is more in line with hpux suggest -pa32
> could be lying about it's performance. ie the data isn't on media
> like bonnie expects. Same might be true for hpux on input. dunno.
> Need to troll and bonnie or other disk io perf mailing lists.
> 
> BTW, another HPUX (only on workstations) thing is to set WCE (write
> cache enable) on the SCSI device. 
Can this behaviur be controlled? I use 10.20.

Another thing which I want to bring up is locking. It seems out getc() performance is stuck at 314chars/sec while HPUX gives almost 600, could it be
that HPUX lock primitive is twice as fast as ours?

/Daniel

-- 
