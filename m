Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA07325
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Dec 1999 06:51:35 -0700
Date: Sat, 11 Dec 1999 14:51:07 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: huck@cup.hp.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] /usr/conf/machine header files
Message-Id: <19991211145107.C17836@mathe.stud.uni-erlangen.de>
References: <19991209050634.D21512@mathe.stud.uni-erlangen.de> <199912110135.RAA00727@lucy.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912110135.RAA00727@lucy.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> FYI,  More precisely, PA2.0 expects to be programmed with "F" extended
> 62-bit physical addresses.  The upper 2 bits are always ignored.  The

The architecture documentation is quite explicit in that the 2 msbs get
ignored in the _virtual_ address offset generation only.  Actual CPUs
are quite likely to always ignore them, though.

> "F" extension is preserved in all processor resources independent of
> the implemented addess space.  For example, a data reference to the
> physical address 0x3FFF FFFF FFFF 0000 (PSW.d == 0) that took a TLB
> miss would include the unimplemented bits in the ISR.

How can you take a (Data, I assume) TLB miss with the PSW's D bit == 0 ?

> The one exception is the LPA instruction.  It is only defined to the
> width of the implemented physical address space.  To convert that
> address to a generic 64-bit pointer use:
> 
>     trialphysaddr = LPA(va);
>     if( trailphysaddr == 0 ) /* do something else */
>     physaddrwidth = PDC_MODEL.returnCPU_ID.ret[1] + 40;
>     if( (trialphysaddr >> physaddrwidth) == 0xF) {
>         /* need to F extend and decide what to put
>            into the upper 2 bits */
>         <...>
>     } else
>         physaddr = trialphysaddr;
> 
> The upper bits of the LPA result beyond the implemented boundary are
> guaranteed to be zero.

Why would we want to use LPA anyway ?

> > > if this is a feature of HP-UX or something in the HW makes it
> > > easier to do it this way...anyone know?
> 
> F extension reflects the architecture separation of I/O (uncached)
> addresses from memory (cached) addresses.  The processor makes many
> assumptions and address space is assigned to reflect this
> architecture.  By allocating memory address space up from 0, and I/O
> address space down from 0x3fff ffff ffff ffff, then all code is
> independent of the implemented address space size.  I imagine other
> approaches can do this but it works nicely for PA.

That's just not what the documentation says, and I propose we follow
it by simply using physical addresses 0xfXXX XXXX XXXX XXXX when
referring to IO space.

> > > Secondly, don't make assumptions about how many bits are used in
> > > a virtual or physical addresses unless it's processor specific code.
> > > (eg TLB handler or trap handler or hpmc handler). I know the number
> > > of physical bits supported by the processor is going to increase
> > > from 40-bits (runway).
> > 
> > physical addresses you are right about;  we really should use an unsigned
> > long for those and never expect them to be less than 64 bits in length.
> > 
> > virtual addresses, unfortunately, aren't as simple:  The 32 LSBs of the
> > space identifier get ORed into the 32 MSBs of the virtual address, so we
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> More precisely: "into the upper 30 bits of the offset".  The upper two
> space select bits are not included in the global virtual address.

Right, thanks for the clarification.

> objects that won't be greater than 2^32 bytes in size.  ie. All 32-bit
> applications and the 64-bit application's text segments.  Allocate the
> remainder of the spaces as you indicate.  Another possibility is
> consider having one 2^60 sized space for the OS and all straight
> forwardly shared objects.  You get the following assignment of for
> 32-bit wide space IDs:
>    0000 0000:   one 2^60 byte in size object
>    1xxx xxxx:   2^28 in count 2^32 byte in size objects
>    2xxx x000:   2^16 in count 2^44-byte in size objects
>    3xxx x000:   2^16 in count 2^44-byte in size objects
>    ...

Indeed I didn't think about having spaces of different sizes before, and
it definitely makes sense to have one 2^62 byte space to map physical
memory / I/O with.

	Philipp Rumpf
