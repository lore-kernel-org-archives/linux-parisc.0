Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oscar.intranet.nimag.net (slipknot.nimag.net [195.202.197.141])
	by dsl2.external.hp.com (Postfix) with SMTP id 24583482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 08:55:03 -0600 (MDT)
Received: from francois by gollum.intranet.nimag.net with local (Exim 3.32 #1 (Debian))
	id 15iznZ-0004Yy-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 16:55:01 +0200
Date: Mon, 17 Sep 2001 16:55:01 +0200
From: Francois Deppierraz <francois@ctrlaltdel.ch>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010917165501.B17483@gollum.intranet.nimag.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Sender: Francois Deppierraz <francois@ctrlaltdel.ch>
Subject: [parisc-linux] nmap -O -> kernel panic on 712
List-ID: <linux-parisc.vger.kernel.org>

Hi kernel hackers !

My HP 712/60 with a 2.4.9-pa20 kernel crash with the following error
message when I portscan it using nmap -O (OS detection).

kswapd[4]: Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001111
r0-3o 00000000 10332810 1028b9e4 0000000a
r4-7o 100dfdb2 100ed148 0000000c 100dfd94
r8-11o 00000000 00000001 00020000 10ce6500
r12-15o 11fb09a0 00004400 00004800 43f02aa9
r16-19o 100eca00 00000000 00000c00 00000001
r20-23o 00000000 00000109 117ca000 0000000f
r24-27o 00000000 100ed148 10ce6500 102f0010
r28-31o 117ca160 00000040 100ed400 1012e6d8
sr0-3o 00000000 00000002 00000000 00000002
sr4-7o 00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10281658 1028165c
 IIR: 0c801093    ISR: 00000000  IOR: 100dfdb2
 CPU:        0   CR30: 100ec000 CR31: 103a0000
 ORIG_R28: 00000000
Kernel Panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing

Thanks for your work !

Any idea ? Do I need to fill a bugreport ?
-- 
Francois Deppierraz <francois.deppierraz@nimag.net>
Nimag Networks Sàrl - www.nimag.net
PGP Key ID: 9D283BC9
