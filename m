From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa nptl switch
Date: Mon, 31 Aug 2009 12:53:26 -0400
Message-ID: <119aab440908310953g1b15f071we6bed160772caad6@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>
	 <20090819124816.GC2517@hall.aurel32.net>
	 <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
	 <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>
	 <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>
	 <200908311846.49969.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200908311846.49969.elendil@planet.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 31, 2009 at 12:46 PM, Frans Pop<elendil@planet.nl> wrote:
> Carlos O'Donell wrote:
>>> In practice it shouldn't be problem at all.
>>> Debian should make sure that binary/library compiled
>>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
>>> by proper Depends: line like "libc6 (>=3D 2.10)".
>>
>> Does every package have to do this? I'm not very familiar with all t=
he
>> packaging requirements.
>
> It is something that should automatically get done correctly as long =
as
> the libc-dev package defines the minimum version that way.
>
> The mechanism that determines this is in /var/lib/dpkg/info/libc6.shl=
ibs.
> Currently this has lines like:
> =A0 libc 6 libc6 (>=3D 2.9)
>
> It's virtually certain that the shlibs file will be updated to read
> '(>=3D 2.10)' when the glibc maintainers switch to that version.

Thanks Frans. This is what I expected.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
