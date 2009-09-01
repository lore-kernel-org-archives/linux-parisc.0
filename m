From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: hppa nptl switch
Date: Tue, 01 Sep 2009 17:50:27 +0200
Message-ID: <4A9D42C3.70103@aurel32.net>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>	 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>	 <20090819124816.GC2517@hall.aurel32.net>	 <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>	 <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>	 <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>	 <200908311846.49969.elendil@planet.nl> <4A9CBA44.8040202@aurel32.net> <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell a =E9crit :
> On Tue, Sep 1, 2009 at 2:08 AM, Aurelien Jarno<aurelien@aurel32.net> =
wrote:
>> Frans Pop a =E9crit :
>>> Carlos O'Donell wrote:
>>>>> In practice it shouldn't be problem at all.
>>>>> Debian should make sure that binary/library compiled
>>>>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
>>>>> by proper Depends: line like "libc6 (>=3D 2.10)".
>>>> Does every package have to do this? I'm not very familiar with all=
 the
>>>> packaging requirements.
>>> It is something that should automatically get done correctly as lon=
g as
>>> the libc-dev package defines the minimum version that way.
>>>
>>> The mechanism that determines this is in /var/lib/dpkg/info/libc6.s=
hlibs.
>>> Currently this has lines like:
>>>    libc 6 libc6 (>=3D 2.9)
>>>
>> No, as glibc uses symbols files, this file is actually not used.
>> Nevertheless it is still possible to resolve all symbols to libc6 (>=
=3D 2.10).
>=20
> Once an application is rebuilt against a new libc, what prevents the
> user from downgrading libc and breaking the application?
>=20

If we make sure that the new programs are using symbols from version
GLIBC_2.10, the program should refuse to start with a lower version of
the glibc.

--=20
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
