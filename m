Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA21630
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Dec 1999 20:58:51 -0700
Sender: cjohnson@cj-solutions.com
Message-ID: <3846E9BD.DFC8D51C@mcn.net>
Date: Thu, 02 Dec 1999 20:50:53 -0100
From: Carl Johnson <cjs@mcn.net>
MIME-Version: 1.0
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>,
        "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Booting on J200
References: <38458959.9307D971@mcn.net> <99120220503901.00296@P100>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Thanks Helge:

I never said I looked at the obvious first! Poor planning/thinking
on my part. I did however about 2 secs before reading your post
did recompile a FRESH ("VIRGIN") source and did manipulate
the command line and get it to give me a Pengiun powered PA
with a shell!

Thanks Anyhow!

Helge Deller wrote:
> 
> Am Wed, 01 Dec 1999 schrieb Carl Johnson:
> > I have built my own kernels and modified them some, but have also
> > used the prebuilt kernels, I have had no success figuring out
> > what hangs the kernel but anyhow, I will tell of my testing
> > of the 1999-10-19 and 1999-11-13. And Hopefully I will
> > recieve some help, _TIA_
> >
> > --
> > 1999-10-19: Hangs at transfering control to kernel
> >
> > --
> > 1999-11-13: Hnags after:
> >
> > Transfering control to kernel. (At entry point 0x00010000)
> > kernel(0x00148C80, 0x00504010, 0x00148C80, 0x00016640)
> > Clear BSS 0x0011B048 --> 0x0013D384
> > Boot Loader: PA/Linux, maybe PALO
> > real_mode setup exiting
> >
> 
> Hello Carl,
> 
> Are you shure, that the outputs doesn´t go to the first COM-Port as default (in
> which case you would never see something more on the screen)...
> 
> Check /arch/parisc/boot/boot_code/ipl_c.c and search for " console=ttyS0 " ...
> You would have to modify this (console=tty0)  ** OR **  start the machine with
> "boot pri isl" and modify the command-line.
> 
> Helge Deller.

-- 
Carl Johnson
