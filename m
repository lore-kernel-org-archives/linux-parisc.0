Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA11263
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Sep 1999 22:31:25 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37E478EA.14370720@uswest.net>
Date: Sat, 18 Sep 1999 23:47:22 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Philipp Rumpf <prumpf@suse.de>
CC: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] exec_kernel help
References: <37E34387.713858FE@uswest.net> <19990918102923.C5481@suse.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

> > I've been struggling with this for the last couple of days, and I'm
> > stuck.  I can build a bootable image, but I can not get it to transfer
> > control to the kernel.  (I'm working on a C200+ which is a PA-8200
> > (PA-RISC 2.0) as Grant pointed out earlier).  I know the first targeted
> > build is for the PA 1.1, but I am willing and would like to get the
> > kernel working on the 2.0 also.
>
> It would be really nice to support PA2.0 in narrow mode.
>
> > Here is the output on the console (I'm typing this in by hand)
>
> Try to get a serial console set up.

Finally after several hours I finally figured out how to setup the serial
console.  (BTW, don't put a null-modem adapter on a null-modem cable, it
doesn't work :()

Well the result is still the same ... It hangs after printing the message
"Transfering control to kernel. (At entry point 0x00010000).  So I'll start
diving into head.S and see if I can trace it from there.

>
> > Transfering control to kernel. (At entry point 0x00010000)
> > -----------------------------------------------------
> >
> > It hangs there and I have to reboot to continue.

> > Any help/pointers would be appreciated :)

>
> okay, both head.S and our console (which is still called pdc_* though it
> really is IODC) rely on pa1.1 firmware.  I am not sure this works on PA2.0
> systems.
>
>         Philipp Rumpf

I'll investigate this and see if I can track it down.  Thanks for the
pointers!

-Ryan
