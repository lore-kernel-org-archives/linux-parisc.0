Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71325482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 11:30:21 -0600 (MDT)
Received: from xatlrelay1.atl.hp.com (xatlrelay1.atl.hp.com [15.45.89.190])
	by atlrel6.hp.com (Postfix) with ESMTP id 9311B1F5FE
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 13:30:10 -0400 (EDT)
Received: from xatlbh2.atl.hp.com (xatlbh2.atl.hp.com [15.45.89.187])
	by xatlrelay1.atl.hp.com (Postfix) with ESMTP id 781B51F54F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 13:30:10 -0400 (EDT)
Message-ID: <B9957F974955D411829400D0B74FF27A04BF7840@xtor01.canada.hp.com>
From: "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 13 Jul 2001 13:30:01 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] LOOP_CLR_FD on 735
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I've been trying the latest releases on various workstations I have access
to.

Two of the machines are a B180L and a 735.  The B180L installs with the
0.9.1 CD.   When I try the 735 with 0.9.1 or 0.9.2 I get the message

	ioctl: LOOP_CLR_FD: No such device or address

at the point where the Rescue Floppy is being installed from floppy images
off of the CD into the Linux system partition, it just sits there.  I
believe I saw a similiar message with the B180L but it flicked past too fast
for me to read the entire message.

Both machines are being installed via the serial console.

I've seen that there is another report of a 735 running at ESIEE but that
was a "735/B"; this is probably the 735/125 instead of a 735/99 that I'm
running.

Any suggestions?  What is this message?  Anything you want me to try?

Cheers,

Kevin Carson
