Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8036482A
	for <parisc-linux@parisc-linux.org>; Wed, 23 May 2001 16:52:02 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 23 May 2001 16:54:39 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010523225439.411F937CA8@carmen.fc.hp.com>
Subject: [parisc-linux] new hppa toolchain, uploaded to debian archive
List-ID: <linux-parisc.vger.kernel.org>

Hi,

There was a slight problem with the glibc in the newcompilers-20010521 set I 
announced yesterday. It was built with a wrong header which caused a problem 
with building gdb and strace. I rebuilt glibc and have placed it and the same 
binutils and gcc at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/newcompilers-20010523/

After several of us tested the new toolchain and did not find any regressions, 
Paul Bame uploaded the debs to the Debian archive today and they should 
hopefully be available in the next few days. However, since the binutils mess 
is still not completely cleaned up YOU STILL SHOULD NOT APT-GET UPGRADE. For 
now grab them from the above URL and install by hand. If you are sure your 
system is clean of the binutils mess then you can use this toolchain to 
produce binaries for distribution/upload to debian.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
