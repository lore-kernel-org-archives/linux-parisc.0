Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8B83482A
	for <parisc-linux@parisc-linux.org>; Mon,  9 Apr 2001 10:29:49 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Cc: boehm@acm.org, whig@debian.org, taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Apr 2001 10:32:19 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010409163219.4C92837CDC@carmen.fc.hp.com>
Subject: [parisc-linux] hppa-linux support needed for libgc5
List-ID: <linux-parisc.vger.kernel.org>

Hi HP_PA LINUX hackers,

The package libgc("a conservative garbage collector for C and C++") needs some 
hppa-linux specific changes. Right now it assumes that hppa means HP-UX. The 
upstream source is,

http://www.hpl.hp.com/personal/Hans_Boehm/gc/

and the debian package is named libgc5.

The build uses a program called if_mach to determine the arch/os and it does 
that by looking at the file "gcconfig.h".

In that file(version 5.3 of libgc) the lines 141-148, 979-1016, 1320-1325 are 
the ones we care about.  libgc5 is needed as a build/runtime dependency for 
several packages in Debian, most notably the gcc source package. I will hack 
it for now but we need to get real support added soon. Could somebody with 
more hppa experience take a look at it?

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
