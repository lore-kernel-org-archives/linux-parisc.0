Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADB2D483C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 09:19:34 -0700 (MST)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] STI without PCI
Message-ID: <1016468351.3c96137f696f0@webmail.tiscalinet.be>
Date: Mon, 18 Mar 2002 17:19:11 +0100 (CET)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1016466919.3c960de7350ce@webmail.tiscalinet.be> <20020318155833.M21765@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020318155833.M21765@parcelfarce.linux.theplanet.co.uk>
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

Quoting Matthew Wilcox <willy@debian.org>:

> On Mon, Mar 18, 2002 at 04:55:19PM +0100, joel.soete@freebel.net wrote:
> > I uncheck CONFIG_PCI in my .config file then make menuconfig and make
> dep ; make
> > cklean ; make vmlinux.
> > 
> > It compiles successfully (with apt-get dist-upgrade this morning).
> 
> thanks.
> 
> umm.. could you show the portions of your boot log relating to scsi or
> sda?
> 

For sure (I would have to add, sorry):
SCSI subsystem driver Revision: 1.00
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi0: (3:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32151N          Rev: HP02
  Type:   Direct-Access                      ANSI SCSI revision: 02
scsi0: (4:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST34371N          Rev: HPM2
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 4, lun 0
scsi0: (3:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: unknown partition table
scsi0: (4:0) Enabling Tag Command Queuing
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
 sdb: unknown partition table

(well it works with k-2.4.18-pa4 from last this March 12 and I just restart to
compile this new pa5 with previous .config to compare)

    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
