Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ati6.ati.stlawrencec.on.ca (unknown [142.155.128.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DD7C482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 09:07:00 -0600 (MDT)
Message-ID: <001901c1062d$a08091c0$0f809b8e@ati.stlawrencec.on.ca>
From: "rpengelly" <rpengelly@ati.stlawrencec.on.ca>
To: "Richard Hirst" <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <000d01c10626$ac7139f0$0f809b8e@ati.stlawrencec.on.ca> <20010706153937.Z23509@linuxcare.com>
Subject: Re: [parisc-linux] opening initial console
Date: Fri, 6 Jul 2001 11:09:17 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I'm confused about booting from a lifimage. How do we go about this. Note:
we are unbale to install via CDROM because of harware issues so we are
relying on a network install.

P.S. Thanks for all your help so far. We need all we can get.

----- Original Message -----
From: "Richard Hirst" <rhirst@linuxcare.com>
To: "rpengelly" <rpengelly@ati.stlawrencec.on.ca>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Friday, July 06, 2001 10:39 AM
Subject: Re: [parisc-linux] opening initial console



> Sounds like you have tried to boot a kernel over the network, and
> have it mount a root file system also over the network.  The problem
> is likely to be that the kernel failed to find any useful files on
> the file system it mounted - no /dev/tty*, no /sbin/init, etc.
> Could be access permisions problems.  Try mounting the fs from some
> other system and check things look ok.
>
> If you grab the 0.9.1 ISO and boot the lifimage from that, the
> lifimage contains 32 and 64 bit kernels, and a ramdisk.  It should
> boot and mount root from the ramdisk (not from nfs).
>
> Richard
>
