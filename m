Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from merulo.debian.org (merulo.external.hp.com [192.25.206.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EA47482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Aug 2001 09:54:27 -0600 (MDT)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id 8399B2412C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Aug 2001 09:54:23 -0600 (MDT)
Sender: bdale@rover.gag.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Downloading kernel source
References: <99F41EF55D11D511818600D0B74749C496F42B@wchrntms01.uk.wmmercer.com>
	<Pine.LNX.4.33.0108131738060.12006-100000@leo.uni-sw.gwdg.de>
From: Bdale Garbee <bdale@gag.com>
Date: 13 Aug 2001 09:54:23 -0600
In-Reply-To: <Pine.LNX.4.33.0108131738060.12006-100000@leo.uni-sw.gwdg.de>
Message-ID: <87hevc551s.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

weilbach@uni-sw.gwdg.de (Peter Weilbacher) writes:

> is there a place to download the more or less current kernel source
> (as tarball)? A few weeks ago I was trying to get it via CVS, but
> that took hours, and I finally realized that I got the wrong one...
> I wanted to give it a new try with JFS...

I'm working on kernel-image packages for upload to the Debian mirrors right
now.  One of the side-effects is that the Debian source package will contain
a mostly-current tarball that is a snapshot of the code from CVS.  

Until I get this done, I'm not sure what other options exist.

Bdale
