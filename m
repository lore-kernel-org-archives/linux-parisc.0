Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8728A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Oct 2001 03:56:23 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 56CD0B00C; Wed, 17 Oct 2001 10:56:41 +0100 (BST)
Date: Wed, 17 Oct 2001 10:56:41 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Daniel Engstrom <5116@telia.com>
Cc: parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
Message-ID: <20011017105641.G11105@linuxcare.com>
References: <20011008230949.U11105@linuxcare.com> <20011013233216.A24926@zaphod.halden.lillfab.se> <20011016101716.A11105@linuxcare.com> <20011017000833.C10728@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017000833.C10728@zaphod.halden.lillfab.se>; from 5116@telia.com on Wed, Oct 17, 2001 at 12:08:33AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 17, 2001 at 12:08:33AM +0200, Daniel Engstrom wrote:
> 
> > > I have some problems with this driver on my 715-50/old installed from the 
> > > 0.92 cd.
> > 
> > We've had one problem report so far that was fixed by adding a scsi
> > terminator. 
> Well I have terminators at both ends, the external one is an active terminator 
> and the internal on is the original HP part. 
> I also tried to remov the external CD from the bus to day but it had no effect.
> 
> > The new driver runs fast sync scsi transfers, while the old one ran slower
> > async. 
> The 715 i have have a vanilla 53c700 chip and as far as I can tell this chip 
> supports only async transfers. The driver will not enable sync tranfers unless 
> you have at least a 53c700-66 device.

Yes, I think you are right there.

> > Also let us know what you system has by way of scsi termination.
> See above. I have two 3G Quantum drives on the bus and until today I had a dual speed
> Toshiba CDROM in an external enclosure.
> 
> I have enabled debugging in the 53c700 driver, whith this debugging the driver seems 
> to stay alive longer that without debuging. Infact it has yet to lockup after running 
> bonnie for 18 minutes (I booted an nfs root and mounted the scsi disk maunaly). I guess
> the debuging printk's removed the lockup. I just rebooted in to the nfs root with a new 
> kernel where the only change is the removal of the debug output, and this kernel dies after
> a while (~10min) running bonnie. Please advise. :)

I don't think 18 mins with no lockup against 10 mins with lockup is
conclusive really, given that the debugging will have slowed things
down considerably.  How long have you run bonnie for with the old
driver?  I'd like to see that run for say 1 hour without lockups
before we assumed the new driver was causing a problem.

When it fails, I'd expect the scsi layer to time out any active
commands and retry.  Is there any evidence of it doing that, or
is there no console output at all?

Richard
