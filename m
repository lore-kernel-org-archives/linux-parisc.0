Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86DFF482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 11:42:23 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Kernel panic with -pa48
Message-ID: <1002908535.3bc72b77e40fd@webmail.tiscalinet.be>
Date: Fri, 12 Oct 2001 19:42:15 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net,
	Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
References: <1002899016.3bc70648db602@webmail.tiscalinet.be> <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Matt,

Just co -pa49 and boot again but strange behaviour (as with pa45).
Here the SCSI kernel messages:

>>> it tacks a long time (15s) before displaying the LOGO
....
Oct 12 17:22:34 palinux2 kernel: SCSI subsystem driver Revision: 1.00
Oct 12 17:22:34 palinux2 kernel: 53c700: Version 2.6 By
James.Bottomley@HansenPartnership.com
Oct 12 17:22:34 palinux2 kernel: scsi0: 53c710 rev 2
Oct 12 17:22:34 palinux2 kernel: scsi0 : LASI SCSI 53c700
Oct 12 17:22:34 palinux2 kernel: scsi0: (3:0) Synchronous at offset 8, period 100ns
Oct 12 17:22:34 palinux2 kernel:   Vendor: SEAGATE   Model: ST34572N         
Rev: HP03
Oct 12 17:22:34 palinux2 kernel:   Type:   Direct-Access                     
ANSI SCSI revision: 02
Oct 12 17:22:34 palinux2 kernel: scsi0: (6:0) Synchronous at offset 8, period 100ns
Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants to abort
command
Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants device reset
Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants BUS reset,
cmd 1006e800
Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
Oct 12 17:22:34 palinux2 kernel: scsi0: Bus Reset detected, executing command
1006e800, slot 00010520, dsp 00070528[0528]
Oct 12 17:22:34 palinux2 kernel:  failing command because of reset, slot
00010520, cmnd 1006e800
Oct 12 17:22:34 palinux2 kernel: scsi0: (6:0) Synchronous at offset 8, period 100ns
Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants to abort
command
Oct 12 17:22:34 palinux2 kernel: ^I0x03 00 00 00 40 00
Oct 12 17:22:34 palinux2 kernel: scsi: device set offline - not ready or command
retry failed after bus reset: host 0 chan
nel 0 id 6 lun 0

>>> here it takes a long time (about 30 seconds) before continuing?


Oct 12 17:22:34 palinux2 kernel: Attached scsi disk sda at scsi0, channel 0, id
3, lun 0
Oct 12 17:22:34 palinux2 kernel: scsi0: (3:0) Enabling Tag Command Queuing
Oct 12 17:22:34 palinux2 kernel: scsi0 (3:0) New error handler wants to abort
command
Oct 12 17:22:34 palinux2 kernel: ^I0x00 00 00 00 00 00
Oct 12 17:22:34 palinux2 kernel: scsi0: Bus Reset detected, executing command
1006e800, slot 00010520, dsp 00070528[0528]
Oct 12 17:22:34 palinux2 kernel:  failing command because of reset, slot
00010520, cmnd 1006e800
Oct 12 17:22:34 palinux2 kernel:  failing command because of reset, slot
00010654, cmnd 1005e800
Oct 12 17:22:34 palinux2 kernel: scsi0 (3:0) New error handler wants device reset
Oct 12 17:22:34 palinux2 kernel: ^I0x00 00 00 00 00 00
Oct 12 17:22:34 palinux2 kernel: scsi0 (3:0) New error handler wants BUS reset,
cmd 1005e800
Oct 12 17:22:34 palinux2 kernel: ^I0x00 00 00 00 00 00
Oct 12 17:22:34 palinux2 kernel: scsi0: Bus Reset detected, executing command
00000000, slot 00000000, dsp 00070528[0528]
Oct 12 17:22:34 palinux2 kernel: scsi0: (3:0) Synchronous at offset 8, period 100ns
Oct 12 17:22:34 palinux2 kernel: SCSI device sda: 8388314 512-byte hdwr sectors
(4295 MB)
Oct 12 17:22:34 palinux2 kernel: Partition check:
Oct 12 17:22:34 palinux2 kernel:  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >

I hope it will be more helpfull.
      joel

PS: Now I have to leave office. Have a nice week-end.

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
