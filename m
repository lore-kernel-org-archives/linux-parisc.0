From: Thibaut VARENE <varenet@debian.org>
Subject: Re: hppa nptl switch
Date: Tue, 1 Sep 2009 16:40:35 +0200
Message-ID: <7d01f9f00909010740m61001b0eu4109d91e4130e831@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>
	 <20090819124816.GC2517@hall.aurel32.net>
	 <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
	 <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>
	 <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>
	 <200908311846.49969.elendil@planet.nl> <4A9CBA44.8040202@aurel32.net>
	 <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 1, 2009 at 3:55 PM, Carlos O'Donell<carlos@systemhalted.org=
> wrote:
> On Tue, Sep 1, 2009 at 2:08 AM, Aurelien Jarno<aurelien@aurel32.net> =
wrote:
>> Frans Pop a =C3=A9crit :
>>> Carlos O'Donell wrote:
>>>>> In practice it shouldn't be problem at all.
>>>>> Debian should make sure that binary/library compiled
>>>>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
>>>>> by proper Depends: line like "libc6 (>=3D 2.10)".
>>>> Does every package have to do this? I'm not very familiar with all=
 the
>>>> packaging requirements.
>>>
>>> It is something that should automatically get done correctly as lon=
g as
>>> the libc-dev package defines the minimum version that way.
>>>
>>> The mechanism that determines this is in /var/lib/dpkg/info/libc6.s=
hlibs.
>>> Currently this has lines like:
>>> =C2=A0 =C2=A0libc 6 libc6 (>=3D 2.9)
>>>
>>
>> No, as glibc uses symbols files, this file is actually not used.
>> Nevertheless it is still possible to resolve all symbols to libc6 (>=
=3D 2.10).
>
> Once an application is rebuilt against a new libc, what prevents the
> user from downgrading libc and breaking the application?

I'd say "common sense" but I recall we don't have protection against
silliness ;^)

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
