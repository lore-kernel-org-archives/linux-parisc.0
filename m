From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 01:24:25 +0100
Message-ID: <200901210124.26118.arnd@arndb.de>
References: <1232496257.3123.19.camel@localhost.localdomain> <20090120.161626.93641145.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: jaswinder@kernel.org, mingo@elte.hu, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090120.161626.93641145.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 21 January 2009, David Miller wrote:
> From: Jaswinder Singh Rajput <jaswinder@kernel.org>
> Date: Wed, 21 Jan 2009 05:34:17 +0530
> 
> > usr/include/asm-generic/fcntl.h is giving 2 'make headers_check' warnings:
> >  usr/include/asm-generic/fcntl.h:127: leaks CONFIG_64BIT to userspace where it is not valid
> >  usr/include/asm-generic/fcntl.h:149: leaks CONFIG_64BIT to userspace where it is not valid
> > 
> > usr/include/asm-generic/fcntl.h:
> ...
> > #ifndef CONFIG_64BIT will always be true for userspace. So what is the use of #ifndef CONFIG_64BIT ?
> 
> Good catch.
> 
> This file needs to test for 64-bit'ness using some non-CONFIG_*
> test.  And the standard built-in CPP macros which can be used
> to check for that are different on every platform.

I think we should simply define a macro for use in the kernel, e.g. in
<asm/types.h>. There already is a BITS_PER_LONG macro in there, maybe
we can add an exported __BITS_PER_LONG there that checks for the right
macro on each architecture.

On parisc, there is a major confusion in this area, at some point, all
checks for __LP64__ got replaced with CONFIG_64BIT there. While I have
not understood what the problem with __LP64__ was, the check for
CONFIG_64BIT on parisc user space looks very wrong.

	Arnd <><
