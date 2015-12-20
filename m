From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 21:06:50 +0100
Message-ID: <56770A5A.1080700@gmx.de>
References: <20151218233034.GA24910@p100.box>
 <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com>
 <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com>
 <5676CE11.9020808@gmx.de> <485EBA8B-C9F3-4A5C-9962-ADD70134B52C@bell.net>
 <56770264.90706@gmx.de> <DB44FC0C-734A-477F-BA28-2271D151F15C@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <DB44FC0C-734A-477F-BA28-2271D151F15C@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20.12.2015 20:46, John David Anglin wrote:
> On 2015-12-20, at 2:32 PM, Helge Deller wrote:
> 
>>> in a LDO "copy" instruction.
>>
>> Actually it's the "OR,cond r1,r2,t" instruction.
>> https://parisc.wiki.kernel.org/images-parisc/6/68/Pa11_acd.pdf
>> page 5-105
>>
>> if ((opcode & 0xff00ffff) == 0x08000254)
>>
>> The mask should be 0xffe0ffff, so that some bits of r2 (which needs to be 0) are not missed.

This is actually not the full truth.
I missed the point, that "r2" is a register and not an immediate value.
My code just checks that "r2" means %r0, while it could be any other register as well,
which either has a null-value, or even worse, if someone decides to "calculate" the syscall number.

> There are multiple instructions that could be used.  The PA 2.0 arch says LDO  on page 7-83.

True.
But luckily it seems gas converts "copy" to the "or" syntax mentioned above.
In any case, keeping my kernel patch will report any cases (which might by mistake get added)
in the future so that we can fix userspace then (or enhance the kernel workaround).

Helge
