Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA26224
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jul 1999 09:24:40 -0600
Message-ID: <004401bec49f$05fa81a0$e38f4b0f@cup.hp.com>
From: "Rich Rauenzahn" <rrauenza@cup.hp.com>
To: <Ulrich.Strelow@schering.de>, "Davin Petersen" <davinp@celltech.com>
Cc: <parisc-linux@thepuffingroup.com>
References: <C12567A2.0034ABC8.00@BE2314.schering.de>
Subject: Re: Antwort: [parisc-linux] Booting the kernel
Date: Fri, 2 Jul 1999 08:24:48 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>


And if you don't know your disk path, you can always try...

hpux /stand/vmlinux

I've found that often works on newer OS installs.

(btw, for those of you who run HPUX, that's also the way to boot off of the
backup kernel; you would specify /stand/vmunix.prev)

Rich

> 4. use hpux to load vmlinux
>    hpux disc(2/0/1.6.0;0)/stand/vmlinux
>              2/0/1.6.0                   is the hardware path to the boot
> disk
>                       ;0                 stands for section 0 which means
> whole disk or LVM
>                         /stand/vmlinux   is the kernel file to boot
>
> Ulrich
> ---------------------------------------------
> Ulrich Strelow
> <ulrich.strelow@schering.de or
> ulrich_strelow@yahoo.com>
> Berlin, Germany
>
>
>
>
>
>
>
> Davin Petersen <davinp@celltech.com> am 02.07.99 00:41:40
>
>
> An:   parisc-linux@thepuffingroup.com
> Kopie:     (Blindkopie: Ulrich Strelow/BE/USR/SHG)
>
>
> Thema:    [parisc-linux] Booting the kernel
>
>
>
>
>
> After downloading the goodies available from the FTP site I gather that
> rbootd is the way to spit the linux kernel to a HP box.  Am I wrong?  Is
> there no way of using the ISL?  I tried using the ISL (on my H60), got
> an error message and was dumped back to the ISL prompt.
>
> --------------------------------------------------------------------------
-
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
> `unsubscribe' as the subject.
>
>
>
>
>
> --------------------------------------------------------------------------
-
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
> `unsubscribe' as the subject.
>
