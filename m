From: Brendan Horan <brendanhoran@basstech.net>
Subject: Re: PARISC Linux website and status update
Date: Sat, 20 Apr 2013 22:07:19 +0800 (HKT)
Message-ID: <1544662368.29.1366466839145.JavaMail.root@basstech.net>
References: <5171B347.6070600@gmx.de> <13691126.u1dAREQ1nW@donald.sf-tec.de> <276588197.910.1366429889203.JavaMail.root@basstech.net> <20130420155518.0de6df62@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130420155518.0de6df62@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 20 Apr 2013 11:51:29 +0800 (HKT)
Brendan Horan <brendanhoran@basstech.net> wrote:

> Would that be Gentoo?
> Last time I checked the minimal install CD was out of date.

The only two ways in which the install CD could be truly "out of date"
is if the kernel and userland tools wouldn't support the new hardware
you wanted to install Gentoo Linux on (like previously unsupported disk
controllers) or if you wanted to install it on a novel filesystem that
the install CD's kernel and tools didn't yet support.


> I did manage to get it up and running on my j6750.

The install CD's version isn't important to the installation but
for the two exceptions mentioned above. Indeed, you might even use a
Debian install CD to do a Gentoo Linux install. The "stage3" tarballs
which contain the actual install base are what is important[1], and they
have been kept up to date quite well. That said, we recently released a
new set of boot images (CD[2] and netboot[3]) with support for
recent hardware, filesystems and (yes!) SMP.


     jer


[1] http://distfiles.gentoo.org/releases/hppa/autobuilds/current-stage3/
[2] http://distfiles.gentoo.org/experimental/hppa/livecd/
[3] http://distfiles.gentoo.org/experimental/hppa/netboot/


I've been using Gentoo for years :) 
So I understand an "older" install CD is still fine:)

Thanks for pointing out the new live cd for me!

Brendan
