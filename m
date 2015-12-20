From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 14:39:33 -0500
Message-ID: <B201D30D-8677-4D06-B3F9-EA4494972EF5@bell.net>
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

> +	/* Usually we don't have to restore %r20 (the system call number)
> +	 * because it gets loaded in the delay slot of the branch external
> +	 * instruction via the ldi instruction.
> +	 * In some cases a register-to-register copy instruction might have
> +	 * been used instead, in which case we need to copy the syscall
> +	 * number into the source register before returning to userspace.
> +	 */

I'm thinking it might be better to fix syscall() in glibc.  The copy could be
moved before ble and a nop placed delay slot.

Dave
--
John David Anglin	dave.anglin@bell.net



