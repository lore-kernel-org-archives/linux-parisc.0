Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07227482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Sep 2001 02:25:27 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5FCE0B00C; Tue, 25 Sep 2001 09:24:02 +0100 (BST)
Date: Tue, 25 Sep 2001 09:24:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel 2.5.9-pa24 won't boot 735/125
Message-ID: <20010925092401.M5051@linuxcare.com>
References: <Pine.LNX.4.33.0109201328390.14604-100000@lefou> <Pine.LNX.4.33.0109242042210.17244-100000@lefou>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0109242042210.17244-100000@lefou>; from sonny@aspersion.org on Mon, Sep 24, 2001 at 10:09:09PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 24, 2001 at 10:09:09PM -0600, Sonny Cook wrote:
> Okay, I've written off cross compiling as a loss.  I did get a 715/80
> working with no obvious problems.  I've compiled a kernel with the
> EARLY_BOOTUP_DEBUG flag defined.  So, I boot my 735/125 with that kernel
> and get much more interesting information.  Thusly:
...
> Setting the System Clock using the Hardware Clock as reference...
> Cannot access the Hardware Clock via any known method.
> Use the --debug option to see the details of our search for an access
> method.
> System Clock set. Local time: Tue Sep 25 20:35:45 MDT 2001
> 
> Cleaning: /tmp /var/lock /var/run.
> 
> At this point the system refuses to give any more output.  I can ping the
> box, but there are no services running (sshd is supposed to start up.)  I
> also assume that the root file system (/dev/sdb2) is indeed mounted,
> because if I just cold reboot, it has to fsck the filesystem next time.
> 
> The kernel is compiled without STI or framebuffer support.  It also has
> all of the non experimental iptables options compiled in.

To eliminate the possibility of a kernel config problem, I would
make distclean; cp arch/parisc/debian-configs/32 .config; make oldconfig
make dep; make

The other thing you can try is booting with init=/bin/sh and try
starting things up by hand to see what hangs it.  Or maybe remove
non-essentail services, then if it boots ok try starting them one
by one.

Richard
