Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FADB482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jul 2001 09:22:15 -0600 (MDT)
Message-Id: <200107031521.JAA05441@puffin.external.hp.com>
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: jfs-discussion@oss.lotus.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] JFS on PA-RISC-Linux 
In-Reply-To: Message from Peter Weilbacher <weilbach@uni-sw.gwdg.de>
   of "Tue, 03 Jul 2001 12:51:27 +0200." <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de>
Date: Tue, 03 Jul 2001 09:21:00 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Peter Weilbacher wrote:
...
I can't comment on the bus error.

>         mkfs.jfs development version: $Name: v1_0_0 $
> 
>         Warning!  All data on device /dev/sdb1 will be lost!
> 
>         Continue? (Y/N) Y
> 	<4>mkfs.jfs(379): unaligned access to 0x00035245 at ip=0x000137af
> 	Not-handled unaligned insn 0x4a740108
> 	Unaligned handler failed, ret = -1
> 
> (optionally without <4> or with Bus error)
> 
> Is it JFS's fault or that of the PA-RISC-Linux port?

The parisc-linux port. Randolph Chung recently added support for unaligned
access emulation.  Randolph needs more info to fix this problem.
See http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012946.html

> The messages do
> not seem to be from mkfs.jfs, as I did not find anything like that
> in its source. Is it too early to try things like this?

No. If no one tries, we won't know what's broken. The basic stuff works.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
