Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DDAF4A19
	for <parisc-linux@parisc-linux.org>; Sat, 10 Mar 2001 19:56:24 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id NAA23111;
	Sun, 11 Mar 2001 13:55:45 +1100
Date: Sun, 11 Mar 2001 13:55:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
In-Reply-To: <20010310102154.P18113@tausq.org>
Message-ID: <Pine.LNX.4.21.0103111254230.23407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 10 Mar 2001, Randolph Chung wrote:

> > Running any of the binaries in the binutils deb gives an immediate
> > segfault. This includes things like as, ld, etc... obviously this makes
> > it rather difficult to compile anything.. :-(
> 
> ok, one more bit of info; removing the --enable-shared from the binutils
> build line gives binaries that work, so i'm guessing there's some
> problems with the shared libs (libopcodes and libbfd) ?

Very likely.  I'm downloading at the moment to have a look at
it.  You can check yourself by disassembling the shared libs.

"objdump -j .init -dr libbfd.so" should give you something like the
following:

0000000000011a0c <_init-0x1c>:
   11a0c:	e8 20 00 00 	b,l 11a14 <_init-0x14>,r1
   11a10:	28 2a 50 00 	addil 54800,r1,%r1
   11a14:	e0 20 22 02 	be,n 100(sr4,r1)
   11a18:	2a 7f ff ff 	addil -800,r19,%r1
   11a1c:	48 35 06 88 	ldw 344(r1),r21
   11a20:	ea a0 c0 00 	bv r0(r21)
   11a24:	48 33 06 90 	ldw 348(r1),r19

0000000000011a28 <_init>:
   11a28:	6b c2 3f d9 	stw rp,-14(sp)
   11a2c:	6f c4 00 80 	stw,ma r4,40(sp)
   11a30:	6b d3 3f c1 	stw r19,-20(sp)
   11a34:	e8 5f 1f bd 	b,l 11a18 <_init-0x10>,rp
   11a38:	08 13 02 44 	copy r19,r4
   11a3c:	08 04 02 53 	copy r4,r19
   11a40:	e8 40 02 a0 	b,l 11b98 <frame_dummy>,rp
   11a44:	08 00 02 40 	nop
   11a48:	08 04 02 53 	copy r4,r19
   11a4c:	e8 5f 1f 75 	b,l 11a0c <_init-0x1c>,rp
   11a50:	08 00 02 40 	nop
   11a54:	08 04 02 53 	copy r4,r19
   11a58:	4b c2 3f 59 	ldw -54(sp),rp
   11a5c:	08 04 02 53 	copy r4,r19
   11a60:	e8 40 c0 00 	bv r0(rp)

0000000000011a64 <_end_init>:
   11a64:	4f c4 3f 81 	ldw,mb -40(sp),r4

If you see a mix of r4 and r3 being used to save/restore r19, then that's
the direct cause of your crashes.  The indirect cause is a bad crti.o and
crtn.o built from glibc sources checked out from pehc between 2001/01/16
and 2001/02/05.

You've already started down the path to recovery:
  build and install binutils with --disable-shared,
  build and install gcc with --enable-languages=c --disable-shared,
  build and install glibc

You can then build tools with --enable-shared if you like.

Alan Modra
-- 
Linuxcare
