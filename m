Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44E90482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 May 2001 08:09:16 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 36272B008; Mon, 28 May 2001 15:06:38 +0100 (BST)
Date: Mon, 28 May 2001 15:06:38 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010528150638.B25745@linuxcare.com>
References: <20010515165900.H24955@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010515165900.H24955@linuxcare.com>; from rhirst@linuxcare.com on Tue, May 15, 2001 at 04:59:00PM +0100
Subject: [parisc-linux] Re: slang.so problems
List-ID: <linux-parisc.vger.kernel.org>

This still isn't solved.  If you install the slang1 and util-linux
from the archive, and do not install slang1-dev, then cfdisk will
not run:

slab:/usr/src/findutils-4.1.7# cfdisk 
cfdisk: error while loading shared libraries: cannot open shared object file: cannot load shared object file: No such file or directory
slab:/usr/src/findutils-4.1.7# ldd /sbin/cfdisk 
        libslang.so => not found
        libc.so.6 => /lib/libc.so.6 (0x4002b000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)
slab:/usr/src/findutils-4.1.7# dpkg -c /share/slang1_1.4.4-2_hppa.deb 
drwxr-xr-x root/root         0 2001-04-23 04:57:55 ./
drwxr-xr-x root/root         0 2001-04-23 04:57:51 ./lib/
-rw-r--r-- root/root    471076 2001-04-23 04:57:51 ./lib/libslang.so.1.4.4
drwxr-xr-x root/root         0 2001-04-23 04:57:47 ./usr/
drwxr-xr-x root/root         0 2001-04-23 04:57:46 ./usr/lib/
drwxr-xr-x root/root         0 2001-04-23 04:57:47 ./usr/share/
drwxr-xr-x root/root         0 2001-04-23 04:57:47 ./usr/share/doc/
drwxr-xr-x root/root         0 2001-04-23 04:57:53 ./usr/share/doc/slang1/
-rw-r--r-- root/root       615 2001-02-21 02:17:28 ./usr/share/doc/slang1/NEWS
-rw-r--r-- root/root       728 2001-02-21 02:17:28 ./usr/share/doc/slang1/README
-rw-r--r-- root/root     21113 2001-02-21 02:17:29 ./usr/share/doc/slang1/changelog.gz
-rw-r--r-- root/root      2012 2001-04-23 04:55:23 ./usr/share/doc/slang1/copyright
-rw-r--r-- root/root      3503 2001-02-21 02:17:29 ./usr/share/doc/slang1/UPGRADE.txt.gz
-rw-r--r-- root/root      1872 2001-04-23 04:55:23 ./usr/share/doc/slang1/changelog.Debian.gz
lrwxrwxrwx root/root         0 2001-04-23 04:57:46 ./lib/libslang.so.1 -> libslang.so.1.4.4

We are only getting away with this because the slang1_1.4.4.0.1-1_hppa.deb
in my install tree is hacked to provide libslang.so.

Richard



On Tue, May 15, 2001 at 04:59:00PM +0100, Richard Hirst wrote:
> I have had problems relating to slang.so when building boot-floppies.
> I don't entirely understand what is going on, so I'm posting the
> facts as I see them, so others can comment.
> 
> There are three packages, slang1, slang1-dev, slang1-pic (-pic probably
> isn't relevant here).
> 
> The basic problem is that slang1 provides only libslang1.so.1 and
> libslang.so.1.4.4, but various things expect libslang.so and so
> wont run unless sland1-dev is installed.  slang1-dev provides
> libslang.so.
> 
> Things I have found that are affected are cfdisk (in util-linux),
> whiptail, and libnewt0.
> 
> As a test I installed the three slang1 packages from the debian
> archive and did "gcc -o hw hw.c -lslang; ldd hw".  I get:
> 
>         libslang.so => /usr/lib/libslang.so (0x4002b000)
>         libc.so.6 => /lib/libc.so.6 (0x400b0000)
>         libm.so.6 => /lib/libm.so.6 (0x401f4000)
>         libdl.so.2 => /lib/libdl.so.2 (0x40234000)
>         /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)
> 
> If I now remove slang1-dev, and try to run hw I get
> 
> ./hw: error while loading shared libraries: libslang.so: cannot load shared object file: No such file or directory
> 
> 
> If I build my own slang1 packages and install them and then remake
> 'hw', I get
> 
>         libslang.so.1 => /lib/libslang.so.1 (0x4002b000)
>         libc.so.6 => /lib/libc.so.6 (0x400b0000)
>         libm.so.6 => /lib/libm.so.6 (0x401f4000)
>         libdl.so.2 => /lib/libdl.so.2 (0x40234000)
>         /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)
> 
> and 'hw' runs fine with slang1-dev removed, as it should.
> 
> 
> cfdisk from the debain archive wont run unless slang1-dev is installed.
> If I rebuild cfdisk myself, with the debian slang1 packages installed,
> cfdisk still wants libslang.so.  If I rebuild cfdisk with my own build
> slang1 packages installed, the resulting cfdisk wants libslang.so.1,
> as it should.
> 
> So, it seems something is wrong with the slang1 packages in debian,
> and that has resulted in bad util-linux, whiptail, and libnewt0 builds.
> 
> I don't know what might have gone wrong with the debian builds, because
> when I build slang1 debs they are fine.
> 
> Can someone else try this, and, if appropriate, upload new slang*,
> util-linux, whiptail, and libnewt0 packages to the archive?
> 
> Thanks,
>   Richard
> 
