Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25E60482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 16:45:40 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 240121F714
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 18:43:17 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id QAA00533
	for parisc-linux@lists.parisc-linux.org; Sat, 20 Oct 2001 16:45:35 -0600 (MDT)
Date: Sat, 20 Oct 2001 16:45:35 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110202245.QAA00533@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> On Sun, Oct 21, 2001 at 08:05:16AM +1000, Steve.Grady@csiro.au wrote:
> > I want to put a large SCSI disk either 9.1G or 18.2G SCSI disk on a HP
> > 735/125 does anyone know if this will work under PARISC-linux and will I be
> > able to see the whole disk?
>
> The only thing to beware of is that palo can only access the first
> 2GB of the disc, so the kernel that it loads has to be in this area.
> It is possible to fix palo to work for >2GB partitions, but nobody's
> done that yet.

What this means is that you can create a small /boot partition
at the front of the disk, and then create as many other partitions
as you want. Other than the palo limit, which only affects the partition
you boot from, the partitions can be > 2Gb.

However, the other thing to be aware of is that the Fast Wide SCSI
Is not yet supported (at least last time I checked) on the 735. The
SE SCSI adapter will work though.

John Marvin
jsm@fc.hp.com
