Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA01894
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Dec 1999 14:41:55 -0700
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by palrel1.hp.com (Postfix) with ESMTP id DF980416
	for <parisc-linux@thepuffingroup.com>; Tue, 14 Dec 1999 13:44:12 -0800 (PST)
Message-Id: <199912142144.NAA22222@lucy.cup.hp.com>
Subject: Re: [parisc-linux] /usr/conf/machine header files
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de
Date: Tue, 14 Dec 1999 13:43:59 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991211145107.C17836@mathe.stud.uni-erlangen.de> from Philipp Rumpf at Dec "11," 1999 "02:51:07" pm
From: Jerry Huck <jerry_huck@hp.com>
Reply-To: huck@cup.hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: huck@cup.hp.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Sat, 11 Dec 1999 14:51:07 +0100
> From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
> To: huck@cup.hp.com
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] /usr/conf/machine header files

> > FYI,  More precisely, PA2.0 expects to be programmed with "F" extended
> > 62-bit physical addresses.  The upper 2 bits are always ignored.  The
           ^^^^^^^^ should be "absolute"

> The architecture documentation is quite explicit in that the 2 msbs get
> ignored in the _virtual_ address offset generation only.  Actual CPUs
> are quite likely to always ignore them, though.

My statement was wrong.  I forgot about our subtle distinction between
absolute and physical addresses and the contradictions in the 2.0 book.

Readers can skip the remainder of this note if your not interested in
address definitions.

The 1.x books made physical and absolute addresses equivalent.  The 2.0
architecture made a significant distinction between absolute and physical
addresses but did not properly document the difference.

Page 3-1, section "Physical and Absolute addressing", correctly defines
the two terms.  Basically, an absolute address is only 62-bits in
width and the upper 2 bits must be ignored.  Physical addresses are 64-bits
wide.  Page H-10 correctly describes the mapping between the two addresses.

The address you form for data or instruction addresses when PSR.D or
PSR.C (respectively) is zero is an ABSOLUTE address.  The LDWA and
STWA instructions specify an ABSOLUTE address.  This is consistently
correct in the book.

Inconsistently specified is the output of the TLB.  TLBs translate
virtual addresses to PHYSICAL addresses (full 64-bits).  This is
incorrect in many places.

Also, the discussion on page 3-8 on "Absolute Addresses" is confusing
since the upper 2 bits of the "offset" (a 64-bit quantity) is ignored
and all the memory vs. I/O distinction is done using the upper 4 bits
of the 62-bit absolute address.

So, you can still count on the interesting equivalent mapping that
is possible between absolute addresses and virtual addresses.

> > "F" extension is preserved in all processor resources independent of
> > the implemented addess space.  For example, a data reference to the
> > physical address 0x3FFF FFFF FFFF 0000 (PSW.d == 0) that took a TLB
> > miss would include the unimplemented bits in the ISR.
> 
> How can you take a (Data, I assume) TLB miss with the PSW's D bit == 0 ?

My mistake - bad example and incorrect terminology.  How about:

For example, a data reference to the absolute address 
0x3FFF FFFF FFFF 0000 (PSW.d == 0) that took an "assist emulation trap"
would include the unimplemented bits in the ISR.

> > The one exception is the LPA instruction.  It is only defined to the
> > width of the implemented physical address space.  To convert that
> > address to a generic 64-bit pointer use:
> > 
> >     trialphysaddr = LPA(va);
> >     if( trailphysaddr == 0 ) /* do something else */
> >     physaddrwidth = PDC_MODEL.returnCPU_ID.ret[1] + 40;
> >     if( (trialphysaddr >> physaddrwidth) == 0xF) {
> >         /* need to F extend and decide what to put
> >            into the upper 2 bits */
> >         <...>
> >     } else
> >         physaddr = trialphysaddr;
> > 
> > The upper bits of the LPA result beyond the implemented boundary are
> > guaranteed to be zero.
> 
> Why would we want to use LPA anyway ?

I don't know how Linux works, but it is a fast way to get the physical
address for DMA (say out of a virtually mapped buffer pool).  We have
used physically indexed tables that low-level handlers can quickly
pick up some information for fault handling (say some kind of page
promotion information or other things that don't fit in the TLB
entry).
> 
> > > > if this is a feature of HP-UX or something in the HW makes it
> > > > easier to do it this way...anyone know?
> > 
> > F extension reflects the architecture separation of I/O (uncached)
> > addresses from memory (cached) addresses.  The processor makes many
> > assumptions and address space is assigned to reflect this
> > architecture.  By allocating memory address space up from 0, and I/O
> > address space down from 0x3fff ffff ffff ffff, then all code is
> > independent of the implemented address space size.  I imagine other
> > approaches can do this but it works nicely for PA.
> 
> That's just not what the documentation says, and I propose we follow
> it by simply using physical addresses 0xfXXX XXXX XXXX XXXX when
> referring to IO space.

The documentation is a little inconsistent.  I was referring to
absolute addresses.  Depending on how you want to manage the possible
equivalent mappings, those upper 2 bits of absolute addresses will get
set to some interesting values.  Addresses used by I/O devices are
physical addresses and will definitely start with 0xF.

Jerry

...stuff deleted...

> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
