Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id E26AC4832
	for <parisc-linux@parisc-linux.org>; Tue, 29 May 2001 17:29:53 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 May 2001 17:32:38 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010529233238.ED68937CFD@carmen.fc.hp.com>
Subject: [parisc-linux] List of packages for hppa ISO release version 2
List-ID: <linux-parisc.vger.kernel.org>

Hi binary-hppa addicts,

Here's version 2 of the list of packages for the ISO release. First the 
changes,

Added
-----
apt/apt-utils (thanks to Paul Bame)
binutils-hppa64
gcc-hppa64
gdb-hppa
autoconf2.13
ipmasqadm
iptables
libft-perl
libttf2
python-newt
sirc
strace
task-c++-dev
task-c-dev
task-devel-common

Removed
-------
ssh (I accidentally forgot to remove it from the last list)

Obsolete/local (installed but not in the archive)
--------------
libstdc++2.1 (known, ok)
libstdc++3.0 (known, ok) 
man-db  (?)
apt/apt-utils (needs to be uploaded to debian)
binutils-hppa64  \
gcc-hppa64        - unofficial debs, on pehc
gdb-hppa         /
termwrap (Richard's alien'd hack)

Dependency issues
-----------------
debconf pre-depends on perl-base (>= 5.6.1)
perl-modules depends on perl-base (= 5.6.1-3)
perl-modules depends on perl-base (= 5.6.1-3)
perl depends on perl-modules (= 5.6.0-21)

lwresd recommends libnss-lwres
libnss-lwres does not appear to be available


The list of packages is at,

http://puffin.external.hp.com/~taggart/selections.20010529

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
