Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA08270
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 22:49:12 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 91ADE68A
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Nov 2000 00:51:28 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id WAA05143 for parisc-linux@puffin.external.hp.com; Wed, 22 Nov 2000 22:50:14 -0700 (MST)
Date: Wed, 22 Nov 2000 22:50:14 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011230550.WAA05143@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CONFIG_DMB_TRAP diff
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> Hello again (last one until Monday - I promise),
>
> With Lamont's wisdom, I implemented support for Date Memory Break trap.
>
> This enables the kernel programmer to capture the evil code which
> stomps on other people's "private" data. Only works for stores
> through virtual addresses. gsc_writeX() and DMA will still
> bypass this mechanism.
>
> pb, dhd, (or some equivalent deity), could you review/commit this code?
> Or tell me it's ok to commit?
>
> I've touched:
>         arch/parisc/config.in
>         arch/parisc/kernel/entry.S
>         arch/parisc/mm/kmap.c
>         include/asm-parisc/pgtable.h
>

Please don't. This solution is way more complicated than it should be.
Here are the problems with it:

     1) As I had already mentioned in a previous discussion, the
     pte's already reserve the location for the B bit (data memory
     break trap) and the dtlb miss handlers already move the entire
     group of bits that include this bit in one operation. So no
     change is necessary to the dtlb miss handlers to specially
     set that bit and incur extra instructions in the tlb miss handlers,
     and no extra bits need to be allocated in the pte. Instead of
     adding a new definition (e.g. 0x800, which is our last available bit)
     use the one that is already reserved for it: 0x010.

     2) There is no reason to add a special data memory break trap
     handler. The general trap handler is more than sufficient for
     this case. handle_interruption will be called if a data memory
     break trap is encountered. Just add a new case for the list
     of traps, and handle the trap in C. You can set the X bit by
     simply setting it in the saved ipsw (in gr[0]) and it will be
     set upon return from the trap, no muss, no fuss.


Note that the above also applies for the page reference trap.  The T bit
is also already supported (0x040 in the pte) by the dtlb miss handlers.
Note that the reason I reserved these bits is because it would actually
take MORE code in the dtlb miss handlers to NOT support those bits and use
them for something else.

Another helpful hint for those wanting to use this feature.  If you are
tracking corruptions that span multiple pages, then just setting the B bit
on each page may be all you need.  But, when I've used the data memory
break trap for corruption tracking, typically I've wanted to track a
corruption that was happening to a particular variable, i.e. a 4 byte
quantity, and lots of other variables were being legitimately written on
the same page, so you wind up with thousands of data memory break traps,
where only one may be the one that is corrupting the location you are
interested in.  But, all is not lost, the solution is still fairly simple.
The data memory break trap provides a valid iir, isr and ior.  So once you
get the trap, a custom data memory break handler (which can be written
with a few lines of C in handle_interruption), simply uses iir, isr and
ior to check if the access was to the specific byte or bytes you are
interested in.  I've simply used isr/ior to check for writes within the
word I was interested in.  That may be enough for most cases.  The
information you are missing from isr/ior is the size of the write
transaction.  To get this you would need to parse the instruction stored
in iir (code to determine the size of a store from the instruction in the
iir will be necessary when an unaligned fault handler is written).

John Marvin
jsm@fc.hp.com
