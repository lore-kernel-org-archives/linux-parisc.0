Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc3-hems4-0-cust183.bre.cable.ntl.com [213.107.179.183])
	by dsl2.external.hp.com (Postfix) with ESMTP id 637A5482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 05:10:56 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 74011B00C; Tue, 23 Oct 2001 12:10:34 +0100 (BST)
Date: Tue, 23 Oct 2001 12:10:34 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Steve.Grady@csiro.au, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125
Message-ID: <20011023121034.E11105@linuxcare.com>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCBC0@wing-ep.tip.csiro.au> <20011020232231.D31505@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020232231.D31505@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Sat, Oct 20, 2001 at 11:22:31PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 11:22:31PM +0100, Matthew Wilcox wrote:
> On Sun, Oct 21, 2001 at 08:05:16AM +1000, Steve.Grady@csiro.au wrote:
> > I want to put a large SCSI disk either 9.1G or 18.2G SCSI disk on a HP
> > 735/125 does anyone know if this will work under PARISC-linux and will I be
> > able to see the whole disk?

As I think jsm added, the internal fast-wide-diff disks on a 53c720 are
not supported atm.  53c720 is supported on some systems (zalon on bluefish
card, in my B180, for example), and I had some provisional patches for
53c720 support on Outfield (735).  Turns out that they wont work though,
because 735 is not cache coherent.  The 53c720 driver is ncr53c8xx.c,
which assumes cache coherent memory is available - it bombs on 735
because pci_alloc_consistent() fails.

Not sure what to do about this yet - we might get support most easily
by adding 53c720 to the new 53c700 driver, but it would be running
the 53c720 in 53c700 mode, which is rather sub-optimal.

Given that ncr53c8xx.c is really a pci driver, I think there is a limit
to how much we can get away with changing it for non-pci, non 53c8xx
chips.

Richard
