Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA22919
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 01:48:42 -0600
To: Andreas <andi@fischlustig.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cd image does boot but console dies during kernel
 boot
In-Reply-To: Message from Andreas <andi@fischlustig.de>
   of "Thu, 10 Aug 2000 03:40:11 +0200." <399207FB.3A6EBEFA@fischlustig.de>
References: <399207FB.3A6EBEFA@fischlustig.de> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 09 Aug 2000 19:50:37 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000810015037.226F9381A0@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Andreas writes...

> I tried the recent kernels and the developer snapshot cd.
> My machine is a 712/60 with 128MB RAM.
> 
> here the last two lines from the kernel output
> 
> ttyS00 at iomem 0xf0105800 (irq = 538) is a 16550A
> pdc_cons die!!

Everyone sees that error currently.

I assume you are watching this output on the graphics console?  At this point 
the kernel switches over to the serial for console.  You have two options,

1. Plug in a serial console(minicom and a null-modem cable work well). In this 
case you may also want to hack the firmware console to serial so you get 
everything in one place. See,

http://puffin.external.hp.com/mailing-lists/parisc-linux/1999/12-Dec/0091.html

for instructions. You will need an HP-UX disk to boot from and serial console 
on the 712 is not supported by HP. But it works fine.


2. Switch to a kernel that uses STI instead of serial.  Then you will get all 
output on the graphics console. To do this use a kernel built with 
CONFIG_STI_CONSOLE enabled.

-- 
Matt Taggart
taggart@fc.hp.com
