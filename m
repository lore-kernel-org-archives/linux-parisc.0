Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F3BE482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 05:46:24 -0600 (MDT)
Message-Id: <200110161146.NAA01522@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Matt.VanDeWerken@csiro.au
Subject: Re: [parisc-linux] Installing...
Date: Tue, 16 Oct 2001 13:46:15 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <A8566E157F5FD411BCFB00D0B7816D51C72BB5@ntexchange.cat.csiro.au>
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D51C72BB5@ntexchange.cat.csiro.au>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

Hi Matt,

if I'm right you could just use your i386 machine to
copy the iso image of the palinux install cd directly to an 
empty scsi harddrive (e.g. with "dd if=palinux_cd.iso of=/dev/sdX").
Then connect that drive to your pa-box, do a "boot search" in the
bootmenu and boot directly from that harddrive (e.g. "boot scsi.5.0").

Helge

On Tuesday 16 October 2001 11:51, Matt.VanDeWerken@csiro.au wrote:
> Thanks Thomas (so fast!!),
>
> Are these filesystems still current? I've got an old nfs filesystem from
> about that time, too, which I've installed before, so I have done it all
> before, but I wasn't sure if the 'old' filesystem would work with the newer
> kernels (and newer glibc?)
>
> What I would prefer to do, if I can get some instruction, is to use the
> .iso image to write to a disk (which I would make bootable - how?), which I
> could then use to install to a second external disk.
>
> I guess I should just 'give it a go', and see what happens.
>
> Thanks  again,
>
> Cheers,
> Matthew van de Werken
> Electronics Engineer
> CSIRO Exploration & Mining - Gravity Group
> 1 Technology Court - Pullenvale - Qld - 4069
> ph:  (07) 3327 4685     fax:  (07) 3327 4455
> email:  m.vandewerken@cat.csiro.au
>
> > -----Original Message-----
> > From: Thomas Marteau [mailto:marteaut@esiee.fr]
> > Sent: Tuesday, 16 October 2001 7:45 PM
> > To: Matt.VanDeWerken@csiro.au
> > Cc: parisc-linux@lists.parisc-linux.org
> > Subject: Re: [parisc-linux] Installing...
> >
> >
> > Hi Matthew,
> >
> > 	Once upon a time, we worked with the same equipment as
> > you've got and
> > we published some filesystem tarballs. In addition, we wrote a script
> > called sysintall that does everything well if you can plug an externel
> > disc on a X86.
> >
> > The useful links are:
> > http://www.parisc-linux.org/
> > http://www.esiee.fr/puffin/
> > http://mkhppa1.esiee.fr/download.html#fs
> >
> > Good luck and if you need any help, please mail me, Thomas.
> > ESIEE Team
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Helge Deller                            email: helge.deller@sap.com
SAP AG Walldorf/Baden, Germany         Phone: +49 6227  7-67783
LinuxLab                               Fax  : +49 6227 78-67783

SAP LinuxLab support address: linux@sap.com
