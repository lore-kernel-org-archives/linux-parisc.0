Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AC7D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 09:54:11 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Kernel panic with -pa48
Message-ID: <1002902036.3bc712146327e@webmail.tiscalinet.be>
Date: Fri, 12 Oct 2001 17:53:56 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net,
	Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
References: <1002899016.3bc70648db602@webmail.tiscalinet.be> <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Here is my kernel messages that pertain to SCSI (with pa42, sorry I have to made
some place):

Oct 12 15:42:52 palinux2 kernel: SCSI subsystem driver Revision: 1.00
Oct 12 15:42:52 palinux2 kernel: sim700: Configuring 53c710 (SCSI-ID 7) at
f0106100, IRQ 86, options 0
Oct 12 15:42:52 palinux2 kernel: scsi0: Revision 0x2
Oct 12 15:42:52 palinux2 kernel: scsi0: test 1 completed ok.
Oct 12 15:42:52 palinux2 kernel: scsi0 : LASI/Simple 53c7xx
Oct 12 15:42:52 palinux2 kernel:   Vendor: SEAGATE   Model: ST34572N         
Rev: HP03
Oct 12 15:42:52 palinux2 kernel:   Type:   Direct-Access                     
ANSI SCSI revision: 02
Oct 12 15:42:52 palinux2 kernel:   Vendor: HP        Model: C3325A           
Rev: HP08
Oct 12 15:42:52 palinux2 kernel:   Type:   Direct-Access                     
ANSI SCSI revision: 02
Oct 12 15:42:52 palinux2 kernel: Attached scsi disk sda at scsi0, channel 0, id
3, lun 0
Oct 12 15:42:52 palinux2 kernel: Attached scsi disk sdb at scsi0, channel 0, id
6, lun 0
Oct 12 15:42:52 palinux2 kernel: SCSI device sda: 8388314 512-byte hdwr sectors
(4295 MB)
Oct 12 15:42:52 palinux2 kernel: Partition check:
Oct 12 15:42:52 palinux2 kernel:  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
Oct 12 15:42:52 palinux2 kernel: SCSI device sdb: 4194685 512-byte hdwr sectors
(2148 MB)
Oct 12 15:42:52 palinux2 kernel:  sdb: unknown partition table
Oct 12 15:42:52 palinux2 kernel: Lasi Harmony Audio rev. 18 at 0xf0104000, using
IRQ 82

Is it enough help?

        joel


Quoting Matthew Wilcox <willy@debian.org>:

> On Fri, Oct 12, 2001 at 05:03:36PM +0200, joel.soete@freebel.net wrote:
> > I met following problem with pa48 (on a 712/80):
> > 
> > ...
> > VFS: Cannot open root device "sda3" or "08:03"
> > Please append a correct "root=" boot option
> > Kernel panic: vfs Unable to mount root fs on "08:03"
> > 
> > (I check if the fs is still correct. And I can still boot with
> 2.4.9-pa45.
> > So it could not any more recognise ext2fs)
> 
> Umm.. I doubt your diagnosis is correct.  Can you send your kernel
> messages
> that pertain to SCSI?  I have a 712/80 here which boots -pa48 just
> fine.
> 
> Linux 15.1.54.8 2.4.9-pa48 #125 Thu Oct 11 20:55:54 MDT 2001 parisc
> unknown
> 
> SCSI subsystem driver Revision: 1.00
> 53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
> scsi0: 53c710 rev 2
> scsi0 : LASI SCSI 53c700
> scsi0: (6:0) Synchronous at offset 8, period 100ns
>   Vendor: SEAGATE   Model: ST31230N          Rev: HP04
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
> scsi0: (6:0) Enabling Tag Command Queuing
> SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
> Partition check:
>  sda: sda1 sda2
> 
> I can fsck, mount sda2 without any trouble.
> 
> > Is it in relation with your mail:
> >
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-October/014100.html
> 
> No, that's to do with SuperIO on B1000 - J7000 workstations.  Plus,
> -pa48 fixed that problem :-)
> 
> -- 
> Revolutions do not require corporate support.
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
