Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amsfep11-int.chello.nl (amsfep11-int.chello.nl [213.46.243.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8DC9482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 07:12:02 -0600 (MDT)
Received: from gatekeeper ([213.46.122.180]) by amsfep11-int.chello.nl
          (InterMail vM.5.01.05.17 201-253-122-126-117-20021021) with ESMTP
          id <20030425131201.OFOX29019.amsfep11-int.chello.nl@gatekeeper>
          for <parisc-linux@lists.parisc-linux.org>;
          Fri, 25 Apr 2003 15:12:01 +0200
Received: from laptop ([10.0.3.2] ident=arjen)
	by gatekeeper with esmtp (Exim 3.35 #1 (Debian))
	id 19935b-0001A4-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 15:18:07 +0200
From: Arjen Hommersom <arjenh@chello.nl>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 25 Apr 2003 14:08:38 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200304251408.39242.arjenh@chello.nl>
Subject: [parisc-linux] sstfb crash
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

I just tried to test my Voodoo2 card on a C240 machine. I compiled 2.4.20-pa32 
and set CONFIG_FB_VOODOO1=m. The compiler was 3.0.4. Unfortunately it crashes 
when i try to load it. The following messages appear just before it locks up 
hard:

# modprobe sstfb
sstfb : Voodoo2 with ICS ICS5342 dac
sstfb: framebuffer at 0xf3400000, mapped at 0xf3400000, size 2 Mb

Stack dump:
 1ec64900:  0004ff0e 10159e6c 1ec64880 002acc20
 1ec648f0:  5758595a 0003242c 0003556c 00000000
 1ec648e0:  10650800 00000000 1035e1df 1ebe5a14
 1ec648d0:  6269745f 1ebe5a14 6269745f 1ec64710
 1ec648c0:  6c6f636b 73747576 00000000 1ec647a0
 1ec648b0:  000001ff 00032adc 1f185340 0000000f

Kernel addresses on the stack:
[<10159e6c>]  [<0003242c>]  [<0003556c>]  [<00032adc>]
[<000355cc>]  [<0003556c>]  [<00034fee>]  [<00034940>]
[<00034fb4>]  [<0003556c>]  [<000355a4>]  [<101f1ac8>]
[<000355a4>]  [<101f1b90>]  [<000355a4>]  [<000345c8>]
[<1011cff0>]  [<101049fc>]  [<00032060>]  [<10109f90>]
[<0002b800>]  [<10109084>]  [<10108cf4>]  [<1013eaac>]
[<1013d610>]  [<1014db28>]  [<1011f77c>]

Kernel Fault: Code=15 regs=1ec64900 (Addr=eae3e729)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110
r00-03  00000000 102ad810 101f5f68 1ebe5ab4
r04-07  00000000 00000000 00000000 1ebe5800
r08-11  ffffffff 1ec64810 6269745f 1ebaa000
r12-15  1fdabcc0 1ec64550 000435a8 00042da8
r16-19  00042da8 00042da8 000521c8 00450192
r20-23  001f5dce 2bb0e9ab eae3e71d 745f6c6f
r24-27  00000000 00000000 745f6c6f 10292010
r28-31  0000000f f3000000 1ec64900 101f20d4
sr0-3   00000000 0000034d 00000000 0000034d 
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IADQ: 10135394 10135398
 IIR: 0ed8109a    ISR: 00000000  IOR: eae3e729
 CPU:        0   CR30: 1ec64000 CR31: 10348000
 ORIG_R28: 102acdc0

The System.map can be found at http://213.46.122.180/System.map.bz2

Any ideas?

Arjen Hommersom
