Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA09302
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Sep 1999 02:27:10 -0600
Date: Sat, 18 Sep 1999 10:29:23 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] exec_kernel help
Message-ID: <19990918102923.C5481@suse.de>
References: <37E34387.713858FE@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <37E34387.713858FE@uswest.net>; from Ryan Bradetich on Sat, Sep 18, 1999 at 01:47:19AM -0600
List-ID: <linux-parisc.vger.kernel.org>

> I've been struggling with this for the last couple of days, and I'm
> stuck.  I can build a bootable image, but I can not get it to transfer
> control to the kernel.  (I'm working on a C200+ which is a PA-8200
> (PA-RISC 2.0) as Grant pointed out earlier).  I know the first targeted
> build is for the PA 1.1, but I am willing and would like to get the
> kernel working on the 2.0 also.

It would be really nice to support PA2.0 in narrow mode.

> Here is the output on the console (I'm typing this in by hand)

Try to get a serial console set up.

> Transfering control to kernel. (At entry point 0x00010000)
> -----------------------------------------------------
> 
> It hangs there and I have to reboot to continue.

Can you access PIM and see if it got an HPMC ?

> Any help/pointers would be appreciated :)

okay, both head.S and our console (which is still called pdc_* though it
really is IODC) rely on pa1.1 firmware.  I am not sure this works on PA2.0
systems.

	Philipp Rumpf
