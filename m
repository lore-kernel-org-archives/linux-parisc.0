Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bender.bawue.de (bender.bawue.de [193.197.13.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65E0F482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Apr 2001 12:17:14 -0600 (MDT)
Date: Thu, 19 Apr 2001 20:18:33 +0200 (CEST)
From: Andreas Thienemann <andreas@thienemann.net>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Clock skew problems 
In-Reply-To: <200104191802.MAA24940@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.10.10104192013560.31352-100000@gate.ixs.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Grant,

On Thu, 19 Apr 2001, Grant Grundler wrote:

> Everytime one updates the kernel time and it gets set *back*,
> make will notice the derived objects (ie libdb.a) are newer than
> current time and complain.
Yes, I knew that. I still can remember when it happened to me for the
first time. I was a fresh linux novice running RedHat 3.0.3 and  compiling
his first kernel when I played with the timeconfig panel in another
xterm. Whoaps! One failed build attempt. ;)
 
> I'm assuming the A500 has a good RTC.
I've got a 821/D250 and I don't know anything about the accuracy of the
RTC clock.
But hwclock tells me the following:

[root@hp9000 root]# hwclock
Thu Apr 19 20:17:25 2001  -1.063290 seconds

> I'll submit a bug for you.
Thanks!

bye,
 andreas
