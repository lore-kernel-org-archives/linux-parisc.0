Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA11449
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 16:58:39 -0700
Message-ID: <19991208200838.B3557@thepuffingroup.com>
Date: Wed, 8 Dec 1999 20:08:38 -0500
From: Phil Schwan <pschwan@thepuffingroup.com>
To: Nils Bokermann <nilsb@bermuda.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715-75 (netboot?)
References: <14414.61066.628924.132344@hercules.bermuda.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <14414.61066.628924.132344@hercules.bermuda.de>; from Nils Bokermann on Thu, Dec 09, 1999 at 12:49:30AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Dec 09, Nils Bokermann wrote:
> Is there a way to boot linux on a HP 9000 (apollo) 715-75 over the net
> (yes -- it is, with rbootd, wich runs here). But HOW can I get a
> ramdisk to my HP??

At the moment, the ramdisk is linked into the kernel image.  When you
"make Image", it pulls "ramdisk.bin" from your top-level kernel source
directory.

-Phil
