Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C1864A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 11:00:49 -0700 (MST)
Message-Id: <200102211803.KAA17294@milano.cup.hp.com>
To: "Bryan W. Headley" <bheadley@interaccess.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CD boot help with 735 
In-reply-to: Your message of "Wed, 21 Feb 2001 10:43:26 PST."
             <3A93F02E.28D1B6ED@interaccess.com>
Date: Wed, 21 Feb 2001 10:03:09 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Bryan W. Headley" wrote:
> Hi,
> 
> Am trying to boot the CDROM, but keep getting "ENTRY_INIT status = -4"
> and a few lines of hex. Never
> 
> 1) The above occurs on the console, routed to built-in video. Should I
> have done something to redirect console messages to
>     COMM port beforehand? Have a laptop attached to be the serial
> console, but obviously to no effect

Shouldn't matter. Where PDC thinks the console is and where linux
thinks it is can be two different places.

> 2) Just being stupid: 9600 8 N 1, COM port A for the serial console,
> right?

yes. Assuming linux can find and support port A.

> 3) Should I try, "b scsi.6.0 IPL" or without the IPL?

Probably not. typically scsi.6.0 is the built-in hard disk.
Do "sea scsi" and see what shows up. CD-ROM is normally SCSI ID 2.
(Though it doesn't have to be).

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
