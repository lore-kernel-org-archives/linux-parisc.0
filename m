Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71346482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 22:22:08 -0600 (MDT)
Date: Tue, 28 Aug 2001 00:22:51 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010828002251.L28978@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk> <20010817155340.C8649@megatonmonkey.net> <20010828000748.G7064@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828000748.G7064@linuxcare.com>; from rhirst@linuxcare.com on Tue, Aug 28, 2001 at 12:07:48AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> The installer starts with a bunch of .debs which are sufficiently new
> that they don't have the apt-segv problem.  That is the case for the
> 0.9.2 ISO, anyway.
> 
> You might me able to do a fresh install from the 0.9.2 ISO to get a
> more stable system.  If you don't want to do that, you could try using
> dpkg -i to install .debs from that ISO.  Possibly a dpkg -i *.deb in
> the binary-hppa/base dir might just work.  You should probably be running
> a new(ish) kernel before you do that.
> 
> Richard
>

Richard,

I think the main issue was that we were using a _really_ old kernel.
Which didn't have a lot of the later patches for the older 715 boxes.

I'm currently trying to roll the toolchain from start to end, and 
automate the process a little. BTW, is there any automation setup for
building the toolchain? Does each developer just have their own way(tm)
of doing the build?

The problem I have now lies in gathering up-to-date src for glibc,
and as Matthew pointed out, it is only available from the debian packages.

I'm currently trying this out.

Cheers,
Carlos.
