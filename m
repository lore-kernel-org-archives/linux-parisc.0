Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA20685
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 06:56:50 -0600
Date: 4 Oct 2000 12:57:46 -0000
Message-ID: <20001004125746.18672.qmail@mailserv2.iuinc.com>
Received: from y18626 ([10.108.21.26]) by smtp.huawei.com
          (Netscape Messaging Server 4.15) with SMTP id G1WOVN01.E12 for
          <parisc-linux@thepuffingroup.com>; Wed, 4 Oct 2000 20:47:47 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: parisc-linux@thepuffingroup.com
From: yuqian <yuqian@huawei.com>
Subject: [parisc-linux] pre-build HP-UX/10.20 bash's problem
List-ID: <linux-parisc.vger.kernel.org>

Hi.
I have a HP B2000 (9000/785) with HP-UX 10.20 and installed 
binaries/HP-UX/depot/10.20/bash-2.03-1.hpux-10.20.depot.gz,
but it not work when I want to build a new kernel:
   bash-2.03$ make dep
   scripts/mkdep init/*.c > .depend
   scripts/mkdep `find /home/yq/linux/include/asm
/home/yq/linux/include/linux /home/yq/linux/include/scsi
/home/yq/linux/include/net -name   SCCS -prune -o -follow -name \*.h ! -name
modversions.h -print` > .hdepend
   bash: scripts/mkdep: Arg list too long
   make: *** [dep-files] Error 126
  
Am I missing any thing?
Thanks for any advices.
