Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp5ve.mailsrvcs.net (smtp5vepub.gte.net [206.46.170.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 311044A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 09:32:43 -0700 (MST)
Sender: raffo@bellatlantic.net
Message-ID: <3A93ED8E.E33833CF@neuronet.pitt.edu>
Date: Wed, 21 Feb 2001 11:32:14 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Warnings compiling the CVS kernel
References: <Pine.LNX.4.21.0102211838120.9668-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> On Wed, 21 Feb 2001, Rafael E. Herrera wrote:
> > After building the cross-compiler in an x86 machine, I get warning
> > message like this one for most of the sources when compiling the kernel:
> >
> > /usr1/users/raffo/parisk/source/linux/include/linux/string.h:27:
> > warning: conflicting types for built-in function `strncpy'
> 
> These are a result of the string functions being declared in the
> kernel header file to take an "unsigned long" length arg (via
> __kernel_size_t)

Doesn't sound like an issue then.

> > The compilation succeeds but the boot will crash here:
> >
> > [...]
> > POSIX conformance testing by UNIFIX
> 
> Yeah, same result here (except I get a reboot).  I'm not sure yet whether
> this is due to bugs in gcc or the kernel.

Let me know I there is something I can try. Thanks

-- 
     Rafael
