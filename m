From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa nptl switch
Date: Tue, 1 Sep 2009 09:55:18 -0400
Message-ID: <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>
	 <20090819124816.GC2517@hall.aurel32.net>
	 <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
	 <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>
	 <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>
	 <200908311846.49969.elendil@planet.nl> <4A9CBA44.8040202@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Return-path: <bounce-debian-glibc=debian-glibc=m.gmane.org@lists.debian.org>
In-Reply-To: <4A9CBA44.8040202@aurel32.net>
Resent-Message-ID: <8VRelZ11U3.A.CdG.XfSnKB@liszt>
List-Post: <mailto:debian-glibc@lists.debian.org>
List-Help: <mailto:debian-glibc-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-glibc-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-glibc-request@lists.debian.org?subject=unsubscribe>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 1, 2009 at 2:08 AM, Aurelien Jarno<aurelien@aurel32.net> wrote:
> Frans Pop a =E9crit :
>> Carlos O'Donell wrote:
>>>> In practice it shouldn't be problem at all.
>>>> Debian should make sure that binary/library compiled
>>>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
>>>> by proper Depends: line like "libc6 (>=3D 2.10)".
>>> Does every package have to do this? I'm not very familiar with all the
>>> packaging requirements.
>>
>> It is something that should automatically get done correctly as long as
>> the libc-dev package defines the minimum version that way.
>>
>> The mechanism that determines this is in /var/lib/dpkg/info/libc6.shlibs=
.
>> Currently this has lines like:
>> =A0 =A0libc 6 libc6 (>=3D 2.9)
>>
>
> No, as glibc uses symbols files, this file is actually not used.
> Nevertheless it is still possible to resolve all symbols to libc6 (>=3D 2=
.10).

Once an application is rebuilt against a new libc, what prevents the
user from downgrading libc and breaking the application?

Cheers,
Carlos.
