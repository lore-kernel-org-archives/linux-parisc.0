Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA31849
	for <parisc-linux@puffin.external.hp.com>; Fri, 20 Oct 2000 08:36:32 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 490BE84B
	for <parisc-linux@thepuffingroup.com>; Fri, 20 Oct 2000 10:37:55 -0400 (EDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id IAA06649 for parisc-linux@thepuffingroup.com; Fri, 20 Oct 2000 08:37:54 -0600 (MDT)
Date: Fri, 20 Oct 2000 08:37:54 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200010201437.IAA06649@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: Bug in shared libraries
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

FYI,

Here is a partial dump from ld-2.1.94.so. The instruction at offset 3c60
below, "stw r6,0(r7)", is the first faulting instruction that is attempting
to write into its own .rodata section. Once this is fixed, there may
be others.

John

00003c00 <_dl_start+0x4c0>:
    3c00:       0c 60 10 97     ldw  0(sr0,r3),r23
    3c04:       2a 60 00 00     addil 0,r19,%r1
    3c08:       48 21 00 78     ldw 3c(sr0,r1),r1
    3c0c:       6b c1 3f 99     stw r1,-34(sr0,sp)
    3c10:       6b c0 3f 91     stw r0,-38(sr0,sp)
    3c14:       34 1a 00 04     ldi 2,r26
    3c18:       2a 60 00 00     addil 0,r19,%r1
    3c1c:       48 38 00 80     ldw 40(sr0,r1),r24
    3c20:       e8 45 18 74     b,l f860 <_dl_sysdep_output>,rp
    3c24:       0a f5 0a 17     add,l r21,r23,r23
    3c28:       08 04 02 53     copy r4,r19
    3c2c:       4b d4 3e a9     ldw -ac(sr0,sp),r20
    3c30:       0c 70 10 98     ldw  8(sr0,r3),r24
    3c34:       0e 90 10 94     ldw  8(sr0,r20),r20
    3c38:       08 07 02 5a     copy r7,r26
    3c3c:       0b 14 b8 80     cmpclr,>> r20,r24,r0
    3c40:       08 14 02 58     copy r20,r24
    3c44:       e8 48 0a 3c     b,l 15168 <memcpy>,rp
    3c48:       08 06 02 59     copy r6,r25
    3c4c:       e8 00 00 20     b,l 3c64 <_dl_start+0x524>,r0
    3c50:       08 04 02 53     copy r4,r19
    3c54:       e8 44 1d 8c     b,l db20 <_dl_reloc_bad_type>,rp
    3c58:       34 18 00 00     ldi 0,r24
    3c5c:       08 04 02 53     copy r4,r19
    3c60:       0c e6 12 80     stw  r6,0(sr0,r7)
    3c64:       34 a5 00 18     ldo c(r5),r5
    3c68:       88 a9 bc 27     cmpb,>>,n r9,r5,3a80 <_dl_start+0x340>
    3c6c:       0c a8 10 97     ldw  4(sr0,r5),r23
    3c70:       e8 00 03 f8     b,l 3e74 <_dl_start+0x734>,r0
    3c74:       35 6b 00 02     ldo 1(r11),r11
    3c78:       80 a9 a3 e2     cmpb,<<=,n r9,r5,3e70 <_dl_start+0x730>
    3c7c:       0d 00 10 95     ldw  0(sr0,r8),r21
    3c80:       0c a0 10 94     ldw  0(sr0,r5),r20
    3c84:       0a 95 0a 07     add,l r21,r20,r7
    3c88:       0c a8 10 95     ldw  4(sr0,r5),r21
    3c8c:       d2 b4 1a e8     extrw,u r21,23,24,r20
    3c90:       d6 94 08 84     depw,z r20,27,28,r20
    3c94:       0a 8a 0a 14     add,l r10,r20,r20
