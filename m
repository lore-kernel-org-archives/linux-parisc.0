Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA03508
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Mar 2000 19:17:27 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id 0BA968B6
	for <parisc-linux@thepuffingroup.com>; Tue,  7 Mar 2000 17:18:35 -0800 (PST)
To: parisc-linux@thepuffingroup.com
Date: Tue, 07 Mar 2000 18:18:05 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12SV6z-000245-00@endor.fc.hp.com>
Subject: [parisc-linux] palo
List-ID: <linux-parisc.vger.kernel.org>


I incorporated prumpf's byte-order changes to palo & ipl so they *should*
work when cross-compiled on x86 but I haven't been able to confirm that yet.

palo (really ipl) was converted to use ELF32, so you don't need SOM
for the boot loader.  palo still understands either SOM or ELF32
executables for ipl (if you happen to have an old one) and/or vmlinux.

The palo sources have been heavily re-named, so get your new bits with care!

One oddity -- you have to build palo 2 extra times at first, due to
some symlinking hacks.  VPATH would probably be better, when I get the time,
or somebody else does.

	-P
