Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5526749FC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 15:29:47 -0600 (MDT)
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Where to get recent parisc kernels w/o building? 
In-Reply-To: Message from "Neulinger, Nathan" <nneul@umr.edu>
   of "Fri, 28 Sep 2001 15:37:57 CDT." <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F4@umr-mail03.cc.umr.edu>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F4@umr-mail03.cc.umr.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 28 Sep 2001 15:29:46 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010928212946.44B9D37C8D@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Neulinger, Nathan" writes...

> Is there any convenient place to grab a 2.4.9 (or more recent) vmlinux for
> parisc-linux other than getting it myself out of cvs? (Don't have a
> functional build environment at the moment.)

The ones in
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels
are rather out of date. I'll try an build some next week if someone doesn't 
beat me to it.

> Also, what about a working gcc? I've apt-get upgrade'd everything, and gcc
> complains about lots of header file goofiness when compiling even a simple
> hello world program.

apt-get install libc6-dev

> Also, does the kernel build have to be done cross-compile, or can it be
> built on the parisc-linux machine itself?

The preferred way of building kernels is natively. However, if the only native 
box you have access is slow, then you'll probably still want to cross compile.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
