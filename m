Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA24967
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Sep 1999 22:32:58 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37D8775B.A7802688@uswest.net>
Date: Thu, 09 Sep 1999 21:13:31 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: ext-helge.deller@nokia.com, Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Finally ... Kernel Booted on C200
References: <A914533BF4B9D2118D980008C7894C0A01013168@dueis01nok>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Well I never claimed I was bright :)
Thanks for the hint/help.

I do have a question/patch for you though......

When I do a make mrproper, or make distclean, etc ... the
arch/parisc/boot/boot_code/cache.c file gets removed, and I have to
re-checkit out from cvs....  Is this supposed to happen?

I've attached a patch to remove the cache.c file from the clean in the
Makefile if this is a bug.....

Thanks again for hint/help!
-Ryan


ext-helge.deller@nokia.com wrote:

> Yes, but it's really easy with two steps:
>
> 1. make vmlinux
> 2. make Image   (<- Here the ipl will be built & stripped, then ipl and
> vmlinux will be added to the file "Image").
> 3. Boot the file arch/parisc/boot/Image from HDD or via network.
>
> Helge Deller.
>
> > -----Original Message-----
> > From: EXT Ryan Bradetich [mailto:rbradetich@uswest.net]
> > Sent: Donnerstag, 9. September 1999 5:33
> > To: Parisc Linux
> > Subject: [parisc-linux] Finally ... Kernel Booted on C200
> >
> >
> > Well I'm slowly learning .... :)
> >
> > I finally figured out how to compile the cvs tree into a kernel that
> > I could boot on the C200.
> > These are the steps I followed, will someone verify if they
> > are correct?
> >
> > 1. built the kernel using vmlinux,
> > 2. built the ipl in arch/parisc/boot/boot_code
> > 3. stripped ipl
> > 4. mkImage ipl vmlinux vmlinux.boot
> > 5 boot off of vmlinux.boot
> >
> > At this point I get Tranfering control to kernel.  (At entry point
> > 0x00010000)
> > The LED are also flashing in some patteren.
> >
> > Well, time to start researching signals :)
> >
> > -Ryan
> >
> >
> >
> > --------------------------------------------------------------
> > -------------
> > To unsubscribe: send e-mail to
> > parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.
> >
