From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 20:03:19 -0400
Message-ID: <119aab440907051703y2bc7e71fnbddefa5dc0773f3@mail.gmail.com>
References: <20090705171929.5C7205146@hiauly1.hia.nrc.ca>
	 <20090705230740.EE8624FC6@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org, Kyle McMartin <kyle@mcmartin.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090705230740.EE8624FC6@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 5, 2009 at 7:07 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> After staring at the dynamic loader code for a while, I think the fol=
lowing
> mmap call in dl-load.c doesn't correctly map the info data for /lib/l=
ibdl.so.2.
>
> =A0 =A0 =A0 =A0/* Remember which part of the address space this objec=
t uses. =A0*/
> =A0 =A0 =A0 =A0l->l_map_start =3D (ElfW(Addr)) __mmap ((void *) mappr=
ef, maplength,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0c->prot,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0MAP_COPY|MAP_FILE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0fd, c->mapoff);
>
> The info data is near the end of the mapped segment. =A0The l_info fi=
eld
> is initialized by elf_get_dynamic_info from the dynamic data mapped
> at l->ld.

Why do you think this is wrong?

> I seem to recall that the kernel mmap implementation on hppa is somew=
hat
> unique.

I don't recall anything, Kyle?

> In the above call, mappref is NULL. =A0The kernel selects the map loc=
ation.

Yes, that's probably correct, the loader is letting the kernel choose
the address, at this point we don't care where the library is loaded.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
