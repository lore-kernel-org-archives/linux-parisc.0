From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Tue, 3 Nov 2009 16:54:07 -0500 (EST)
Message-ID: <20091103215408.7B0AD4E0B@hiauly1.hia.nrc.ca>
References: <4AF0A3E9.6060302@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AF0A3E9.6060302@gmx.de> from "Helge Deller" at Nov 3, 2009 10:43:05 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 11/03/2009 10:36 PM, John David Anglin wrote:
> >> Unwind section '.PARISC.unwind' at offset 0x11c contains 3 entries:
> >>
> >> <libcrc32c_mod_fini>: [0x0-0x2c]
> >>           Entry_GR=1 Save_SP Save_RP Total_frame_size=8
> >> <libcrc32c_mod_init>: [0x0-0x44]
> >>           Entry_GR=1 Save_SP Save_RP Total_frame_size=8
> >> <crc32c>: [0x0-0x6c]
> >>           Entry_GR=2 Save_SP Save_RP Total_frame_size=8
> >
> > What do you see for '.rela.PARISC.unwind'?
> >
> > I suspect that this is a problem in handling the R_PARISC_SEGREL32
> > relocations is the kernel loader.  The above would be fine if
> > libcrc32c_mod_fini and libcRc32c_mod_init are in different sections
> > (.exit.text and .inti.text).
> 
> Relocation section '.rela.PARISC.unwind' at offset 0x9b8 contains 6 entries:
>   Offset     Info    Type            Sym.Value  Sym. Name + Addend
> 00000000  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 0
> 00000004  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 2c
> 00000010  00000331 R_PARISC_SEGREL32 00000000   .init.text + 0
> 00000014  00000331 R_PARISC_SEGREL32 00000000   .init.text + 44
> 00000020  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 0
> 00000024  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 6c

That's exactly what I expected.  There's no overlap.  The module
loader needs to sort the unwind entries after doing the relocations.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
