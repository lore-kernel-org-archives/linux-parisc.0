Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA03594
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 May 2000 15:11:58 -0600
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id SAA25453
	for parisc-linux@thepuffingroup.com; Tue, 23 May 2000 18:12:11 -0400
Date: Tue, 23 May 2000 18:12:11 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CVS cleanups
Message-ID: <20000523181211.E17536@thepuffingroup.com>
References: <20000523180827.D17536@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000523180827.D17536@thepuffingroup.com>; from willy@thepuffingroup.com on Tue, May 23, 2000 at 06:08:27PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, May 23, 2000 at 06:08:27PM -0400, willy@thepuffingroup.com wrote:
> 
> The following files have only their CVS id string changed in our CVS
> repo.  Would anyone like to fix them before we do the 2.3.99-pre8 merge
> on Friday?  I'm just going through now and preparing a list of files
> we'll need to pay attention to.

I really did just forget to attach the list of files, didn't I?  This cold
is getting to me.


linux-2.3/Documentation/usb/error-codes.txt
linux-2.3/Documentation/usb/uhci.txt
linux-2.3/arch/sparc/lib/ashldi3.S
linux-2.3/arch/sparc64/kernel/iommu_common.c
linux-2.3/arch/sparc64/kernel/iommu_common.h
linux-2.3/arch/sparc64/prom/map.S
linux-2.3/drivers/i2c/i2c-pcf8584.h
linux-2.3/drivers/scsi/README.aha152x
linux-2.3/drivers/telephony/ixj.c
linux-2.3/drivers/telephony/ixj.h
linux-2.3/drivers/usb/plusb.c
linux-2.3/drivers/zorro/names.c
linux-2.3/fs/cramfs/inflate/adler32.c
linux-2.3/fs/cramfs/inflate/uncompr.c
linux-2.3/fs/cramfs/inflate/zconf.h
linux-2.3/fs/cramfs/inflate/zutil.h
linux-2.3/include/asm-m68k/apollodma.h
linux-2.3/include/asm-ppc/hw_irq.h
linux-2.3/include/linux/i2c-algo-bit.h
linux-2.3/include/linux/i2c-algo-pcf.h
linux-2.3/include/linux/i2c-dev.h
linux-2.3/include/linux/i2c-elektor.h
linux-2.3/include/linux/ixjuser.h
linux-2.3/include/net/inetpeer.h
linux-2.3/net/ipv4/inetpeer.c
