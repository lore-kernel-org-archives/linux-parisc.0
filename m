Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA30562
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 03:55:16 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2C51FB007; Fri, 10 Nov 2000 10:55:16 +0000 (GMT)
Date: Fri, 10 Nov 2000 10:55:16 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001110105515.I32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc-linux reaches uptimes in excess of one day!
List-ID: <linux-parisc.vger.kernel.org>

Just for interest...  My A180 has been up for 25 hours, the first
12 of which I had a couple of telnet sessions open running vi, gcc,
etc. and since then it has been looping doing kernel builds.
I also ran cvs to update its kernel source tree from pehc.
So far it has completed about 23 kernel builds with one hiccup:

do_page_fault() pid=2420 command='cpp0'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001011
r0-3     00000000 4013ac38 400e134f 00000004
r4-7     40138c38 ffffffb5 2002014b 00000001
r8-11    00000004 00000000 00000000 4001ada0
r12-15   4001ad7c 0001b300 2001f601 00000001
r16-19   00012000 00000023 00000020 40138c38
r20-23   20020100 4012a51c 00000000 9999999a
r24-27   2002016c 2002014c 00000004 00013d34
r28-31   00000000 4013a438 200201c0 40041757
sr0-4    00000000 00000011 00000000 00000011
sr4-8    00000011 00000011 00000011 00000011

IASQ: 00000011 00000011 IAOQ: 400e13b7 400e13bb
 IIR: 0c601094    ISR: 00000011  IOR: 00000004
ORIG_R28: 40019450


Richard
