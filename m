Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA24156
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 23:09:25 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id C2248155A
	for <parisc-linux@thepuffingroup.com>; Thu, 25 Jan 2001 22:13:20 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id WAA23253
	for parisc-linux@thepuffingroup.com; Thu, 25 Jan 2001 22:15:27 -0800 (PST)
Date: Thu, 25 Jan 2001 22:15:27 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200101260615.WAA23253@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sh segfaults
List-ID: <linux-parisc.vger.kernel.org>


Hi all,
So despite booting our shiny new 2.4.0 kernel fine and being able to rcp
the sources to attempt a native build, "make oldconfig" consistently
sees a segfault:

c3k:/usr/src/linux \<535\>make oldconfig > /dev/null

do_page_fault() pid=561 command='sh' type=15 address=0x000006e4

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 00000368 000327a3 bb002490
r4-7     4001399b 00000000 401cf630 401d2fbc
r8-11    00076d74 00000000 bb002490 000c3110
r12-15   ffffffff 00000000 00000000 00000001
r16-19   0000005c 00000000 00000000 401d2fbc
r20-23   fffff000 400eb63c 0007e498 00000008
r24-27   00000000 bb002908 00000002 00076808
r28-31   0000023a 0000002f bb002880 400eb663
sr0-3    00000368 00000368 00000000 00000368
sr4-7    00000368 00000368 00000368 00000368

IASQ: 00000368 00000368 IAOQ: 000327a3 000327a7
 IIR: 483306f8    ISR: 00000368  IOR: 000006e4
ORIG_R28: 00000001
make: *** [oldconfig] Segmentation fault
c3k:/usr/src/linux \<536\>


And redirecting output to /dev/null doesn't always work either.
Sometimes I just get back an error msg.
This wasn't happening with the previous kernels.

This is unfortunately on the same proto-c3k that couldn't run hwclock.sh
at boot up before though that worked fine on my c3k at work. So it
might just be the machine. If others could verify...

thanks,
grant
