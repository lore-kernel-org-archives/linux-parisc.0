Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 836E3482A
	for <parisc-linux@parisc-linux.org>; Fri, 27 Apr 2001 19:04:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14tJ9Z-0001Ed-00
	for parisc-linux@parisc-linux.org; Sat, 28 Apr 2001 02:04:05 +0100
Date: Sat, 28 Apr 2001 02:04:05 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010428020405.K7818@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] strace -f caused kernel fault
List-ID: <linux-parisc.vger.kernel.org>

just trying to track down a problem with libc, I did:

$ strace -f 2>strace.out make check
make -r PARALLELMFLAGS="" CVSOPTS="" -C ../libc objdir=`pwd` check

and then on console, i got:

Dumping Stack from 0000000035efc000 to 0000000035efcbc0:                        

[stack dump snipped]

Kernel Fault: Code=26 regs=0000000035efc880 (Addr=0000000000000008)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001100000000000001110
r0-3     0000000000000000 000000001035a9a0 0000000010105290 0000000035efc780
r4-7     0000000000000000 0000000035efc000 0000000000000000 0000000000021fc0
r8-11    000000001034f9a0 000000000002a340 0000000000000001 0000000000000000
r12-15   0000000000000100 000000000002e608 00000000000227c0 000000000000005c
r16-19   0000000035efc3a0 0000000000000000 0000000000000000 0000000025870068
r20-23   0000000001fca9e6 0000000000000000 00000000103df4b8 0000000028d78800
r24-27   0000000035efc068 0000000000008800 0000000000000000 000000001034f9a0
r28-31   00000000103501a0 0000000035efc770 0000000035efcbc0 000000001030c880
sr0-3    0000000000095a00 0000000000095a80 0000000000000000 0000000000095b00
sr4-7    0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010128714 0000000010128718
 IIR: 0eb312d0    ISR: 0000000000000000  IOR: 0000000000000008
ORIG_R28: 0000000010155a60

0000000010128714 is right in the middle of schedule(), according to System.map.

-- 
Revolutions do not require corporate support.
