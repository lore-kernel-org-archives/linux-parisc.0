Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from onet2.cup.hp.com (onet2.cup.hp.com [15.255.208.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C0834879
	for <parisc-linux@parisc-linux.org>; Fri, 14 Sep 2001 09:24:32 -0600 (MDT)
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by onet2.cup.hp.com (Postfix) with ESMTP id 564C418D20
	for <parisc-linux@parisc-linux.org>; Fri, 14 Sep 2001 08:24:03 -0700 (PDT)
Date: Fri, 14 Sep 2001 11:23:53 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@parisc-linux.org
Cc: baldric-exec@baldric.uwo.ca
Message-ID: <20010914112352.A1491@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Glibc2.2.4-1
List-ID: <linux-parisc.vger.kernel.org>

M,

Just a quick update. I've been recently inundated with the start of
school and phazing life back into a fast flowing stream is never easy ;)

Recent progression:

I finally built the full toolchain.

- Latest Binutils
- Latest GCC
- Latest Glibc 2.2.4-1

Carried out all the 0list patches by hand, in order.

x glibc-vs-gcc3
x db1-addon-enabler
x manual-texinfo4
x ldd
x glibcbug
x hurd-ldflags
x fhs-linux-paths
x pthread_create-manpage
x string2-pointer-arith
x glibc22-nss-upgrade
x glibc22-getaddrinfo
- glibc22-hppa
./sysdeps/ia64/dl-fptr.c.rej

x glibc22-eo_EO
x glibc22-m68k-compat
x glibc22-m68k-fpic
x glibc22-locales
x sparc64-fixups
x glibc22-fts
x glibc22-getdents-fix

It looks like ./sysdeps/ia64/dl-fptr.c is completely different!
I get 7 hunks failed on that file. All the reentrant ifdef's are
gone, and the structure of the file is totally different.

I've ignored those patch failures since there was no visible way
to merge them.

I also installed linuxthreads and the db1 addon.
Which mandated some minor changes to a few header includes for db1 :}

I've compiled 2.4.9-pa16 with the toolchain, and for the first time
ever... I saw a small framebuffer penguin... and it almost brought
me to tears ;)

I have 712/60's and 715/50's running the newer kernel. All of them
are doing much better, and running far faster than ever before.

-----------------------------------------------------
On to testing and building the deb for glibc 2.2.4-1
-----------------------------------------------------

I tried to apt-get -f dist-upgrade
Which again failed on "trying to install a non-directory"
(No segfaults this time around)

For future referance, you can fix this by creating a dummy directory
with the name of the directory that you are failing with.

I've fully apt-get'd my 712/60 from the baseplus tarball with
no apparent problems.

Though lately ksoftirqd seems to eat ~99% of my CPU on idle.

---

Anything I should watch for when building the deb for glibc 2.2.4-1?
It may take quite a while on my 712/60.

I'll get back you when I've finished and tested.

Cheers,
Carlos.
