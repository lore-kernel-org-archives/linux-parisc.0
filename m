Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA22715
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 01:33:47 -0600
Sender: andi@mailserv2.iuinc.com
Message-ID: <399207FB.3A6EBEFA@fischlustig.de>
Date: Thu, 10 Aug 2000 03:40:11 +0200
From: Andreas <andi@fischlustig.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cd image does boot but console dies during kernel boot
List-ID: <linux-parisc.vger.kernel.org>

I tried the recent kernels and the developer snapshot cd.
My machine is a 712/60 with 128MB RAM.

here the last two lines from the kernel output

ttyS00 at iomem 0xf0105800 (irq = 538) is a 16550A
pdc_cons die!!
