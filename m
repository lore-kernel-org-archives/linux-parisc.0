Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA29656
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 03:28:43 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id CAA05476
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 02:30:03 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id CAA10197 for parisc-linux@puffin.external.hp.com; Mon, 14 Feb 2000 02:30:02 -0700 (MST)
Date: Mon, 14 Feb 2000 02:30:02 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002140930.CAA10197@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Linux syscall ABI
List-ID: <linux-parisc.vger.kernel.org>


I've been talking with willy about the Linux syscall ABI, and now I'd
like to get some input from the rest of you regarding how it should
be handled.

As most of you are aware, HP-UX uses some parisc specific features,
namely the gate instruction used on a page mapped with privilege
promotion access rights (i.e. a gateway page), to implement HP-UX
syscalls. HP-UX puts this gateway page at 0xC0000000 in the users
address space (Which on HP-UX is in a shared quadrant, so there
is only one entry is needed in the tlb for all user processes).

Currently I've implemented a Linux syscall gateway page at 0xC0010000,
but since we don't have anything to be binary compatible with for
parisc linux applications, we can do things differently. I'd like
to throw out a few proposals and see what you all think. Feel free
to suggest other ideas.

Proposal #1:

Don't use a gateway page. Use a more "traditional" trapping instruction,
and handle syscalls in the fault path. We could use a subset of the
available break instructions, or we could "dedicate" a trap (the break
instruction trap handler will have to be shared with debugger support),
like the privileged register trap, or any of a few other traps that
a user program should not run into in the normal course of execution.

The disadvantage with this method is that I don't believe it can be made
to perform as well.  Even if we dedicate a particular trap for handling
syscalls, we still need to do at least 4 mtctl instructions (which on many
parisc processors take 2 states each, and don't bundle for multiple issue)
to reload the space queue and offset queue, plus and rfi instruction, in
order to return to virtual mode in the kernel.  This method also will
defeat any advantages from branch prediction.

All of the other proposals below deal with using a gateway page. I
personally believe that using a gateway page is the better choice.
However, on parisc linux we are capable of supporting a ~4 Gb linear
address space for user processes. I don't think locating the gateway
page at the ~3 Gb mark is a good idea, since it prevents heap expansion
beyond that point (this is a problem I am currently trying to work around
on HP-UX for customers who need this kind of large address space and
are not yet willing to port to 64 bit). I can think of no good reason
to put the gateway page in the middle of the user address space somewhere.
The remaining proposals have to do with where the Linux gateway page
should be located.

I should mention here that we do not currently plan on having any globally
shared quadrants in the user address space for parisc linux. Therefore
whether or not an HP-UX gateway page is mapped into the address space
can be determined on a per process basis. I can see no reason to map
a HP-UX gateway page into the address space for native parisc linux
processes (as opposed to HP-UX processes running on parisc linux).

Proposal #2:

Map the Linux syscall gateway page at the top end of the user address space.
What this top end address would be has yet to be determined. Depending
on how we support mapping I/O devices into the user address space, we
may want to reserve the 0xF0000000-0xFFFFFFFF range for IO (keeping the
device mapped at its equivalent address in the kernel address space).
This may be also be necessary for routines like memcpy (so it can easily
determine if the address is an IO mapped address), which if used on IO
addresses have to do things differently, assuming that memcpy is optimized
for performance.


Proposal #3:

Map the Linux syscall gateway page at near the bottom end of the users
address space.  We could define the default text start for parisc linux
processes such that it leaves room for a gateway page below it.

Proposal #4:

Map the Linux syscall gateway page at the very bottom end of the users
address space, i.e. 0x00000000! Note that gateway pages are execute only,
so processes would still fault on a data null pointer dereference. We
could put some trapping code at the beginning of the gateway page to
catch anyone branching through a null function pointer.

One disadvantage of this proposal is that we could not support the
System V personality null pointer dereference behaviour. This maps
a page of zero's at location 0 so that null pointer dereferences will
return 0 for buggy software. Do we really still need to maintain this
ancient hack?

A slight advantage of this proposal is that it eliminates one instruction
(yes, one whole instruction!) from the syscall path. The general syscall
stub for a user space gateway page looks something like this:

	ldil L%<gateway address>,%r1
	ble  R%<gateway address>(%sr?,%r1)
	ldi <syscall #>,%r20

With the gateway page at 0 we don't need the ldil and can do just:

	ble <gateway page offset>(%sr4,%r0)
	ldi <syscall #>,%r20

Proposal #5:

Locate the gateway page in the kernel address space (space 0).  This will
be a more efficient with respect to tlb usage.  It will add an instruction
to the syscall stub (perhaps an instruction or two can be reclaimed
on the gateway page in return, see below).

It is more efficient re: tlb usage for two reasons.  The first reason is
that since there is only one kernel address space, we only need one entry
in the tlb to map the page.  For user space gateway pages every process
will have its own mapping (aliased to the same page).  I should mention
here that every process will have its own unique space value, and we will
not need to flush the tlb on context switches. The second reason is
that we could locate the syscall return path on the gateway page, so
the syscall path will not need to run through another address range
(the syscall return code) that it could miss on. The kernel system
calls are written in C, and therefore cannot do a long branch back onto
the gateway page, which would be necessary if the gateway page is not
located in the kernel address space. If the gateway page is located in
the kernel address space the system calls can return there for the
syscall return path (check pending signals, rescheds, etc.) before
doing a long branch back to user space. We may also be able to save
a few instructions in the syscall path if the return point is the
natural return point for where the branch to the syscall was taken.

The disadvantage is that we would have to load a space register in
the syscall stub. The sequence would be something like this:

	mtsp %r0,%sr0
	ldil L%<gateway address>,%r1
	ble  R%<gateway address>(%sr0,%r1)
	ldi <syscall #>,%r20

If address 0 is available in the kernel address space (and there are
a variety of reasons why it might not be available long term) the
sequence could be shortened to:

	mtsp %r0,%sr0
	ble  <gateway offset>(%sr0,%r0)
	ldi <syscall #>,%r20

Proposal #6:

Locate the gateway page in a space dedicated purely for the gateway
page. This has the advantage of having one global mapping, similar
to proposal #5 above. It also is completely flexible in terms of
where in the address space it could be located, i.e. 0 would be
available. It has the disadvantages (compared to #5) of not being
able to locate the syscall return path on the gateway page. Also
it would take yet another instruction to load a non zero space value
into a space register, e.g: (assuming gateway at address 0)

    ldi <gateway space value>,%r1
    mtsp    %r1,%sr0
    ble  <gateway offset>(%sr0,%r0)
    ldi <syscall #>,%r20

I only mention this possibility to be complete. I personally do not
think it has much going for it.


I haven't proposed more flexible solutions, including what HP-UX
does for 64 bit syscalls, i.e. they pass a pointer to an array of
syscall pointers into the application at startup. This means that
you have to load them from memory.  My opinion is that we don't
need to be that flexible,  but I'm sure some of you will disagree.

So, what do you all think?

John Marvin
jsm@fc.hp.com
