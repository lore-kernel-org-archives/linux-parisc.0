Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 558FA4B0F
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 11:48:58 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f8TIILG04697
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 14:18:21 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f8THmvT15621
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 13:48:57 -0400
Date: Sat, 29 Sep 2001 13:48:57 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010929134857.B15266@megatonmonkey.net>
References: <20010928182422.A22740@dogbert.localdomain> <Pine.NEB.4.33.0109282045120.601-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.NEB.4.33.0109282045120.601-100000@www2.scram.de>; from jochen@scram.de on Fri, Sep 28, 2001 at 08:48:18PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> 
> On my installation i "fixed" this by switching off SCSI disconnects for my
> disks. IIRC, this was by adding sim700=nodisc:0x70 to the kernel command
> line.
> 
> I'm currently about 150 km away from my HP9000/720 during the weekend.
> I'll test the proposed patch on Monday.
>

I usually use sim700=noneg:0xff,nodisc:0xff.
Turn it all off ;)

c. 
