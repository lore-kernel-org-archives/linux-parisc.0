Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11276
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Mar 2000 16:35:08 -0700
Message-Id: <200003222233.XAA11675@zaphod.halden.lillfab.se>
Date: Wed, 22 Mar 2000 23:33:21 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] PALO and ramdisk micro-howto
To: Paul Bame <bame@endor.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
In-Reply-To: <E12XSiA-00022u-00@endor.fc.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On 21 Mar, Paul Bame wrote:
> In palo/Makefile, comment out NFSROOT= and uncomment the RAMDISK= line
> which assumes your ramdisk is the file ../linux-2.3/ramdisk.bin which
> is the way we used to have things.  Make sure you have a ramdisk in that
> file (or change RAMDISK=).
> 
I tried this with my 715/50 and current CVS kernel and palo as of today.

I got the following results:

[...]

RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
SCSI clock: 50000000
Lasi Scsi (53c700) found at 0xf0825100
scsi-ncr53c7xx : unsupported SCSI chip 700
scsi : 0 hosts.
scsi : detected total.
IP-Config: No network devices available.
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 600 blocks [1 disk] into ram disk... done. 
kernel BUG at block_dev.c:411! 
kernel BUG at block_dev.c:411!


Any ideas?

/Daniel

-- 
Daniel Engström - Lilla Fabriken AB - Technical Support
daniel@lillfab.se - Work related.  5116@telia.com - Private.
