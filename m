Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (adsl-64-109-89-110.chicago.il.ameritech.net [64.109.89.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id B582E482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 17:59:39 -0600 (MDT)
Message-Id: <200110232359.f9NNxPG09126@localhost.localdomain>
To: Daniel Engstrom <5116@telia.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	parisc-linux@lists.parisc-linux.org,
	Richard Hirst <rhirst@linuxcare.com>
In-Reply-To: Message from Daniel Engstrom <5116@telia.com>
   of "Tue, 23 Oct 2001 22:33:50 +0200." <20011023223350.A1650@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Oct 2001 18:59:25 -0500
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [parisc-linux] Re: 53c700: tagged queueing problem confirmed
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com said:
> I have used these drives with i386 Linux without problems with both
> the aix7xxx driver and the sym53c8xx driver. Both these drivers use a
> default of max 8 tags per lun, so I chnaged the value in your driver
> and it works. So, maybe 8 tags per lun is the conservative default
> here ? 

That's not unreasonable.  You're going to run into problems with the new 
aic7xxx driver, though, which has a default of 253 tags.

Usually you want larger numbers of tags to allow multiple active I/Os and give 
the device the most freedom to order them efficiently.  However, in linux we 
have the elevator to consider as well:  The more tags, the less time the I/Os 
spend in the elevator queue and the less chance of coalescing adjacent I/O.  
For any given workload, there's probably an optimal tag number and I bet they 
cluster around some value for a variety of workloads, but I've no idea what it 
is.

I'd still be wary of allowing tags on this drive.  The firmware clearly has a 
point beyond which it goes haywire and you don't really know where that is.  
It could be that reducing the max tags to 8 makes this unlikely but not 
impossible, so you may still end up with insidious data corruption 
possibilities.

James
