Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA08554
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Sep 1999 13:49:32 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id PAA02398
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Sep 1999 15:51:17 -0400 (EDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id MAA00724 for <parisc-linux@thepuffingroup.com>; Mon, 27 Sep 1999 12:51:38 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id MAA10009 for parisc-linux@thepuffingroup.com; Mon, 27 Sep 1999 12:51:54 -0700 (PDT)
Message-Id: <199909271951.MAA10009@meow.sr.hp.com>
Subject: [parisc-linux] compiling on a 735? (fwd)
To: parisc-linux@thepuffingroup.com
Date: Mon, 27 Sep 1999 12:51:54 -0700 (PDT)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|
|Hi!
|
|I've recently gotten hold of a 735/99 (A2608A) workstation (128M ram and 2 
|really loud disks), and would like to contribute.
|
|I've cleaned one of the disks, and on the other I've installed the 
|egcs, flex and make depots (the bash-depot seems to be non-
|existent, so I've compiled and installed it from gnu.org myself.
|
|I've downloaded a kernel snapshot (some days ago), and now have 
|some questions;
|
|1. has anybody compiled ncurses, so that make menuconfig works? I'll give
|it a try soon.
|2. Is my 735 a 712 or 715? Does it matter at this stage?

It's neither, it's a 735.
It is however very similar to a 715/33,50,75, which are completely
different machines than 715/64,80,100.

|3. Is my 735 a A class or D class? Does it matter?

It's neither.

|4. The HCL notes that the 735 has a 7100, so that part is ok.

That's a 7100, not a 7100LC as used in 712, 715/64,80,100.

|5. Gecko or Dino? I don't have one pci-slots, so I guess it's no Dino, right?

It predates all of the Gecko era chips: LASI, DINO, etc.

	-Bill
