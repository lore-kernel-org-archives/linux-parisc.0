Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA27150
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 12:35:07 -0600
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id OAA27607
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Sep 1999 14:36:48 -0400 (EDT)
Received: (from frowand@localhost) by xsvr4.cup.hp.com (8.7.6/8.7.3) id LAA25870 for parisc-linux@thepuffingroup.com; Wed, 22 Sep 1999 11:37:26 -0700 (PDT)
From: Frank Rowand <frowand@cup.hp.com>
Message-Id: <199909221837.LAA25870@xsvr4.cup.hp.com>
Subject: RE:[parisc-linux] Questions understanding exec_kernel
To: parisc-linux@thepuffingroup.com
Date: Wed, 22 Sep 1999 11:37:26 PDT
List-ID: <linux-parisc.vger.kernel.org>

> /*
>  *  exec_kernel(entry_point, &commandline, Kernel_FreeMemStart,
> half_bss_size );
>  *  exec_kernel() calls our kernel...
>  */
> 
>  .EXPORT exec_kernel,code
>  .PROC
>  .CALLINFO
>  .ENTRY
> exec_kernel
>  mtsm     %r0                 ; Disable traps and interrupts.
> 
>  mtctl    %r0,        %cr17   ; Clear two-level IIA Space Queue
>  mtctl    %r0,        %cr17   ;    effectively setting kernel space.
>
>  [Question: Page 5-149 from the PA-RISC 1.1 Architecture and Instruction
> Set Reference Manual states: "Level 0:  If the target control register
> is CR 8, 9, 12, 13, 17, or 20, this instructin executes as a null
> instruction."  I am assuming we are running at level 0 since the rfi
> command required running at level 0, so what is the difference between a
> null instruction and a nop?]

You are not "running" at level 0.  Levels are a description of what
capabilities are implemented in a processor.  The levels are described
on p. 2-4 of the second edition of the PA-RISC 1.1 ..., in the paragraph
titled "Levels of PA-RISC" (I assume you have the first edition because
my page numbers don't match yours).

Therefore, the RFI instruction doesn't require "running at level 0".



> mtctl    %arg0,      %cr18   ; Stuff entry point into head of IIA
>  ldo      4(%arg0),   %arg0   ;    Offset Queue, and entry point + 4
>  mtctl    %arg0,      %cr18   ;    into tail of IIA Offset Queue.
> 
>  ldi      0x9,        %arg0   ; Set PSW Q & I bits (collect intrpt
>  mtctl    %arg0,      %ipsw   ;    state, allow external intrpts).
> 
>  copy     %arg2,      %arg0   ; commandline to arg1
>  [Note:  I think the comment is incorrect... we are actually copying the
> Kernel_FreeMemStart into arg0 ... Am I missunderstanding the comment?]
>                               ; arg3 is not changed..
>  .EXIT
>  rfi    ; begin execution of kernel.
>  nop
>  [Question: Page 5-139 from the PA-RISC 1.1 Architecture and Instruction
> Set Reference Manual states: "Execution of an RFI instruction when any
> of the PSW !, I, or R bits are ones is an undefined operation."  We are
> explicitly setting the Q & I bits before calling the rfi command.  I
> don't understand how this works ... ]
>  .PROCEND
> 
> Thanks,
> -Ryan

I don't have the define of %ipsw (I don't have the source in front of me),
but I assume that is defined to be control register 22, the IPSW.  The
value of the PSW is saved in the PSW whan an interrupt occurs.  Then,
when returning from the interrupt via the RFI instruction, the value of
the IPSW is copied to the PSW.  So if you put a value into the IPSW
then issue the RFI instruction, you set the value of the PSW via the
RFI instrution.  (Look at the "Operation" section for the RFI instruction,
p. 5-138 in the second edition, for more details.)


Then from another email:
>     If I remember right, RFI followed by a NOP is an idiom to tell the CPU
>   to start fetching instructions from an absolute address pointed to by the
>   IVA so we usually want to that with interrupts enabled (Q & I bits set).

The RFI updates the program counter queues from IIAOQ_Back, IIAOQ_Front,
IISQ_Back, and IISQ_Front (these are control registers).  In other words,
the result of the RFI instruction is a branch to the address in
IIASQ_Front.IIAOQ_Front.


-Frank Rowand
