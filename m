Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64947482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 21:42:45 -0600 (MDT)
Message-Id: <200110240338.VAA19430@puffin.external.hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: 53c700: tagged queueing problem confirmed 
In-Reply-To: Message from James Bottomley <James.Bottomley@HansenPartnership.com>
   of "Tue, 23 Oct 2001 18:59:25 CDT." <200110232359.f9NNxPG09126@localhost.localdomain>
Date: Tue, 23 Oct 2001 21:38:58 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

James Bottomley wrote:
> That's not unreasonable.  You're going to run into problems with the new 
> aic7xxx driver, though, which has a default of 253 tags.
> 
> Usually you want larger numbers of tags to allow multiple active I/Os
> and give the device the most freedom to order them efficiently.

Hmm...not really. Maybe for DOS or other really stupid OS's.

> However, in linux we have the elevator to consider as well:  The
> more tags, the less time the I/Os spend in the elevator queue and
> the less chance of coalescing adjacent I/O.  

That's right...coalescing and seek times need to be considered.
WCE bit (that I described before) also affects how long
IO are on the disk sort queue. With WCE enabled, setting the
max number of tags to 2 (or so) works very nicely.

I'm told Linux's disk sort elevator isn't very good about starvation.
ie IO's can get "prempted" for a long time because the IO
is destined for a currently "out of favor" geography on the disk.

One more consideration unique to multi-initiator SCSI clusters:
(Ie several hosts share devices on one SCSI bus)
The total number of outstanding IO can't exceed what the disk
is capable of handling or we end up wasting bandwidth to
requeue rejected IO's (BUSY msg or something like that).

> For any given workload, there's probably an optimal tag number and I bet
> they cluster around some value for a variety of workloads, but I've no
> idea what it is.

8 tags seems to be a pretty good trade off between on-disk optimizations
and OS trade-offs for database apps. At least that was true a few years
ago.

> I'd still be wary of allowing tags on this drive.  The firmware clearly has a
> point beyond which it goes haywire and you don't really know where that is.  
> It could be that reducing the max tags to 8 makes this unlikely but not 
> impossible, so you may still end up with insidious data corruption 
> possibilities.

Check with the vendor to see if the firmware is upgradeable.
Odds are if someone like HP or Sun is OEM'ing the disk, bugs
in the firmware have been found and fixed in later versions.

grant
