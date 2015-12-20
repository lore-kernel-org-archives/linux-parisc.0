From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 15:14:08 -0500
Message-ID: <6E922C83-B2CF-4B18-94B4-E848EF7305F9@bell.net>
References: <20151218233034.GA24910@p100.box>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151218233034.GA24910@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-18, at 6:30 PM, Helge Deller wrote:

> +	/* Get assembler opcode of code in delay branch */
> +	uaddr = (unsigned int *) (regs->gr[31] + 1);

Shouldn't increment be 4?

Dave
--
John David Anglin	dave.anglin@bell.net



