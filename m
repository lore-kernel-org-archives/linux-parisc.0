Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EBCE482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 12:53:39 -0600 (MDT)
Message-Id: <200110111850.MAA29903@puffin.external.hp.com>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B2000 
In-Reply-To: Message from Richard Allen <ra@hp.is>
   of "Thu, 11 Oct 2001 16:47:35 -0000." <20011011164735.I4861@hp.is>
Date: Thu, 11 Oct 2001 12:50:20 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Allen wrote:
> I just got a B2000 in and I decided to test it with Linux.
> 
> The B2000 is a strange beast.  It's got USB keyboard and mouse.
> It has a IDE cdrom drive.

Yup. none of which is supported yet.
USB support is almost ready.
I need to look at IDE-CDROM support because of issues
with the IDE drivers and DMA. I've got a pile of other
things on my todo list as well so this may take a while.

> The 0.92 iso began booting and loaded the kernel.   It's console (B2000
> is a workstation with a graphical console) went blank and the screen went
> into powersaving mode.

You need to use serial console and boot via LAN and setup
an NFS root to install on a local HD. Lack of CD-ROM support,
issues with SE SCSI on those boxes, and no testing of sticons
(console driver for graphics head) makes installing from CD somewhat
unatractive on that generation of workstation. But several folks
(including me) are running parisc-linux on C3000, J5000, and J7000
machines. It's just not easy to install yet.

> Judging by the front panel LCD, things went very bad ;)   It was cycling
> through many HPMC and FLT codes.

Could be any one of the unsupported devices or bugs in the older kernel.

There is talk of a 0.9.3 ISO but no plan of when to release it.
I'd expect in the next month or so.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
