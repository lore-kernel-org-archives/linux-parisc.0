Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE8594A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Mar 2001 17:23:03 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA16685;
	Wed, 14 Mar 2001 11:22:01 +1100
Date: Wed, 14 Mar 2001 11:22:01 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils 
In-Reply-To: <Pine.LNX.4.21.0103141045320.27636-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103141102190.27636-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 14 Mar 2001, Alan Modra wrote:

> ld crashes for me too.  Yikes!  I'll look into it.

It's a compiler bug. :-(

I'm getting a crash at 0x40045a08.  ldd binutils/ld/.libs/ld-new shows me
that libbfd loads at 4001e000, so that's an offset of 27a08.
Dissasembling gives me this code in hppa_add_stub:

   279d4:       0d 82 10 35     ldb,ma  1(sr0,r12),r21
   279d8:       0d 82 10 34     ldb,ma  1(sr0,r12),r20
   279dc:       0d 75 12 22     stb,ma  r21,1(sr0,r11)
   279e0:       af 9d 5f dd     addib,>= -2,ret0,279d4 <hppa_add_stub+0x32c>
   279e4:       0d 74 12 22     stb,ma  r20,1(sr0,r11)
   279e8:       0d 80 10 15     ldb  0(sr0,r12),r21
   279ec:       0d 75 12 00     stb  r21,0(sr0,r11)
   279f0:       63 da 3e e9     stb r26,-8c(sp)
   279f4:       63 c0 3e eb     stb r0,-8b(sp)
   279f8:       63 d6 3e e1     stb r22,-90(sp)
   279fc:       63 d7 3e e3     stb r23,-8f(sp)
   27a00:       63 d8 3e e5     stb r24,-8e(sp)
   27a04:       63 d9 3e e7     stb r25,-8d(sp)
   27a08:       4a b5 08 f0     ldw 478(r21),r21

Note the use of r21 as a temp to shuffle bytes around, then it's use as an
index reg.  What's missing is a ldil to set up the high part of the
address.

Alan
-- 
Linuxcare
