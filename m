Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04558
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Nov 2000 19:11:44 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 2429396A
	for <parisc-linux@thepuffingroup.com>; Sun,  5 Nov 2000 18:13:33 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA02082
	for parisc-linux@thepuffingroup.com; Sun, 5 Nov 2000 18:18:35 -0800 (PST)
Date: Sun, 5 Nov 2000 18:18:35 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011060218.SAA02082@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] string.h warnings
List-ID: <linux-parisc.vger.kernel.org>


When linux/arch/parisc/kernel/pci.c built, I get the following
warnings:
/linux/kwdb64/linux/include/linux/string.h:54: warning: conflicting types for built-in function `strlen'
/linux/kwdb64/linux/include/linux/string.h:61: warning: conflicting types for built-in function `memset'
/linux/kwdb64/linux/include/linux/string.h:64: warning: conflicting types for built-in function `memcpy'
/linux/kwdb64/linux/include/linux/string.h:73: warning: conflicting types for built-in function `memcmp'

Could this be related to or shed light on the problem bdale had?

thanks,
grant
