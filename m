Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc171-bre9.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8CAE482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 May 2001 04:38:43 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 05DB7B007; Thu, 10 May 2001 11:37:58 +0100 (BST)
Date: Thu, 10 May 2001 11:37:57 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010510113757.C1840@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] exim crash
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Just grabbed exim_3.22-4_hppa.deb from the debian archive, and got
the following crash on installing/configuring it.  exim_3.22-2_hppa.deb
from pehc is ok.  I was able to reproduce the crash by trying to send
mail with 'mail' (same iaoq value, at least).

Richard


slab login: !!die_if_kernel: exim(18725): Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111
r0-3     0000000000000000 000000000009a950 00000000000461d3 000000000009f010
r4-7     000000000009f01d 00000000000a0550 0000000000000013 000000000007db64
r8-11    0000000000097950 00000000000996b0 00000000000a0550 00000000000000b8
r12-15   0000000000000020 000000000009b150 00000000000988bc 0000000000079ee0
r16-19   0000000000000028 0000000000097828 0000000000000002 0000000000097828
r20-23   000000000000003a 000000004027e470 000000000009abaa 000000000000003a
r24-27   0000000000079800 000000000000003f 00000000000a0550 0000000000097150
r28-31   000000000009f01c 00000000faf00c48 00000000faf00d00 00000000000461d3
sr0-3    00000000000ce400 00000000000ce400 0000000000000000 00000000000ce400
sr4-7    00000000000ce400 00000000000ce400 00000000000ce400 00000000000ce400

IASQ: 00000000000ce400 00000000000ce400 IAOQ: 00000000000314bf 00000000000314c3
 IIR: 4835016e    ISR: 00000000000ce400  IOR: 000000000009aa07
ORIG_R28: 0000000000000000
