Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.obsidian.de (unknown [213.69.121.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51BE54A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Feb 2001 01:03:09 -0700 (MST)
Date: Fri, 16 Feb 2001 09:18:09 +0100 (MET)
From: Kevin Read <obsidian@panokratie.de>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Test on 705
In-Reply-To: <3A8C672C.E06566A0@esiee.fr>
Message-ID: <Pine.LNX.4.31.0102160916170.456-100000@kiste.innnet.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Fri, 16 Feb 2001, Thomas Marteau wrote:

> Hi Kevin,
>
> 	It seems like you want to boot with the file system via nfs.

Yes, thats my intention.

> This is waht that means:
>
> mount: RPC call returned error 229
> Root-NFS: Server returned error -229 while mounting /tftpboot/(none)
> VFS: Unable to mount root fs via NFS, trying floppy.
> VFS: Cannot open root device "nfs" or 02:00
> Please append a correct "root=" boot option
>
> If it is not what you want, please refer to the PALO Readme or to the
> official website PALO How-To

Thanks for the pointers! I tcpdumped the network and couldn't see any
bootp requests so I figured that the kernel couldn't access the network
chip, too.

BTW, this kernel is from yesterdays CVS.


>
> Good Luck, Thomas
>
> ESIEE Team
> Visit http://www.esiee.fr/puffin
>
