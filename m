Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe55.law3.hotmail.com [209.185.240.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EA054829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 09:27:11 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <OE232NqFJ3sl3xbYiMC00003f35@hotmail.com> <20020805151839.GD31773@systemhalted>
Subject: Re: [parisc-linux] Compiling 2.4.19-pa0
Date: Mon, 5 Aug 2002 17:27:08 +0200
Message-ID: <OE55uhhhETApmdUrmib0000099c@hotmail.com>
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

[....]

> On Mon, Aug 05, 2002 at 04:17:45PM +0200, Alex Green wrote:
> > Hi,
> >
> > I'm trying to compile the latest kernel source from the parisc-linux
ftp,
> > 2.4.19-pa0 I belive and I get the following errors while doing the "make
> > vmlinux":
> >
>
> Please include a list of the following:
>
> 1. Compiler version.

gcc-3.1.1 and gcc-3.0.4

> 2. Binutils version.

binutils-2.12.90.0.15-1

> 3. Modutils version.

modutils-2.4.19    * Built from source *

> 4. Last time you ran "apt-get update; apt-get dist-upgrade;".

Today

> 5. Running kernel version.

2.4.18 from woody

> 6. How you got the kernel source tree.
>         - Did you 'cvs co' ontop of a 2.4.18 tree?

no, i took the .tar.gz from the CVS on the ftp site, I have no access to cvs
* firewall *


> 7. What steps you took to compile the kernel.
>         - Did you try runnig 'make mrproper' first?

make clean dep vmlinux.....     Should I try running make mrproper first??
