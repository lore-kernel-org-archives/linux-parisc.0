Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc171-bre9.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58E22482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 May 2001 04:44:19 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 23FC6B007; Thu, 10 May 2001 11:43:37 +0100 (BST)
Date: Thu, 10 May 2001 11:43:37 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010510114337.D1840@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] nsgmls crash
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Trying to build the boot-floppies, I get a repeatable crash here:

slab:~# !!die_if_kernel: nsgmls(21734): Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     0000000000000000 0000000000035880 000000000001f717 00000000faf00740
r4-7     0000000000033080 0000000000036342 0000000000036002 0000000000000004
r8-11    00000000000362d2 00000000000adc10 00000000000af390 00000000000b01d0
r12-15   0000000000000000 00000000ffffffff 00000000000a8ed0 0000000000000000
r16-19   0000000000000000 0000000000000000 0000000000000000 000000000001f5d4
r20-23   00000000402b0710 0000000040265970 000000000001f5d4 0000000000000000
r24-27   0000000040265970 00000000402af588 0000000040265980 0000000000033080
r28-31   0000000000000000 000000000003da00 00000000faf007c0 000000000001f717
sr0-3    000000000027e100 000000000027e100 0000000000000000 000000000027e100
sr4-7    000000000027e100 000000000027e100 000000000027e100 000000000027e100

IASQ: 000000000027e100 000000000027e100 IAOQ: 000000000001f6c7 000000000001f6cb
 IIR: 4835090e    ISR: 000000000027e100  IOR: 0000000000035d07
ORIG_R28: 0000000000000001

luckily all the useful bits have been built before this point.
I wasn't getting this a couple of days ago, I'm keeping my system
pretty much up to date with the debian archive, and don't know what
upgrade introduced this problem.

Richard
