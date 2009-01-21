From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 09:24:22 +0100
Message-ID: <200901210924.23484.arnd@arndb.de>
References: <1232496257.3123.19.camel@localhost.localdomain> <20090120.163203.199590606.davem@davemloft.net> <4976D937.5040704@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: David Miller <davem@davemloft.net>, jaswinder@kernel.org,
	mingo@elte.hu, x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4976D937.5040704@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 21 January 2009, Helge Deller wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> >> On parisc, there is a major confusion in this area, at some point, all
> >> checks for __LP64__ got replaced with CONFIG_64BIT there. While I have
> >> not understood what the problem with __LP64__ was, the check for
> >> CONFIG_64BIT on parisc user space looks very wrong.
> 
> I think the parisc mess is my fault. I once replaced the __LP64__ by 
> CONFIG_64BIT and forgot that some files are exported to userspace.
> I'll clean that up and send patches.

I have a patch set that introduces a lot more asm-generic headers where
I also need a generic way to check for this. The approach I chose
here was to check "#if __BITS_PER_LONG == 64" for anything that is
exported to user space. Maybe you can #define this in asm/types.h
and use this check in the parisc headers as well.

	Arnd <><
