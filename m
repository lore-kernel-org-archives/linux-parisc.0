Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA21055
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 18:02:59 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 8823317E4
	for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 17:04:03 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id RAA05296
	for parisc-linux@thepuffingroup.com; Tue, 10 Oct 2000 17:08:20 -0700 (PDT)
Date: Tue, 10 Oct 2000 17:08:20 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010110008.RAA05296@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 712 crash
List-ID: <linux-parisc.vger.kernel.org>

Wow cool!
I'm pretty impressed with how far the parisc-linux port is now...
It's almost useful! :^)

Well, things that seemed to work: DNS, ifconfig, LASI lan driver,
   ping, rcp, df, top, dpkg, etc..

After rcp'ing the ncurses package over and installing it,
the system crashed when I tried "w" command.

Note that /dev/sdb is sick (doesn't spin up) and needs
to be replaced or jumpers changed...console output with
the error scrolled off. I'm pretty sure it was sense data
but aren't so sure I recall it correctly: ASC/ASCQ d8/80, key 03.


But my 712 (using STI Console) crashed and I'm typing in *some*
of the crash data by hand:

Kernel Fault: Code=15  regs=c4f6c6c0 (Addr=c9c504b8)

PSW  : 0004320a  GR 1 : ffffffd0  GR 2 : c01390cc  GR 3 : c2fc8f60
...
GR24 : c4fffae8  GR25 : 00000060  GR26 : 006c884a  GR27 : c025e000
GR28 : 0000000b  GR29 : 01b22128  GR30 : c4f6c900  GR31 : c012e224

SR1 and SR3 are 00002008

IASQ : 00000000 00000000 IAOQ : c012e228 c012e22c ORIG_R28 : 00002008
 IIR : 6a740030 ISR : 00000000 IOR : c9c0504b8



Ok now for translations:
0xc01390cc try_to_free_buffers+12c
0xc025e000 data_start+0
0xc012e228 kmem_cache_free+44

sorry...but I'm not going to enter the stack dump by hand...

cheers,
grant
