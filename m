Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEEE1482A
	for <parisc-linux@parisc-linux.org>; Thu, 10 Jan 2002 15:43:55 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id obzfkaaa for parisc-linux@parisc-linux.org; Thu, 10 Jan 2002 15:38:11 -0700
Date: Thu, 10 Jan 2002 14:43:38 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020110224338.GK3247@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] FWD: The problematic asm code
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

Torsten, the Debian ghostscript maintainer, has been working on trying
to figure out a weird floating-point related (?) problem with the
ghostscript package on hppa.

Basically, the problem was tracked down to this:
<Bluehorn> (gdb) bt 2
<Bluehorn> #0  gs_distance_transform (dx=0, dy=18, pmat=0xbff01980, pdpt=0xbff01960)
<Bluehorn>     at src/gsmatrix.c:253
<Bluehorn> #1  0x000f53e4 in common_transform (i_ctx_p=0x4067c8,
<Bluehorn>     ptproc=0x3e1562 <__DTOR_END__+22238>,
<Bluehorn>     matproc=0x3e15ba <__DTOR_END__+22326>) at src/zmatrix.c:297
<Bluehorn> tausq: see? dx is zero and dy is 18

<Bluehorn> (gdb) up
<Bluehorn> 297                     code = (*matproc) (opxy[0], opxy[1], pmat, &pt);
<Bluehorn> (gdb) p opxy
<Bluehorn> $15 = {72, 72}

Some disassembly from the code attached. Looks like it's not calling the
function with the right set of registers?

Any ideas?  This might be related to the python2 problem we are seeing
as well...

randolph

----- Forwarded message from Torsten Landschoff <torsten@sarti.debian.org> -----

Date: Thu, 10 Jan 2002 22:21:09 +0000
To: tausq@debian.org
Cc: 122666@bugs.debian.org
Subject: The problematic asm code
From: Torsten Landschoff <torsten@sarti.debian.org>

Hi Randolph, 

This code is generated - I think it is wrong:

                code = (*matproc) (opxy[0], opxy[1], pmat, &pt);
 c30:	34 74 00 50 	ldo 28(r3),r20
 c34:	48 73 00 c0 	ldw 60(sr0,r3),r19
 c38:	6b d3 3f 99 	stw r19,-34(sr0,sp)
 c3c:	34 73 00 40 	ldo 20(r3),r19
 c40:	6b d3 3f 91 	stw r19,-38(sr0,sp)
 c44:	34 13 00 20 	ldi 10,r19
 c48:	2c 73 00 16 	fldd  r19(sr0,r3),fr22
 c4c:	2f c1 12 16 	fstd  fr22,-10(sr0,sp)
 c50:	0f c1 10 99 	ldw  -10(sr0,sp),r25
 c54:	0f c9 10 9a 	ldw  -c(sr0,sp),r26
 c58:	0e 81 10 97 	ldw  -10(sr0,r20),r23
 c5c:	0e 89 10 98 	ldw  -c(sr0,r20),r24
 c60:	48 76 3f a9 	ldw -2c(sr0,r3),r22
 c64:	eb e0 00 00 	b,l c6c <common_transform+0x178>,r31
			c64: R_PARISC_PCREL17F	$$dyncall
 c68:	08 1f 02 42 	copy r31,rp
 c6c:	08 1c 02 53 	copy ret0,r19
 c70:	68 73 00 60 	stw r19,30(sr0,r3)

The source file is src/zmatrix.c from gs-aladdin. Not sure if the 
license would allow pasting it here... Should be the same for gs-6.51, 
but it is harder to build because it includes more stuff so I used
gs-aladdin...

cu
	Torsten

----- End forwarded message -----

-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
