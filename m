Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailf.telia.com (mailf.telia.com [194.22.194.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7294482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 16:08:39 -0600 (MDT)
Date: Wed, 17 Oct 2001 00:08:33 +0200
From: Daniel Engstrom <5116@telia.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
Message-ID: <20011017000833.C10728@zaphod.halden.lillfab.se>
References: <20011008230949.U11105@linuxcare.com> <20011013233216.A24926@zaphod.halden.lillfab.se> <20011016101716.A11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <20011016101716.A11105@linuxcare.com>; from rhirst@linuxcare.com on Tue, Oct 16, 2001 at 11:17:16 +0200
List-ID: <linux-parisc.vger.kernel.org>

> > I have some problems with this driver on my 715-50/old installed from the 
> > 0.92 cd.
> 
> We've had one problem report so far that was fixed by adding a scsi
> terminator. 
Well I have terminators at both ends, the external one is an active terminator 
and the internal on is the original HP part. 
I also tried to remov the external CD from the bus to day but it had no effect.

> The new driver runs fast sync scsi transfers, while the old one ran slower
> async. 
The 715 i have have a vanilla 53c700 chip and as far as I can tell this chip 
supports only async transfers. The driver will not enable sync tranfers unless 
you have at least a 53c700-66 device.

> Poorly terminated scsi busses are much more likely to fail with the new driver.  
> James Bottomley posted a patch to disable sync transfers a few days ago, 
> could you try that and see if it helps?  
This patch will only disable sync transfers if you have a 53c710, I changed it to
disable sync tranfsers regardless of the chip in question. It did not make things 
any  better, though (as one would expect considering the capabilities of my chip). 

> Also let us know what you system has by way of scsi termination.
See above. I have two 3G Quantum drives on the bus and until today I had a dual speed
Toshiba CDROM in an external enclosure.

I have enabled debugging in the 53c700 driver, whith this debugging the driver seems 
to stay alive longer that without debuging. Infact it has yet to lockup after running 
bonnie for 18 minutes (I booted an nfs root and mounted the scsi disk maunaly). I guess
the debuging printk's removed the lockup. I just rebooted in to the nfs root with a new 
kernel where the only change is the removal of the debug output, and this kernel dies after
a while (~10min) running bonnie. Please advise. :)

/Daniel

-- 
