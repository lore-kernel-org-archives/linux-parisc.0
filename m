Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA23437
	for <parisc-linux@puffin.external.hp.com>; Mon, 9 Oct 2000 21:40:50 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel2.hp.com (Postfix) with ESMTP id 05F8AEE
	for <parisc-linux@thepuffingroup.com>; Mon,  9 Oct 2000 21:41:38 -0600 (MDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 6607638131
	for <parisc-linux@thepuffingroup.com>; Mon,  9 Oct 2000 21:43:45 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Oct 2000 21:43:45 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001010034345.6607638131@carmen.fc.hp.com>
Subject: [parisc-linux] New nfsroots and xc
List-ID: <linux-parisc.vger.kernel.org>

I have created 2 new palinux nfsroots. The first is just the Debian base 
packages that we have(~15MB).

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/base-20001009.tar.gz

The second is the above plus everything else we have(~38MB).

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20001009.tar.g
z

I have also put a new i386-linux -> hppa-linux cross compiler tarball at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20001009.tar.gz


-- 
Matt Taggart
taggart@fc.hp.com
