Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 623F2482A
	for <parisc-linux@parisc-linux.org>; Fri, 25 May 2001 18:32:09 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Major hppa binutils problem 
In-Reply-To: Message from Matt Taggart <taggart@carmen.fc.hp.com>
   of "Tue, 22 May 2001 18:07:59 MDT." <20010523000759.C759937DCE@carmen.fc.hp.com>
References: <20010523000759.C759937DCE@carmen.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 18:34:50 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010526003450.E0CC037C8F@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart writes...

[snip]
> Paul Bame has written a script you can run to check and see if your system
> has any bad debs installed. Its available at,
> 
> ftp://puffin.external.hp.com/pub/parisc/tools/plt-checker

It was discovered that this tool could silently fail if you didn't have the 
right version of binutils installed. I have updated the URL above with Paul's 
latest version. Also most of the bad debs in the debian archive have been 
replaced by new clean ones. So what a few of us have been doing is,

- "apt-get update; apt-get upgrade" to get all the latest debs
- run plt-checker
- remove or replace the remaining stuff that's broken

You'll probably want to do something similar.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
