Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA15737
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 11:05:33 -0700
Date: Wed, 24 Jan 2001 12:06:23 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and newest CVS bits 
In-Reply-To: <200101241708.JAA20961@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0101241157050.25744-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Wed, 24 Jan 2001, Grant Grundler wrote:

> Greg Ingram wrote:
> > ccio-dma.c:738: Assertion size > 0 failed!
> > Kernel panic: size > 0                                                       
> 
> Bogus ASSERT. Ryan committed the fixes last night. Please try again.

I pulled ccio-dma.c again and it still has the ASSERT at line 738.  If I
remove it, the kernel dies at line 385:
	
	ASSERT(pages_needed);

If I remove it, death occurs are line 460:

	ASERT(pages_mapped);

I've appended messages again.  Is the message from sim700 important?  Or
is it just telling me that I don't have that hardware?  The very last line
is different too.

- Greg

SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86, options 0
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST11200N SUN1.05  Rev: 8358
  Type:   Direct-Access                      ANSI SCSI revision: 02
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: restart (scsi reset).
scsi1 : ncr53c8xx - version 3.3b
  Vendor: SEAGATE   Model: ST32430W          Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
ncr53c720-0-<6,0>: tagged command queue depth set to 8
Detected scsi disk sda at scsi0, channel 0, id 0, lun 0
Detected scsi disk sdb at scsi1, channel 0, id 6, lun 0
 
ccio-dma.c:460: Assertion pages_mapped failed!
Kernel panic: pages_mapped
In interrupt handler - not syncing
   
