Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.oplnk.net (unknown [216.90.3.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 518D1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 15:21:01 -0600 (MDT)
Received: from deskbean (216-90-3-162.dsl.oplnk.net [216.90.3.162])
	by mail.oplnk.net (Postfix) with SMTP id AF5964E00C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 16:41:06 -0500 (CDT)
Message-ID: <003401c0ce96$88726af0$a2035ad8@3beans.com>
Reply-To: "Peter Weatherall" <peter.weatherall@3beans.com>
From: "Peter Weatherall" <peter.weatherall@3beans.com>
To: <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.21.0104261258350.11174-100000@pilchuck.reedmedia.net> <OE25oryKFRJrzdDW6lC000046f5@hotmail.com>
Subject: Re: [parisc-linux] HP 710 and miscellaneous questions ...
Date: Thu, 26 Apr 2001 16:19:09 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I have a C160. When I boot it , I see the following message -

>>>>
Dino version 2.1 (bridge mode) found at 0xf1600000


The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:795!
>>>>>

How can I determine if my c160 is affected ? what's this kernel bug at
dino.c all about and is there some Dino documentation available ?

Thanks
Peter

Where can I learn more about





----- Original Message -----
From: "Brian Stewart" <pdksh@hotmail.com>
To: "Jeremy C. Reed" <reed@reedmedia.net>;
<parisc-linux@lists.parisc-linux.org>
Sent: Thursday, April 26, 2001 3:57 PM
Subject: Re: [parisc-linux] HP 710 and miscellaneous questions ...


> You will find the HP710 is not going to work for you at this moment. The
710
> has a ASP bus that has some problems with the interrupt controller (that
is
> the suspicion of the pa-risc linux group). I have been unsuccessful in
> getting it to run. The network card stops working at boot and the scsi
> driver will not detect any scsi devices.
>
> I went one step further and created a large ramdisk (8-9 meg) and tried to
> boot and run entirely in the ram disk. Init fails as soon as the kernel
> passes control to it. I would recommend using mklinux for the time being,
> there is a lot of interest in that machine but the documentation that is
> needed to resolve the interrupt problem is not in the hands of the right
> people. I would like to be optimistic and say in 6 months or so the
pa-risc
> linux gurus out there will have a fix.
>
> mklinux:
> ftp://ftp.cirr.com/pub/hppa/mklinux/
> basically you d/l a disk image and the usr.tar, var.tar files and dd the
> image to a hard drive on a second machine.
>
> I hope this helps
>
>
> ----- Original Message -----
> From: "Jeremy C. Reed" <reed@reedmedia.net>
> To: <parisc-linux@lists.parisc-linux.org>
> Sent: Thursday, April 26, 2001 4:27 PM
> Subject: [parisc-linux] HP 710 and miscellaneous questions ...
>
>
> > I see "[t]his mailing list exists to serve the developers." Where is
> > the appropriate forum to discuss basic usage?
> >
> > I have an HP 700 Series Apollo Model 710. As far as I can tell it has no
> > usable operating system (no HPUX). I can turn it on and connect to a
> > series of (CMOS?/BIOS?) prompts and menus via a serial cable. It does
not
> > have a CD drive. I do not have HPUX to do any cross-compiles. (I have
> > installed a variety of flavours of BSD and Linux hundreds of times, but
> > always on i386 architectures.)
> >
> > I want to use Linux (or BSD) on it. The PA-RISC webpages have links for
> > documentation, but none appear to explain a basic install. Where is the
> > documentation for installing Linux on a hard drive?
> >
> > The software page (http://www.parisc-linux.org/software/) says "nfsroot"
> > is the easiest way; but the instructions say "you have to build on
> > HP/UX."
> >
> > Is there simply a filesystem image (with kernel and userspace) that I
can
> > dd to a harddrive that I can then use to boot my HP 710)? If so, where
is
> > it? (And where is this documented?)
> >
> > Also, I see an ISO image at
> > ftp://puffin.external.hp.com/pub/parisc/cd-images/; is there any
> > (easy) way to convert this ISO image to an image that I can dd on to my
> > hardrive (to use to boot)?
> >
> > Thanks,
> >
> >    Jeremy C. Reed
> >    http://bsd.reedmedia.net/
> >
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> >
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
