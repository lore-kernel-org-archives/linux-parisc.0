From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts (v2)
Date: Mon, 21 Dec 2015 08:11:50 -0500
Message-ID: <D2C9455F-EB66-494D-8503-4F56E6289ECA@bell.net>
References: <20151218233034.GA24910@p100.box> <20151221091933.GA22935@p100.box>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151221091933.GA22935@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-21, at 4:19 AM, Helge Deller wrote:

> On parisc the current syscall restart code assumes that all syscall
> callers load the syscall number in the delay slot of the ble
> instruction. That's how it is e.g. done in the unistd.h header file:
> 	ble 0x100(%sr2, %r0)
> 	ldi #syscall_nr, %r20
> Because of that assumption the current code never restored %r20 before
> returning to userspace.

Is %r20 restored for nop case?  The comments in the patch suggest that it is
not necessary to restore it.

I'm  thinking we need to review syscall clobbered register list for glibc.

Dave
--
John David Anglin	dave.anglin@bell.net



