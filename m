Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE6CB482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 02:36:05 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 4F594B00D; Mon, 16 Jul 2001 09:34:16 +0100 (BST)
Date: Mon, 16 Jul 2001 09:34:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] LOOP_CLR_FD on 735
Message-ID: <20010716093416.B30207@linuxcare.com>
References: <B9957F974955D411829400D0B74FF27A04BF7840@xtor01.canada.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <B9957F974955D411829400D0B74FF27A04BF7840@xtor01.canada.hp.com>; from kevin_carson@hp.com on Fri, Jul 13, 2001 at 01:30:01PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 13, 2001 at 01:30:01PM -0400, CARSON,KEVIN (HP-Canada,ex1) wrote:
> Hi!
> 
> I've been trying the latest releases on various workstations I have access
> to.
> 
> Two of the machines are a B180L and a 735.  The B180L installs with the
> 0.9.1 CD.   When I try the 735 with 0.9.1 or 0.9.2 I get the message
> 
> 	ioctl: LOOP_CLR_FD: No such device or address
> 
> at the point where the Rescue Floppy is being installed from floppy images
> off of the CD into the Linux system partition, it just sits there.  I
> believe I saw a similiar message with the B180L but it flicked past too fast
> for me to read the entire message.

That message relates to the installer doing a loopback mount of
the rescue image.  Havn't looked at what the installer is doing to
trigger it, but it should not be causing your problem.

Richard
