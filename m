Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA09454
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 05:50:50 -0600
Received: from ppp-1-219.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.219)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 11:50:35 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D201DB005; Fri, 18 Aug 2000 12:49:44 +0100 (BST)
Date: Fri, 18 Aug 2000 12:49:44 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000818124944.A13870@linuxcare.com>
References: <20000815160510.C7757@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000815160510.C7757@vodka.thepuffingroup.com>; from matthew@wil.cx on Tue, Aug 15, 2000 at 04:05:10PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  The tulip driver doesn't initialise with the 2.4.0-test6 kernel
(for me, anyway).
The problem is that pci_resource_start (pdev, 0) in tulip_core.c
line 1046, returns 0x0001ff00, where it should (I think) return
0x0000ff00.  I added a printk in drivers/pci/pci.c to show the
start/end values as it filled in the pci_dev->resource table,
and that showed start 0x0000ff00 end 0x0000ff7e.  Don't know
where bit 16 gets added to start..

I just commented out the 'goto err_out_free_netdev' in tulip_core.c
and it now claims to mount nfs root, but cannot find init.
I had to comment out the unregistering of pdc console to
see that.

In 2.3.99pre8 tulip announced that the chip was at 0x1ff00 also,
but it didn't matter because the request_region call was different.

My 53c720 driver doesn't work any more either :-(

Richard
