Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CD80482B
	for <parisc-linux@parisc-linux.org>; Fri,  6 Jul 2001 15:47:46 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel6.hp.com (Postfix) with ESMTP id 20CB01F7A5
	for <parisc-linux@parisc-linux.org>; Fri,  6 Jul 2001 17:47:45 -0400 (EDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id PAA02874
	for <parisc-linux@parisc-linux.org>; Fri, 6 Jul 2001 15:47:44 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.22 #1 (Debian))
	id 15IdRv-00051U-00
	for <parisc-linux@parisc-linux.org>; Fri, 06 Jul 2001 15:47:43 -0600
To: parisc-linux@parisc-linux.org
Date: Fri, 06 Jul 2001 15:47:43 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15IdRv-00051U-00@noam.fc.hp.com>
Subject: [parisc-linux] 2.4.6 boots!
List-ID: <linux-parisc.vger.kernel.org>

2.4.6-pa2 boots (serial console) both 64 and 32-bit on c3000 and
b180.  It may be hanging on 712 (I had to remove CONFIG_GSC_WAX
to get rid of an infinite loop).  Boot-time IP configuration
(PNP+BOOTP) isn't working (with tulip anyway) but static network
configuration works.  I just laid down the LINUS_246_DEVEL tag
so I guess the tree's open for business again.

	-P
