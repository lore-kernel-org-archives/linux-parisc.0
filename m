Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A9B349F9
	for <parisc-linux@parisc-linux.org>; Fri, 28 Sep 2001 14:11:41 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] what i did on my holidays 
In-Reply-To: Message from "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
   of "Fri, 28 Sep 2001 13:37:18 EDT." <20010928133718.N2611@megatonmonkey.net>
References: <20010927161004.E16096@parcelfarce.linux.theplanet.co.uk>
 <20010927204451.F2611@megatonmonkey.net> <20010928152312.A3460@parcelfarce.linux.theplanet.co.uk>  <20010928133718.N2611@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 28 Sep 2001 14:11:39 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010928201139.9437837C8D@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Carlos O'Donell Jr." writes...

[snip]
> Out of curiosity, is there a gdb package built for debian-hppa?

There's an unofficial package in

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/unofficial-debs

pehc cvs needs to be synced up with upstream before the changes can be sent 
upstream and also put in the official Debian package.

[snip]
> Who's working on the compiler for parisc?

No one. Alan Modra periodically does cvs merges and I use that to generate 
patches for the Debian package. We need to catch up with the 
3.0.2ds2-0pre010922 version of the package, which I hope to do next week. That 
might help glibc but I'm betting whatever's causing the build failure it still 
out there.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
