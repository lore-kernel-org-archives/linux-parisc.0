Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA20835
	for <parisc-linux@puffin.external.hp.com>; Fri, 21 Jan 2000 19:52:53 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (Postfix) with ESMTP id 7C2CADAF
	for <parisc-linux@thepuffingroup.com>; Fri, 21 Jan 2000 20:53:38 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id RAA23821 for parisc-linux@thepuffingroup.com; Fri, 21 Jan 2000 17:54:04 -0800 (PST)
Date: Fri, 21 Jan 2000 17:54:04 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200001220154.RAA23821@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] hardware.h vs machine.h
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Could someone explain why HPHW_NPROC (and friends) are defined in
both asm-parisc/hardware.h and asm-parisc/machine.h?

It seems the latter is obsolete...and both use
"ifndef _PARISC_HP_MACHINES_H_" to prevent multiple inclusion.

thanks,
grant
