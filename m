Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92FD7482A
	for <parisc-linux@parisc-linux.org>; Mon,  9 Apr 2001 14:21:52 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id 872AB58D
	for <parisc-linux@parisc-linux.org>; Mon,  9 Apr 2001 16:21:51 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id CD10E37CDB
	for <parisc-linux@parisc-linux.org>; Mon,  9 Apr 2001 14:24:25 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Apr 2001 14:24:25 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010409202425.CD10E37CDB@carmen.fc.hp.com>
Subject: [parisc-linux] New cross compiler available - xc-20010409.tar.gz
List-ID: <linux-parisc.vger.kernel.org>

I have built a new cross-compiler tarball and placed it at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010409.tar.gz

This is both i386-linux to hppa-linux(with glibc) and i386-linux to 
hppa64-linux(no glibc). Since the last one(March 7) there have been gcc and 
binutils merges and various fixes. As usual the cross-compiler lives in 
/opt/palinux and should be untar'ed from /.

Let me know if you have any problems.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
