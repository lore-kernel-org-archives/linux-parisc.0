Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA02097
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Dec 1999 18:33:47 -0700
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by atlrel1.hp.com (Postfix) with ESMTP id AEB09C9CF
	for <parisc-linux@thepuffingroup.com>; Fri, 10 Dec 1999 20:35:59 -0500 (EST)
Message-Id: <199912110135.RAA00727@lucy.cup.hp.com>
Subject: Re: [parisc-linux] /usr/conf/machine header files
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de
Date: Fri, 10 Dec 1999 17:35:47 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991209050634.D21512@mathe.stud.uni-erlangen.de> from Philipp Rumpf at Dec "9," 1999 "05:06:34" am
From: Jerry Huck <jerry_huck@hp.com>
Reply-To: huck@cup.hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: huck@cup.hp.com
List-ID: <linux-parisc.vger.kernel.org>

> From parisc-linux-request@thepuffingroup.com Wed Dec  8 21:05:46 PST 1999
> Date: Thu, 9 Dec 1999 05:06:34 +0100
> From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
> To: Grant Grundler <grundler@cup.hp.com>
> Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
>         parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] /usr/conf/machine header files

> > > PA2.0 port:  64-bit virtual addresses are 42 bits per quadrant only and
> > > start at the smallest address in the quadrant - so unlike alpha where the
> > > addresses are "sign-extended".
> > Actually, HP-UX does sign extend I/O addresses. I'm not sure
> 
> That's physical addresses though, so we really don't care, do we ?

FYI,  More precisely, PA2.0 expects to be programmed with "F" extended
62-bit physical addresses.  The upper 2 bits are always ignored.  The
"F" extension is preserved in all processor resources independent of
the implemented addess space.  For example, a data reference to the
physical address 0x3FFF FFFF FFFF 0000 (PSW.d == 0) that took a TLB
miss would include the unimplemented bits in the ISR.

The one exception is the LPA instruction.  It is only defined to the
width of the implemented physical address space.  To convert that
address to a generic 64-bit pointer use:

    trialphysaddr = LPA(va);
    if( trailphysaddr == 0 ) /* do something else */
    physaddrwidth = PDC_MODEL.returnCPU_ID.ret[1] + 40;
    if( (trialphysaddr >> physaddrwidth) == 0xF) {
        /* need to F extend and decide what to put
           into the upper 2 bits */
        <...>
    } else
        physaddr = trialphysaddr;

The upper bits of the LPA result beyond the implemented boundary are
guaranteed to be zero.

All this discussion is only relevant to 2.0 processors running
the kernel in wide mode.

> > if this is a feature of HP-UX or something in the HW makes it
> > easier to do it this way...anyone know?

F extension reflects the architecture separation of I/O (uncached)
addresses from memory (cached) addresses.  The processor makes many
assumptions and address space is assigned to reflect this
architecture.  By allocating memory address space up from 0, and I/O
address space down from 0x3fff ffff ffff ffff, then all code is
independent of the implemented address space size.  I imagine other
approaches can do this but it works nicely for PA.

> > Secondly, don't make assumptions about how many bits are used in
> > a virtual or physical addresses unless it's processor specific code.
> > (eg TLB handler or trap handler or hpmc handler). I know the number
> > of physical bits supported by the processor is going to increase
> > from 40-bits (runway).
> 
> physical addresses you are right about;  we really should use an unsigned
> long for those and never expect them to be less than 64 bits in length.
> 
> virtual addresses, unfortunately, aren't as simple:  The 32 LSBs of the
> space identifier get ORed into the 32 MSBs of the virtual address, so we
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
More precisely: "into the upper 30 bits of the offset".  The upper two
space select bits are not included in the global virtual address.

> are limited to 2+(62-virtual_address_bits_used) effective bits for space
> identifiers (on PA2.0 CPUs with 32 bit space registers).  As we want to
> use at least one space identifier per process, actually using only 42
> bits of the virtual address gives us 22 bits of space identifiers - or
> 1 M processes even if we use 4 space identifiers per process.

Yes, and this division between space bits and offset bits are
flexible.  You could define a large number (say 2^28) spaces for
objects that won't be greater than 2^32 bytes in size.  ie. All 32-bit
applications and the 64-bit application's text segments.  Allocate the
remainder of the spaces as you indicate.  Another possibility is
consider having one 2^60 sized space for the OS and all straight
forwardly shared objects.  You get the following assignment of for
32-bit wide space IDs:
   0000 0000:   one 2^60 byte in size object
   1xxx xxxx:   2^28 in count 2^32 byte in size objects
   2xxx x000:   2^16 in count 2^44-byte in size objects
   3xxx x000:   2^16 in count 2^44-byte in size objects
   ...

You get the idea.
Jerry
