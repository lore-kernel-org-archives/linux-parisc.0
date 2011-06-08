From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: eglibc_2.13-5 on hppa
Date: Wed, 8 Jun 2011 09:21:44 -0400
Message-ID: <BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
References: <20110608013308.GA15282@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110608013308.GA15282@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 7, 2011 at 9:33 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> What's the status of glibc? =A0In the testsuite, I seeing various
> tests hang. =A0For example,

AFAIK glibc 2.14 is stable and just released, but has some testsuite fa=
ilures.

glibc 2.15 is in development and I'll be looking at it next week.

> dave =A0 =A0 =A02301 =A00.0 =A00.2 =A032912 25916 ? =A0 =A0 =A0 =A0S =
=A0 =A013:31 =A0 0:03 apt-get --compile source libc6
> dave =A0 =A0 =A02458 =A00.0 =A00.0 =A032912 =A05112 ? =A0 =A0 =A0 =A0=
S =A0 =A013:31 =A0 0:00 =A0\_ apt-get --compile source libc6
> dave =A0 =A0 =A02817 =A00.0 =A00.0 =A0 1968 =A0 596 ? =A0 =A0 =A0 =A0=
S =A0 =A013:32 =A0 0:00 =A0 =A0 =A0\_ sh -c cd eglibc-2.13 && dpkg-buil=
dpackage -b -uc
> dave =A0 =A0 =A02820 =A00.0 =A00.0 =A0 9164 =A05764 ? =A0 =A0 =A0 =A0=
S =A0 =A013:32 =A0 0:00 =A0 =A0 =A0 =A0 =A0\_ /usr/bin/perl /usr/bin/dp=
kg-buildpackage -b -uc
> dave =A0 =A0 =A03206 =A00.0 =A00.0 =A0 3836 =A01208 ? =A0 =A0 =A0 =A0=
S =A0 =A013:32 =A0 0:02 =A0 =A0 =A0 =A0 =A0 =A0 =A0\_ /usr/bin/make -f =
debian/rules build
> dave =A0 =A0 27678 =A00.0 =A00.0 =A0 4484 =A01396 ? =A0 =A0 =A0 =A0S =
=A0 =A017:52 =A0 0:00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\_ /bin/bash -=
e -c set -e ; \?if [ -n "" ]; then \? =A0echo "Tests have been disabled=
 via DEB_BUILD_OPTIONS." | tee bu
> dave =A0 =A0 27689 =A00.0 =A00.0 =A0 2184 =A0 896 ? =A0 =A0 =A0 =A0S =
=A0 =A017:52 =A0 0:00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\_ /us=
r/bin/make -C build-tree/hppa-libc -k check
> dave =A0 =A0 27692 =A00.0 =A00.0 =A0 1968 =A0 596 ? =A0 =A0 =A0 =A0S =
=A0 =A017:52 =A0 0:00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
\_ /bin/sh -c /usr/bin/make -r PARALLELMFLAGS=3D"" CVSOPTS=3D"" -C /hom=
e/dave/debian/glibc/eglibc-2.13 objdir=3D`p
> dave =A0 =A0 27695 =A00.0 =A00.0 =A0 4752 =A03320 ? =A0 =A0 =A0 =A0S =
=A0 =A017:52 =A0 0:04 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A0 =A0 \_ /usr/bin/make -r PARALLELMFLAGS=3D CVSOPTS=3D -C /home/dave/=
debian/glibc/eglibc-2.13 objdir=3D/home/dave/de
> dave =A0 =A0 =A0 301 =A01.5 =A00.0 =A0 5680 =A04288 ? =A0 =A0 =A0 =A0=
S =A0 =A020:35 =A0 0:15 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A0 =A0 =A0 =A0 \_ /usr/bin/make subdir=3Drt -C rt ..=3D../ tests
> dave =A0 =A0 =A08664 =A00.0 =A00.0 =A0 2956 =A01156 ? =A0 =A0 =A0 =A0=
S =A0 =A020:49 =A0 0:00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 \_ /bin/bash -c GCONV_PATH=3D/home/dave/debian=
/glibc/eglibc-2.13/build-tree/hppa-libc/iconvdata LC
> dave =A0 =A0 =A08666 =A00.0 =A00.0 =A0 1920 =A0 396 ? =A0 =A0 =A0 =A0=
S =A0 =A020:49 =A0 0:00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \_ /home/dave/debian/glibc/eglibc-2.13=
/build-tree/hppa-libc/elf/ld.so.1 --library-path /home
> dave =A0 =A0 =A08667 =A0100 =A00.0 =A034836 =A0 588 ? =A0 =A0 =A0 =A0=
Sl =A0 20:49 =A0 2:09 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \_ /home/dave/debian/glibc/egli=
bc-2.13/build-tree/hppa-libc/elf/ld.so.1 --library-path /
> dave =A0 =A0 27690 =A00.0 =A00.0 =A0 3376 =A0 616 ? =A0 =A0 =A0 =A0S =
=A0 =A017:52 =A0 0:01 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\_ tee=
 build-tree/log-test-hppa-linux-gnu-libc

I never see any testsuite hangs on my a500 (vanilla 2.6.33).

I have a pile of free time next week and I hope to dedicate some time
to cleaning up the glibc testsuite.

> Thoughts?

Yes, the "warning: Unable to find libthread_db matching inferior's
thread library, thread debugging will not be available." means you
can't debug threads until you preload the new libc's
libthread_db.so.1.

You must always use the libthread_db.so.1 that matches your threading l=
ibrary.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
