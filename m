Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A489482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Apr 2001 12:09:09 -0600 (MDT)
Message-Id: <200104191802.MAA24940@puffin.external.hp.com>
To: Andreas Thienemann <andreas@thienemann.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Clock skew problems 
In-Reply-To: Your message of "Thu, 19 Apr 2001 15:22:08 +0200."
             <Pine.LNX.4.10.10104191518560.30090-100000@gate.ixs.com>
Date: Thu, 19 Apr 2001 12:02:54 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Andreas Thienemann wrote:
> But now, when I try do compile some software I'm having problems.
> 
> I'm getting the following message from make:
> 
> make: *** Warning: File `libdb.a' has modification time in the future
> (2001-04-19 15:15:33 > 2001-04-19 15:15:04)
>
> And I have absolutely no Idea why this is happening.

Everytime one updates the kernel time and it gets set *back*,
make will notice the derived objects (ie libdb.a) are newer than
current time and complain.

However, I suspect the kernel isn't keeping time perfectly and updating
from the HW clock (YMMV: historically, some servers had better RTC crystals)
is causing the problem. Having a bad RTC will also look like
the kernel isn't keeping time when in fact it is.

a500# date
Thu Apr 19 11:11:02 MDT 2001
a500# hwclock
Thu Apr 19 11:11:01 2001  -1.003308 seconds
a500# uptime
 11:11:36 up 21:25,  1 user,  load average: 0.00, 0.04, 0.04

So not doing too badly - but it needs to be fixed.
I'm assuming the A500 has a good RTC.
I'll submit a bug for you.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
