Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01050
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Apr 2000 12:06:04 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel2.hp.com (Postfix) with ESMTP id 21077A93
	for <parisc-linux@thepuffingroup.com>; Thu,  6 Apr 2000 14:05:58 -0400 (EDT)
To: parisc-linux@thepuffingroup.com
Date: Thu, 06 Apr 2000 12:05:57 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12dGfF-00012e-00@endor.fc.hp.com>
Subject: [parisc-linux] building a glibc-based tool chain
List-ID: <linux-parisc.vger.kernel.org>


Well it still doesn't work, but here are some UGLY HACKS I use to
get a tool chain built using our glibc, which only works on x86 I think.
There are many many failure modes which these steps avoid, or so I hope.
Lots of this is probably my misunderstanding of the glibc/gcc relationship.

First grab binutils and build it as usual.  I used

    .../binutils/configure --target=hppa1.1-linux --disable-nls \
	--prefix=/opt/palinux
    make
    make install

DO NOT allow the default --prefix to be used or you'll be SCREWED later
when you try to build gcc.

Fix your $PATH before going further:

    PATH=/opt/palinux/bin:$PATH

Now the nasty one.  Grab glibc and configure it:
    !! DO NOT allow the default --prefix to be used or you'll be SCREWED
    !! later when you try to build gcc.  If by chance you do an install
    !! into /usr/local you'll have to remove those files before gcc will
    !! build.

    .../glibc/configure --target=hppa1.1-linux --disable-nls \
	--prefix=/opt/palinux --disable-shared --disable-sanity-checks
    make

This will fail with undefined references.  Do:
    ls > nss/makedb
    make

This should complete.  This is pretty creepy but...

    for n in *
    do
	touch $n/stubs
    done

    make install

This will fail, but gets far enough to be useful.

Now in the top-level makefile in the real glibc source tree, remove
the dependency like this diff shows (otherwise the manual/ subdir build
will prevent success).

    diff -r1.1 Makefile
    142c142
    < $(inst_includedir)/gnu/stubs.h: subdir_install
    ---
    > $(inst_includedir)/gnu/stubs.h: 

Then:

    make /your/install/directory/include/gnu/stubs.h

Now remove the #ifdef __USE_UNIX98 and the matching #endif  /* Unix98 */
from /your/install/directory/include/unistd.h around line 238

Time for gcc

    .../gcc/configure --target=hppa1.1-linux --disable-nls --prefix=/opt/palinux

    make
    make install

For some unknown reason, this new hppa1.1-linux-gcc doesn't look in
/opt/palinux/include for headers, thus a quick hack:

    mv /opt/palinux/lib/gcc*/*/*/include/* /opt/palinux/include
    rmdir /opt/palinux/lib/gcc*/*/*/include/
    ln -s /opt/palinux/include /opt/palinux/lib/gcc*/*/*/include/

It might be better to use a different --prefix when configuring glibc
so as to have these header files installed where gcc expects to find them.

At this point I was able to compile but not link.  For some reason gcc
doesn't look in /opt/paliux/lib for crt1.o and friends.  When I
added crt0.o and libc by hand, the link failed with a meaningless error.

	-P
