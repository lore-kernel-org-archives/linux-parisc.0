Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1246482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 12:05:52 -0600 (MDT)
Received: from esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id CC2CDD15F4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 20:05:50 +0200 (CEST)
Sender: delahaym@esiee.fr
Message-ID: <3AD34CC0.BE88DE32@esiee.fr>
Date: Tue, 10 Apr 2001 20:11:12 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Pb with fcntl.c
List-ID: <linux-parisc.vger.kernel.org>

Hi all!

while my kernel was booting, I got this dump:

Kernel Fault: Code=26 regs=10038580 (Addr=00000008)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 00000002 101496ec 00000000
r4-7     00000000 00000000 faf00e08 00000000
r8-11    ffffffff faf006c8 00008250 00000002
r12-15   00009b2c 00009b2c 1029860c 102e4000
r16-19   00000000 102e4580 00000000 4014907a
r20-23   00000014 00000000 00000000 ffffffff
r24-27   00000000 faf00e28 00000000 1027e010
r28-31   00000000 00000000 100387c0 10119250
sr0-3    00000000 00000002 00000000 00000002
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101394cc 101394d0
 IIR: 0c701085    ISR: 00000000  IOR: 00000008
ORIG_R28: 0000000f


The incriminated instruction is in the code of fput():

00000000101394b0 <fput>:
    101394b0:   6b c2 3f d9     stw rp,-14(sp)
    101394b4:   6f c6 00 80     stw,ma r6,<(sp)
    101394b8:   6b c3 3f 99     stw r3,-34(sp)
    101394bc:   08 1a 02 43     copy r26,r3
    101394c0:   6b c5 3f 89     stw r5,-3c(sp)
    101394c4:   34 74 00 28     ldo 14(r3),r20
    101394c8:   6b c4 3f 91     stw r4,-38(sp)
    101394cc:   0c 70 10 85     ldw  8(sr0,r3),r5
    101394d0:   0c 78 10 86     ldw  c(sr0,r3),r6
    101394d4:   0c b0 10 84     ldw  8(sr0,r5),r4
    101394d8:   00 01 0e 76     rsm 1,r22
    101394dc:   0e 80 10 93     ldw  0(sr0,r20),r19
    [...]

Since r3 value is 0 and since r3 is a copy of r26, which 
is arg0 according to Documentation/parisc/register, I assume
that fput as been called with a null argument.

the address 101496ec is part of sys_fcntl():

00000000101496a0 <sys_fcntl>:
    101496a0:   6b c2 3f d9     stw rp,-14(sp)
    101496a4:   6f c6 00 80     stw,ma r6,<(sp)
    101496a8:   08 18 02 46     copy r24,r6
    101496ac:   6b c5 3f 89     stw r5,-3c(sp)
    101496b0:   08 1a 02 45     copy r26,r5
    101496b4:   6b c4 3f 91     stw r4,-38(sp)
    101496b8:   08 19 02 44     copy r25,r4
    101496bc:   e8 57 1e e5     b,l 10139634 <fget>,rp
    101496c0:   6b c3 3f 99     stw r3,-34(sp)
    101496c4:   34 03 3f ef     ldi -9,r3
    101496c8:   08 05 02 5a     copy r5,r26
    101496cc:   08 04 02 59     copy r4,r25
    101496d0:   c8 9c 20 28     movb,= ret0,r4,101496ec <sys_fcntl+0x4c>
    101496d4:   08 06 02 58     copy r6,r24
    101496d8:   e8 5f 1a e5     b,l 10149450 <do_fcntl>,rp
    101496dc:   08 04 02 57     copy r4,r23
    101496e0:   08 04 02 5a     copy r4,r26
    101496e4:   e8 57 1b 8d     b,l 101394b0 <fput>,rp
    101496e8:   08 1c 02 43     copy ret0,r3
    101496ec:   08 03 02 5c     copy r3,ret0
    101496f0:   4b c2 3f 59     ldw -54(sp),rp
    101496f4:   4b c5 3f 89     ldw -3c(sp),r5
    101496f8:   4b c4 3f 91     ldw -38(sp),r4
    101496fc:   4b c3 3f 99     ldw -34(sp),r3
    10149700:   e8 40 c0 00     bv r0(rp)
    10149704:   4f c6 3f 81     ldw,mb <(sp),r6

Here, before the call of fput, r4 is copied into r26.
But at the address 101496d0, if r4 is null, there is a branch
over the call of fput()... So fput() would never have been called with
a null argument.

Does anyone have a clue of what happened? Btw, is the file "register" up
to date?    


Regards,
-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/en
