Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1116D482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 12:14:28 -0600 (MDT)
Message-Id: <200104201807.MAA31270@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] kernel panic using cpio from cdrom to disk. 
In-Reply-To: Your message of "Fri, 20 Apr 2001 17:57:49 BST."
             <20010420175749.M11226@linuxcare.com>
Date: Fri, 20 Apr 2001 12:07:14 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> This is interesting, my tests worked fine, but when I tried to reboot
> (typed 'init 6'), it blew up:

was in-mem data being sync'd to disk?

> Like Ryans crash, PSW has only the Q bit set - data translation is
> turned off.  I guess that means the IAOQ values are real addresses, so I
> added 0x10000000 before looking them up in System.map.  In my case, it
> died on the "rsm 8,r0" under os_hpmc_5 in arch/parisc/kernel/hpmc.S.

That would suggest two things:
1) the box HPMC'd in both cases - look at PIM dump for more info
2) we have a bug in our HPMC handler that PDC tries to call (in real mode).
   Perhaps one of the asm gods (or even demi-gods :^) could look at
   hpmc.S and the path to get there.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
