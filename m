Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66B4B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 May 2001 10:01:25 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CCF77B007; Tue, 15 May 2001 16:59:00 +0100 (BST)
Date: Tue, 15 May 2001 16:59:00 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010515165900.H24955@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] slang.so problems
List-ID: <linux-parisc.vger.kernel.org>

I have had problems relating to slang.so when building boot-floppies.
I don't entirely understand what is going on, so I'm posting the
facts as I see them, so others can comment.

There are three packages, slang1, slang1-dev, slang1-pic (-pic probably
isn't relevant here).

The basic problem is that slang1 provides only libslang1.so.1 and
libslang.so.1.4.4, but various things expect libslang.so and so
wont run unless sland1-dev is installed.  slang1-dev provides
libslang.so.

Things I have found that are affected are cfdisk (in util-linux),
whiptail, and libnewt0.

As a test I installed the three slang1 packages from the debian
archive and did "gcc -o hw hw.c -lslang; ldd hw".  I get:

        libslang.so => /usr/lib/libslang.so (0x4002b000)
        libc.so.6 => /lib/libc.so.6 (0x400b0000)
        libm.so.6 => /lib/libm.so.6 (0x401f4000)
        libdl.so.2 => /lib/libdl.so.2 (0x40234000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)

If I now remove slang1-dev, and try to run hw I get

./hw: error while loading shared libraries: libslang.so: cannot load shared object file: No such file or directory


If I build my own slang1 packages and install them and then remake
'hw', I get

        libslang.so.1 => /lib/libslang.so.1 (0x4002b000)
        libc.so.6 => /lib/libc.so.6 (0x400b0000)
        libm.so.6 => /lib/libm.so.6 (0x401f4000)
        libdl.so.2 => /lib/libdl.so.2 (0x40234000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)

and 'hw' runs fine with slang1-dev removed, as it should.


cfdisk from the debain archive wont run unless slang1-dev is installed.
If I rebuild cfdisk myself, with the debian slang1 packages installed,
cfdisk still wants libslang.so.  If I rebuild cfdisk with my own build
slang1 packages installed, the resulting cfdisk wants libslang.so.1,
as it should.

So, it seems something is wrong with the slang1 packages in debian,
and that has resulted in bad util-linux, whiptail, and libnewt0 builds.

I don't know what might have gone wrong with the debian builds, because
when I build slang1 debs they are fine.

Can someone else try this, and, if appropriate, upload new slang*,
util-linux, whiptail, and libnewt0 packages to the archive?

Thanks,
  Richard
