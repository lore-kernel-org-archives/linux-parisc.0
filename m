Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 417354837
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 01:05:20 -0600 (MDT)
Date: Fri, 28 Sep 2001 01:05:18 -0600
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Hamish Moffatt <hamish@cloud.net.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FW SCSI on the D350
Message-ID: <20010928010518.A12507@beavis.ybsoft.com>
References: <hamish@cloud.net.au> <20010928001354.A1519@silly.cloud.net.au> <200109280541.XAA27408@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109280541.XAA27408@puffin.external.hp.com>
From: rbradetich@uswest.net (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 11:41:28PM -0600, Grant Grundler wrote:
> Hamish Moffatt wrote:
> > 
> > Hi,
> > 
> > I'm trying to install the 0.9 release on a D350 server. The kernel
> > recognises the standard SCSI, using the lasi7xxx driver, and finds
> > the tape drive and the CD-ROM on that host. However, it doesn't
> > find the Bluefish fast/wide SCSI host, so it doesn't find the
> > four internal hard disks, which makes installation a little tough.

You need a newer kernel, and you should be able to see the SCSI
card.  I'm not sure which -pa?? kernel, so just grab CVS head and
that should be sufficient.

> The D-class is very similar to Cxxx - ie it has U2 or Uturn in it.
> parisc-linux currently only supports GSC devices below the first IOMMU.
> Ryan Bradetich is working on "I/O tree" support to enable support
> for multiple IOMMUs - then we should be able to walk additional
> GSC busses and find more devices.

The code is in to detect the card under the "other" IOMMU, but if any
dma is performed on the "other" GSC bus, it will HPMC the machine.  As
Grant said, I have been working on the I/O tree to fix the problem, and
am getting close to having it working for SYSTEM_MAP firmware.

> > The boot-up firmware recognises all of the disks OK, but the Bluefish
> > is just not included in the device list shown at startup/dmesg.

LaMont Jones saw this same behavior on the J200.  Firmware reports the
Bluefish card for me on the C200.  In one of the Later kernel I committed
the support to walk the GSC busses uner ccio so LaMont could boot the
J200.  This should also work for you.

> Probably because GSC bus with your Bluefish (FWD SCSI) isn't being walked.
> That's something Ryan wants to fix once IOtree support is at least
> sort-of working.
> 
> > I'll try the 0.9.2 release tomorrow. Any other things I can do
> > which might help?

I do not think the 0.9.2 release is new enough, try the CVS head
kernel.

> Send Ryan cash. ;^)
> (Just kidding...)

:)

- Ryan
