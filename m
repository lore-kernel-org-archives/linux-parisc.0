Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA30441
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 11:09:05 -0700
Message-Id: <200011151809.NAA22314@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Help with posix_types.h
To: bame@noam.fc.hp.com (Paul Bame)
Date: Wed, 15 Nov 2000 13:09:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@puffin.external.hp.com
In-Reply-To: <E13w62o-0006Pv-00@noam.fc.hp.com> from "Paul Bame" at Nov 15, 2000 10:08:22 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

The largest disk currently available I believe is the 180GB Seagate Baracuda.
The size of drives is increasing about a factor of 2 per year.  The
__kernel_off_t definitely needs to be 64 bits to handle large drives
in both 32 and 64 bit systems.  Disk blocks are typically 512 or 1024 bytes.
Thus, drives may exceed 4GB disk blocks in 3-4 years.  Inodes are variable
in size (8KB average).  Thus, we are a little further away from exceeding
the 32 bit inode limit.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
