Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF50F482A
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 17:37:48 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 36A9A28A
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 19:37:48 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id E019A38074
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 17:40:30 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Apr 2001 17:40:30 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010425234030.E019A38074@carmen.fc.hp.com>
Subject: [parisc-linux] New hppa glibc 2.2.1 packages
List-ID: <linux-parisc.vger.kernel.org>

Hi hppa hackers,

I have built new hppa glibc packages. Please read this whole message before 
installing. I have placed them at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/newlibc-20010425/

They are an update of the 2.2.1 packages that were in the base tarball and 
ESIEE isos and include the following changes,

- support for large files
- fix 32-bit UIDs/GIDs
- fix minor floating-point bug
- make SHM work on 64-bit
- make getdents64 work
- make us suck less at resource limits

If you need these features, need to do a new install, or feel like upgrading 
then you should grab them. If you can wait a few days then you might want to 
wait for the 2.2.3 based packages which will be available shortly after the 
upstream 2.2.3 release.

Install Notes
-------------
You must upgrade your kernel before installing these packages. Your kernel 
must be from April 24th or later.

If you have been apt-get upgrading you may have a newer libdb2 package 
installed that shares files with this libc package. If you see this error,

   Unpacking replacement libc6 ...
   dpkg: error processing libc6_2.2.1-1_hppa.deb (--install):
   trying to overwrite `/lib/libdb.so.3', which is also in package libdb2

Then run the following,

   dpkg --install --force-overwrite libc6_2.2.1-1_hppa.deb
   apt-get --reinstall install libdb2

Once we've moved to newer packages this problem will go away.

Post any problems to the list.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
