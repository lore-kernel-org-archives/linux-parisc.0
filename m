Received: from ns2.imedia.net (ns2.imedia.net [209.247.154.4])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id MAA32338
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:27:47 -0700
Message-Id: <5.0.0.25.0.20001115112439.01ec17a0@mail.webcash.com>
Date: Wed, 15 Nov 2000 11:26:30 -0800
To: "Thomas Marteau" <marteaut@esiee.fr>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] Boot command 
Cc: <parisc-linux@puffin.external.hp.com>
In-Reply-To: <007c01c04f2f$6679f620$a832d793@esiee.fr>
References: <Your message of "Fri, 03 Nov 2000 11:46:39 PST." <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
 <Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
 <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
 <5.0.0.25.0.20001114142101.00a69910@mail.webcash.com>
 <5.0.0.25.0.20001115095344.01f15cb0@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>


Thomas,
I mounted the /dev/sda3 on mnt and deleted every thing and recopied then 
rebooted. It worked. Probably there was some fault while I copied yesterday.
I did not repartition the disk now.
Thanks

Regards
Kailas
At 07:10 PM 11/15/00 +0100, Thomas Marteau wrote:
>Hi again,
>
>     You put the swap partition before the f0 partition and here it is the f0
>partition in first position.
>     Also, your hard disk is ida instead of sda, what's that ?
>
>Bye,
>
>ESIEE Team
>----- Original Message -----
>From: Kailashnath V Rampure <kailasr@webcash.com>
>To: Thomas Marteau <marteaut@esiee.fr>
>Cc: <parisc-linux@puffin.external.hp.com>
>Sent: Wednesday, November 15, 2000 6:55 PM
>Subject: Re: [parisc-linux] Boot command
>
>
> > Yes Thomas the vmlinux is in /boot of 3rd partition as the other
>partitions
> > are swap and f0.
> >
> > At 11:48 AM 11/15/00 +0100, Thomas Marteau wrote:
> >
> > >----- Original Message -----
> > >From: Kailashnath V Rampure <kailasr@webcash.com>
> > >To: Paul Bame <bame@noam.fc.hp.com>
> > >Cc: Grant Grundler <grundler@cup.hp.com>; Matt Taggart
> > ><taggart@carmen.fc.hp.com>; <parisc-linux@thepuffingroup.com>
> > >Sent: Tuesday, November 14, 2000 11:58 PM
> > >Subject: Re: [parisc-linux] Boot command
> > >
> > >
> > > > I have booted HP A class server through network. On that I have
> > >repartioned
> > > > the system and followed the steps on
> > >http://www.parisc-linux.org/install.html.
> > > > I have used the following command to initialize the hard disk. The
>kernel
> > >I
> > > > have downloaded is vmlinux-20001018. and cpied it to /mnt/boot/vmlinux
> > > > after mounting /dev/sda3. I have used the following command to
>initialize
> > > > the HDD.
> > > >
> > > > palo -I -k /boot/vmlinux -b /boot/iplboot \ -c '3/boot/vmlinux
>TERM=linux
> > > > HOME=/ root=/dev/sda3' \ /dev/sda
> > >
> > >This means that vmlinux must be in /boot in your third partition on your
> > >disk.
> > >Is it true in your case?
> > >
> > > > --------------------------------
> > > > I get the following error:
> > > > --------------------------------
> > > > SOFT Boot.
> > > > palo ipl bame@noam Tue oct 31 14:18:02 MST 2000
> > > > 0/vmlinux 2138614 bytes@ 0x1f78c000
> > > > 0/palo-cmdline '3/boot/vmlinux TERM=linux HOME=/ root=/dev/sda3'
> > > > /dev/ida1 82 62 1030688
> > > > /dev/ida2 f0 1030750 24738
> > > > /dev/ida3 83 1055488 1030750
> > > > Kernel:partition 3 file /boot/vmlinux
> > > > ext2 block size 1024
> > > > ext2_mount(partition 3) returns 0
> > > > ext2_open(/boot/vmlinux) = -1
> > > > open /boot/vmlinux failed
