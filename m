Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 809454A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Mar 2001 20:02:46 -0700 (MST)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Mar 2001 20:04:50 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010322030450.4898538145@carmen.fc.hp.com>
Subject: [parisc-linux] New toolchain debs and ftp reorg
List-ID: <linux-parisc.vger.kernel.org>

Hi parisc-linux'ers,

Quite a bit has changed with the toolchain in the last few weeks. I seem to be 
building new binutils/gcc/glibc packages almost every day. Rather than 
continually swap the debs out of the normal directory on the ftp site I've 
started putting the toolchain in it's own directory. As of today we seem to 
have a fairly stable(knock on wood) set of debs, available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/newcompilers-20010321/

I encourage everyone to grab a new toolchain. In particular people with PCXT 
systems(715/old,725/735/755,others) will want to grab the new libc6 packages 
which enable these systems to start working.

The new gcc debs are based on the gcc-3.0 experimental debian packages and are 
designed to co-exist with other versions of gcc on the system. This has a 
couple implications for us,

- The packages do not conflict with the old gcc packages
   You will need to dpkg -r all older gcc related packages
- some binaries install with a -3.0 prefix
   At least you will need to,
     cd /usr/bin
     mv cpp cpp.old;ln -s cpp-3.0 cpp
     mv g++ g++.old;ln -s g++-3.0 g++
     mv g77 g77.old;ln -s g77-3.0 g77
     mv gcc gcc.old;ln -s gcc-3.0 gcc

There is a gcc-defaults package that fixes these and I will try and get that 
working on hppa soon. When the need arises to do new compilers they will get a 
new directory.

With all the changes in the toolchain recently there are a couple that we 
really want(but not *need*) to recompile all packages for. So the most current 
versions of everything we've built up to this point are available in,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/debs-old/

The latest versions of everything from here on out will be available in,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/debs/

until we change it to something else :) Most of the debs in deb-old/ still 
work but as things get rebuilt and put in debs/ I will move them to the 
debs-old/old subdirectory.

All these directories are not yet apt-get'able. I may set that up if I get 
time. Also none of these debs are in the official debian tree yet. I suspect 
uploads will start once the build daemon is up and running.

Hopefully this makes sense. Please let me know if you have questions/problems.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
