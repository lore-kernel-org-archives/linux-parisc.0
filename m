Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEF70482A
	for <parisc-linux@parisc-linux.org>; Sun, 21 Oct 2001 16:27:22 -0600 (MDT)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125 
In-Reply-To: Your message of "Sun, 21 Oct 2001 12:19:32 EDT."
             <200110211619.f9LGJXge014176@hiauly1.hia.nrc.ca>
References: <200110211619.f9LGJXge014176@hiauly1.hia.nrc.ca> 
Date: Sun, 21 Oct 2001 16:27:21 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011021222721.6658837D25@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" writes...

> > The question is will you be able to find a 9 or 18GB disk
> > with either SE SCSI or HVD SCSI interface which the 735
> > can connect to.
> 
> What about a Seagate ST318417N?  It is: 18.4GB, 7200 rpm, 8.5 ms seek avg,
> Ultra SCSI, suggested resale price $269.  While you can still find a HVD
> drive it looks like they are rapidly going the way of the dodo bird.

I think that should work.

Last year sometime I saw Paul Bame install an 18GB 10k RPM LVD Seagate
Cheetah drive in a 712 and install parisc-linux on it. It worked great :)

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
