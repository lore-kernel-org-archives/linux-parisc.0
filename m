From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Fwd: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Fri, 16 Aug 2013 09:26:40 +0400
Message-ID: <56141376630800@web3e.yandex.ru>
References: <55021376630755@web3e.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <55021376630755@web3e.yandex.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

=46orgot CC to the list

16.08.2013, 09:25, "Alex Ivanov" <gnidorah@p0n4ik.tk>:

15.08.2013, 03:36, "John David Anglin" <dave.anglin@bell.net>:

> =9AOn 10-Aug-13, at 3:56 PM, Alex Ivanov wrote:
>>> =9A=9AI've tried this one and many other things (except the messing=
 with
>>> =9A=9Aendianness) so far. The error is
>>> =9A=9Astill there.
> =9AAlex, I don't know which distro your using but I built and uploade=
d a
> =9Anew debian build of mesa and some packages it
> =9Adepends on to the parisc archive. =9AMesa and the open source ATI =
driver
> =9Abuild without problems on parisc. =9AHowever, this
> =9Athread suggests we need to go backwards to resolve the endian issu=
es:
> =9Ahttp://forums.gentoo.org/viewtopic-p-7128758.html
>
> =9AI have a RV100 in my rp3440 that I may play a bit with if I get a
> =9Achance.
>
> =9AWhile this might be a kernel issue, I suggest that the bug needs t=
o be
> =9Afiled on the relevant distro package list and
> =9Amaybe on the package source list as well.
>
> =9ADave
> =9A--
> =9AJohn David Anglin dave.anglin@bell.net

Dave,

I'm on a Debian.
The problem is that the same issue happens with framebuffer console too
(new kernels use radeon drm for this purpose, instead of radeonfb), whi=
ch
resides in kernel.
The console comes unnacelerated and is the same slow as X.
So yes, this seems to be a kernel issue.
-------- =FA=C1=D7=C5=D2=DB=C5=CE=C9=C5 =D0=C5=D2=C5=D3=D9=CC=C1=C5=CD=CF=
=C7=CF =D3=CF=CF=C2=DD=C5=CE=C9=D1 --------
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
