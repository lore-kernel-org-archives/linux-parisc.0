From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Tue, 7 Jul 2009 18:17:23 -0400
Message-ID: <119aab440907071517q658b124dxb5b8c7d630ff6c98@mail.gmail.com>
References: <1246975877.4522.9.camel@mulgrave.site>
	 <20090707162158.26D514FB2@hiauly1.hia.nrc.ca>
	 <119aab440907071342l1a936c47n62d8f332d8ecf5d4@mail.gmail.com>
	 <20090707220715.GA17656@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	kyle@mcmartin.ca, randolph@tausq.org, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707220715.GA17656@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 7, 2009 at 6:07 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> I would guess that the loop terminated early because the l_info array
> is all zeros except for the first NEEDED entry. =A0It appears correct=
=2E =A0The
> loop might have terminated early because of a cache issue, or possibl=
y
> the value loaded from memory somehow got corrupted. =A0Another possib=
ility
> would be the mmap operation wasn't complete when the memory was exami=
ned
> by the dynamic loader. =A0When the core dump was done, the operation =
was
> complete.
>
> I think it's less likely that a cache issue affected the memory used =
by
> the dynamic loader (l_info field) as the data before and after in the
> map seemed reasonable.
>
> The fact PA8700 processors are also experiencing similar problems
> would seem to suggest that this isn't a PA8800 L2 issue unless we hav=
e
> multiple problems.
>
> I think we need to try running a recent kernel on gsyprf11 for a whil=
e
> to see if we can capture a similar event.

This rang a bell...

In glibc/elf/rtld.c we have this:

  /* Partly clean the `bootstrap_map' structure up.  Don't use
     `memset' since it might not be built in or inlined and we cannot
     make function calls at this point.  Use '__builtin_memset' if we
     know it is available.  We do not have to clear the memory if we
     do not have to use the temporary bootstrap_map.  Global variables
     are initialized to zero by default.  */
#ifndef DONT_USE_BOOTSTRAP_MAP
# ifdef HAVE_BUILTIN_MEMSET
  __builtin_memset (bootstrap_map.l_info, '\0', sizeof (bootstrap_map.l=
_info));
# else
  for (size_t cnt =3D 0;
       cnt < sizeof (bootstrap_map.l_info) / sizeof (bootstrap_map.l_in=
fo[0]);
       ++cnt)
    bootstrap_map.l_info[cnt] =3D 0;
# endif

On hppa we don't have builtin memset (probably one of the few arches),
so we fall back on this weird loop which I always thought was wrong.

I was seeing problems with l_info having garbage in it, so I had a
local hack which cleared the entire bootstrap_map.

Did your l_info come from the bootstrap_map?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
