Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA00446
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:33:59 -0700
Message-Id: <200011151923.LAA13597@milano.cup.hp.com>
To: Andreas Thienemann <andreas@bawue.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 250/1 doesn't boot but dumps stack 
In-reply-to: Your message of "Thu, 16 Nov 2000 20:20:41 PST."
             <3A143389.CA59F143@bawue.de>
Date: Wed, 15 Nov 2000 11:23:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Andreas Thienemann wrote:

> But when I try to boot up this kernel it dumps stack right after initialising
> the pty interfaces. (I already left out everything unnecessary, such as
> parallel port support)
...
> parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
> Found i82596 at 0xffd07000, IRQ 87
> early initialization of device eth0 is deferred
> Initializing Lasi PS/2-keyboard port at 0xffd08000...
> Support for Lasi PS/2-psaux not yet available !
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Starting kswapd v1.8
> pty: 256 Unix98 ptys configured
> lp0: using parport0 (interrupt-driven).

Are you sure you left out parallel port support?


> Data access rights fault in kernel: Code=26 regs=c7f98780 (Addr=00000004)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001011
> r0-3     00000000 c02ca800 c029c248 00000000
> r4-7     c7ffc400 ffffffff c01e2468 c028b800
> r8-11    c02cb800 000000f0 00000000 000000ff
> r12-15   000000f2 000000fa 000000fd f0100000
> r16-19   f0001180 f0000070 f0000068 00000000
> r20-23   c7f9870e 00000002 c029c4d0 ffd07000
> r24-27   c7f98710 00000f20 00000000 c0268000
> r28-31   00000001 00000000 c7f989c0 002b31b8
> sr0-4    00000000 00000000 00000000 00000000
> sr4-8    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: c029c264 c029c268
>  IIR: 0e681096    ISR: 00000000  IOR: 00000004
> ORIG_R28: 00000000

Smells like a driver bug.
Can you look up IOAQ and GR2 (c029c264 and c029c248) in System.map file?

grant
