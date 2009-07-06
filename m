From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 20:17:42 -0400 (EDT)
Message-ID: <20090706001745.274D94F19@hiauly1.hia.nrc.ca>
References: <119aab440907051703y2bc7e71fnbddefa5dc0773f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907051703y2bc7e71fnbddefa5dc0773f3@mail.gmail.com> from "Carlos O'Donell" at Jul 5, 2009 08:03:19 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > The info data is near the end of the mapped segment. =A0The l_info field
> > is initialized by elf_get_dynamic_info from the dynamic data mapped
> > at l->ld.
> 
> Why do you think this is wrong?

I don't know about the specifics.  My supposition is that we may not
be copying the entire segment depending on where the map is placed.

> > I seem to recall that the kernel mmap implementation on hppa is somewhat
> > unique.
> 
> I don't recall anything, Kyle?

This came up with respect to the GCC PCH implementation for parisc.  See
comments in host-hpux.h.  At the moment, we do have a PCH related bug.
See PR 39355.  While I know the problem is present in the PCH file, I
haven't been able to figure out how wrong data gets in the file.

> > In the above call, mappref is NULL. =A0The kernel selects the map locatio=
> n.
> 
> Yes, that's probably correct, the loader is letting the kernel choose
> the address, at this point we don't care where the library is loaded.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
