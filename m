Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B7504A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 15:25:27 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA22878;
	Wed, 28 Feb 2001 09:24:53 +1100
Date: Wed, 28 Feb 2001 09:24:53 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP: We have ignition
In-Reply-To: <E14XkRA-0003RI-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.21.0102280914480.21714-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 27 Feb 2001, Alan Cox wrote:

>  > Is there a 'dont use builtins' flag ?
> > 
> > -fno-builtin
> > 
> > I'd be inclined to do this instead
> 
> Careful, if you use different typings to everyone else you will get a million
> printf format warnings instead

Hmm, alpha, ia64, mips64, sparc64 and s390 use an `unsigned long'
__kernel_size_t while arm, i386, m68k, mips, ppc, sh and sparc use
`unsigned int'.  I think the precedent is there for us to use
`unsigned int' for 32 bit, and `unsigned long' for 64 bit.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
