From: Frans Pop <elendil@planet.nl>
Subject: Re: hppa nptl switch
Date: Mon, 31 Aug 2009 18:46:48 +0200
Message-ID: <200908311846.49969.elendil@planet.nl>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz> <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com> <20090819124816.GC2517@hall.aurel32.net> <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com> <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz> <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz> <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-reply-To: <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell wrote:
>> In practice it shouldn't be problem at all.
>> Debian should make sure that binary/library compiled
>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
>> by proper Depends: line like "libc6 (>= 2.10)".
> 
> Does every package have to do this? I'm not very familiar with all the
> packaging requirements.

It is something that should automatically get done correctly as long as 
the libc-dev package defines the minimum version that way.

The mechanism that determines this is in /var/lib/dpkg/info/libc6.shlibs. 
Currently this has lines like:
   libc 6 libc6 (>= 2.9)

It's virtually certain that the shlibs file will be updated to read
'(>= 2.10)' when the glibc maintainers switch to that version.

Cheers,
FJP
