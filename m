Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02AAA4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 00:45:18 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA14891;
	Wed, 21 Feb 2001 18:44:58 +1100
Date: Wed, 21 Feb 2001 18:44:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Warnings compiling the CVS kernel
In-Reply-To: <3A9368A1.E31D5F93@neuronet.pitt.edu>
Message-ID: <Pine.LNX.4.21.0102211838120.9668-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Feb 2001, Rafael E. Herrera wrote:

> After building the cross-compiler in an x86 machine, I get warning
> message like this one for most of the sources when compiling the kernel:
> 
> /usr1/users/raffo/parisk/source/linux/include/linux/string.h:27:
> warning: conflicting types for built-in function `strncpy'

These are a result of the string functions being declared in the
kernel header file to take an "unsigned long" length arg (via
__kernel_size_t)

> The compilation succeeds but the boot will crash here:
> 
> [...]
> POSIX conformance testing by UNIFIX

Yeah, same result here (except I get a reboot).  I'm not sure yet whether
this is due to bugs in gcc or the kernel.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
