Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01814
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 15:12:49 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 1059A415
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Oct 2000 17:14:22 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 2F4D238137
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Oct 2000 15:16:08 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 26 Oct 2000 15:16:08 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001026211608.2F4D238137@carmen.fc.hp.com>
Subject: [parisc-linux] New cross-compiler available
List-ID: <linux-parisc.vger.kernel.org>

I have placed a new x86/Linux -> hppa/Linux cross-compiler at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20001026.tar.gz

It contains 32/64bit compilers/binutils and a 32bit glibc. Untar it in /, it 
lives in /opt/palinux.

-- 
Matt Taggart
taggart@fc.hp.com
