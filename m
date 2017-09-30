From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: HP-UX for C8000
Date: Sat, 30 Sep 2017 17:25:06 +0200
Message-ID: <20170930152506.GA10542@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

while makeing progress on getting better graphic support for C8000
machines, I'm at a point I need some help...

Current status:

- PCI Radeon card is passing the DMA tests (using test hack)
- fixed three bugs in parisc-agp.c (wrong byte order for iommu entries,
  missing coherence information in iommu entries and missing fdc for
  ioemmu entries)
- AGP card are still not working, looks like they don't even start a DMA
  transfer at all

I'm stuck at this point as there is no documentation for quicksilver
agp available. The zx1-ioa document only covers mercury agp bridges
(used and working in ZX2000/ZX6000), but quicksilver is different
and I couldn't find the missing bit(s), yet. I now have two ideas
to make progess. I'm going to measure, if a REQ signal is issued on
the AGP bus and also look if the bridge responds with GNT. The second
idea involves HP-UX. I want to look what HP-UX does with quicksilver.

Does anyone have a C8000 with a running HP-UX on it and can help
getting a register dump of quicksilver ? Otherwise what HP-UX should
I try to get for a C8000 ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
