Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA748482A
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 07:25:10 -0700 (MST)
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <1008771313.3c20a0f14484a@nyepost.start.no>
Date: Wed, 19 Dec 2001 15:15:13 +0100 (CET)
From: Andy Walker <squawker@start.no>
Cc: Andy Walker <squawker@start.no>, parisc-linux@parisc-linux.org
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no> <20011219113621.X1897@linuxcare.com>
In-Reply-To: <20011219113621.X1897@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Quoting Richard Hirst <rhirst@linuxcare.com>:
> > 
> > ...
> > 18. Bluefish Add-on FW-SCSI (4) at 0xfff8c000 [11], versions 0x13,
> 0x0, 0x89
> > ...
> > zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> > ncr53c8xx: 53c720 detected
> > ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> > scsi0 : ncr53c8xx-3.4.3b-20010512
> 
> Don't know why that is failing; does it always fail, or is it an
> intermittant problem?  e.g. Are the disks detected at boottime?
> 
> You might try booting with something like
> 
> ncr53c8xx=sync:255,burst:0,verb:2
> 
> which slows it down and might help if it is intermittant (just guessing
> though)
> 
> Richard
> 

Hi Richard,

Yep, it always fails. If there's a disk on the bus (I've tried a couple
of different ones) it will always hang on boot with timeouts and bus
resets when trying to find the disk.

To triple check the termination, I installed the terminator packs on
the card and moved the cable from the internal connector to the
external one. No difference there, even with your kernel parameter
suggestion.

Here's the verbose output from a boot without a disk connected:

zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 
setup=disc:y,specf:3,tags:8,sync:255,burst:0,wide:y,diff:0,revprob:n,buschk:0x1
ncr53c8xx: 
setup=mpar:y,spar:y,fsn=n,verb:2,debug:0x0,led:n,settle:2,irqm:0x0,nvram:0x1,pci
fix:0x0
ncr53c8xx: 53c720 detected
ncr53c720-0: using memory mapped IO at virtual address 0xfff8c800
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: initial SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 00/00/20/00/80/00
ncr53c720-0: final   SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 03/00/20/00/88/00
ncr53c720-0: resetting, command processing suspended for 2 seconds
ncr53c720-0: restart (scsi reset).
scsi0 : ncr53c8xx-3.4.3b-20010512
ncr53c720-0: command processing resumed

I'm gonna try one more disk, one that I've tested with Linux on the B132,
but that won't be until tomorrow.

-Andy



------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
