From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 14:46:06 -0500
Message-ID: <DB44FC0C-734A-477F-BA28-2271D151F15C@bell.net>
References: <20151218233034.GA24910@p100.box> <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com> <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com> <5676CE11.9020808@gmx.de> <485EBA8B-C9F3-4A5C-9962-ADD70134B52C@bell.net> <56770264.90706@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56770264.90706@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-20, at 2:32 PM, Helge Deller wrote:

>> in a LDO "copy" instruction.
> 
> Actually it's the "OR,cond r1,r2,t" instruction.
> https://parisc.wiki.kernel.org/images-parisc/6/68/Pa11_acd.pdf
> page 5-105
> 
> if ((opcode & 0xff00ffff) == 0x08000254)
> 
> The mask should be 0xffe0ffff, so that some bits of r2 (which needs to be 0) are not missed.

There are multiple instructions that could be used.  The PA 2.0 arch says LDO  on page 7-83.

I think we should fix syscall().  It's not used that much.

Dave
--
John David Anglin	dave.anglin@bell.net



