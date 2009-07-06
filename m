From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 21:43:20 -0400 (EDT)
Message-ID: <20090706014321.E91A45146@hiauly1.hia.nrc.ca>
References: <1246842383.4158.22.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de, kurt@roeckx.be,
	pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org,
	kyle@mcmartin.ca
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1246842383.4158.22.camel@mulgrave.site> from "James Bottomley" at Jul 5, 2009 08:06:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, 2009-07-05 at 20:17 -0400, John David Anglin wrote:
> > > > The info data is near the end of the mapped segment. =A0The l_info field
> > > > is initialized by elf_get_dynamic_info from the dynamic data mapped
> > > > at l->ld.
> > > 
> > > Why do you think this is wrong?
> > 
> > I don't know about the specifics.  My supposition is that we may not
> > be copying the entire segment depending on where the map is placed.
> 
> Who is supposed to copy the segment?  The user or the kernel?

As far as I can tell, the kernel is responsible for mapping the segment.
Then, elf_get_dynamic_info processes the mapped data to generate the
l_info field in the link map.

The kernel has control over where the segment is mapped.  In as much
as the dependencies for /bin/sh are processed many times in a GCC
build, I have to think the problem relates to the placement or a
random problem with mmap.  There is a small possibility that the
processing of the data by elf_get_dynamic_info has a problem.

> > > > I seem to recall that the kernel mmap implementation on hppa is somewhat
> > > > unique.
> > > 
> > > I don't recall anything, Kyle?
> > 
> > This came up with respect to the GCC PCH implementation for parisc.  See
> > comments in host-hpux.h.  At the moment, we do have a PCH related bug.
> > See PR 39355.  While I know the problem is present in the PCH file, I
> > haven't been able to figure out how wrong data gets in the file.
> 
> Do you have a bugzilla reference so we can take a look ... also, is this
> likely a tool chain problem or a kernel one?  If it's a kernel one could
> someone provide a description of what they think is going wrong?

The bugzilla reference is <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39355>.

Many of my comments in the PR are wrong.  See comment #47.  At this time,
I know that the data in the PCH file are wrong but I don't know why.  In
any case, I should not have mentioned the PCH bug.  It's probably a tool
chain bug.  The main point of the comment was that the hppa mmap implementation
differs from other implementations (MAP_PRIVATE is not reliable).  So, there
may be other issues.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
