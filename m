Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A59D24891
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 07:58:14 -0600 (MDT)
Date: Fri, 19 Sep 2003 09:56:07 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030919135606.GE18225@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] r19 (aka pic-register akak ltp) not restored on entry back to libc from libpthread?
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

jda,

Perhaps you can help here with my problem, again it's an r19 related
issue.

make[2]: *** [/glibc-cvs/build-hppa/posix/tst-regex.out] Error 139

Breakpoint 1, fixup (l=0xfaf00d68, reloc_offset=1248) at dl-runtime.c:72
72        alloca (sizeof (int));
(gdb) c 22

I exit the loader, and I have ~2700 insn before I get to here...

(gdb) si 2713

I've traced it down to:

0000000040024000-000000004016d000 r-xp 0000000000000000 08:04 1308771
/mnt/flaire/src/glibc-cvs/build-hppa/libc.so

Looks like "public_mALLOc" from libc/malloc/malloc.c trying to unlock
the memory arena mutex.

00081ea0 <__libc_malloc>:
0x400a5f50:     copy r4,r19
0x400a5f54:     cmpib,= 0,ret0,0x400a5f8c
...

r19 = 40181d50 (All is good, all is quiet for 2700 insn)

(gdb) x/4 0x40181d50-0x1800+0x400
0x40180950: 0x400a6234 0x40181d50 0x40094320 0x40181d50

(Stub)
0x400abf0c:     b,l 0x400abf14,r1
0x400abf10:     addil 9f000,r1,%r1
0x400abf14:     be,n 71c(sr4,r1)
(Load r19 and target address from PLABEL)
0x4014b630:     bb,>=,n r22,1e,0x4014b640
0x4014b634:     depwi 0,31,2,r22
0x4014b638:     ldw 4(sr0,r22),r19
0x4014b63c:     ldw 0(sr0,r22),r22
0x4014b640:     bv r0(r22)
0x4014b644:     stw rp,-18(sr0,sp)

r19 = 401a57a8 (Good for libpthread ...)

(gdb) x /4 0x401a57a8-0x1800+0x400
0x401a43a8: 0x00000008 0x0000b6ac 0x0000b6e8 0x08000000
            ^^^^^^^^^^ Soon to be fatal return address.

000072e0 <__pthread_mutex_unlock>:
0x4018d2e0:     stw rp,-14(sr0,sp)
0x4018d2e4:     stw,ma r4,40(sr0,sp)
0x4018d2e8:     stw r19,-20(sr0,sp)		# 2719
...

0000000040186000-0000000040195000 r-xp 0000000000000000 08:04 655453
/mnt/flaire/src/glibc-cvs/build-hppa/linuxthreads/libpthread.so

0x4019063c:     stw r19,-20(sr0,sp)		# 2742
...
0x40190860:     stw r19,-20(sr0,sp)		
...
0x401908f8:     bv r0(rp)			# 2774
0x401908fc:     ldo -80(sp),sp
...
0x40190770:     bv r0(rp)
0x40190774:     ldo -80(sp),sp
...
000072e0 <__pthread_mutex_unlock>
0x4018d334:     bv r0(rp)			# 2806
0x4018d338:     ldw,mb -40(sr0,sp),r4
...
00081ea0 <__libc_malloc>
0x400a5f84:     b,l 0x400a5edc,r0
0x400a5f88:     copy r5,ret0
...

Hold your horses here, we made it back into libc but our ltp is still
that which we loaded upon entry to libpthread? :(

0x400a5eec:     bv r0(rp)
0x400a5ef0:     ldw,mb -40(sr0,sp),r6
...
0x401028e4:     cmpib,<> 0,r20,0x40102918
0x401028e8:     copy r3,r25
...
0x40102918:     b,l 0x40116658,rp		# 2839
0x4010291c:     copy r6,r26

First use of libpthread's r19 is fatal.

0x40116658:     addil -1800,r19,%r1		# 2840
0x4011665c:     ldw 400(sr0,r1),r21  <--- *BOOM* r21=0x8
0x40116660:     bv r0(r21)
0x40116664:     ldw 404(sr0,r1),r19 

Any thoughts? Did I miss something?

Cheers,
Carlos.
