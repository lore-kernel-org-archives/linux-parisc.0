Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71D46482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 May 2002 01:09:14 -0600 (MDT)
To: "EVERSON,SETH (HP-Loveland,ex1)" <seth_everson2@hp.com>
Subject: RE: [parisc-linux] Try to boot b2000 failled?
Message-ID: <1021532950.3ce35b165180a@webmail.tiscali.be>
Date: Thu, 16 May 2002 09:09:10 +0200 (CEST)
From: joel.soete@freebel.net
Cc: "'joel.soete@freebel.net'" <joel.soete@freebel.net>,
	parisc-linux@lists.parisc-linux.org
References: <F341E03C8ED6D311805E00902761278C0CD12BEA@xfc04.fc.hp.com>
In-Reply-To: <F341E03C8ED6D311805E00902761278C0CD12BEA@xfc04.fc.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Seth,

Simple and efficent (why making complex when we can do simple :) )

Many thanks,
Joel

Quoting "EVERSON,SETH (HP-Loveland,ex1)" <seth_everson2@hp.com>:

> Joel -
> 
> Here is what I've been doing to install debian on my C3600 and J5000. 
> No 
> need for network or anything:
> 
> 1.  Copy the file LIFIMAGE in the disks-hppa directory to a CD-ROM
> 2.  Boot a HP-UX 10 or 11 cd
> 3.  Go to the installer, and go to a recovery console.
> 4.  Load 'dd' and 'mount'.  This will get dd and all the mount files.
> 5.  Go to a shell.
> 6.  Mount /dev/dsk/c0t0d0 to /mnt with mount -t cdfs 
> 7.  Go to /mnt, then do a 'dd if='LIFIMAGE;1' of=/dev/dsk/cXtYdZ
> bs=2048'  
>     where x, y, and z are your target scsi hard disk.  
> 8.  Reboot the machine, and boot the scsi hard disk you just targeted.
> 9.  Interact with the IPL, and your done.
> 
> The great thing is, everything gets loaded into RAM.  So, when you
> start
> the install, just partition both drives like normal, and install.  Just
> 
> make sure you do everything right the first time, or you'll have to
> repeat
> the process.
> 
> -Seth
> 
> -----Original Message-----
> From: joel.soete@freebel.net [mailto:joel.soete@freebel.net]
> Sent: Tuesday, May 14, 2002 9:03 AM
> To: joel.soete@freebel.net
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Try to boot b2000 failled?
> 
> 
> Oops... I find back a kernel pa12 and this boot better until it panics
> because of:
> ...
> root fs not found
> ...
> 
> So I suspect a mistake in the bootp-tftp config.
> In fact I would like to mount my palinux-0.9-3 cd on b180:/cdrom and use
> it
> as
> root fs to install the b2000.
> Unfortunately i do not find any example to do this. Is somebody can
> share
> its
> experience.
> 
> Thanks in advance for additionale help,
>     Joel
> 
> Quoting joel.soete@freebel.net:
> 
> > Hi all,
> > 
> > To split my gcc-3.2 and gcc-3.1 env on two different server (need
> disk
> > space
> > also), I would like to install a free b2000 workstation.
> > 
> > To do this i choose lan install (no possibilty for external
> scsi-cdrom
> > and no
> > more place to rebuild a new cdimage with recent kernel); I configure
> my
> > palinux
> > b180 as bootp-tftp server and configure in accordance with
> >
> http://pateam.esiee.fr/parisc-linux-boot/parisc-linux-boot/preparation.html.
> > 
> > In b2000 BOOT_ADMIN> boot lan, the lifimage (build with cvs palo &
> > kernel
> > 2.4.18-24 which boot well on my b180) is well found and launched but
> > hang just
> > after "Searching for devices..." and the green light on the ide
> cd-rom
> > driver
> > stay lighted?
> > 
> > Thanks in advance for help,
> >     Joel
> > 
> > 
> > -------------------------------------------------
> > This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> > 
> 
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
