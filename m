Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 370A2482A
	for <parisc-linux@parisc-linux.org>; Tue, 22 May 2001 18:08:06 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Date: Tue, 22 May 2001 18:10:50 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010523001050.DB0DF37DCE@carmen.fc.hp.com>
Subject: [parisc-linux] New hppa toolchain debs for testing
List-ID: <linux-parisc.vger.kernel.org>

Hi pa/linux addicts,

I have built new native toolchain debs. They are,

binutils - based on 2.11.90.0.8 upstream with Alan Modra's patch,
    http://sources.redhat.com/ml/binutils/2001-05/msg00284.html

gcc-3.0 - based on 3.0-0pre010427 debian package with a new hppa patch

glibc - based on 2.2.3-2 debian package with a new hppa patch

This is a big step forward from the glibc 2.2.1 and gcc 3.0-0pre010223 
packages that we have been using. Because these are so new and we need things 
to be stable for the release at the end of the month, these packages are 
currently FOR TESTING ONLY. Please give them a try but do not 
distribute/upload any packages built with them. If we determine that they are 
equal to or better than the older toolchain then we may upload them to the 
Debian archive and then people can distribute/upload.

The packages are available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/newcompilers-20010521/

Report any problems to the list.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
