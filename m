From: David Miller <davem@davemloft.net>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Tue, 20 Jan 2009 16:32:03 -0800 (PST)
Message-ID: <20090120.163203.199590606.davem@davemloft.net>
References: <1232496257.3123.19.camel@localhost.localdomain>
	<20090120.161626.93641145.davem@davemloft.net>
	<200901210124.26118.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: jaswinder@kernel.org, mingo@elte.hu, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: arnd@arndb.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200901210124.26118.arnd@arndb.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 21 Jan 2009 01:24:25 +0100

> I think we should simply define a macro for use in the kernel, e.g. in
> <asm/types.h>. There already is a BITS_PER_LONG macro in there, maybe
> we can add an exported __BITS_PER_LONG there that checks for the right
> macro on each architecture.

That might work.

> On parisc, there is a major confusion in this area, at some point, all
> checks for __LP64__ got replaced with CONFIG_64BIT there. While I have
> not understood what the problem with __LP64__ was, the check for
> CONFIG_64BIT on parisc user space looks very wrong.

Yep.
