Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D8CD482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 11:35:59 -0600 (MDT)
Message-Id: <200110181732.LAA02640@puffin.external.hp.com>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] More on the B2000 
In-Reply-To: Message from Richard Allen <ra@hp.is>
   of "Thu, 18 Oct 2001 14:24:59 -0000." <20011018142459.S8089@hp.is>
Date: Thu, 18 Oct 2001 11:32:30 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Allen wrote:
> I managed to install a B2000 from the 0.92 ISO.    The trick
> is to connect a serial console, open the box and disconnect the
> IDE cdrom drive, install a SCSI card and plug in a external
> SCSI cdrom drive.

Ah - excellent idea.
I'm helping get IDE-CDOM working and I have also started work on
getting the built-in narrow scsi working (sym53c8xx driver needs
to make a PDC GET_INITIATOR call).

> I attempted to compile todats kernel on the machine and I did it as
> Im used to do (make oldconfig, make dep, make palo)
> That kernel refuses to boot:

To debug problems like this, enable EARLY_BOOTUP_DEBUG in
arch/parisc/kernel/pdc_cons.c.  We also need you to keep the matching
System.map and look up where IOAQ and GR02 point to in the kernel.
Use "build-tools/a.c" to help do the look ups.

I've copied kernels for c3k (32-bit) and a500 (64-bit) to my ftp server.
I've stripped out stuff neither needs from their respective .config:
	ftp://gsyprf10.external.hp.com/pub/a500
and
	ftp://gsyprf10.external.hp.com/pub/c3000

DISCLAIMER: I don't guarantee these kernels will work for anyone for any
purpose or that they are "clean" builds (ie may have custom changes).
Just providing them as a convience.

If something is missing from the respective .config that you think
I should include, feel free to ask for it. I might include it. ;^)

...
> The LCD is also Nice :)   It reads:
> 
> FLT CBFB4.9-pa57
> 785/B2000

CBFB is the "chassis code" for the fault.
Don't recall what that means but it's documented someplace.

The "785/B2000" is written by firmware.
Kudos to Helge/Randolph for the code that writes the top line.
It is cool!

grant
