Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE386482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 16:15:25 -0600 (MDT)
Message-Id: <200110132212.QAA19397@puffin.external.hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic with -pa48 
In-Reply-To: Message from James Bottomley <James.Bottomley@HansenPartnership.com>
   of "Sat, 13 Oct 2001 15:51:34 EDT." <200110131951.f9DJpZT01701@localhost.localdomain>
Date: Sat, 13 Oct 2001 16:12:09 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

James Bottomley wrote:
> Your next problem will be the C3325A drive:  I have one of these and it seems
> to drop tagged commands under heavy load (which annoys the SCSI error handler
> no end).  I was going to ask for it to be added to the SCSI mid-layer black 
> list as being unable to handle tags, but I haven't got around to it yet.

Many of the older drives for workstations have issues like this.
Workstation folks couldn't wait for the server folks to finish
testing and issues like this weren't found. That stopped being true
about 5 years ago when 1 and 2 GB (5400rpm) drives came on the market.

In general, drives smaller than 1GB are not reprogammable
and thus can't be upgraded. I don't know if C3325A is upgradeable.
If it is, the firmware for it *might* be on the same ftp site
as platform firmware - see the www.parisc-linux.org FAQ for the URL.
And not sure if there is a utility for linux to download
SCSI device firmware.

grant
