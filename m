Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CC2981EC
	for <parisc-linux@parisc-linux.org>; Tue,  6 Mar 2001 03:08:55 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA23688;
	Tue, 6 Mar 2001 21:07:08 +1100
Date: Tue, 6 Mar 2001 21:07:08 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] bzip2 causes page fault
In-Reply-To: <20010306090048.53CB038BD7@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0103062051380.442-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 6 Mar 2001, Matt Taggart wrote:

> I am attempting to build the bzip2 debian package I ran into a problem. The 
> build creates the bzip2 executable and library and attempts to do some 
> compression/decompression as a test. When it does I get the following page 
> fault,

When I run this, I get a page fault in a different place, in
libbz2.so.1.0:__do_global_ctors_aux, which is called from _init.
Disassembly of libbz2.so.1.0 reveals some nastiness in _init:

000000000000134c <_init>:
    134c:       6b c2 3f d9     stw rp,-14(sp)
    1350:       6f c3 00 80     stw,ma r3,40(sp)
    1354:       6b d3 3f c1     stw r19,-20(sp)
    1358:       e8 5f 1f bd     b,l 133c <_init-0x10>,rp
    135c:       08 13 02 43     copy r19,r3
    1360:       08 03 02 53     copy r3,r19
    1364:       e8 40 05 00     b,l 15ec <frame_dummy>,rp
    1368:       08 00 02 40     nop
    136c:       08 04 02 53     copy r4,r19
    1370:       e8 46 1c 18     b,l e184 <__do_global_ctors_aux>,rp
    1374:       08 00 02 40     nop
    1378:       08 04 02 53     copy r4,r19
    137c:       4b c2 3f 59     ldw -54(sp),rp
    1380:       08 03 02 53     copy r3,r19
    1384:       e8 40 c0 00     bv r0(rp)

0000000000001388 <_end_init>:
    1388:       4f c3 3f 81     ldw,mb -40(sp),r3

Notice how r19 is being saved in r3 at the start of this function, but
then restored from r4 before the call to __do_global_ctors_aux.  __init is
a little special, as it is cobbled together from crti.o (provides start
of function up to the frame_dummy call), the call to
__do_global_ctors_aux, and crtn.o (provides tail of function).  You
obviously have a mismatch :-O

To fix it, you'll need to recompile current pehc CVS glibc using the new
compiler, which will give you new crti.o and crtn.o  (And yeah, the fault
is mine - I broke our glibc sources for a while)

I strongly suspect your other crashes are caused by the same problem.

Alan Modra
-- 
Linuxcare.
