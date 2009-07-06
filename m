From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: HPPA and Squeeze
Date: Sun, 05 Jul 2009 20:06:23 -0500
Message-ID: <1246842383.4158.22.camel@mulgrave.site>
References: <20090706001745.274D94F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org,
	kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090706001745.274D94F19@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2009-07-05 at 20:17 -0400, John David Anglin wrote:
> > > The info data is near the end of the mapped segment. =A0The l_info field
> > > is initialized by elf_get_dynamic_info from the dynamic data mapped
> > > at l->ld.
> > 
> > Why do you think this is wrong?
> 
> I don't know about the specifics.  My supposition is that we may not
> be copying the entire segment depending on where the map is placed.

Who is supposed to copy the segment?  The user or the kernel?

> > > I seem to recall that the kernel mmap implementation on hppa is somewhat
> > > unique.
> > 
> > I don't recall anything, Kyle?
> 
> This came up with respect to the GCC PCH implementation for parisc.  See
> comments in host-hpux.h.  At the moment, we do have a PCH related bug.
> See PR 39355.  While I know the problem is present in the PCH file, I
> haven't been able to figure out how wrong data gets in the file.

Do you have a bugzilla reference so we can take a look ... also, is this
likely a tool chain problem or a kernel one?  If it's a kernel one could
someone provide a description of what they think is going wrong?

James


