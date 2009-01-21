From: Helge Deller <deller@gmx.de>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 09:13:43 +0100
Message-ID: <4976D937.5040704@gmx.de>
References: <1232496257.3123.19.camel@localhost.localdomain>	<20090120.161626.93641145.davem@davemloft.net>	<200901210124.26118.arnd@arndb.de> <20090120.163203.199590606.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: arnd@arndb.de, jaswinder@kernel.org, mingo@elte.hu, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@mcmartin.ca>
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090120.163203.199590606.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
>> On parisc, there is a major confusion in this area, at some point, all
>> checks for __LP64__ got replaced with CONFIG_64BIT there. While I have
>> not understood what the problem with __LP64__ was, the check for
>> CONFIG_64BIT on parisc user space looks very wrong.

I think the parisc mess is my fault. I once replaced the __LP64__ by 
CONFIG_64BIT and forgot that some files are exported to userspace.
I'll clean that up and send patches.

Thanks for catching this!

Helge
