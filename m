From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Tue, 15 Feb 2011 11:47:04 -0500
Message-ID: <20110215164703.GA9471@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca> <20110215015852.GA6615@hiauly1.hia.nrc.ca> <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 15 Feb 2011, Carlos O'Donell wrote:

> On Mon, Feb 14, 2011 at 8:58 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e52=
0 addr 0x411e
> > 8000 in file libc-2.11.2.so with flags 0x8000071
> >
> > i haven't tracked down where these come from but this looks like a =
glibc issue.
> > Note the final vm_flags value for the final map. =A0This is the ine=
quivalent one.
> > As far as I know, the GCC testsuite does not play with MAP_FIXED ma=
ps.
> >
> > Carlos, any thoughts on where this might come from?
>=20
> Could you more clearly describe exactly what is the problem from
> glibc's perspective?

It's a little hard to tell since I haven't found the application
the causes the above inequivalent aliases.

=46rom a kernel perspective, we need to avoid multiple maps of the same
memory page with inequivalent virtual addresses (i.e., the maps must
start at the same address & 0x3fffff).

Inequivalent maps only result from the use of MAP_FIXED.  All
the maps with VM_READ and VM_EXEC are equivalent in this case,
so it's fairly clear that the map is for a code segment of
libc-2.11.2.so.  There is one map with just the VM_READ flag
that is not equivalent.  Because there are multiple maps to the
same memory page, the page is in effect shared.

Ideally, glibc should use equivalent aliases for all maps that
it creates when they are "shared" as above.

> The dynamic loader will do a non-fixed mapping to cover the entire
> range of the PIC code needed to load into memory. This ensures it has
> enough space to map segments. Then it follows up by using MAP_FIXED t=
o
> exactly map the segment from the file into memory. It also maps
> remaining pages at MAP_FIXED from fd=3D-1 (zero fill).

I tend to think this is the problem area.  I will try to find a
testcase.

> Locale archives are also mapped in via MAP_FIXED (after a non-fixed m=
apping).
>=20
> Malloc uses MAP_FIXED and PROT_NONE (inaccessible) when shrinking
> internal heaps e.g. it uses MAP_FIXED to single out the pages that ar=
e
> no longer accessible (in a secure glibc it uses madvise
> (MADV_DONTNEED).
>=20
> Malloc under some conditions may mremap with MREMAP_FIXED.
>=20
> Those are the glibc instances of MAP_FIXED maps that I can find.

None of these appear to involve executable maps to a file.

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
