Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3748B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 09:31:05 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 00C32B00C; Tue, 18 Sep 2001 16:30:15 +0100 (BST)
Date: Tue, 18 Sep 2001 16:30:15 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: marka@sea.checkpoint.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing a native built kernel with 2.4.0 (.92 dist).
Message-ID: <20010918163015.Q19441@linuxcare.com>
References: <Pine.NEB.4.33.0109172318580.16734-100000@www2.scram.de> <Pine.WNT.4.33.0109171459100.1080-100000@nemo.dev.metainfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.WNT.4.33.0109171459100.1080-100000@nemo.dev.metainfo.com>; from marka@sea.checkpoint.com on Mon, Sep 17, 2001 at 03:13:40PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 17, 2001 at 03:13:40PM -0700, marka@sea.checkpoint.com wrote:
> 
> I've successfully installed and upgraded with the .92 distro, but I'm having
> trouble getting a natively built kernel with this distro to load.
> 
> the load will either freeze at 'branching to kernel entry point' or
> on the last time I rebuilt and copied, it complained:
> 
> Couldn't grok your kernel executable format
> failed to load kernel

If you are netbooting, you use a lifimage, if you are booting
from disk you use the vmlinux file produced from building the
kernel.

> this is with kernel-latest and palo-latest from Sep 7 on a b180l
> 
> I select PA7300LC on 'make oldconfig' (this sets CONFIG_PA7100LC=y in
> .config).

The config we use for the official kernels is in arch/parisc/debian-configs/32,
you can "make distclean; cp arch/parisc/debian-configs/32 .config;
make oldconfig; make; cp vmlinux /boot/vmtest", then reboot, interact
with IPL and change the vmlinux-whatever name to be vmtest.

> Any tips from the pros on building and installing -latest natively?  I'd
> really like to get the fixes in 2.4.9, and there must be something more
> interesting that needs to be done than copying/renaming lifimage over to /boot
> and updating palo.conf and re-running palo.

Don't copy lifimages to /boot, copy vmlinux.

Richard
