Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA11563
	for <parisc-linux@puffin.external.hp.com>; Fri, 28 Jul 2000 15:26:43 -0600
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by cosrel2.hp.com (Postfix) with ESMTP id 82A8171D
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Jul 2000 15:28:30 -0600 (MDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id PAA25633
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Jul 2000 15:28:34 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13IHh3-00042q-00
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Jul 2000 15:29:21 -0600
To: parisc-linux@thepuffingroup.com
Date: Fri, 28 Jul 2000 15:29:21 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13IHh3-00042q-00@noam.fc.hp.com>
Subject: [parisc-linux] New cross-compiler
List-ID: <linux-parisc.vger.kernel.org>


I just put a new cross compiler tarball at
ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000728.tgz
As usual, it's built for the Debian 'potato' release, and will probably
work on most fairly recent Linux boxes.

This is the full userspace-capable cross compiler, which is also
required to build palo these days (palo needs the x-compiler to have
a full set of header files).  It built sash, the kernel, and palo.

It does not include any of the shared library stuff currently under
development.

	-Paul Bame
