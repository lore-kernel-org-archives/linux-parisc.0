Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D46E482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 11:55:07 -0600 (MDT)
Message-Id: <200104131748.LAA06103@puffin.external.hp.com>
To: "Matthew van de Werken" <mvdw73@one.net.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Booting 735/99 
In-Reply-To: Your message of "Fri, 13 Apr 2001 22:28:27 +1000."
             <007701c0c415$3f4779a0$1401a8c0@peewee>
Date: Fri, 13 Apr 2001 11:48:25 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Matthew van de Werken" wrote:
> Is this possible? Is there a disk image somewhere I can use for this?

You should be able to dump the ISO to disk and boot that.
The only problem is to convince everyone to use the disk instead
of CDROM /dev special device names. I think one only has
to interactively change the "Root" parameter but haven't
tried it recently.


> Alternatively, can I build a bootable disk manually on the SCSI disk from
> the x86 box? If I do this, what do I need to do? I tried to do the
> instructions on the "Installing PA-RISC Linux" page, however I couldn't
> mount the "f0" type partition (for obvious reasons), even if I had known
> what to put there once I had.

The f0 partition is raw data and not a file system.
cvs checkout the linux and palo repositories from your x86 and
you can build an XC palo which can talk to your disk.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
