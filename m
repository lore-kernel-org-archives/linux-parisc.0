Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from imhotep.aubi.de (mail.aubi-online.de [62.159.82.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F99548EA
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 15:52:00 -0600 (MDT)
Message-ID: <7B1EED0C5D58D411B73200508BDE77B2C53CA9@EXCHANGEB>
From: =?iso-8859-1?Q?Markus_D=F6hr?= <doehrm@aubi.de>
To: "'Thomas Marteau'" <marteaut@esiee.fr>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Newbie on PA: Trying to compile kernel
Date: Tue, 9 Oct 2001 23:51:47 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Thanx for you quick answer!

> First of all, a reminder about the CVS. You have all the 
> infos about it
> at 
>  http://www.parisc-linux.org/tools/index.html#anoncvs

I have :-)

> After, for the cross-compiling, you need to download the xc here
> ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-l
atest.tgz

No, I'd like to do a native linux-kernel-on-linux compile.

I'm compiling kernels since 1.9.X (don't remember exactly) on INTEL and
Sparc, but never did on parisc. So I did the following:

hppaubi:/usr/src# export CVSROOT=`cat linux/CVS/Root `

hppaubi:/usr/src# echo $CVSROOT
:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc

hppaubi:/usr/src# cvs -z5 co linux palo

The documents tell me to use either NFS or a RAMDISK in palo/Makefile and
_here's_ the problem (or the documents are outdated). I'll try the manual
approach and see what'll happen.


PS-OT: I wonder if SAP will port their application server to parisc/Linux...

-- 
Markus Doehr            AUBI Baubschlaege GmbH
IT Admin/SAP R/3 Basis  Zum Grafenwald
fon: +49 6503 917 152   54411 Hermeskeil
fax: +49 6503 917 190   http://www.aubi.de 
