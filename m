Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21894
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Feb 2000 11:41:58 -0700
Date: Wed, 16 Feb 2000 18:41:23 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI
Message-ID: <20000216184122.Q765@abacus.local>
References: <200002161357.GAA11682@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002161357.GAA11682@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Wed, Feb 16, 2000 at 06:57:08AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > > But Perhaps we can have a 16 Mb offset instead.
> >
> > I think not mapping the first 64 KB and making a copy of page 0 somewhere
> > else would make sense.  Then we could use the first 64 KB of the virtual
> > address space to implement gateway pages.
> 
> We can probably use a smaller offset than 16 Mb but 64 Kb won't work.  We

I didn't propose any offset.  I proposed to do the mapping somewhat like this:

virt		phys
0000 0000 	somewhere (whereever our syscall page is)
0000 1000 	- (invalid)
 ...
0000 f000	- (invalid)
0001 0000 	0001 0000
 ...
01ff f000	01ff f000

for a 32 MB box.  This is why I said we should make a copy of page 0.

> Rereading what you said above made me realize that you probably were not
> talking about a 64 Kb offset. If so, then you are talking about
> still using an offset of 0, but just not mapping the first 64 Kb a memory,
> i.e. throwing those pages "away" (actually we can probably find ways
> to use them). The only problem with this is that we would be prevented
> from using maximally large tlb mappings to map the first 64 Mb of memory.

I don't think I care.  Note that this is for PA1.1 anyway, so we don't have
large pages architecturally.

> If we moved the offset to 64 Mb we could use 64 Mb page size mappings
> to map the kernel address space. The cost of this is that it reduces
> the amount of physical memory we can support.  We can't support 4 Gb
> (at least not easily), since we need virtual space for the vmalloc area.
> So I'm not sure losing 64 Mb of virtual space at the bottom end is that
> much of an issue.
> 
> What is the largest amount of physical memory we want to support for the
> 32 bit implementation?  How hard do we want to work to achieve it?  We
> can't support more than 4 Gb.  It would take some work to support 4 Gb.
> My feeling is that if we supported 3.5 Gb max that would be more than
> adequate.  We could use a 64 Mb offset and use 64 Mb page size mappings to
> cover the kernel address space.  This should leave enough space for the
> vmalloc area.

IMHO, don't map the first 64 KB, map the first 3.25 GB - 64 KB, then have
512 MB vmalloc space, then 256 MB I/O space.  (For newer boxes it looks like
the 64 KB we don't map should be more like 1 MB).

> > I don't see a real problem with that.  Modifying SR2 requires either direct
> > modification (the only code I could see doing that is HP/UX code, which isn't
> > supposed to execute with PER_LINUX anytime soon) or executing random bytes,
> > which will always break in unexpected ways.
> >
> 
> I agree that it is not a significant enough problem to stop us from doing
> this. So, I propose the following:
> 
>     1) When we move the kernel virtual mappings we will leave room at
>     the bottom to a) properly trap on null pointer dereferences, and
>     b) provide room for a Linux syscall gateway page in the kernel
>     address space (space 0). This gateway page will be located at an
>     offset within the positive offset range of a ble instruction.

If you mean "not map the first 64 KB - 1 MB" by "leave room", I agree.

>     2) We will set sr2 to zero for each process.

Agreed.

>     3) We will only map an HP-UX syscall gateway page into HP-UX
>     processes, i.e. we will not map any gateway page into the user
>     address space for PER_LINUX processes.

agreed.

>     4) Linux syscalls will use the following 2 instruction sequence
>     to reach the gateway page:
> 
> 	ble <gateway offset>)(%sr2,%r0)
> 	ldi <syscall #>,%r20

I'd prefer to fix gateway offset now - it's a pretty arbitrary decision,
but it might break binary compatibility lateron.  My proposal is 0x100.

So did anyone think about how to write the actual syscall asm statements ?
it seems rather hard to me, at least without writing the actual functions
directly and having one more level of indirection ...
