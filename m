Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CBF2493B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 07:25:35 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D851@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 4 Oct 2001 08:24:38 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] Unaligned data reference...
List-ID: <linux-parisc.vger.kernel.org>

Just got this on a J210 built with a native mostly default cvs build of the
kernel.

Wasn't using the machine at the time (happened overnight) so don't know if
anything particular triggered it.

-- Nathan


Debian GNU/Linux testing/unstable inst2 ttyS0

inst2 login: swapper[0]: Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001111
r0-3     00000000 10317810 102836ac 0000000a
r4-7     109e8db2 10380ac8 0000000c 109e8d94
r8-11    00000000 00000001 00020000 27acb3a0
r12-15   00000000 0000004d 000000fd 0000001c
r16-19   10380580 f00000ac f00000a4 00000001
r20-23   00000000 00000109 27c3d000 0000000f
r24-27   00000000 10380ac8 27acb3a0 102d6010
r28-31   27c3d120 00000000 10380d80 101302d8
sr0-3    00000000 000001c4 00000000 000001c4
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10279908 1027990c
 IIR: 0c801093    ISR: 00000000  IOR: 109e8db2
 CPU:        0   CR30: 10380000 CR31: 10388000
 ORIG_R28: 00000000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
