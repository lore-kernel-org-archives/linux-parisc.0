From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Tue, 7 Jul 2009 18:39:20 -0400 (EDT)
Message-ID: <20090707223921.855354FB2@hiauly1.hia.nrc.ca>
References: <119aab440907071517q658b124dxb5b8c7d630ff6c98@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, James.Bottomley@hansenpartnership.com,
	kyle@mcmartin.ca, randolph@tausq.org, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907071517q658b124dxb5b8c7d630ff6c98@mail.gmail.com> from "Carlos O'Donell" at Jul 7, 2009 06:17:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Jul 7, 2009 at 6:07 PM, John David
> Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> > I would guess that the loop terminated early because the l_info array
> > is all zeros except for the first NEEDED entry. =A0It appears correct. =
> =A0The
> > loop might have terminated early because of a cache issue, or possibly
> > the value loaded from memory somehow got corrupted. =A0Another possibilit=
> y
> > would be the mmap operation wasn't complete when the memory was examined
> > by the dynamic loader. =A0When the core dump was done, the operation was
> > complete.
> >
> > I think it's less likely that a cache issue affected the memory used by
> > the dynamic loader (l_info field) as the data before and after in the
> > map seemed reasonable.
> >
> > The fact PA8700 processors are also experiencing similar problems
> > would seem to suggest that this isn't a PA8800 L2 issue unless we have
> > multiple problems.
> >
> > I think we need to try running a recent kernel on gsyprf11 for a while
> > to see if we can capture a similar event.
> 
> This rang a bell...
> 
> In glibc/elf/rtld.c we have this:
> 
>   /* Partly clean the `bootstrap_map' structure up.  Don't use
>      `memset' since it might not be built in or inlined and we cannot
>      make function calls at this point.  Use '__builtin_memset' if we
>      know it is available.  We do not have to clear the memory if we
>      do not have to use the temporary bootstrap_map.  Global variables
>      are initialized to zero by default.  */
> #ifndef DONT_USE_BOOTSTRAP_MAP
> # ifdef HAVE_BUILTIN_MEMSET
>   __builtin_memset (bootstrap_map.l_info, '\0', sizeof (bootstrap_map.l_inf=
> o));
> # else
>   for (size_t cnt =3D 0;
>        cnt < sizeof (bootstrap_map.l_info) / sizeof (bootstrap_map.l_info[0=
> ]);
>        ++cnt)
>     bootstrap_map.l_info[cnt] =3D 0;
> # endif
> 
> On hppa we don't have builtin memset (probably one of the few arches),
> so we fall back on this weird loop which I always thought was wrong.
> 
> I was seeing problems with l_info having garbage in it, so I had a
> local hack which cleared the entire bootstrap_map.
> 
> Did your l_info come from the bootstrap_map?

No.  The l_info fields for the dynamic loader and libncurses.so.5
had already been processed.  The segv occurred processing the needed
entry for libdl.so.2.  The code was processing the needed entries
for /bin/sh.

The cause of the corruption that you observed is not obvious to
me.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
