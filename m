Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CC09482A
	for <parisc-linux@parisc-linux.org>; Fri, 23 Mar 2001 13:47:45 -0700 (MST)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Mar 2001 13:19:13 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010323201913.8693C38F00@carmen.fc.hp.com>
Subject: [parisc-linux] New compilers available
List-ID: <linux-parisc.vger.kernel.org>

I have updated the native compiler debs again,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/newcompilers-20010323/

- New glibc packages that fix pthreads. You can now safely use the nscd 
package and other pthreads apps.
- New gcc packages that fix a problem when compiling a libperl shared perl.
- binutils are the same as 20010321

You don't have to grab them unless you're seeing these problems, but it 
wouldn't hurt either.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
