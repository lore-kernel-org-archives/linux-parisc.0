Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E033A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 01:52:10 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id BAA09784
	for parisc-linux@lists.parisc-linux.org; Thu, 19 Jul 2001 01:51:15 -0600
Date: Thu, 19 Jul 2001 01:51:15 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200107190751.BAA09784@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] r3 getting trashed by __wake_up?
List-ID: <linux-parisc.vger.kernel.org>

Hi parisc asm experts! ;^)

The problem I'm seeing is r3 is zero'd (trashed) by __wake_up()
when called by wake_up_parent().  I'm triggering this consistently
with "pon uunet" - ie fire up a ppp dialup session. The c3k crashes
after the modem returns a "CONNECT" string.

The c3k data page faults with:

	Kernel Fault: Code=26 regs=8e6a4740 (Addr=00000098)

IOAQ and GR02 are both wake_up_parent+24
(called from skip_save_ior+164) 

"objdump -rD kernel/signal.o" shows:

0000000000000000 <wake_up_parent>:
   0:   6b c2 3f d9     stw rp,-14(sp)
   4:   6f c4 00 80     stw,ma r4,40(sp)
   8:   6b c3 3f 89     stw r3,-3c(sp)
   c:   08 1a 02 44     copy r26,r4
  10:   08 04 02 43     copy r4,r3
  14:   34 19 00 02     ldi 1,r25
  18:   34 7a 01 50     ldo a8(r3),r26
  1c:   e8 00 a0 00     call 24 <wake_up_parent+0x24>
                        1c: R_PARISC_PCREL22F   __wake_up
  20:   08 19 02 58     copy r25,r24
  24:   48 73 01 30     ldw 98(r3),r19
  28:   36 63 3e d1     ldo -98(r19),r3
...


r3 is zero. But it obviously wasn't zero before calling __wake_up.
Now __wake_up save/restore of registers is a bit wierd...
It doesn't look right to me but it's been a long day:
0000000000000000 <__wake_up>:
   0:   08 03 02 41     copy r3,r1
   4:   6b c2 3f d9     stw rp,-14(sp)
   8:   08 1e 02 43     copy sp,r3
   c:   6f c1 01 00     stw,ma r1,80(sp)
  10:   0c 6d 12 90     stw  r13,8(sr0,r3)
...
  c8:   0c 70 10 8d     ldw  8(sr0,r3),r13
...
  f0:   34 7e 00 80     ldo 40(r3),sp
  f4:   e8 40 d0 00     ret       
  f8:   4f c3 3f 81     ldw,mb -40(sp),r3

I didn't see any code inbetween that modifies r3.
And from this code it looks like r3 is callee save.

Shouldn't sp be restored with "copy r3,sp"?
And the restore of r3 be "ldw 0(sp),r3"?

Everything on my c3k is up-to-date and vmlinux was built native from scratch:
   gcc-3.0 |    1:3.0-1 |      unstable | hppa, hurd-i386
   gcc-3.0 |    1:3.0-4 |      unstable | alpha, arm, i386, mips, mipsel, powerpc, sparc

Perhaps we just need to rebuild/use the newer gcc bits?
Other ideas?

thanks,
grant
