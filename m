Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 427A2482A
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 15:34:27 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id B8F2F8AA
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 17:34:26 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id BF03237F86
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 15:34:25 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 29 Jun 2001 15:34:25 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010629213425.BF03237F86@carmen.fc.hp.com>
Subject: [parisc-linux] New i386->hppa cross-compiler
List-ID: <linux-parisc.vger.kernel.org>

Hi hppa-linux'ers,

I have built a new i386 ->hppa/hppa64 cross-compiler. The tarball is available 
at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010628-2.tar.gz

Untar it from / it lives in /opt/palinux, so you'll want to add 
/opt/palinux/bin to your $PATH. It was built against potato's glibc 2.1.3 so 
it should work on systems using that and newer.

Please report any problems to the list.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
