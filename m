Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pimout3-ext.prodigy.net (pimout3-ext.prodigy.net [207.115.63.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08E2A4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Feb 2003 15:51:36 -0700 (MST)
Reply-To: <adam.sk@groovy.ffloth.com>
From: "Adam Skaffloth" <adam.sk@groovy.ffloth.com>
To: "'Thibaut VARENE'" <varenet@esiee.fr>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
Date: Sat, 1 Feb 2003 14:50:43 -0800
Message-ID: <003d01c2ca44$5a8bbf50$b601a8c0@pepp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030201232637.6a8bdc99.varenet@esiee.fr>
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

I tried the latest one, but that are not able to configure the kernel
modules,
Message is:

depmod: Can't open /lib/modules/2.4.20-32/modules.dep for writing.

As the netboot seems to work but not the full iso images.
Can you guide me to a know working netboot iso that I can use ?

/ Adam

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Thibaut
VARENE
Sent: Saturday, February 01, 2003 2:27 PM
To: adam.sk@groovy.ffloth.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tried to Install Debian 3r1 on C110, C180
and 2 712/60, no luck.


On Sat, 1 Feb 2003 13:34:24 -0800
"Adam Skaffloth" <adam.sk@groovy.ffloth.com> wrote:

> I downloaded the iso images from
> ftp://gsyprf10.external.hp.com/debian-cd/3.0_r0/hppa/
> I went back to check for the MD5 Checksums.
> They did not compare, but then I saw that the MD5SUM file was referencing
> i386 disks,
> under the hppa directory :)
the 3.0r0 ISO on pateam.esiee.fr has its checksum displayed on the website.
>
> Under ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/
> are a lot of test netinstalls,
> Is there any of them that are corresponfing to 3.0r0 ?
> Should I download the .iso image or is the lifimage to prefer ?
They all come from pateam.esiee.fr as well, and all feature the newest
kernels and boot-floppies available, and are based on woody, so they would
indeed correspond to 3.0r0.

The lifimages are only netbootable kernel images.

You would probably need the ISO to help a netinstal procedure.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
