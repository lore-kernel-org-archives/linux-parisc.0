Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA08967
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 May 2000 20:10:07 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by cosrel1.hp.com (Postfix) with ESMTP id B7CBA9EC
	for <parisc-linux@thepuffingroup.com>; Thu, 11 May 2000 14:10:42 -0600 (MDT)
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 1828A4FE19
	for <parisc-linux@thepuffingroup.com>; Thu, 11 May 2000 16:10:14 -0400 (EDT)
To: parisc-linux@thepuffingroup.com
Date: Thu, 11 May 2000 14:10:13 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12pzHh-0001Ji-00@endor.fc.hp.com>
Subject: [parisc-linux] ELF tool chain builds hello world!!!
List-ID: <linux-parisc.vger.kernel.org>


Just thought I'd offer a binary tarball of a tool chain which can
cross-compile hello world!!!!!  (seems to work on the kernel too)
There are quite a few little icky things I did to build this which
I'll clean up and post, along with build recipes, over the next
day or so.

User space is not far off!!!!!

	-Paul Bame

The following tarball should be unpacked in / and it populates
/opt/palinux (not to be confused with /opt/puffin).  It is built
for i586 (I have an AMD K6 box at home!) on the Debian 'potato'
release.

ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/elf32x86.tar.gz
