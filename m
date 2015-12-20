From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 21:19:18 +0100
Message-ID: <56770D46.3030909@gmx.de>
References: <20151218233034.GA24910@p100.box>
 <6E922C83-B2CF-4B18-94B4-E848EF7305F9@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <6E922C83-B2CF-4B18-94B4-E848EF7305F9@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20.12.2015 21:14, John David Anglin wrote:
> On 2015-12-18, at 6:30 PM, Helge Deller wrote:
> 
>> +	/* Get assembler opcode of code in delay branch */
>> +	uaddr = (unsigned int *) (regs->gr[31] + 1);
> 
> Shouldn't increment be 4?

No.
The first address which is being executed in userspace is regs->gr[31]-3.

Helge


