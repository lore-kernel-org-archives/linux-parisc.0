Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 440CE482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 03:01:26 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9F46FB00C; Wed, 11 Jul 2001 10:00:09 +0100 (BST)
Date: Wed, 11 Jul 2001 10:00:09 +0100
From: 'Richard Hirst' <rhirst@linuxcare.com>
To: Joachim Kress <jkress@unilog.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palinux
Message-ID: <20010711100009.J18375@linuxcare.com>
References: <41E365428D7DD21192B700104BB0EA3D01526E2B@nttue01.tue.integrata.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <41E365428D7DD21192B700104BB0EA3D01526E2B@nttue01.tue.integrata.de>; from jkress@unilog.de on Wed, Jul 11, 2001 at 10:44:49AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 11, 2001 at 10:44:49AM +0200, Joachim Kress wrote:
> 
> 	the Workstation boot and then will stop
> 	with "BOOT_ADMIN"
> 
> 	first step:
> 	then i boot with "boot scsi.1.0" (CDROM Address)
> 	the Workstation is booting and falling back to
> 	"BOOT_ADMIN"

Hmm, ok.  I was hoping it might say something like "ipl checksum error",
or "bad lif magic".

It might be a hardware probem with the CDROM, cable, or terminators,
I suppose.  Can you try to boot over the network from a bootp server?
The README on the CD should help.

Richard
