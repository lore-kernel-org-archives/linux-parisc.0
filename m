Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 029A94A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 09:18:56 -0700 (MST)
Date: Wed, 14 Feb 2001 10:17:56 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Steven Pritchard <steve@silug.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Auto-rebooting (was Re: [parisc-linux] C100 & Latest CVS Bits)
In-Reply-To: <200102132246.f1DMkL801323@osiris.silug.org>
Message-ID: <Pine.LNX.4.21.0102140959410.16902-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 13 Feb 2001, Steven Pritchard wrote:

> Does rebooting with sysrq work?  

Er, as in on the keyboard?  It's not even plugged in.  I haven't gotten a
monitor to work with my C100 so I've only used the serial console and
telnet.

> (I've never actually tried it over a serial console, but I seem to
> recall that you can send a break, then "b".)

My terminal program is cu on a Sun SparcStation 2.  Sending a break with
'~#' and '~%break' with and without a trailing 'b' don't have any effect.

> Actually, will that work, or do you have to turn on sysrq via /proc
> after booting?
> 
> Oh, wait, it looks like you can pass "panic=1" as a kernel parameter. 
> That should have the same effect as "echo 1 > /proc/sys/kernel/panic"
> (or adding "kernel.panic = 1" to /etc/sysctl.conf and running "sysctl
> -p") on a running system.

I'll go ahead and append this option, but I think some of the times the
kernel is dead.

- Greg
