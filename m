Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob05.one.net.au (mail-ob05.one.net.au [61.12.0.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DBAE482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 03:44:39 -0600 (MDT)
Message-ID: <010d01c0cd6c$f2200280$1401a8c0@peewee>
From: "Matthew van de Werken" <mvdw73@one.net.au>
To: "Richard Hirst" <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <A8566E157F5FD411BCFB00D0B7816D51C7294A@ntexchange.cat.csiro.au> <20010423220846.O985@linuxcare.com> <002301c0cd1d$a6d3add0$1401a8c0@peewee> <20010425091204.J985@linuxcare.com>
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?
Date: Wed, 25 Apr 2001 19:48:51 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi Richard:

I'm a little bit of a beginner at all this kernel hacking business (well, a
rank beginner would be more accurate)...

What I'll do is turn on the verbose SCSI error reporting, and the SCSI
logging facility and try again.

I''l have to do a 'man printk' to have a look at what that function's syntax
is, then take it from there.

Cheers,
MvdW [who, despite lack of total success is having a lot of fun...]



----- Original Message -----
From: "Richard Hirst" <rhirst@linuxcare.com>
To: "Matthew van de Werken" <mvdw73@one.net.au>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, April 25, 2001 6:12 PM
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?


> On Wed, Apr 25, 2001 at 10:21:17AM +1000, Matthew van de Werken wrote:
> > Hi Richard:
> >
> > I added the patch (I assume I added it correctly - the resulting vmlinux
was
> > different), and ran the new kernel, with no change. The FW scsi is still
not
> > recognised.
>
> Shame :(  The Zalon driver is the one you are interested in.  My B180
> with a Bluefish (Zalon based) FWD card runs the sim700, zalon, and
> sym53c8xx drivers all at the same time, no problem.
>
> It's possible I got the parameters wrong in my patch; the aim is to
> cause drivers/scsi/zalon7xx.c:zalon_scsi_callback() to get called
> for your interface.  It could be that is getting called but failing
> for some reason.  If it is called, you should at least be getting
> a line
>
>         ......: Zalon vers field is ......
>
> output on boot.
>
> If you don't see that, perhaps you can investigate by adding a few
> printk()'s to see what I got wrong.
>
> zalon7xx_detect() is surely getting called, and that uses
register_driver()
> in arch/parisc/kernel/drivers.c to try and match your cards parameters
> against one of the entries in zalon_scsi_drivers[].  Try and figure out
> why that match is not succeeding for your scsi interface.
>
> Richard
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
