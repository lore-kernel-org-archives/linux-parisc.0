Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72A88482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 01:31:54 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 88474B00C; Mon, 10 Sep 2001 08:32:04 +0100 (BST)
Date: Mon, 10 Sep 2001 08:32:04 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Boyan Lazarov <bsl@mek.dtu.dk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing on Apollo 735
Message-ID: <20010910083204.P19441@linuxcare.com>
References: <3B9BA35D.9A02DD98@mek.dtu.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B9BA35D.9A02DD98@mek.dtu.dk>; from bsl@mek.dtu.dk on Sun, Sep 09, 2001 at 07:14:05PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 09, 2001 at 07:14:05PM +0200, Boyan Lazarov wrote:
> Hi ,
> I am trying to install linux on Apollo 735 . The system boots normally (
> serial console, from cd image 0.9.2) . When i reach the point to install
> the kernel  and the modules , the installer starts the installation and
> gives message 
> ioctl: LOOP_CLR_FD: No such device or address 

The installer gives that message for everyone, but normally it
immediately continues with the install.  What disks are you trying
to install on to?  I don't believe the internal wide scsi disks
are supported atm, but people have installed on to external narrow
disks.

Richard
