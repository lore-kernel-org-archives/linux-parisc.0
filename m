Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id C48FA485E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Aug 2003 14:06:49 -0600 (MDT)
Date: Fri, 29 Aug 2003 16:04:00 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030829200400.GF19341@systemhalted>
References: <20030829084816.GD19341@systemhalted> <200308291507.LAA13539@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308291507.LAA13539@hiauly3.hia.nrc.ca>
Subject: [parisc-linux] Re: [glibc] tststatic failues, reduced to simple testcase.
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

Dave,

I will start by saying that I wasn't "fair" in just dumping the assembly
into an email, falling asleep at my keyboard at 4:30 AM and leaving it
up to you to guess what was _really_ going on :)

I'm sending this to the list so it gets recorded on archive. Our problem
right now it that we don't properly restore r19 after an __asm()
statement even if the clobber contains r19. Or rather gcc doesn't
schedule the restore to occur at the right time.

What does this mean for glibc, well it means that ld.so's first fork
corrupts the PIC register r19 aka LTP, and the subsequent import stub
for a function call fails (SIGSEGV). What is effected in glibc?
The following:
	- INTERNAL_SYSCALL (Macro syscall)
	- INLINE_SYSCALL (Macro syscall)
	- syscall(...) (C version)
	- DO_CALL (Assembly wrapper syscall)

What is not effected:
	- DO_CALL_NOERRNO
	- DO_CALL_ERRVAL
	- PSEUDO (syscall cancellation wrapper)
	
Explicitly storing and loading r19 around the syscall e.g. inside the
__asm() statement works around the problem. I do not want to have to
stw/ldw since it costs a lot in performance, we know now to look at gcc
for help. Perhaps I will use this as a temporary measure to release
glibc 2.3.2 for debian so we keep testing moving.

This problem has a number of interesting heisenbugs:
	- If the kernel decides not to scratch in r19 then you're okay.
	- If the compiler version scheduled r19 restore differently then
          you're okay.

All of these contributed to a lof of head scratching on my part. Since
things worked sometimes, on some boxes, and differently with different
compilers. Needless to say I learned a lot and poked enough other people
that we have had our mmap flush problems fixed, and our -fPIC -static
problems fixed.

See the following for expansion on both:
http://www.ussg.iu.edu/hypermail/linux/kernel/0308.2/1680.html
http://sources.redhat.com/ml/binutils/2003-08/msg00467.html

> I don't see the restore of r19 from r4.  What are the other 10 insns?
> Normally, I would have expected it before

This code is the relocated libpthread.so as viewed without symbols by
tracing through ld.so loading ex14 testcase in glibc. This code is the
beginning of the loader trying to start the child process immediately
after the last few calls in dl-runtime.c. What follows is the whole insn
stream up to the crash from the last call to fixup.

Here it is for posterity.

Breakpoint 1, 0x4100ceb0 in _dl_runtime_resolve () at dl-runtime.c:213
213               value = l->l_addr + sym->st_value;
(gdb) c 21
Will ignore next 20 crossings of breakpoint 1.  Continuing.
                                                                                           
Breakpoint 1, 0x4100ceb0 in _dl_runtime_resolve () at dl-runtime.c:213
213               value = l->l_addr + sym->st_value;
                                                   
si from here forward
                                        
0x4015e3b8:     stw rp,-14(sr0,sp)
0x4015e3bc:     stw,ma r4,40(sr0,sp)
0x4015e3c0:     stw r19,-20(sr0,sp)
0x4015e3c4:     addil 1000,r19,%r1
0x4015e3c8:     copy r1,r21
0x4015e3cc:     ldw 200(sr0,r21),r21
0x4015e3d0:     ldw 6c(sr0,r21),r22
0x4015e3d4:     cmpib,<> 0,r22,0x4015e3e8
0x4015e3d8:     addil 800,r19,%r1
                                                                                           
0x4015e3e8:     ldw 5d8(sr0,r1),r20
0x4015e3ec:     copy r20,r26
0x4015e3f0:     b,l 0x40167e30,r31
0x4015e3f4:     copy r31,rp
                                                                                           
0x40167e30:     b,l 0x40167e38,r1
0x40167e34:     addil 9f800,r1,%r1
0x40167e38:     be,n 218(sr4,r1)
                                                                                           
0x40207850:     bb,>=,n r22,1e,0x40207860
0x40207854:     depwi 0,31,2,r22
0x40207858:     ldw 4(sr0,r22),r19 <---------- r19 = 0x40020718
0x4020785c:     ldw 0(sr0,r22),r22
0x40207860:     bv r0(r22)
0x40207864:     stw rp,-18(sr0,sp)
                                                                                           
0x4000812c:     stw rp,-14(sr0,sp)
0x40008130:     stw,ma r5,40(sr0,sp)
0x40008134:     stw r4,-3c(sr0,sp)
0x40008138:     stw r3,-38(sr0,sp)
0x4000813c:     stw r19,-20(sr0,sp)
0x40008140:     ldw c(sr0,r26),r20
0x40008144:     copy r26,r3
0x40008148:     cmpib,<< 3,r20,0x40008184
0x4000814c:     ldi 16,ret0
0x40008150:     blr r20,r0
0x40008154:     nop
                                                                                           
0x40008160:     b,l 0x400081a8,r0
0x40008164:     ldw 8(sr0,r26),r20
                                                                                           
0x400081a8:     ldi 0,ret0
0x400081ac:     ldo 10(r26),r26
0x400081b0:     mfctl tr3,r5
0x400081b4:     cmpb,=,n r5,r20,0x400081cc
0x400081b8:     b,l 0x4000b29c,rp
0x400081bc:     copy r5,r25
                                                                                           
0x4000b29c:     stw rp,-14(sr0,sp)
0x4000b2a0:     stw,ma r4,40(sr0,sp)
0x4000b2a4:     stw r19,-20(sr0,sp)
0x4000b2a8:     b,l 0x4000b930,rp
0x4000b2ac:     ldo 10(r26),r26
                                                                                           
0x4000b930:     stw rp,-14(sr0,sp)
0x4000b934:     ldo 80(sp),sp
0x4000b938:     stw r7,-68(sr0,sp)
0x4000b93c:     stw r6,-64(sr0,sp)
0x4000b940:     stw r5,-60(sr0,sp)
0x4000b944:     stw r4,-5c(sr0,sp)
0x4000b948:     stw r3,-58(sr0,sp)
0x4000b94c:     stw r19,-20(sr0,sp)
0x4000b950:     copy r26,r5
0x4000b954:     ldi 0,r3
0x4000b958:     ldil 1e8000,r20
0x4000b95c:     ldi 31,r6
0x4000b960:     ldo 481(r20),r7
0x4000b964:     stw r5,-70(sr0,sp)
0x4000b968:     ldw -70(sr0,sp),r20
0x4000b96c:     depwi 0,31,4,r20
0x4000b970:     cmpb,<<=,n r5,r20,0x4000b984
                                                                                           
0x4000b984:     ldw -70(sr0,sp),r20
0x4000b988:     ldcw 0(sr0,r20),r20
0x4000b98c:     cmpib,<> 0,r20,0x4000b9d0
0x4000b990:     ldw -94(sr0,sp),rp
                                                                                           
0x4000b9d0:     ldw -68(sr0,sp),r7
0x4000b9d4:     ldw -64(sr0,sp),r6
0x4000b9d8:     ldw -60(sr0,sp),r5
0x4000b9dc:     ldw -5c(sr0,sp),r4
0x4000b9e0:     ldw -58(sr0,sp),r3
0x4000b9e4:     bv r0(rp)
0x4000b9e8:     ldo -80(sp),sp
                                                                                           
0x4000b2b0:     ldw -54(sr0,sp),rp
0x4000b2b4:     bv r0(rp)
0x4000b2b8:     ldw,mb -40(sr0,sp),r4
                                                                                           
0x400081c0:     stw r0,4(sr0,r3)
0x400081c4:     b,l 0x40008180,r0
0x400081c8:     stw r5,8(sr0,r3)
                                                                                           
0x40008180:     ldi 0,ret0
0x40008184:     ldw -54(sr0,sp),rp
0x40008188:     ldw -3c(sr0,sp),r4
0x4000818c:     ldw -38(sr0,sp),r3
0x40008190:     bv r0(rp)
0x40008194:     ldw,mb -40(sr0,sp),r5
                                                                                           
0x4015e3f8:     b,l 0x4015e3e0,r0
0x4015e3fc:     ldw -54(sr0,sp),rp
                                                                                           
0x4015e3e0:     bv r0(rp)
0x4015e3e4:     ldw,mb -40(sr0,sp),r4

0x40008838:     copy r4,r19  <---Restore----- r19 = 0x40020718
__asm(
0x4000883c:     be,l 100(sr2,r0),%sr0,%r31
0x40008840:     ldi 2,r20                    !! FORK !!
);
0x40008844:     ldi -1000,r20 <--Corrupted--- r19 = 0x10106368
0x40008848:     cmpb,>>= r20,ret0,0x40008868
0x4000884c:     copy ret0,r6
                                                                                           
0x40008868:     cmpib,<> 0,r6,0x400088e4
0x4000886c:     copy r19,r4
                                                                                           
0x400088e4:     b,l 0x4000a9d4,rp
0x400088e8:     ldo 38(r7),r5
                                                                                           
0x4000a9d4:     stw rp,-14(sr0,sp)
0x4000a9d8:     ldo 40(sp),sp
0x4000a9dc:     stw r19,-20(sr0,sp)
0x4000a9e0:     ldw -54(sr0,sp),rp
0x4000a9e4:     b,l 0x40005440,r0
0x4000a9e8:     ldo -40(sp),sp

No scheduled r19 restore yet.  
                                                                                         
0x40005440:     addil -800,r19,%r1
0x40005444:     ldw 55c(sr0,r1),r21 <-- Not quote boom, probably wrong.
0x40005448:     bv r0(r21)
0x4000544c:     ldw 560(sr0,r1),r19 <-- *Boom*

> If the restore is not there, please send preprocessed source and
> compilation details.  BOOM appears to be in an import stub (i.e.,
> there must be a call in the 10).  Calls use r19 in pic code (i.e.,
> in the import stub), so it's not obvious why the restore wouldn't be
> there.

The restore is not there. Placing r19 into the __asm(syscall) clobber 
list doesn't fix the issue. Nothing short of an explicity stw/ldw inside 
the __asm statement saves r19 from corruption.

> Scheduling can reorder instructions, so the pic restore doesn't have
> to immediately follow a call.  "FORK" isn't a GCC generated call
> (we never use sr2).  Calls are tricky and the procedure for generating
> them has been revised several times.  Now, we don't split out the save
> and restore of the pic register until after reload.  Reload can introduce
> new uses of the pic register.  When not using exceptions, register
> copies following a call are part of an "in call group" that keeps the
> restore in the same basic block as the call for scheduling purposes.
> However, when exceptions are enabled, the basic block ends at the
> call.  If the restore is split out from the call before reload,
> it will be scheduled in a different basic block from the call.  As
> a result, scheduling may move another instruction which has an
> implicit dependence on the pic register forward past the restore.
> Then, BOOM.

Preprocessed source for ptfork.c at:
http://www.baldric.uwo.ca/~carlos/ptfork.E
You'll see the INLINE_SYSCALL in __pthread_fork on line 8137.

I would like to not that I might have made _many_ errors, but the simple
stw/ldw r19 fix passes all the glib thread tests so I think its a step
in the right direction.

Thanks for the help!
c.
