Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 613B348DB
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 16:20:01 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Date: Sat, 29 Sep 2001 17:19:04 -0500
Cc: Albert Strasheim <fullung@ilink.nis.za>
References: <200109271442.KAA14125@mail.lokmail.net> <20010929080006.A25136@dogbert.localdomain> <01092913361601.00620@localhost.localdomain>
In-Reply-To: <01092913361601.00620@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <01092917190400.02926@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

Albert and other 720 folks;

I have been reading the directions (please forgive me for that)...

It looks (reads) as if it possible to return to the faulting instruction
(MFCTL in this case) without executing it.  If so, then adjusting the
instruction (and space) queues within the fault handler can be avoided;
also avoiding problems with finding the correct "following instruction"
address.

In general: 
When executing a group 3 fault (MFCTL), the PSW register is
copied into the IPSW register.  The "N" bit of the PSW (now in the IPSW)
is a copy of the "nullify bit" of the instruction PRECEDING the
instruction at iaoq[0].  The nullify bit of the instruction preceding the
MFCTL instruction was "zero" (or we wouldn't be here).
So rather than trying to adjust the addresses in the instruction/space
queues, it should be possible to just set the "N" bit of the IPSW (or its
representation in the interrupted registers structure).  Then, when the
finally makes it back to a "Return from Interrupt" instruction, our faked
"N" bit will be loaded into the PSW and the processor will skip the MFCTL
instruction which gets returned to.

Having zero experience with this processor and no way to test my idea; I
have done some "cut and paste" from the documentation - perhaps somebody
could check me on this idea.

Mike

PA-RISC 1.1 Architecture and Instruction Set Reference Manual
HP Part Number: 09740-90039
Printed in U.S.A. February 1994
Third Edition

- - - -

Trap:
  Traps include two sorts of possibilities: either the function requested by 
the current instruction cannot or should not be carried out, or system 
intervention is desired by the user before or after the instruction is 
executed. Examples of the first type include arithmetic operations that 
result in signed overflow and instructions executed with insufficient 
privilege for their intended function. Such instructions are normally not
re-executed. Examples of the second type include the debugging support traps. 
Traps are synchronous with respect to the instruction stream.

- - - -

Group 3:    
6 Instruction TLB miss fault/Instruction page fault
7 Instruction memory protection trap
30 Instruction debug trap
8 Illegal instruction trap
9 Break instruction trap
10 Privileged operation trap
11 Privileged register trap
12 Overflow trap
13 Conditional trap
14 Assist exception trap
15 Data TLB miss fault/Data page fault
16 Non-access instruction TLB miss fault
17 Non-access data TLB miss fault/Non-access data page fault
26 Data memory access rights trap
27 Data memory protection ID trap
28 Unaligned data reference trap

- - - -

Name	Privileged register trap (11)

Cause	An attempt is being made to write to a privileged space register or 	
access a privileged control register without being at the most privileged 
level (priv= 0)

Parameters    	IIR ­ The instruction causing the trap
IIA Queue    	Front ­ Address of the instruction causing the trap
		Back ­ Address of the following instruction

Notes    This interruption may be caused by the MOVE TO SPACE REGISTER, 
MOVE TO CONTROL REGISTER, or MOVE FROM CONTROL REGISTER 
instructions.

- - - -

Processor state is encoded in a 32-bit register called the Processor Status 
Word (PSW). When an interruption occurs, the old value of the PSW is saved in 
the Interruption Processor Status Word (IPSW) and usually all defined PSW 
bits are set to 0. The format of the PSW is shown in Figure 2-9.
 (copy is unreadable as e-mail ... "N" is bit 10dec.)
Figure 2-9. Processor Status Word

The PSW is set to the contents of the IPSW by the RETURN FROM INTERRUPTION 
and RETURN FROM INTERRUPTION AND RESTORE instructions. The interruption 
handler may restore the original PSW, modify selected bits, or may change the 
PSW to an entirely new value.

- - - -

N    Nullify. 
The current instruction is nullified when this bit is 1. This bit is set to 1 
by an instruction that nullifies the following instruction.

- - - -
I am ignoring the other 423 pages of the manual - which might be a mistake.
_ _ _ _

All in all, the way I read it - we can emulate the effect of an instruction 
prior to the MFCTL instruction that has its "nullify" bit set by setting the 
"N" bit in the IPSW.  With the effect that when the RFI is completed, the 
hardware will just skip the MFCTL which was just emulated.

Mike
