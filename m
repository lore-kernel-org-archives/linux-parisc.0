Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2DE2482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 07:33:12 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 819F0B00C; Tue, 10 Jul 2001 14:31:51 +0100 (BST)
Date: Tue, 10 Jul 2001 14:31:51 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Charles Boone <ccboone@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010710143151.D23509@linuxcare.com>
References: <20010709220547.W23509@linuxcare.com> <20010710040536.41333.qmail@web11203.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010710040536.41333.qmail@web11203.mail.yahoo.com>; from ccboone@yahoo.com on Mon, Jul 09, 2001 at 09:05:36PM -0700
Subject: [parisc-linux] Re: Problem installing .9 iso image on C240
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 09, 2001 at 09:05:36PM -0700, Charles Boone wrote:
> I got the .9.1 release, it only wants to boot the
> 32bit version.  so I  tried running the install both
> with compatibility and without.
....
....
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                 
>                          
> PSW: 00000000000011001111111100001110                 
>                          
> r0-3     00000000 10335810 101fc9ec ffffffff          
> r4-7     1fe02060 0000000e 00000000 10336010          
> r8-11    0000004e 0000004d 0004000e 102c0f14
> r12-15   00000000 ffffffff 000000fd f0100000     
> r16-19   10300580 f000020c f0000204 0000ff40     
> r20-23   1fe02060 0000ff40 101fc9b0 0000000e     
> r24-27   0000ff40 f2000064 c1b21ec0 1028a010     
> r28-31   1fe03aa0 000001c0 10300a00 1010d2c8
> sr0-3    00000000 000006e2 00000000 00000000
> sr4-7    00000000 00000000 00000000 00000000
>  					     
> IASQ: 00000000 00000000 IAOQ: 101fc2e8 101fc9ec
>  IIR: 081a025c    ISR: 9227ffc8  IOR: 00000064
>  ORIG_R28: 00000000

IAOQ = _gsc_readl + 8
called from dino_in32()
I guess it was dino_in32(0xc1b21ec0), which looks odd.

Don't know why it should fail like that in the middle of the
install.  Is it repeatable?


Richard
