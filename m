Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id C25FF4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Mar 2001 12:43:26 -0700 (MST)
Message-Id: <200103061946.LAA03745@milano.cup.hp.com>
To: herrold <herrold@owlriver.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [HPADM] SUMMARY: firmware questions 
In-reply-to: Your message of "Tue, 06 Mar 2001 13:45:01 PST."
             <Pine.LNX.4.30.0103061332440.16778-100000@pokey.513erich.iwaynet.net>
Date: Tue, 06 Mar 2001 11:46:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

herrold wrote:
> This crossed the HP-UX admin list in summary form today -- it is
> somewhat longish, but it got me to thinking about firmware version
> issues.
> 
> I was left with a couple of unanswerable (to me) questions:
> 
> Predicate: An arbitrary HP chassis, found on ebay or cast off at
> work, will have no maintenance records, and be in an unknown state
> as to firmware version.

It will be known a few moment after one powers on the box.

> 1.  For porters:  I would infer that some of the code is
> re-inventing firmware-fixpacks and firmware-state detection code
> [consciously or not] for problems which have already been
> indentified and perhaps solved, by HP.  Is this being well or
> episodically addressed, and could it be done better?

It's not being addressed for parisc-linux by anyone *yet*.
You are welcome to submit a wishlist bug at http://bugs.parisc-linux.org

In general, parisc-linux expects one to upgrade firmware "manually"
to the latest version. Firmware updates are simple and can be done
by booting LIF images available from HP's "CPU" support website (ftp really).
Warnings about downloading the wrong firmware rendering a box useless
are to be taken *very* seriously.


> 2.  For HP-ers:  Is HP-corporate ameanable to general release and
> application of fixpacks to the general population of HP-chassis
> owners?  This answer may vary by host class -- i.e., if the
> provision of fixpacks is a maintenance contract benefit, it may be
> sensible only from HP's point of view to release only older
> 'end-of-life'd' class hosts without charge (they are no longer a
> revenue stream item) -vs- release them all, recognizing that the GPL
> feedback might provide a fix for an indentified but un-addressed
> fixpack open issue.

I'm not sure what you mean by fixpack in the above context.

HP currently makes all firmware available for free and people
can download them for free. HP both fixes bugs and adds support
for new features in firmware updates. So reasons for updating
may vary.


...
> So, it sounds like the tape is the only way to go.

I've been doing all of my updates via the network - everything
from 712's to C3K and A500s.

One can also dd the firmware update image to a scratch
disk and boot from that instead of tape - it's *alot*
faster. :^)

> And, there are
> conflicting opinions -- either "if isn't broke; don't fix it"
> vs "HP knows best -- be proactive".

I fall into the latter camp. I know and trust the firmware guys
to fully test firmware before releasing it. And they have to be
since a failed download or broken firmware means the box is
rendered useless.

My experience to date has been pretty good overall - better than
HPUX networking patches for example. :^)

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
