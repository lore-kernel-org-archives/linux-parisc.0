Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 929544A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 15:50:26 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA32661
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Feb 2001 15:46:17 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A79E703.390B75AB@dot.at>
Date: Thu, 01 Feb 2001 23:45:23 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: penfold@customware.com.au
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 720/50 SCSI - supported?
References: <200102011141.WAA11608@customware.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ni, I don't know this problem. The only problem I had was with the
floppy in
my 720. One command is not supported (or so, I have not debugged it).
For the first tests I disconnects the SCSI cable from the floppy
interface card
to be able to boot faster, as the SCSI driver does retries.

Cheers
	Christoph P.


penfold@customware.com.au wrote:
> 
> Hi,
> 
> after successfully cross compiling a kernel, I have a problem!
> 
> The initial bus scan seems to see the scsi controller:
> model   00002000 00000481 00000000 00000000 775e3623 000011f4 00000004 0000000d
> 00000000
> vers    00000003
> CPUID   vers 0 rev 0
> model   9000/720
> led_init: CPU_HVERSION 200
> Searching for devices in PDC firmware... processor hpa 0xfffbe000
>  an older box...
> Found devices:
> 1. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
> 2. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0
> 
> but the driver seems to have a problem here!
> 
> SCSI subsystem driver Revision: 1.00
> sim700: Couldn't get consistent shared memory
> sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
> scsi0: Revision 0x0
> Post test1, istat 05, sstat0 00, dstat 81
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: test 1 FAILED: dsps: exp 0xab93001d, got 0x65686361
> scsi0: Chip register contents:
>  (script[0] at virt c7f70000, bus 7f70000)
>  00  sien:  af  sdid:  00  scntl1:20  scntl0:c4
>  04  socl:  00  sodl:  00  sxfer: 00  scid:  80
>  08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
>  0C  sstat2:00  sstat1:00  sstat0:00  dstat: 80
>  10
>  14  ctest3:92  ctest2:21  ctest1:f0  ctest0:00
>  18  ctest7:00  ctest6:53  ctest5:00  ctest4:00
>  1C  temp:  00000000
>  20              ctest8:ff  istat: 06  dfifo: 32
>  24  dbc:   635f7472  dnad:  65686361  dsp:   07f774b4
>  30  dsps:  65686361
>  34  dmode: 80
>  38  dcntl: 80  dwt:   00  dien:  1d
>  3C
> Warning : device (10, 0x4, 0x0, 0x71, 0x0) NOT claimed by Lasi SCSI 53c700
> 
> Is this a known problem ?
> 
> thanks,
> 
> Damian
> penfold@customware.com.au
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
