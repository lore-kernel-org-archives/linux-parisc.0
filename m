From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Tue, 7 Jul 2009 18:07:16 -0400
Message-ID: <20090707220715.GA17656@hiauly1.hia.nrc.ca>
References: <1246975877.4522.9.camel@mulgrave.site> <20090707162158.26D514FB2@hiauly1.hia.nrc.ca> <119aab440907071342l1a936c47n62d8f332d8ecf5d4@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	kyle@mcmartin.ca, randolph@tausq.org, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907071342l1a936c47n62d8f332d8ecf5d4@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 07 Jul 2009, Carlos O'Donell wrote:

> On Tue, Jul 7, 2009 at 12:21 PM, John David
> Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> >> So if I characterise the problem you think you're seeing: on mmap =
of a
> >> file at a memory location to be determined by the kernel, a sequen=
tial
> >> set of reads of the mapped location eventually turns up a zero whe=
re
> >> there should be data? =A0Yes, it does sound like a caching issue.
> >
> > Yes. =A0The loop is terminated by a null tag:
> >
> > =A0while (dyn->d_tag !=3D DT_NULL)
> > =A0 =A0 =A0{
> > =A0 =A0 =A0 =A0 ...
> > =A0 =A0 =A0}
> >
> > However, the core dump doesn't show a null tag before the STRTAB ta=
g
> > that caused the segmentation fault.
>=20
> Do you mean "after" the STRTAB tag? I assume the library on-disk has =
a
> DT_NULL, otherwise it would always fail.

I'm sure that there is a null tag after the STRTAB.  The segmentation
fault occurred because the get operation failed after processing
the first NEEDED tag and before the STRTAB tag.  The loop goes
sequentially through the array of DT objects in the recently mmap'd
data and inserts pointers to these objects into the dynamic loaders
link map for the file (in the l_info field).  There were no null tags
between the NEEDED entry and the STRTAB entry in the mmap'd data in
the core dump.  The DT objects are near the end of the mmap'd data.

I would guess that the loop terminated early because the l_info array
is all zeros except for the first NEEDED entry.  It appears correct.  T=
he
loop might have terminated early because of a cache issue, or possibly
the value loaded from memory somehow got corrupted.  Another possibilit=
y
would be the mmap operation wasn't complete when the memory was examine=
d
by the dynamic loader.  When the core dump was done, the operation was
complete.

I think it's less likely that a cache issue affected the memory used by
the dynamic loader (l_info field) as the data before and after in the
map seemed reasonable.

The fact PA8700 processors are also experiencing similar problems
would seem to suggest that this isn't a PA8800 L2 issue unless we have
multiple problems.

I think we need to try running a recent kernel on gsyprf11 for a while
to see if we can capture a similar event.

Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
