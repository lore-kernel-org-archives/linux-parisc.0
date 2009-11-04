From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Tue, 3 Nov 2009 19:57:36 -0500 (EST)
Message-ID: <20091104005737.0E4674FB2@hiauly1.hia.nrc.ca>
References: <4AF0A8FB.2000504@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AF0A8FB.2000504@gmx.de> from "Helge Deller" at Nov 3, 2009 11:04:43 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> Relocation section '.rela.PARISC.unwind' at offset 0x9b8 contains 6 entries:
> >>    Offset     Info    Type            Sym.Value  Sym. Name + Addend
> >> 00000000  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 0
> >> 00000004  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 2c
> >> 00000010  00000331 R_PARISC_SEGREL32 00000000   .init.text + 0
> >> 00000014  00000331 R_PARISC_SEGREL32 00000000   .init.text + 44
> >> 00000020  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 0
> >> 00000024  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 6c
> >
> > That's exactly what I expected.  There's no overlap.  The module
> > loader needs to sort the unwind entries after doing the relocations.
> 
> It's already sorting the entries, but creating the relocation is currently a hack.
> 
> See top of arch/parisc/kernel/module.c:
>   *    - SEGREL32 handling
>   *      We are not doing SEGREL32 handling correctly. According to the ABI, we
>   *      should do a value offset, like this:
>   *                      if (in_init(me, (void *)val))
>   *                              val -= (uint32_t)me->module_init;
>   *                      else
>   *                              val -= (uint32_t)me->module_core;
>   *      However, SEGREL32 is used only for PARISC unwind entries, and we want
>   *      those entries to have an absolute address, and not just an offset.
>   *
>   *      The unwind table mechanism has the ability to specify an offset for
>   *      the unwind table; however, because we split off the init functions into
>   *      a different piece of memory, it is not possible to do this using a
>   *      single offset. Instead, we use the above hack for now.
> 
> If we change this, don't we require a binutils update then at the same time from the users?

Where does the .exit.text section fit in this scheme?  The loader
has to appropriately group the sections and determine the section offsets.
It would seem that there is a problem with load offset for at least
one of the three sections in this module.

Don't think fixing the offsets requires a binutils update.  However, the
change to using section offsets may have made the problem worse.  The binutils
update only corrected the issue with overloaded symbols.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
