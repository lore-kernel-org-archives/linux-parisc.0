Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob02.one.net.au (mail-ob02.one.net.au [61.12.0.162])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79A3C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Apr 2001 18:16:47 -0600 (MDT)
Message-ID: <002301c0cd1d$a6d3add0$1401a8c0@peewee>
From: "Matthew van de Werken" <mvdw73@one.net.au>
To: "Richard Hirst" <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <A8566E157F5FD411BCFB00D0B7816D51C7294A@ntexchange.cat.csiro.au> <20010423220846.O985@linuxcare.com>
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?
Date: Wed, 25 Apr 2001 10:21:17 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi Richard:

I added the patch (I assume I added it correctly - the resulting vmlinux was
different), and ran the new kernel, with no change. The FW scsi is still not
recognised.

I tried the following combinations of drivers, with the same result:

(All of the following were with HP-LASI on and HP-ZALON on):

* No other SCSI drivers;
* NCR53c7,8xx support as well;
* sym53c8xx support as well.

None of these combinations works; any other ideas from anyone on how to get
FW scsi support? I am using the snapshot taken I believe on 9 April, with
the cross-compiler from that date.

If anyone has FW scsi support going (at the same time as the narrow scsi),
if they could mail me their .config file to compile the kernel I'd
appreciate it.

I am of course assuming that the FW scsi isn't working, by the fact that the
FW disks aren't being recognised at boot time, and the fact that I can't
fdisk /dev/sdx, for x != a.

Cheers,
MvdW




----- Original Message -----
From: "Richard Hirst" <rhirst@linuxcare.com>
To: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Tuesday, April 24, 2001 7:08 AM
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?


> On Mon, Apr 23, 2001 at 09:08:33AM +1000, van de Werken, Matthew (DEM, PH)
wrote:
> >
> >
> > > -----Original Message-----
> > > From: van de Werken, Matthew (DEM, PH)
> > > Sent: Monday, 23 April 2001 9:07
> > > To: 'parisc-linux@lists.parisc.org'
> > > Subject: RE: [parisc-linux] How do I use the FW scsi on 735?
> > >
> > >
> > > Forgot to mention, it's a custom kernel - there is a chance I
> > > left out the necessary drivers. What is the driver for the FW
> > > SCSI controller on the 735 please?
>
> Can you try this patch, compile CONFIG_SCSI_ZALON in, and let me know
> what happens?
>
> Richard
>
>
> Index: drivers/scsi/zalon7xx.c
> ===================================================================
> RCS file: /home/cvs/parisc/linux/drivers/scsi/zalon7xx.c,v
> retrieving revision 1.6
> diff -u -r1.6 zalon7xx.c
> --- zalon7xx.c 2001/04/06 05:10:57 1.6
> +++ zalon7xx.c 2001/04/23 20:58:30
> @@ -58,6 +58,11 @@
>   "GSC SCSI (Zalon)", "53c720",
>   (void *) zalon_scsi_callback},
>
> + {HPHW_FIO, 0x007, 0, 0x0007c, 0x0, 0,
> + DRIVER_CHECK_HWTYPE | DRIVER_CHECK_SVERSION,
> + "GSC SCSI (Outfield)", "53c720",
> + (void *) zalon_scsi_callback},
> +
>   {0,0,0,0,0,0, 0, (char *) NULL,(char *) NULL,(void *) NULL}
>  };
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
