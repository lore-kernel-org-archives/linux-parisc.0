Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 552D9482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Mar 2001 14:53:55 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2E411B008; Sat, 24 Mar 2001 21:54:25 +0000 (GMT)
Date: Sat, 24 Mar 2001 21:54:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Brian Stewart <pdksh@hotmail.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Help with 710 Network Driver
Message-ID: <20010324215424.E20902@linuxcare.com>
References: <OE60stPGtPrPrvCWO6h00005419@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE60stPGtPrPrvCWO6h00005419@hotmail.com>; from pdksh@hotmail.com on Sat, Mar 24, 2001 at 08:58:11AM -0500
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I have looked at this a bit (remotely, I don't have a 710), and my
conclusion is that both scsi and lan drivers are talking to the
chips just fine.  The problem seems to be that the drivers never
receive interrupts from the chips, which probably means that the
interrupt routing needs setting up differently on these old machines.
Unfortunately I don't have access to any relevant documentation.

Richard


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
> 2) The LAN driver ./drivers/net/lasi_89586.c has links to ./asm/gsc.h
>   - again there is no lasi or gsc support in the 710/705
> 3) The driver loads but has a message about "blindly" reading the PROM MAC
>   - This does not appear to be "ideal" in the mind of the driver
> 4) The driver does not initialise its memory properly - message is posted at
> boot
>   - This again does not appear to be "ideal" in the mind of the driver
> 5) The Lan driver is actually working - sending TX during a BOOTP request
>   - It is IMHO trying to talk to a "LASI" or "GSC" controller that does not
> exist
>     This sorta explains why it appears as if the wires were cut of the LAN
> chip
> 
> I believe that if the LAN driver is corrected it would be a small jump to
> address the broken SCSI driver. I have some logs of the failures but I am at
> work right now and to make matters worse I will be on a business trip next
> week, access to my mail but not my HP or logs.
> 
> If anyone is interested please let me know, This box is too much fun to
> spend its time wasting away with mklinux installed.
> 
> Thank You
> 
> *************************************************
> Brian Stewart
> pdksh@hotmail.NO.SPAM.com
> http://www3.sympatico.ca/trillian
> *************************************************
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
