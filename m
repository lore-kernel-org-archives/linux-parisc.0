Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8ECF0482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 16:57:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14voVb-0000db-00; Fri, 04 May 2001 23:57:11 +0100
Date: Fri, 4 May 2001 23:57:11 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010504235711.M32445@parcelfarce.linux.theplanet.co.uk>
References: <20010504223825.J32445@parcelfarce.linux.theplanet.co.uk> <200105042151.RAA19009@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105042151.RAA19009@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, May 04, 2001 at 05:51:59PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

taking a somewhat different approach:

    ea44:       e8 42 11 d4     b,l 14334 <_setjmp>,rp

00014334 <_setjmp>:
   14334:       6b c2 3f d9     stw rp,-14(sr0,sp)
   14338:       34 19 00 00     ldi 0,r25
   1433c:       37 de 00 80     ldo 40(sp),sp
   14340:       6b d3 3f c1     stw r19,-20(sr0,sp)
   14344:       e8 41 00 d8     b,l 163b8 <__sigsetjmp>,rp
   14348:       6b d3 3f 91     stw r19,-38(sr0,sp)
   1434c:       4b d3 3f 91     ldw -38(sr0,sp),r19
   14350:       4b c2 3f 59     ldw -54(sr0,sp),rp
   14354:       e8 40 c0 00     bv r0(rp)
   14358:       37 de 3f 81     ldo -40(sp),sp

000163b8 <__sigsetjmp>:
   163b8:       0f 43 12 80     stw  r3,0(sr0,r26)
   163bc:       0f 44 12 90     stw  r4,8(sr0,r26)
   163c0:       0f 45 12 98     stw  r5,c(sr0,r26)
   163c4:       6b 46 00 20     stw r6,10(sr0,r26)
   163c8:       6b 47 00 28     stw r7,14(sr0,r26)
   163cc:       6b 48 00 30     stw r8,18(sr0,r26)
   163d0:       6b 49 00 38     stw r9,1c(sr0,r26)
   163d4:       6b 4a 00 40     stw r10,20(sr0,r26)
   163d8:       6b 4b 00 48     stw r11,24(sr0,r26)
   163dc:       6b 4c 00 50     stw r12,28(sr0,r26)
   163e0:       6b 4d 00 58     stw r13,2c(sr0,r26)
   163e4:       6b 4e 00 60     stw r14,30(sr0,r26)
   163e8:       6b 4f 00 68     stw r15,34(sr0,r26)
   163ec:       6b 50 00 70     stw r16,38(sr0,r26)
   163f0:       6b 51 00 78     stw r17,3c(sr0,r26)
   163f4:       6b 52 00 80     stw r18,40(sr0,r26)
   163f8:       6b 53 00 88     stw r19,44(sr0,r26)
   163fc:       6b 5b 00 90     stw dp,48(sr0,r26)
   16400:       6b 5e 00 98     stw sp,4c(sr0,r26)
   16404:       6b 42 00 a0     stw rp,50(sr0,r26)
   16408:       37 53 00 b0     ldo 58(r26),r19
   1640c:       2e 70 12 2c     fstd,ma  fr12,8(sr0,r19)
   16410:       2e 70 12 2d     fstd,ma  fr13,8(sr0,r19)
   16414:       2e 70 12 2e     fstd,ma  fr14,8(sr0,r19)
   16418:       2e 70 12 2f     fstd,ma  fr15,8(sr0,r19)
   1641c:       2e 70 12 30     fstd,ma  fr16,8(sr0,r19)
   16420:       2e 70 12 31     fstd,ma  fr17,8(sr0,r19)
   16424:       2e 70 12 32     fstd,ma  fr18,8(sr0,r19)
   16428:       2e 70 12 33     fstd,ma  fr19,8(sr0,r19)
   1642c:       2e 70 12 34     fstd,ma  fr20,8(sr0,r19)
   16430:       2e 60 12 15     fstd  fr21,0(sr0,r19)
   16434:       e8 1e 0a d5     b,l 139a4 <__sigjmp_save>,r0
   16438:       08 00 02 40     nop

000139a4 <__sigjmp_save>:
   139a4:       6b 40 01 50     stw r0,a8(sr0,r26)
   139a8:       e8 40 c0 00     bv r0(rp)
   139ac:       34 1c 00 00     ldi 0,ret0

oh.  wait.  1434F is exactly where it should be.  *sigh*.  So why the hell
is it returning to the wrong place?

-- 
Revolutions do not require corporate support.
