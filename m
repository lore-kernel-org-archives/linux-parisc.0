Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AE67482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 12:09:40 -0600 (MDT)
Date: Thu, 6 Jun 2002 20:09:38 +0200
Subject: Re: [parisc-linux] J6700/ISO 20020526 install results
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Zahorik <matt@hottub.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <Pine.GSO.4.40.0206060916010.10618-100000@hottub>
Message-Id: <90D1852D-7978-11D6-81E7-0030656F07A2@esiee.fr>
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

Le jeudi 6 juin 2002, =E0 07:38 , Matthew Zahorik a =E9crit :

> Hello all!
>
>   Thanks to Grant for pointing me to the testing ISOs
>
>   The end result of a fresh install using these ISOs was that my J6700=20=

> is
> working fine under a 64-bit kernel.
>
>   I used the mini 70MB image.
>
>   I will be re-installing soon as I'm fooling with software RAID=20
> mirrored
> boot disks and the partitions are not laid out properly.  If the CD
> maintainer wishes to try another ISO addressing my notes below I'll be
> glad to give it another go.
There are regular updates of the netinst iso there:
http://pateam.esiee.fr/cd-images/testing/

You can find the corresponding lifimages there (to load kernel from=20
network, it's only 6M) :
http://pateam.esiee.fr/cd-images/lifimages/

They are regularly uploaded on ftp.parisc-linux.org, although it is not=20=

yet a cron'd job, so I have to do that by hand, therefore you might=20
sometimes find more recent ISOs on pateam than on p-l.o, shame on me :)
>
>   Thanks!
>
> - Matt
>
> ps.  This is my first go at PA-RISC/Linux, although I'm very familiar=20=

> with
> both Linux on other platforms and HP hardware.  Please forgive any
> foot-in-mouth that may result.
>
>   Notes:
>
> -- Base install --
>
>   It defaults to the 32-bit kernel.  I have 16GB in this machine and
> wanted more than 2G swap, therefore I IPL'd palo to boot 0/vmlinux64.
> Minor.  Is memory size known at this point?  If so, >4GB machines may=20=

> want
> to default to 64-bit.
>
>   /dev/hda* is missing, therefore it was unable to find the CDROM for=20=

> base
> install.  I spawned a shell and did a MAKEDEV hda.
This has been solved in the latest ISOs, thanks to Richard Hirst.
>
>   LCD reads Linux 24.18-64 with installation kernel and heartbeat is
> erratic.  Minor.
>
> -- Install after reboot --
>
>   The apt-get configuration *insisted* on looking for stable=20
> packages.  I
> had to use the manual option to add these lines:
>
> deb http://http.us.debian.org/debian woody main contrib
> deb-src http://http.us.debian.org/debian woody main contrib
> deb http://non-us.debian.org/debian-non-US woody/non-US main contrib
> deb-src http://non-us.debian.org/debian-non-US woody/non-US main =
contrib
>
>   Unfortuantely, manual editing of sources.list doesn't allow
> specification of a proxy.  I'm behind a proxy.  Setting $http_proxy =
then
> restarting base-config allowed me to finish.
This is very weird.
Have you tried 'set up another apt source', when installing ?
you might be prompted for all options there, after choosing 'http' or=20
'ftp' source...
>
> -- After install --
>
>   LCD is fine except heartbeat is extremely slow.  Is the speed=20
> dependent
> on load? (:
>
>   Haven't tried SMP.  The installed kernel is UP.
>
>   No real stress testing performed as of yet.  No word on stability.
>
>   Is gcc-3.1 worth putting in as default?
>
> maz@pa-risc:/proc$ more cpuinfo
> processor       : 0
> cpu family      : PA-RISC 2.0
> cpu             : PA8700 (PCX-W2)
> cpu MHz         : 750.000000
> model           : 9000/785/J6700
> model name      : Duet W2
> hversion        : 0x00005dd0
> sversion        : 0x00000491
> I-cache         : 768 KB
> D-cache         : 1536 KB (WB)
> ITLB entries    : 240
> DTLB entries    : 240 - shared with ITLB
> bogomips        : 1497.49
Anyway that's good news, and we will add this box to the list of=20
supported hardware!



Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
