Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73BC24A18
	for <parisc-linux@parisc-linux.org>; Thu,  1 Feb 2001 17:47:53 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id AD57A2EA
	for <parisc-linux@parisc-linux.org>; Thu,  1 Feb 2001 19:47:21 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 31AED3873B
	for <parisc-linux@parisc-linux.org>; Thu,  1 Feb 2001 17:48:49 -0700 (MST)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Feb 2001 17:48:49 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010202004849.31AED3873B@carmen.fc.hp.com>
Subject: [parisc-linux] New toolchain debs available
List-ID: <linux-parisc.vger.kernel.org>

I have built new hppa debian packages of our current binutils, gcc, and glibc 
cvs bits. They are available at,

ftp://puffin.external.hp.com/ftp/pub/parisc/binaries/new-debs/debian/

Whats new
---------
binutils-dev_2.10.91.20001013-1_hppa.deb
binutils-doc_2.10.91.20001013-1_all.deb
binutils_2.10.91.20001013-1_hppa.deb
cpp-doc_2.96.20000925-2_all.deb
cpp_2.96.20000925-2_hppa.deb
g++_2.96.20000925-2_hppa.deb
gcc-doc_2.96.20000925-2_all.deb
gcc_2.96.20000925-2_hppa.deb
glibc-doc_2.2.1-1_all.deb
libc6-dbg_2.2.1-1_hppa.deb
libc6-dev_2.2.1-1_hppa.deb
libc6-pic_2.2.1-1_hppa.deb
libc6-prof_2.2.1-1_hppa.deb
libc6_2.2.1-1_hppa.deb
libstdc++2.10-dev_2.96.20000925-2_hppa.deb
libstdc++2.10_2.96.20000925-2_hppa.deb
locales_2.2.1-1_all.deb
nscd_2.2.1-1_hppa.deb

Several people are also working to populate that directory with other debs 
built with these tools. Report any failures to the list.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
