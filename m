Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C84044837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 23:45:03 -0600 (MDT)
Message-Id: <200109280541.XAA27408@puffin.external.hp.com>
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FW SCSI on the D350 
In-Reply-To: Message from Hamish Moffatt <hamish@cloud.net.au>
   of "Fri, 28 Sep 2001 00:13:54 +1000." <20010928001354.A1519@silly.cloud.net.au>
Date: Thu, 27 Sep 2001 23:41:28 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hamish Moffatt wrote:
> 
> Hi,
> 
> I'm trying to install the 0.9 release on a D350 server. The kernel
> recognises the standard SCSI, using the lasi7xxx driver, and finds
> the tape drive and the CD-ROM on that host. However, it doesn't
> find the Bluefish fast/wide SCSI host, so it doesn't find the
> four internal hard disks, which makes installation a little tough.

The D-class is very similar to Cxxx - ie it has U2 or Uturn in it.
parisc-linux currently only supports GSC devices below the first IOMMU.
Ryan Bradetich is working on "I/O tree" support to enable support
for multiple IOMMUs - then we should be able to walk additional
GSC busses and find more devices.

> The boot-up firmware recognises all of the disks OK, but the Bluefish
> is just not included in the device list shown at startup/dmesg.

Probably because GSC bus with your Bluefish (FWD SCSI) isn't being walked.
That's something Ryan wants to fix once IOtree support is at least
sort-of working.

> I'll try the 0.9.2 release tomorrow. Any other things I can do
> which might help?

Send Ryan cash. ;^)
(Just kidding...)

grant
