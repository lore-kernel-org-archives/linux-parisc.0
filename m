Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F8ED483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Sep 2003 09:47:24 -0600 (MDT)
Date: Sun, 21 Sep 2003 11:45:01 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: James.Bottomley@steeleye.com, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030921154501.GF6963@systemhalted>
References: <20030919192813.GL18225@systemhalted> <200309192010.h8JKAlHs004032@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309192010.h8JKAlHs004032@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Found the r19 problem!
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

On Fri, Sep 19, 2003 at 04:10:47PM -0400, John David Anglin wrote:
> > If it were major we would have fixed it :)
> > I'm trying to find the "missed a restore" point.
> 
> 0x4019063c:     stw r19,-20(sr0,sp)             # 2742
> 
> Just a note, GCC saves r19 in the frame marker in the prologue of
> non-leaf functions but we never attempt to restore r19 from the frame
> marker.  This is the mandated ABI behavior.  At the moment, GCC copies
> r19 to r4 for the save.

I would like to start this off with:
"JDA said don't put r19 into clobber list"

I didn't listen. I thought it should all still work.
James reports that removing r19 from the clobber list works, but I still
haven't rebuilt my tree, so I'll see.

Example (Assembly trace provided at the end):

getcwd: (Start of function)
	stw r19,-20(sr0,sp)
	...
syscall:
	(Syscall with save/load r19 wrapper)
	stw r19,-20(sr0,sp)
	be,l 100(sr2,r0),%sr0,%r31
	ldi 6e,r20
	ldw -20(sr0,sp),r19
	...
	(Many insn later)
	(stub) (dyncall) -> libpthread.so
	-> libc.so
	(r19 not restored)
	(Jump to syscall:)
	...

o GCC is confused by the r19 asm(...) clobber?

Notes:

I generated insn traces using gdb scripts.

  __pthread_mutex_unlock: 0x7730 <0x4018c730>	(In libpthread)
 __libc_malloc: 0x7f4a0 <0x400a34a0>		(In libc)

(return stub)
0x400a34a0:     b,l 0x400a33f8,r0
0x400a34a4:     copy r5,ret0

(__libc_malloc returning)
0x400a33f8:     ldw -54(sr0,sp),rp
0x400a33fc:     ldw -3c(sr0,sp),r5		(No need to restore r19)
0x400a3400:     ldw -38(sr0,sp),r4
0x400a3404:     ldw -34(sr0,sp),r3
0x400a3408:     bv r0(rp)			(Back to getcwd)
0x400a340c:     ldw,mb -40(sr0,sp),r6

getcwd: 0xdb128 <0x400ff128>
0x400ff128:     ldi 0,r21
0x400ff12c:     cmpib,<> 0,ret0,0x400ff034	(Jump back to do syscall)
0x400ff130:     copy ret0,r6

0x400ff034:     copy r3,r25
0x400ff038:     copy r6,r26
0x400ff03c:     stw r19,-20(sr0,sp)
0x400ff040:     be,l 100(sr2,r0),%sr0,%r31
0x400ff044:     ldi 6e,r20
0x400ff048:     ldw -20(sr0,sp),r19 (si gdb artifact, lost insn inside syscall)
0x400ff048:     ldw -20(sr0,sp),r19 
0x400ff04c:     ldi -1000,r20
0x400ff050:     cmpb,>>= r20,ret0,0x400ff070
0x400ff054:     copy ret0,r3

0x400ff070:     cmpib,>,n 0,r3,0x400ff0cc
0x400ff074:     cmpiclr,<> 0,r7,r21
0x400ff078:     ldi 1,r21
0x400ff07c:     cmpiclr,<> 0,r5,r20
0x400ff080:     ldi 1,r20
0x400ff084:     and r20,r21,r20
0x400ff088:     cmpib,<> 0,r20,0x400ff0bc
0x400ff08c:     copy r3,r25			(No r19 restore yet!!!)

(call stub)
0x400ff0bc:     b,l 0x40114e2c,rp
0x400ff0c0:     copy r6,r26

(stub)
0x40114e2c:     addil -1800,r19,%r1
0x40114e30:     ldw 428(sr0,r1),r21
0x40114e34:     bv r0(r21)
0x40114e38:     ldw 42c(sr0,r1),r19


getcwd: 0xdb0c0 <0x400ff0c0>
(stub) *BOOM*

Is there any way we can make this work?

c.
