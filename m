Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06910
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 18:29:21 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 4AD55C99
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Dec 2000 17:32:30 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id RAA22789
	for parisc-linux@thepuffingroup.com; Tue, 26 Dec 2000 17:33:45 -0800 (PST)
Date: Tue, 26 Dec 2000 17:33:45 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012270133.RAA22789@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] another trap 28
List-ID: <linux-parisc.vger.kernel.org>


Not sure this is worth pursueing...just in case someone else runs
into the same problem.

[-1071975368]: Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111110000001010
r0-3     00000000 c027f801 c01b06a4 c02d54ec
r4-7     dfdf1600 00000040 00000000 c02d5000
r8-11    00000080 dffee278 00000080 00000001
r12-15   dffee288 00023a50 00000040 0000ffff
r16-19   df613c3f 00000001 0000b71b 00000140
r20-23   00000040 00000040 00000000 0000000b
r24-27   00010000 00000600 c02d5000 c025c001
r28-31   c027f801 01093c9d df6143c0 c01af438
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c01b2178 c01b217c
 IIR: 4b930308    ISR: 00000000  IOR: c027f985
ORIG_R28: 00000007
die_if_kernel recursion detected.

0xc01b2178 scsi_free+18
0xc01b06a4 scsi_io_completion+a4
0xc01af438 scsi_old_done+26c



grant
