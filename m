Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from khan.acc.umu.se (khan.acc.umu.se [130.239.18.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7F2D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Apr 2001 22:54:17 -0600 (MDT)
Received: from nasse.acc.umu.se (maswan@nasse.acc.umu.se [130.239.18.207])
	by khan.acc.umu.se (8.11.2/8.11.2) with ESMTP id f3H4sGk03952
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Apr 2001 06:54:16 +0200 (MEST)
Date: Tue, 17 Apr 2001 06:54:15 +0200 (MET DST)
From: Mattias Wadenstein <maswan@acc.umu.se>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.GSO.4.33.0104170639220.12304-100000@nasse.acc.umu.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc segfault when building screen
List-ID: <linux-parisc.vger.kernel.org>

"apt-get -b source screen" gives this after a while:

acls.c: In function `AclSetPerm':
acls.c:845: Internal error: Segmentation fault
Please submit a full bug report, with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.

I have done this twice and gotten the segfault in the same place.

Some output:

do_page_fault() pid=13654 command='cc1' type=15 address=0x00000008

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001111
r0-3     00000000 0027d024 0012a85b 00000000
r4-7     002a2270 00000000 00000000 00000000
r8-11    00000020 00000000 00249824 00000007
r12-15   0000001c 0027d024 0027d024 0024a024
r16-19   00000000 00000021 0021ef14 003a08b8
r20-23   00000000 003a08d8 40149ec8 00000018
r24-27   00000024 00000040 003a08b8 00247824
r28-31   003a08b8 003a08b0 bff01180 000bdb07
sr0-3    00000c64 00000c64 00000000 00000c64
sr4-7    00000c64 00000c64 00000c64 00000c64

IASQ: 00000c64 00000c64 IAOQ: 0012a86b 0012a86f
 IIR: 0c701093    ISR: 00000c64  IOR: 00000008
ORIG_R28: 4052ea60

do_page_fault() pid=14793 command='cc1' type=15 address=0x00000008

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001111
r0-3     00000000 0027d024 0012a85b 00000000
r4-7     002a2270 00000000 00000000 00000000
r8-11    00000020 00000000 00249824 00000007
r12-15   0000001c 0027d024 0027d024 0024a024
r16-19   00000000 00000021 0021ef14 003a08b8
r20-23   00000000 003a08d8 40149ec8 00000018
r24-27   00000024 00000040 003a08b8 00247824
r28-31   003a08b8 003a08b0 bff01180 000bdb07
sr0-3    000018bc 000018bc 00000000 000018bc
sr4-7    000018bc 000018bc 000018bc 000018bc

IASQ: 000018bc 000018bc IAOQ: 0012a86b 0012a86f
 IIR: 0c701093    ISR: 000018bc  IOR: 00000008
ORIG_R28: 4052ea60

/Mattias Wadenstein - trying to build some stuff
