Received: from mail.ginko.net (mail.ginko.net [212.202.73.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA31244
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 07:33:49 -0700
Date: Mon, 14 Feb 2000 14:34:06 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Linux syscall ABI
Message-ID: <20000214143406.J765@abacus.local>
References: <200002140930.CAA10197@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002140930.CAA10197@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Mon, Feb 14, 2000 at 02:30:02AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> Proposal #1:
> 
> Don't use a gateway page. Use a more "traditional" trapping instruction,

I agree this probably has very bad performance, so we shouldn't do it.

> Proposal #2:
> 
> Map the Linux syscall gateway page at the top end of the user address space.
> What this top end address would be has yet to be determined. Depending
> on how we support mapping I/O devices into the user address space, we
> may want to reserve the 0xF0000000-0xFFFFFFFF range for IO (keeping the
> device mapped at its equivalent address in the kernel address space).

I don't think reserving 0xFXXX XXXX for I/O in userspace is a good idea.
There is no problem with doing userspace I/O using the normal mmap /dev/mem
approach.  (Except maybe HPUX compatibility, which doesn't concern linux-
only processes).

Not using the last page (i.e. 0xffff f000 - 0xffff ffff) sounds like a good
idea to me though as it avoids small negative numbers cast into pointers
getting successfully dereferenced.

> This may be also be necessary for routines like memcpy (so it can easily
> determine if the address is an IO mapped address), which if used on IO

kernel memcpy() shouldn't ever be called with either an IO or a user address

> One disadvantage of this proposal is that we could not support the
> System V personality null pointer dereference behaviour. This maps
> a page of zero's at location 0 so that null pointer dereferences will
> return 0 for buggy software. Do we really still need to maintain this
> ancient hack?

No, we don't.  We're talking about PER_LINUX binaries here, and those
never expected to be able to dereference NULL pointers.

> The disadvantage is that we would have to load a space register in
> the syscall stub. The sequence would be something like this:
> 
> 	mtsp %r0,%sr0
> 	ldil L%<gateway address>,%r1
> 	ble  R%<gateway address>(%sr0,%r1)
> 	ldi <syscall #>,%r20
> 
> If address 0 is available in the kernel address space (and there are

Of course every page in the region 0xfffc0000 - 0x3f fffc (it's a 17-bit
signed immediate shifted left 2 bits, so that should be -2^18 - 2^18-4)
can be used, so we just need a page within the first 256 KB.
 
> a variety of reasons why it might not be available long term) the
> sequence could be shortened to:
> 
> 	mtsp %r0,%sr0
> 	ble  <gateway offset>(%sr0,%r0)
> 	ldi <syscall #>,%r20

In fact, what's wrong with shortening _this_ sequence to

	ble <gateway offset)(%sr2, %r0)
	ldi <syscall #>,%r20

and teaching userspace to not modify sr2 ?

> I haven't proposed more flexible solutions, including what HP-UX
> does for 64 bit syscalls, i.e. they pass a pointer to an array of
> syscall pointers into the application at startup. This means that
> you have to load them from memory.  My opinion is that we don't
> need to be that flexible,  but I'm sure some of you will disagree.

If you disagree, there's still 252 / 248 KB left for you to play in.

	Philipp
