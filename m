Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05615482A
	for <parisc-linux@parisc-linux.org>; Mon, 25 Jun 2001 18:32:06 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id C54FF474
	for <parisc-linux@parisc-linux.org>; Mon, 25 Jun 2001 20:32:04 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 11C5137D24
	for <parisc-linux@parisc-linux.org>; Mon, 25 Jun 2001 18:34:53 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Jun 2001 18:34:53 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010626003453.11C5137D24@carmen.fc.hp.com>
Subject: [parisc-linux] ISO packages list
List-ID: <linux-parisc.vger.kernel.org>

Hi palinux'ers,

For the 0.9 release I sent the list of packages that would go on the ISO to 
this list for review. As we prepare for the next point release(0.9.1?) I have 
updated it again. I decided to put the list in pehc cvs under 
build-tools/packagelist. Here is what has changed from the 0.9 list

Added
-----
lsof (standard)
mtr-tiny (standard)
vacation (standard)
libgcc1 (new gcc-3.0)
libnss-lwres (new bind)
dpkg-dev
squid
wget
cowsay (fun)
moon-buggy (fun)
xgalaga (fun, X testing)

Removed
-------
netkit-rpc (conflicts with new libc6)


All future changes will be explained in the cvs commit logs(not here).

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
