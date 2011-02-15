From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Tue, 15 Feb 2011 10:13:51 -0500
Message-ID: <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca>
	<20110210200044.203164E01@hiauly1.hia.nrc.ca>
	<20110212161846.GA24076@hiauly1.hia.nrc.ca>
	<20110213193934.GA28834@hiauly1.hia.nrc.ca>
	<20110215015852.GA6615@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110215015852.GA6615@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 14, 2011 at 8:58 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 =
addr 0x411e
> 8000 in file libc-2.11.2.so with flags 0x8000071
>
> i haven't tracked down where these come from but this looks like a gl=
ibc issue.
> Note the final vm_flags value for the final map. =A0This is the inequ=
ivalent one.
> As far as I know, the GCC testsuite does not play with MAP_FIXED maps=
=2E
>
> Carlos, any thoughts on where this might come from?

Could you more clearly describe exactly what is the problem from
glibc's perspective?

The dynamic loader will do a non-fixed mapping to cover the entire
range of the PIC code needed to load into memory. This ensures it has
enough space to map segments. Then it follows up by using MAP_FIXED to
exactly map the segment from the file into memory. It also maps
remaining pages at MAP_FIXED from fd=3D-1 (zero fill).

Locale archives are also mapped in via MAP_FIXED (after a non-fixed map=
ping).

Malloc uses MAP_FIXED and PROT_NONE (inaccessible) when shrinking
internal heaps e.g. it uses MAP_FIXED to single out the pages that are
no longer accessible (in a secure glibc it uses madvise
(MADV_DONTNEED).

Malloc under some conditions may mremap with MREMAP_FIXED.

Those are the glibc instances of MAP_FIXED maps that I can find.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
