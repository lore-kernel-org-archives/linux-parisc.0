Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8A41482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 16:22:37 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15v4Vj-0002sT-00; Sat, 20 Oct 2001 23:22:31 +0100
Date: Sat, 20 Oct 2001 23:22:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: Steve.Grady@csiro.au
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125
Message-ID: <20011020232231.D31505@parcelfarce.linux.theplanet.co.uk>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCBC0@wing-ep.tip.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <49AA3A3C863E5B4C911320AEF99E5DA3010CCBC0@wing-ep.tip.csiro.au>; from Steve.Grady@csiro.au on Sun, Oct 21, 2001 at 08:05:16AM +1000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Oct 21, 2001 at 08:05:16AM +1000, Steve.Grady@csiro.au wrote:
> I want to put a large SCSI disk either 9.1G or 18.2G SCSI disk on a HP
> 735/125 does anyone know if this will work under PARISC-linux and will I be
> able to see the whole disk?

The only thing to beware of is that palo can only access the first
2GB of the disc, so the kernel that it loads has to be in this area.
It is possible to fix palo to work for >2GB partitions, but nobody's
done that yet.

-- 
Revolutions do not require corporate support.
