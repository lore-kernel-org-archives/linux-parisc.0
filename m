Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79B24482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 23:07:11 -0600 (MDT)
Message-Id: <200109060504.XAA09545@puffin.external.hp.com>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs update gives 'move away ....' on every file 
In-Reply-To: Message from thunder7@xs4all.nl
   of "Wed, 05 Sep 2001 15:29:44 +0200." <20010905152944.A23742@middle.of.nowhere>
Date: Wed, 05 Sep 2001 23:04:24 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

thunder7@xs4all.nl wrote:
> - downloaded the linux-latest.tar.gz archive
> - created /home/cvs/parisc and made sure I had enough permissions

You can call this directory anything you want.
I have my linux source trees under /linux/pa64/linux.

...
> - typed 'cd /home/cvs/parisc; cvs update'

You didn't name the CVS repository to use and cvs got confused.

Try 'cd /home/cvs/parisc/linux; cvs update -APd'
Or  'cd /home/cvs/parisc; cvs update -APd linux'

I prefer "pwd" be the source tree I want updated from the repository.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
