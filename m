Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4396A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 09:27:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15s4Da-0005Sa-00; Fri, 12 Oct 2001 16:27:22 +0100
Date: Fri, 12 Oct 2001 16:27:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic with -pa48
Message-ID: <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk>
References: <1002899016.3bc70648db602@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002899016.3bc70648db602@webmail.tiscalinet.be>; from joel.soete@freebel.net on Fri, Oct 12, 2001 at 05:03:36PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 12, 2001 at 05:03:36PM +0200, joel.soete@freebel.net wrote:
> I met following problem with pa48 (on a 712/80):
> 
> ...
> VFS: Cannot open root device "sda3" or "08:03"
> Please append a correct "root=" boot option
> Kernel panic: vfs Unable to mount root fs on "08:03"
> 
> (I check if the fs is still correct. And I can still boot with 2.4.9-pa45.
> So it could not any more recognise ext2fs)

Umm.. I doubt your diagnosis is correct.  Can you send your kernel messages
that pertain to SCSI?  I have a 712/80 here which boots -pa48 just fine.

Linux 15.1.54.8 2.4.9-pa48 #125 Thu Oct 11 20:55:54 MDT 2001 parisc unknown

SCSI subsystem driver Revision: 1.00
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2
scsi0 : LASI SCSI 53c700
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST31230N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
Partition check:
 sda: sda1 sda2

I can fsck, mount sda2 without any trouble.

> Is it in relation with your mail:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-October/014100.html

No, that's to do with SuperIO on B1000 - J7000 workstations.  Plus,
-pa48 fixed that problem :-)

-- 
Revolutions do not require corporate support.
