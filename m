Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA13294
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Mar 2000 20:02:30 -0700
From: willy@thepuffingroup.com
Date: Wed, 22 Mar 2000 22:02:29 -0500
To: 5116@telia.com
Cc: Paul Bame <bame@endor.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PALO and ramdisk micro-howto
Message-ID: <20000322220229.D10226@thepuffingroup.com>
References: <E12XSiA-00022u-00@endor.fc.hp.com> <200003222233.XAA11675@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003222233.XAA11675@zaphod.halden.lillfab.se>; from 5116@telia.com on Wed, Mar 22, 2000 at 11:33:21PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 22, 2000 at 11:33:21PM +0100, 5116@telia.com wrote:
> I tried this with my 715/50 and current CVS kernel and palo as of today.

> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> SCSI clock: 50000000
> Lasi Scsi (53c700) found at 0xf0825100
> scsi-ncr53c7xx : unsupported SCSI chip 700

hehehe... someone's going to have to fix that someday...

> scsi : 0 hosts.
> scsi : detected total.
> IP-Config: No network devices available.
> RAMDISK: ext2 filesystem found at block 0
> RAMDISK: Loading 600 blocks [1 disk] into ram disk... done. 
> kernel BUG at block_dev.c:411! 
> kernel BUG at block_dev.c:411!

those two are OK, they should disappear when we go to the latest Linus
tree.  What's happening at this point is that it's switching to serial
console.  You should be able to stay with PDC console for the time being,
though you can't use it as an input device, only output.  In the fullness
of time, we'll have a proper graphics console.  Stay tuned :-)
