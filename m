Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39AF5482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Mar 2001 15:01:23 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14gw63-0008MI-00; Sat, 24 Mar 2001 22:01:19 +0000
Date: Sat, 24 Mar 2001 22:01:19 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Brian Stewart <pdksh@hotmail.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Help with 710 Network Driver
Message-ID: <20010324220119.A31126@parcelfarce.linux.theplanet.co.uk>
References: <OE60stPGtPrPrvCWO6h00005419@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE60stPGtPrPrvCWO6h00005419@hotmail.com>; from pdksh@hotmail.com on Sat, Mar 24, 2001 at 08:58:11AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 24, 2001 at 08:58:11AM -0500, Brian Stewart wrote:
> I am interested in trying to resolve some of the problems with the 710 with
> its LAN and SCSI problems. I am not a Programming GURU but the re-write of
> the LAN driver should not be too far beyond my abilities. I would appreciate
> anyone's observations and details regarding the failure of the LAN drivers
> on a 710 or 705.
> 
> My observations;
> 1) You can not compile the kernel (finial link fails) without
> GSC/PCI/EISA/WAX support
>   - 710/705 do not have any of the above features.

The `GSC' support is really a misnomer.  It's really a `raw read/write
to PA I/O space'.  It's used on boxes which predate and postdate GSC.
I have some changes planned which will address this misnomer, but I
haven't had a chance to do them yet.

> 4) The driver does not initialise its memory properly - message is posted at
> boot
>   - This again does not appear to be "ideal" in the mind of the driver

The driver is attempting to obtain cache-coherent memory.  This is not
available on machines prior to PCX-L (eg 705, 710, 715/Scorpio, 730,
735, etc).  So it drops back to using non-coherent memory and causing
cache flushes before writes and after reads.

> I believe that if the LAN driver is corrected it would be a small jump to
> address the broken SCSI driver. I have some logs of the failures but I am at
> work right now and to make matters worse I will be on a business trip next
> week, access to my mail but not my HP or logs.
> 
> If anyone is interested please let me know, This box is too much fun to
> spend its time wasting away with mklinux installed.

Richard (who is the original author of both these drivers) believes that
the problem is with the IRQ handling from the Asp chip.  Unfortunately
I've been unable to locate documentation for this device as yet.

Thanks for volunteering.

-- 
Revolutions do not require corporate support.
