Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amidala.eagle.y.se (amidala.eagle.y.se [194.17.221.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46B01482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 07:33:50 -0600 (MDT)
Date: Thu, 19 Jul 2001 15:33:59 +0200 (MEST)
From: Mattias Nordlund <mathew@eagle.y.se>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HP9000 K200 
In-Reply-To: <200107190219.UAA09084@puffin.external.hp.com>
Message-ID: <Pine.GSO.4.33.0107191528260.531-100000@r2d2.eagle.y.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



On Wed, 18 Jul 2001, Grant Grundler wrote:

> Mattias Nordlund wrote:
> >
>
> >From the bootlog, I only see that I built the kernel.
> The newest one from the FTP site is:
> -rw-r--r--   1 grundler cvsusers  1149294 May  6 00:34 lifimage_32_serial_20010505.gz
>
> Which version of the palinux-cd?
>
The newest, I guess, the one from the parisc-linux.org site.

>
>
> > bootlog:
> > http://ariana.eagle.y.se/~mathew/hp9000_boot.txt
>
> One would have to extract the System.map from the vmlinux in this lifimage
> in order to make any sense of the console log.
>
> Looks like a null ptr derefence. Trying a newer 32-bit kernel/lifimage
> would be a first step.  I've put a newer files on puffin.external.hp.com
> ftp site (pub/parisc/binaries/lifimages):
> -rw-r--r--   1 grundler cvsusers  1412239 Jul 18 20:14 lifimage_32_serial_20010717.gz
> -rw-r--r--   1 grundler cvsusers   549881 Jul 18 20:16 System.map_serial_20010717
>
> Can't promise they will work better though...
>

I've tried that kernel, and it dies at the sam point as my own kernel
died, I have include the new boot-log, as I don't reallt know how to find
teh right adress in the System.map =)

http://ariana.eagle.y.se/~mathew/hp9000_boot1.txt

Mattais N
