Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD6D9484A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Sep 2001 11:19:47 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] New i386 cross compilers 
In-Reply-To: Message from "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
   of "Sat, 08 Sep 2001 15:29:13 EDT." <20010908152913.B9613@megatonmonkey.net>
References: <20010908040516.1AA5637DD4@carmen.fc.hp.com>  
 <20010908152913.B9613@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Sep 2001 11:19:46 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010914171946.514203806C@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Carlos O'Donell Jr." writes...

> > Hi palinux people,
> > 
> > ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010905.tar.g
> z
> > 
> > Untar it from / it lives in /opt/palinux/
> > Report any problems to the list.

Oops! The message you just posted made me realize I never responded to this 
message. Sorry.

I used

- binutils upstream
- pehc gcc
- glibc I got from willy (debian 2.2.4 source + things willy hasn't added?)
- glibc headers from current debian hppa glibc package
- kernel headers from pehc
- autobuilder from pehc:build-tools/palinux-autobuilder (cvs up turned off)

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
