Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE72D482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 08:40:23 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AE437B00C; Fri,  6 Jul 2001 15:39:37 +0100 (BST)
Date: Fri, 6 Jul 2001 15:39:37 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] opening initial console
Message-ID: <20010706153937.Z23509@linuxcare.com>
References: <000d01c10626$ac7139f0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000d01c10626$ac7139f0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Fri, Jul 06, 2001 at 10:19:31AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 06, 2001 at 10:19:31AM -0400, rpengelly wrote:
> Well good news and bad news. We've gotten a linux kernal to boot over a network using rbootd and bootp. However just after the root is mounted we get the following message:
> 
> NFS: Mounted root (nfs filesystem) readonly.
> Warning: unable to open an initial console.
> Kernel panic: no int found. Try passing init= option to kernel.
> 
> Anyone run into this problem or know how to fix it.

Sounds like you have tried to boot a kernel over the network, and
have it mount a root file system also over the network.  The problem
is likely to be that the kernel failed to find any useful files on
the file system it mounted - no /dev/tty*, no /sbin/init, etc.
Could be access permisions problems.  Try mounting the fs from some
other system and check things look ok.

If you grab the 0.9.1 ISO and boot the lifimage from that, the
lifimage contains 32 and 64 bit kernels, and a ramdisk.  It should
boot and mount root from the ramdisk (not from nfs).

Richard
