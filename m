Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A675482A
	for <parisc-linux@parisc-linux.org>; Wed, 23 May 2001 17:08:01 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 23 May 2001 17:10:45 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010523231045.0DF9037CA8@carmen.fc.hp.com>
Subject: [parisc-linux] hppa64 cross compiler debs available
List-ID: <linux-parisc.vger.kernel.org>

Hi hppa64 kernel users,

I have built unofficial hppa64-linux cross binutils/gcc debs for use in 
compiling 64 bit kernels on hppa-linux. They are available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/unofficial-debs/

You need both,

binutils-hppa64_2.11.90.0.7-2.0.0.1_hppa.deb
gcc-hppa64_3.0-0pre010427.0.0.1_hppa.deb

They install under /usr so you shouldn't need to modify your path to build a 
64bit kernel. These unofficial debs will not be uploaded to the debian archive 
and are intended as a interim measure until a working mechanism exists to do 
them properly based on the debian source packages.

Let me know if you have any problems.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
