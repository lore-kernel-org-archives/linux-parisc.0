Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B509482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 03:13:36 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 12A1AB00C; Tue, 17 Jul 2001 10:11:40 +0100 (BST)
Date: Tue, 17 Jul 2001 10:11:40 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Cc: parisc-linux@lists.parisc-linux.org, okraus@t-online.de
Subject: Re: [parisc-linux] palinux-0.9.2: Installation fails on C180
Message-ID: <20010717101140.M30356@linuxcare.com>
References: <01071511264600.00948@octopus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01071511264600.00948@octopus>; from Reinhard.Gimbel@freenet.de on Sun, Jul 15, 2001 at 11:26:46AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 15, 2001 at 11:26:46AM +0200, Reinhard Gimbel wrote:
> 
> Hi folks !
> 
> Recently I bought an C180 at a local 2nd hand computer store. 
> 
> I tried to install the latest palinux-0.9.2 (esiee.fr), but the 
> installation failed :-(
> 
> The download itself went ok (md5sums ok), no probs while 
> burning the ISO image (using xcdrgtk). The C180 boots from the 
> CD-R, the system can be set up (HD partitioning, creating the 
> ext2 filesystems, etc.) but during heavy traffic on the SESCSI 
> bus the system crashes (sometime during kernel installation, 
> sometimes during base system installation).

I guess you are installing from CD on SESCSI, to disk on FWSCSI.
You could try to install from the network, so only the one scsi controller
is active.  See if that helps.  You could probably boot from the CD, then
tell the system to load everything via http or nfs, having exported the CD
contents from a suitable server.

Richard
