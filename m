Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailb.telia.com (mailb.telia.com [194.22.194.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id DECF0482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 12:43:41 -0600 (MDT)
Date: Thu, 18 Oct 2001 20:43:34 +0200
From: Daniel Engstrom <5116@telia.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
Message-ID: <20011018204334.C6663@zaphod.halden.lillfab.se>
References: <20011008230949.U11105@linuxcare.com> <20011013233216.A24926@zaphod.halden.lillfab.se> <20011016101716.A11105@linuxcare.com> <20011017000833.C10728@zaphod.halden.lillfab.se> <20011017105641.G11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <20011017105641.G11105@linuxcare.com>; from rhirst@linuxcare.com on Wed, Oct 17, 2001 at 11:56:41 +0200
List-ID: <linux-parisc.vger.kernel.org>

On 2001.10.17 11:56 Richard Hirst wrote:
 
> I don't think 18 mins with no lockup against 10 mins with lockup is
> conclusive really, given that the debugging will have slowed things
> down considerably. 
 
Yes, you have a point. But I want to mention that after the bonnie-runI
also ran a e2fsck on my root filesystem while it was dirty and it finnished
which it had never done with the new driver w/o the debug-output.

> How long have you run bonnie for with the old
> driver?  I'd like to see that run for say 1 hour without lockups
> before we assumed the new driver was causing a problem.
I have done three runs in a row with 100Mb data, I dont know how long this takes, 
but say almost an hour.

> When it fails, I'd expect the scsi layer to time out any active
> commands and retry.  Is there any evidence of it doing that, or
> is there no console output at all?
No output at all. Interrupts still work; the box answers pings and echoes the 
console input, but nothing else works.


/Daniel
-- 
