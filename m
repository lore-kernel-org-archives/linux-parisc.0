Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailc.telia.com (mailc.telia.com [194.22.190.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31A8D482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 14:34:13 -0600 (MDT)
Date: Tue, 23 Oct 2001 22:33:50 +0200
From: Daniel Engstrom <5116@telia.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org,
	Richard Hirst <rhirst@linuxcare.com>
Message-ID: <20011023223350.A1650@zaphod.halden.lillfab.se>
References: <5116@telia.com> <200110220034.f9M0YM701447@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <200110220034.f9M0YM701447@localhost.localdomain>; from James.Bottomley@HansenPartnership.com on Mon, Oct 22, 2001 at 02:34:22 +0200
Subject: [parisc-linux] Re: 53c700: tagged queueing problem confirmed
List-ID: <linux-parisc.vger.kernel.org>

On 2001.10.22 02:34 James Bottomley wrote:
> 5116@telia.com said:
> > I have investigated this some more and I have come to the conclustion
> > that you are quite right. I disabled tagged queueing in the drivber
> > and it instantly bacame stable.
> 
> > Do you have any idea on how to proceed debugging this? 
> 
> Well here's my theory:
> 
> There are a number of reports with tag command queueing problems
> associated with these drives.  In particular, one for freebsd said 
> that the aic7xxx driver was reporting data overruns with TCQ enabled 
> on Quantum Fireballs.
Ok.

I have used these drives with i386 Linux without problems with both the
aix7xxx driver and the sym53c8xx driver. Both these drivers use a default of max
8 tags per lun, so I chnaged the value in your driver and it works.
So, maybe 8 tags per lun is the conservative default here ?

/Daneil 
-- 
