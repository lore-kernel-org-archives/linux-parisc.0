Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2E19482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Aug 2001 17:57:04 -0600 (MDT)
Message-Id: <200108132355.RAA14012@puffin.external.hp.com>
To: Christian Weerts <christian@familie-weerts.de>
Cc: parisc-ml <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] LAN booting 
In-Reply-To: Message from Christian Weerts <christian@familie-weerts.de>
   of "Mon, 13 Aug 2001 18:07:36 -0000." <20010813180736.A306@familie-weerts.de>
Date: Mon, 13 Aug 2001 17:55:23 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christian Weerts wrote:
> Hi,
> 
> is there anyone who has a running 715/80? I want to build a kernel for this
> machine discribed in the nfsroot howto from Martin Petersen, but i don't
> have HP-UX anywhere.

You don't need to have HPUX - note the date of Martin's HOW-TO.
It was posted when we were still using SOM binaries and the linker only
ran under HPUX. You should be able to install from the 0.92 ISO
and build kernels natively.

Or build kernels on x86-linux using the XC toolchain built by Matt Taggart
and posted to the puffin.external.hp.com ftp site. Search parisc-linux
mail archives since May 2001 if you want the full URL.

> If i had a kernel perhaps i could boot the machine over LAN.

Could you mount the 0.92 ISO on an x86-linux box and steal that kernel?
(there are probably several but just try the 32-bit ones.)

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
