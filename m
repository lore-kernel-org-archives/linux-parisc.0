Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20480482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 20:19:51 -0600 (MDT)
Date: Thu, 23 Aug 2001 22:19:16 -0400 (EDT)
From: <nick@snowman.net>
To: Matthew Wilcox <willy@debian.org>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010824023133.A32128@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0108232219001.32506-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86, options 0
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
scsi0: Unable to abort command for target 0
scsi0: Unable to send Bus Device Reset for target 0
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00088018 (script[0x0006]), dsps = 00088448, target = 0
scsi0: Failing command for ID0
scsi0: Unable to abort command for target 0
scsi0: Unable to abort command for target 1
scsi0: Unable to send Bus Device Reset for target 1
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00088018 (script[0x0006]), dsps = 00088448, target = 0
scsi0: Failing command for ID0
scsi0: Unable to abort command for target 1
  Vendor:           Model:                   Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 00
scsi0: Unable to abort command for target 2
scsi0: Unable to send Bus Device Reset for target 2
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00089018 (script[0x0406]), dsps = 00089448, target = 0
scsi0: Failing command for ID1
scsi0: Unable to abort command for target 2


If you need more of the boot messages I can provide them.
	Nick

On Fri, 24 Aug 2001, Matthew Wilcox wrote:

> On Thu, Aug 23, 2001 at 03:33:36PM -0400, nick@snowman.net wrote:
> > Ok, only one more question hopefully.  I updated my PDC firmware from v2.7
> > to v6.1, that went fine.  I tried booting a 32bit lifimage, that worked
> > untill it got to the SCSI, at which point it spat out lots of errors for
> > id's 0, 1 and 2, then locked.  Is there something special I need to do to
> > keep C180's scsi happy?  I am useing the debian iso's lifimages right now.
> 
> I don't recognise this problem, can you post the SCSI messages?
> 
> -- 
> Revolutions do not require corporate support.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
