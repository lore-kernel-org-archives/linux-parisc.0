Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA29171
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jul 1999 22:48:46 -0600
Date: Fri, 2 Jul 1999 22:40:00 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199907030440.WAA28078@fast.cs.utah.edu>
To: J.S.Peatfield@damtp.cam.ac.uk, alex@assyst-intl.com, deller@gmx.de
Subject: Re: [parisc-linux] Booting the kernel
Cc: parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Sat, 3 Jul 1999 03:24:37 +0100
> From: Jon Peatfield <J.S.Peatfield@damtp.cam.ac.uk>
> To: alex@assyst-intl.com, deller@gmx.de
> Subject: Re: [parisc-linux] Booting the kernel
> 
> This reminds me, does anyone have a working rbootd which runs on anything
> other than HP-UX?  If we turn all our HPs into Linux boxes it would be nice to
> still be able to boot them.  Of course looking at the rboot packets on the wire
> shows that they are not anything I recognise...
> 

There is an rboot daemon that comes with all the BSDs and I believe the
same daemon will work on Linux as well.  There were some endian problems
once, but I think they were all solved so it should work on x86 boxes.
It requires BPF.
