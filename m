From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: hppa nptl switch
Date: Tue, 01 Sep 2009 08:08:04 +0200
Message-ID: <4A9CBA44.8040202@aurel32.net>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz> <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com> <20090819124816.GC2517@hall.aurel32.net> <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com> <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz> <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz> <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com> <200908311846.49969.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-glibc@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>
To: debian-hppa@lists.debian.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <200908311846.49969.elendil@planet.nl>
Resent-Message-ID: <fVbs43saKuE.A.pxC.bpLnKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Frans Pop a =E9crit :
> Carlos O'Donell wrote:
>>> In practice it shouldn't be problem at all.
>>> Debian should make sure that binary/library compiled
>>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
>>> by proper Depends: line like "libc6 (>=3D 2.10)".
>> Does every package have to do this? I'm not very familiar with all the
>> packaging requirements.
>=20
> It is something that should automatically get done correctly as long as=
=20
> the libc-dev package defines the minimum version that way.
>=20
> The mechanism that determines this is in /var/lib/dpkg/info/libc6.shlib=
s.=20
> Currently this has lines like:
>    libc 6 libc6 (>=3D 2.9)
>=20

No, as glibc uses symbols files, this file is actually not used.
Nevertheless it is still possible to resolve all symbols to libc6 (>=3D 2=
.10).

--=20
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net


--=20
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
